package ndgController;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NDGRegistController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("./02Normal/regist.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		ServletContext application = getServletContext();
		
		String email = req.getParameter("email1")+"@"+req.getParameter("email2");  
		String mobile = req.getParameter("mobile1")+"-"+req.getParameter("mobile2")+"-"+req.getParameter("mobile3");
		String address = req.getParameter("address1") + req.getParameter("address2");

		ndgmemberDTO dto = new ndgmemberDTO(); 

		dto.setUserid(req.getParameter("userid"));
		dto.setPass(req.getParameter("pass1"));
		dto.setName(req.getParameter("name"));
		dto.setGender(req.getParameter("gender"));
		dto.setBirthday(req.getParameter("birthday"));
		dto.setAddress(address);
		dto.setMobile(mobile);
		dto.setEmail(email);

		ndgmemberDAO dao = new ndgmemberDAO(application); 
		int result = dao.memberInsert(dto);
		dao.close();
		
		//나중에 어디로 갈지 처리
		if(result == 1) {
			//insert에 성공하면 메인으로 이동한다.
			resp.sendRedirect("./02Normal/main.jsp");
			System.out.println("회원가입완료 메인으로 갑니다.");
		}
		else {
			resp.sendRedirect("./02Normal/regist.jsp");
			System.out.println("회원가입 실패 다시 회원가입페이지로 갑니다.");
		}
		
	}

}
