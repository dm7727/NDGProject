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

import com.oreilly.servlet.MultipartRequest;

import fileupload.FileUtil;
import utils.JSFunction;

public class NDGWriteController2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./02Normal/write2.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//서버의 물리적 경로 얻어오기 req.getServletContext()을 통해 application
		//내장객체를 얻어온다.
		String saveDirectory =req.getServletContext().getRealPath("/Uploads");
      
		//application내장객체를 통해 web.xml에 등록된 초기화 파라미터를 얻어온다.
		ServletContext application = getServletContext();
		//업로드 제한용량을 얻어온다.
		int maxPostSize = Integer.parseInt(application.getInitParameter("maxPostSize"));
      
		//파일업로드 처리
		MultipartRequest mr = FileUtil.uploadFile(req, saveDirectory, maxPostSize);
		//업로드에 실패한 경우에는 경고창을 띄우고 쓰기 페이지로 이동한다.
		//만약 글 작성시 파일을 첨부하지 않더라도, 객체는 생성된다. 만약 객체가
		//생성되지 않는다면 나머지 폼값을 받을 수 없기 때문이다.
		if(mr == null) {
			JSFunction.alertLocation(resp, "제한용량초과 or 디렉토리 경로를 확인하세요.", "../fanwrite.do");
			return;
		}
		//여기까지의 코드로 파일업로드는 완료된다.
      
      
		//파일을 제외한 나머지 폼값을 받는다. request객체가 아닌 mr을 통해 받는다. 
		//DTO에 폼값을 저장한다. 
		ndgfanboardDTO dto = new ndgfanboardDTO();
		dto.setUserid(mr.getParameter("userid"));
		dto.setTitle(mr.getParameter("title"));
		dto.setContent(mr.getParameter("content"));
		dto.setPass(mr.getParameter("pass"));
      
		//서버에 업로드 된 파일명을 얻어온다. 
		String fileName = mr.getFilesystemName("ofile1");
		//서버에 저장된 파일이 있는 경우 파일명 변경 처리를 한다. 
		//만약 파일을 첨부하지 않았다면 아래 처리는 하지 않아도 된다.
		if (fileName != null) {
			//날짜와 시간을 이용해서 파일명을 생성
			String now = new SimpleDateFormat("yyyMMdd_HmsS").format(new Date());
			//파일명의 마지막에 있는 .(닷)의 인덱스를 찾은후 확장자를 잘라냄
			String ext = fileName.substring(fileName.lastIndexOf("."));
			//파일명과 확장자를 연결해서 새로운 파일명 생성
			String newFileName = now + ext;
			//파일객체 생성후 파일명을 변경함
			File oldFile = new File(saveDirectory + File.separator + fileName);
			File newFile = new File(saveDirectory + File.separator + newFileName);
			oldFile.renameTo(newFile);
         
			//DTO객체에 원본파일명과 저장된파일명을 저장한다.
			dto.setOfile1(fileName);
			dto.setSfile1(newFileName);
		}
      
		//새로운 게시물을 테이블에 저장한다.
		ndgfanboardDAO dao = new ndgfanboardDAO();
		int result = dao.insertWrite(dto);
		//커넥션풀 자원 반납
		dao.close();
      
		//서블릿에서 특정 요청명으로 이동하고 싶을때는 sendRedirect()를 사용하면된다.
		if(result == 1) {
			//insert에 성공하면 리스트로 이동한다.
			resp.sendRedirect("./fanlist.do");
			System.out.println("게시글 작성 성공");
		}
		else {
			//insert에 실패하면 작성페이지로 다시 이동한다.
			resp.sendRedirect("./fanwrite.do");
			System.out.println("게시글 작성 실패");
		}
	}

}
