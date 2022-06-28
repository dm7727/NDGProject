package ndgController;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

public class NDGEditController2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		파라미터로 전달된 idx값을 받은 후 기존 게시물을 조회한다.
		조회된 결과를 수정페이지의 각 input태그에 value속성으로 삽입한다.
		<textarea>는 value속성이 없으므로 태그사이에 값을 삽입한다. 
		*/
		String idx = req.getParameter("idx");
		ndgfanboardDAO dao = new ndgfanboardDAO();
		ndgfanboardDTO dto = dao.selectView(idx);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("/02Normal/edit2.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//디렉토리의 물리적 경로 얻어오기
		String saveDirectory = req.getServletContext().getRealPath("/Uploads");
		
		//web.xml에 기술한 컨텍스트 초기화 파라미터를 얻어온다.
		ServletContext application = this.getServletContext();
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
		
		//파일업로드 처리 객체 생성과 동시에 업로드는 완료된다.
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		
		if(mr==null) {
			JSFunction.alertBack(resp, "제한용량초과 or 디렉토리 경로를 확인하세요.");
			return;
		}
		
		//파일을 제외한 나머지 폼값을 얻어온다.
		//hidden박스에 저장된 내용(게시물 수정 및 파일수정에 필요함)
		String idx = mr.getParameter("idx");
		String prevOfile = mr.getParameter("prevOfile");
		String prevSfile = mr.getParameter("prevSfile");
		
		//사용자가 직접 입력한 값
		String userid = mr.getParameter("userid");
		String title = mr.getParameter("title");
		String content = mr.getParameter("content");
		//파일삭제를 위한 체크박스(항목이 1개이므로 getParameter()로 받을 수 있다.)
		String deleteFile = mr.getParameter("deleteFile");
		
		/*
		패스워드의 경우 인증이 완료되었을때 session영역에 저장해 두었다.
		따라서 update쿼리 실행시 사용하기 위해 session영역에서 속성값을 가져온다.
		서블릿에서는 getSession()을 통해 얻어올 수 있다. 
		*/
		HttpSession session = req.getSession();
		String pass = (String)session.getAttribute("pass");
		
		ndgfanboardDTO dto = new ndgfanboardDTO();
		dto.setIdx(idx);
		dto.setUserid(userid);
		dto.setTitle(title);
		dto.setContent(content);
		dto.setPass(pass);
		
		//파일삭제처리 : 체크박스에 체크한 경우에만 삭제하면 된다.
		if(deleteFile != null && deleteFile.equals("1")) {
			//체크했다면 파일 컬럼만 null로 변경해준다.
			dto.setOfile1("");
			dto.setSfile1("");
			//물리적경로에 저장된 파일도 삭제해준다.
			FileUtil.deleteFile(req, "/Uploads", prevSfile);
		}
		else {
			String fileName = mr.getFilesystemName("ofile1");
			if (fileName != null) {
				//날짜와 시간을 이용해서 파일명을 생성한다.
				String now = new SimpleDateFormat("yyyMMdd_HmsS").format(new Date());
				//파일의 확장자를 따낸다.
				String ext = fileName.substring(fileName.lastIndexOf("."));
				//파일명과 확장자를 합쳐서 새로운 파일명을 만든다.
				String newFileName = now + ext;
				//파일 객체 생성 후 파일명을 변경한다.
				File oldFile = new File(saveDirectory + File.separator + fileName);
				File newFile = new File(saveDirectory + File.separator + newFileName);
				oldFile.renameTo(newFile);
	         
				//업로드된 파일명을 DTO에 저장한다.
				dto.setOfile1(fileName);
				dto.setSfile1(newFileName);
				
				//새로운 파일이 등록되었으므로 기존 파일은 삭제한다.
				FileUtil.deleteFile(req, "/Uploads", prevSfile);
			}
			else {
				//새로운 파일을 등록하지 않는경우 기존 파일명을 DTO에 저장한다.
				dto.setOfile1(prevOfile);
				dto.setSfile1(prevSfile);
			}
		}
		 
		
		//DB연결 및 업데이트 처리
		ndgfanboardDAO dao = new ndgfanboardDAO();
		int result = dao.updatePost(dto);
		dao.close();
		
		if(result==1) {
			//수정이 완료되었다면 session에 저장된 패스워드를 지운후 상세보기 화면으로 이동한다.
			session.removeAttribute("pass");
			resp.sendRedirect("./fanview.do?idx=" + idx);
		}
		else {
			JSFunction.alertLocation(resp, "비밀번호검증을 다시 진행해주세요", "./fanview.do?idx="+idx );
		}
	}

	
}
