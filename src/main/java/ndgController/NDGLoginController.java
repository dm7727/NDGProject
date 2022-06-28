package ndgController;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utils.JSFunction;

public class NDGLoginController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/02Normal/login.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ServletContext application = getServletContext();
		HttpSession session = req.getSession();
		
		String userid = req.getParameter("userid");
		String pass = req.getParameter("pass");
		System.out.println(userid+"="+pass);

		ndgmemberDAO dao = new ndgmemberDAO(application); 
		
		ndgmemberDTO memberDTO = dao.getNdgmemberDTO(userid, pass);
		
		dao.close();
		

		if(memberDTO.getUserid() != null) {
			//회원인증(로그인)에 성공한 경우
			/*
			세션영역에 아이디와 이름을 저장한다.
			session영역은 페이지를 이동하더라도 웹브라우저를 닫을때까지는 영역이 공유되어
			접근할 수 있다.
			*/
			System.out.println("로그인성공");
			session.setAttribute("userid", memberDTO.getUserid());
			session.setAttribute("pass", memberDTO.getPass());
			//로그인 페이지로 이동한다.
			resp.sendRedirect("./02Normal/main.jsp");
		}
		else {
			//인증에 실패한 경우
			/*
			리퀘스트 영역에 실패메세지를 저장한다.
			request영역은 하나의 요청을 완료할때까지 영역을 공유한다. 즉 요청을 전달하는
			기능이므로 포워드 된 페이지까지 데이터를 공유할 수 있다.
			*/
			System.out.println("로그인실패");
			//로그인 페이지로 포워드(요청 전달)한다.
			req.getRequestDispatcher("./02Normal/login.jsp").forward(req, resp);
		}
	}

}
