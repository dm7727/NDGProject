package ndgController;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NDGViewController2 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//커넥션풀을 통해 DB연결
		ndgfanboardDAO dao = new ndgfanboardDAO();
		//일련번호를 파라미터로 받음
		String idx = req.getParameter("idx");
		
		//조회수 증가
		dao.updateVisitCount(idx);
		//게시물 조회
		ndgfanboardDTO dto = dao.selectView(idx);
		dao.close();
		
		//첨부파일의 확장자를 확인하여 처리하기
		String fileName = dto.getSfile1();
		String fileType = "";
		if(fileName != null) {
			//첨부된 파일이 있다면...
			//파일의 확장자 따내기...
			//파일명의 마지막에 있는 .(닷)의 인덱스를 찾은후 확장자를 잘라냄
			String ext = fileName.substring(fileName.lastIndexOf(".")+1);
			System.out.println("확장자:" + ext);
			if(ext.equals("png") || ext.equals("jpg") || ext.equals("gif")) {
				//첨부파일이 이미지인 경우...
				fileType = "image";
			}
			else if(ext.equals("mp3")) {
				//음원파일인 경우
				fileType = "music";
			}
			
		}
		
		//내용에 대해 줄바꿈 처리를 위해 <br>태그로 변환한다.
		//<textarea>에서 엔터키를 통한 줄바꿈은 \r\n으로 저장된다.
		dto.setContent(dto.getContent().replaceAll("\r\n", "<br>"));
		
		//request영역에 DTO를 저장한 후 View로 포워드한다.
		req.setAttribute("dto", dto);
		req.setAttribute("fileType", fileType);
		//req.getRequestDispatcher("/02Normal/view2.jsp").forward(req, resp);
		
		//컨트롤러 공유하기 도전
		String uri = req.getRequestURI();
		System.out.println(uri);
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		
		if(commandStr.equals("/fanview.do")){
			req.getRequestDispatcher("/02Normal/view2.jsp").forward(req, resp);
		}
		else {
			req.getRequestDispatcher("/01Admin/fanboardview.jsp").forward(req, resp);
		}
	}
}
