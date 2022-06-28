package ndgController;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NDGmemberViewController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//커넥션풀을 통해 DB연결
		ServletContext application = getServletContext();
		ndgmemberDAO dao = new ndgmemberDAO(application);
		//일련번호를 파라미터로 받음
		String userid = req.getParameter("userid");
		
		//게시물 조회
		ndgmemberDTO dto = dao.selectView(userid);
		dao.close();
		
		//request영역에 DTO를 저장한 후 View로 포워드한다.
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("./memberview.jsp").forward(req, resp);
	}
}
