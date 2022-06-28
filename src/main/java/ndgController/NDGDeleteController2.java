package ndgController;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileupload.FileUtil;

public class NDGDeleteController2 extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String idx = req.getParameter("idx");
		
		//DTO객체와 DB연결 및 기존 게시물 가져오기
		ndgfanboardDAO dao = new ndgfanboardDAO();
		ndgfanboardDTO dto = dao.selectView(idx);

		int result = dao.deletePost(idx);
		
		dao.close();
			
		if(result ==1) {
			System.out.println("삭제성공");
			String saveFileName = dto.getSfile1();
			FileUtil.deleteFile(req, "/Uploads", saveFileName);
			resp.sendRedirect("./adminlist2.do");
		}
		else {
			System.out.println("삭제실패");
			resp.sendRedirect("./admindelete2.do");
		}
	}
}
