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
import javax.servlet.http.HttpSession;

import utils.BoardPage;

public class NDGListController2 extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//일단 서버연결
		ndgfanboardDAO dao = new ndgfanboardDAO();
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		String searchField = req.getParameter("searchField");
		String searchWord = req.getParameter("searchWord");
		
		if(searchWord != null) {
			map.put("searchField", searchField);
			map.put("searchWord", searchWord);
		}
		int totalCount = dao.selectCount(map);
		
		ServletContext application = getServletContext();
		//한페이지당 출력할 게시물의 갯수
		int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
		//한 블럭당 출력할 페이지번호 갯수
		int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));

		/*
		목록에 첫 진입시에는 무조건 1페이지로 가정한 후 게시물을 얻어옴.
		특정 페이지로 진입한 경우에는 파라미터를 받아서 구간을 계산해서 얻어옴. 
		*/
		int pageNum =1;
		//파라미터로 넘어오는 pageNum이 있다면 값을 얻어와서...
		String pageTemp = req.getParameter("pageNum");
		//정수로 변환한 후 현재 페이지번호로 지정한다.
		if(pageTemp != null && !pageTemp.equals("")) {
			pageNum = Integer.parseInt(pageTemp);
		}
		
		//게시물의 구간을 계산함.
		int start = (pageNum - 1) * pageSize +1;
		int end = pageNum * pageSize;
		//계산된 값은 Model로 전달하기 위해 Map컬렉션에 저장함.
		map.put("start", start);
		map.put("end", end);
		//페이지 처리 end
		
		//현재 페이지에 출력할 게시물을 얻어옴.
		List<ndgfanboardDTO> boardLists = dao.selectListPage(map);
		//커넥션풀에 자원 반납
		dao.close();
		
		//페이지 번호를 생성하기 위한 유틸리티 클래스의 메서드 호출
		//모델1 방식의 게시판에서 사용했던 메서드를 그대로 사용한다.
		String pagingImg = BoardPage.pagingStr(totalCount, pageSize, blockPage, pageNum, "./fanlist.do");
		//View로 전달할 데이터를 Map컬렉션에 저장함.
		//페이지번호
		map.put("pagingImg", pagingImg);
		//전체 게시물의 갯수
		map.put("totalCount", totalCount);
		//한페이지당 출력할 게시물의 갯수
		map.put("pageSize", pageSize);
		//현재 페이지 번호
		map.put("pageNum", pageNum);
		
		//View로 전달할 객체들을 request영역에 저장한다.
		req.setAttribute("boardLists", boardLists);
		req.setAttribute("map", map);
		//View로 포워드를 걸어준다.
		//req.getRequestDispatcher("./02Normal/list2.jsp").forward(req, resp);
		
		
		//컨트롤러 공유하기 도전
		String uri = req.getRequestURI();
		System.out.println(uri);
		int lastSlash = uri.lastIndexOf("/");
		String commandStr = uri.substring(lastSlash);
		
		if(commandStr.equals("/fanlist.do")){
			req.getRequestDispatcher("/02Normal/list2.jsp").forward(req, resp);
		}
		else {
			req.getRequestDispatcher("/01Admin/fanboardlist.jsp").forward(req, resp);
		}
		
	}
	
}
