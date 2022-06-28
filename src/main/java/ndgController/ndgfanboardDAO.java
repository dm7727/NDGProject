package ndgController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import common.DBConnPool;

public class ndgfanboardDAO extends DBConnPool {

	public ndgfanboardDAO() {
		super();
	}
	
	public int selectCount(Map<String, Object> map) {
		int totalCount = 0;
		String query = "SELECT COUNT(*) FROM ndg_fanboard";
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
	
	public List<ndgfanboardDTO> selectListPage(Map<String, Object> map){
		
		List<ndgfanboardDTO> board = new ArrayList<ndgfanboardDTO>();
		
		String query = "select * from (select tb.*, rownum rNum from (select * from ndg_fanboard ";
		if (map.get("searchWord") !=null) {
			query += " WHERE " + map.get("searchField") + " "
					+ " LIKE '%" + map.get("searchWord") + "%' "; 
		}
		query += " ORDER BY idx DESC) tb) where rNum between ? and ? ";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, map.get("start").toString());
			psmt.setString(2, map.get("end").toString());
			rs = psmt.executeQuery();
			while (rs.next()) {
				
			ndgfanboardDTO dto = new ndgfanboardDTO();

			//테이블이 변경되었으므로 저장하는 부분은 수정이 필요함..
			dto.setIdx(rs.getString(1));
			dto.setUserid(rs.getString(2));
			dto.setTitle(rs.getString(3));
			dto.setContent(rs.getString(4));
			dto.setPostdate(rs.getDate(5));
			dto.setOfile1(rs.getString(6));
			dto.setOfile2(rs.getString(7));
			dto.setOfile3(rs.getString(8));
			dto.setSfile1(rs.getString(9));
			dto.setSfile2(rs.getString(10));
			dto.setSfile3(rs.getString(11));
			dto.setDowncount(rs.getInt(12));
			dto.setPass(rs.getString(13));
			dto.setVisitcount(rs.getInt(14));
			
			board.add(dto);
			}
		}
		catch(Exception e) {
			System.out.println("게시물 조회 중 예외 발생");
			e.printStackTrace();
		}
		return board;
	}

	public int insertWrite(ndgfanboardDTO dto) {
		int result = 0;
		try {
			String query = "insert into ndg_fanboard (idx, userid, title, content, ofile1, ofile2, ofile3, sfile1, sfile2, sfile3, pass) "
					+ " values (ndg_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			
			psmt = con.prepareStatement(query);
			psmt.setString(1, dto.getUserid());
			psmt.setString(2, dto.getTitle());
			psmt.setString(3, dto.getContent());
			psmt.setString(4, dto.getOfile1());
			psmt.setString(5, dto.getOfile2());
			psmt.setString(6, dto.getOfile3());
			psmt.setString(7, dto.getSfile1());
			psmt.setString(8, dto.getSfile2());
			psmt.setString(9, dto.getSfile3());
			psmt.setString(10, dto.getPass());
			result = psmt.executeUpdate();
		}
		catch (Exception e) {
			System.out.println("게시물 입력 중 예외 발생");
			e.printStackTrace();
		}
		return result;
	}
	
	public ndgfanboardDTO selectView(String idx) {
		
		ndgfanboardDTO dto = new ndgfanboardDTO();
		String query = "select * from ndg_fanboard where idx=?";
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			rs = psmt.executeQuery();
			
			if(rs.next()) {
				dto.setIdx(rs.getString(1));
				dto.setUserid(rs.getString(2));
				dto.setTitle(rs.getString(3));
				dto.setContent(rs.getString(4));
				dto.setPostdate(rs.getDate(5));
				dto.setOfile1(rs.getString(6));
				dto.setOfile2(rs.getString(7));
				dto.setOfile3(rs.getString(8));
				dto.setSfile1(rs.getString(9));
				dto.setSfile2(rs.getString(10));
				dto.setSfile3(rs.getString(11));
				dto.setDowncount(rs.getInt(12));
				dto.setPass(rs.getString(13));
				dto.setVisitcount(rs.getInt(14));
			}
		}
		catch (Exception e) {
			System.out.println("게시물 상세보기 중 예외 발생");
			e.printStackTrace();
		}
		return dto;
	}
	public void updateVisitCount(String idx) {
		String query = "update ndg_fanboard set visitcount=visitcount+1 where idx=?";
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, idx);
			psmt.executeQuery();
		}
		catch (Exception e) {
			System.out.println("게시물 조회수 증가 중 예외 발생");
			e.printStackTrace();
		}
	}
	
	public void downCountPlus(String idx) {
		String sql = "update ndg_fanboard set downcount=downcount+1 where idx=?";
		
		try {
			psmt = con.prepareStatement(sql);
			psmt.setString(1, idx);
			psmt.executeUpdate();
		}
		catch (Exception e) {
		}
	}
	
	//수정/삭제전 해당 게시물의 패스워드를 검증한다.
		//즉, 게시물의 일련번호와 패스워드를 통해 조건에 부합하는 레코드가 있는지 확인한다.
		public boolean confirmPassword(String pass, String idx) {
			boolean isCorr = true;
			try {
				String sql = "select count(*) from ndg_fanboard where pass=? and idx=?";
				psmt= con.prepareStatement(sql);
				psmt.setString(1, pass);
				psmt.setString(2, idx);
				rs = psmt.executeQuery();
				
				/*
				select문에 count()함수를 사용하는 경우 조건(where절)에 만족하는 레코드가
				없을때는 0, 만족하는 레코드가 있을때는 1이상의 정수값이 반환된다.
				즉 어떤경우에도 결과값이 있으므로 next() 호출시 if문이 필요하지 않다. 
				*/
				rs.next();
				/*
				if(rs.next()) 
					=> 일반적인 select문을 사용하는 경우에 1개의 레코드만 반환될때 사용한다.
					주로 일련번호를 조건으로 추가하는 경우인데, 만족하는 레코드가 없다면
					next()를 사용할때 에러가 발생된다.
				while(rs.next())
					=> select의 결과가 2개 이상일때 사용된다. 주로 게시판의 목록과 같이
					여러개의 레코드가 반환되는 경우에 사용한다.
				*/
				
				//일치하는 결과가 없는 경우 false를 반환한다.
				if(rs.getInt(1) ==0) {
					isCorr = false;
				}
			}
			catch (Exception e) {
				//예외가 발생하면 확인이 안된것이므로 이때도 false를 반환한다.
				isCorr=false;
				e.printStackTrace();
			}
			//검증이 완료되었을때만 true를 반환한다.
			return isCorr;
		}
		
		//게시물 삭제하기
		public int deletePost(String idx) {
			int result = 0;
			try {
				String query = "delete from ndg_fanboard where idx=?";
				psmt = con.prepareStatement(query);
				psmt.setString(1, idx);
				result = psmt.executeUpdate();
			}
			catch (Exception e) {
				System.out.println("게시물 삭제 중 예외 발생");
				e.printStackTrace();
			}
			return result;
		}
		
		//게시물 수정 처리
		public int updatePost(ndgfanboardDTO dto) {
			int result = 0;
			try {
				//update쿼리문 작성
				String query = "update ndg_fanboard set title=?, userid=?, content=?, ofile1=?, ofile2=?, ofile3=?, sfile1=?, sfile2=?, sfile3=? where idx=? and pass=?";
				
				//동적쿼리문 실행을 위해 prepared객체 생성 및 인파라미터 설정
				psmt = con.prepareStatement(query);
				psmt.setString(1, dto.getTitle());
				psmt.setString(2, dto.getUserid());
				psmt.setString(3, dto.getContent());
				psmt.setString(4, dto.getOfile1());
				psmt.setString(5, dto.getOfile2());
				psmt.setString(6, dto.getOfile3());
				psmt.setString(7, dto.getSfile1());
				psmt.setString(8, dto.getSfile2());
				psmt.setString(9, dto.getSfile3());
				psmt.setString(10, dto.getIdx());
				psmt.setString(11, dto.getPass());
				
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
