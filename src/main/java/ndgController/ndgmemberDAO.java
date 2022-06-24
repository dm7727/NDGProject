package ndgController;

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
}