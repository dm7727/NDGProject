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

public class NDGmemberEditController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		/*
		파라미터로 전달된 idx값을 받은 후 기존 게시물을 조회한다.
		조회된 결과를 수정페이지의 각 input태그에 value속성으로 삽입한다.
		<textarea>는 value속성이 없으므로 태그사이에 값을 삽입한다. 
		*/
		String userid = req.getParameter("userid");
		ServletContext application = getServletContext();
		ndgmemberDAO dao = new ndgmemberDAO(application);
		ndgmemberDTO dto = dao.selectView(userid);
		req.setAttribute("dto", dto);
		req.getRequestDispatcher("./memberedit.jsp").forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String userid = req.getParameter("userid");
		
		String name = req.getParameter("name");
		String pass = req.getParameter("pass");
		String gender = req.getParameter("gender");
		String address = req.getParameter("address");
		String email = req.getParameter("email");
		String mobile = req.getParameter("mobile");
		
		ndgmemberDTO dto = new ndgmemberDTO();
		dto.setName(name);
		dto.setUserid(userid);
		dto.setPass(pass);
		dto.setGender(gender);
		dto.setAddress(address);
		dto.setEmail(email);
		dto.setMobile(mobile);
		
		ServletContext application = getServletContext();
		ndgmemberDAO dao = new ndgmemberDAO(application);
		//게시물 조회를 위해 상세보기에서 작성했던 메서드를 그대로 이용한다.
		int result = dao.updatePost(dto);
		//req.setAttribute("dto", dto);
		dao.close();


		if(result==1){
			//수정이 정상적으로 처리된 경우에는 1이 반환되고, 상세보기로 이동한다.
			System.out.println("수정성공");
			resp.sendRedirect("./memberview.do?userid="+dto.getUserid());
		}
		else {
			System.out.println("수정실패");
			resp.sendRedirect("./memberlist.do");
			//실패한 경우에는 뒤로 이동한다.
			//JSFunction.alertBack("수정하기에 실패했습니다.", out);
		}
		
		
		
		
		
		
		
		

	}
}
