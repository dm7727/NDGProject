package ndgController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnPool;

public class ndgboardDAO extends DBConnPool {

	public ndgboardDAO() {
		super();
	}

	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM ndg_board";
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
			System.out.println("게시물 카운트 중 예외 발생");
			e.printStackTrace();
		}
		return totalCount;
	}
	
	public List<ndgboardDTO> selectListPage(Map<String, Object> map){
		
		List<ndgboardDTO> board = new ArrayList<ndgboardDTO>();
		
		String query = "select * from (select tb.*, rownum rNum from (select * from ndg_board ";
		if (map.get("searchWord") !=null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%' "; 
		}
		
		query += " ORDER BY idx DESC) tb) where rNum between ? and ? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2,  map.get("end").toString());
			rs = psmt.executeQuery();
			while (rs.next()) {
				
				ndgboardDTO dto = new ndgboardDTO();

				//테이블이 변경되었으므로 저장하는 부분은 수정이 필요함..
				dto.setIdx(rs.getString(1));
				dto.setUserid(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile(rs.getString(6));
				dto.setSfile(rs.getString(7));
				dto.setDowncount(rs.getInt(8));
				dto.setPass(rs.getString(9));
				dto.setVisitcount(rs.getInt(10));
				
				board.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
	return board;
	}

	
	
	
	
	
	
}
