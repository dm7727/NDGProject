package ndgController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;

import common.JDBConnect;

public class ndgmemberDAO extends JDBConnect {
	
	public ndgmemberDAO(ServletContext application) {
		super(application);
	}
	
	public int memberInsert(ndgmemberDTO dto) {
		int result = 0;
		try {
			String sql = "INSERT INTO ndg_member VALUES (?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			psmt = con.prepareStatement(sql);
			psmt.setString(1, dto.getUserid()); 
			psmt.setString(2, dto.getPass()); 
			psmt.setString(3, dto.getName()); 
			psmt.setString(4, dto.getGender());
			psmt.setString(5, dto.getBirthday());
			psmt.setString(6, dto.getAddress());
			psmt.setString(7, dto.getEmail());
			psmt.setString(8, dto.getMobile());
			
			result = psmt.executeUpdate();
			System.out.println(result + "행이 입력되었습니다.");
		} 
		catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	} 
	
	public ndgmemberDTO getNdgmemberDTO(String userid, String pass) {
		//DTO객체 생성
		ndgmemberDTO dto = new ndgmemberDTO();
		//회원로그인을 위한 쿼리문 작성
		String query = "SELECT * FROM ndg_member WHERE userid=? AND pass=? ";
		
		try {
			//쿼리문 실행을 위한 prepared객체 생성 및 인파라미터 설정
			psmt= con.prepareStatement(query);
			psmt.setString(1, userid);
			psmt.setString(2, pass);
			
			rs = psmt.executeQuery(); 
			
			//반환된 ResultSet객체를 통해 회원정보가 있는지 확인
			if(rs.next()) {
				//정보가 있다면 DTO객체에 회원정보를 저장한다.
				dto.setUserid(rs.getString("userid")); 
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString(3));
				dto.setGender(rs.getString(4));
				dto.setBirthday(rs.getString(5));
				dto.setAddress(rs.getString(6));
				dto.setEmail(rs.getString(7));
				dto.setMobile(rs.getString(8));
			}
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM ndg_member";
		if (map.get("searchWord") !=null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%'"; 
		}
		
		try {
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
			rs.next();
			totalCount = rs.getInt(1);
		}
		
		catch (Exception e) {
			System.out.println("회원 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public List<ndgmemberDTO> selectListPage(Map<String, Object> map){
		
		List<ndgmemberDTO> board = new ArrayList<ndgmemberDTO>();
		
		String query = "select * from (select tb.*, rownum rNum from (select * from ndg_member ";
		if (map.get("searchWord") !=null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%' "; 
		}
		query += " ORDER BY regidate DESC) tb) where rNum between ? and ? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while (rs.next()) {
				
				ndgmemberDTO dto = new ndgmemberDTO();

				//테이블이 변경되었으므로 저장하는 부분은 수정이 필요함..
				dto.setUserid(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setGender(rs.getString(4));
				dto.setBirthday(rs.getString(5));
				dto.setAddress(rs.getString(6));
				dto.setEmail(rs.getString(7));
				dto.setMobile(rs.getString(8));
				dto.setRegidate(rs.getDate(9));
				board.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("회원 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}
	
	public int deletePost(String userid) {
		int result = 0;
		try {
			String query = "delete from ndg_member where userid=?";
			psmt = con.prepareStatement(query);
			psmt.setString(1, userid);
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("회원 삭제 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public ndgmemberDTO selectView(String userid) {
		
		ndgmemberDTO dto = new ndgmemberDTO();
		String query = "select * from ndg_member where userid=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, userid);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setUserid(rs.getString(1));
				dto.setPass(rs.getString(2));
				dto.setName(rs.getString(3));
				dto.setGender(rs.getString(4));
				dto.setBirthday(rs.getString(5));
				dto.setAddress(rs.getString(6));
				dto.setEmail(rs.getString(7));
				dto.setMobile(rs.getString(8));
				dto.setRegidate(rs.getDate(9));
			}
		}
		catch (Exception e) {
			System.out.println("회원 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	
	//게시물 수정 처리
	public int updatePost(ndgmemberDTO dto) {
		int result = 0;
		try {
			//update쿼리문 작성
			String query = "update ndg_member set pass=?, name=?, gender=?, address=?, email=?, mobile=? where userid=?";
			
			//동적쿼리문 실행을 위해 prepared객체 생성 및 인파라미터 설정
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getPass());
			psmt.setString(2, dto.getName());
			psmt.setString(3, dto.getGender());
			psmt.setString(4, dto.getAddress());
			psmt.setString(5, dto.getEmail());
			psmt.setString(6, dto.getMobile());
			psmt.setString(7, dto.getUserid());
			
			//쿼리실행 및 결과 반환(update된 행의 갯수)
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 수정 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
}