package ndgController;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utils.JSFunction;

public class NDGmemberDeleteController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userid = req.getParameter("userid");

		ServletContext application = getServletContext();
		
		//DTO객체와 DB연결 및 기존 게시물 가져오기
		ndgmemberDTO dto = new ndgmemberDTO();
		ndgmemberDAO dao = new ndgmemberDAO(application);
		dto = dao.selectView(userid);

		dto.setUserid(userid);
		
		int result = dao.deletePost(userid);
		dao.close();
			
		if(result ==1) {
			System.out.println("삭제성공");
			resp.sendRedirect("./memberlist.do");
		}
		else {
			System.out.println("삭제실패");
			resp.sendRedirect("./memberdelete.do");
		}
		
	}
}
