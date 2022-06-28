package ndgController;

public class ndgfanboardDTO {

	private String idx; 	
	private String userid; 
	private String title; 
	private String content; 
    private java.sql.Date postdate; 
    private String ofile1;
    private String ofile2;  
    private String ofile3;  
    private String sfile1;  	
    private String sfile2;  	
    private String sfile3;  	
    private int downcount;
    private String pass;  
    private int visitcount;
    
	public String getIdx() {
		return idx;
	}
	public void setIdx(String idx) {
		this.idx = idx;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public java.sql.Date getPostdate() {
		return postdate;
	}
	public void setPostdate(java.sql.Date postdate) {
		this.postdate = postdate;
	}
	public String getOfile1() {
		return ofile1;
	}
	public void setOfile1(String ofile1) {
		this.ofile1 = ofile1;
	}
	public String getOfile2() {
		return ofile2;
	}
	public void setOfile2(String ofile2) {
		this.ofile2 = ofile2;
	}
	public String getOfile3() {
		return ofile3;
	}
	public void setOfile3(String ofile3) {
		this.ofile3 = ofile3;
	}
	public String getSfile1() {
		return sfile1;
	}
	public void setSfile1(String sfile1) {
		this.sfile1 = sfile1;
	}
	public String getSfile2() {
		return sfile2;
	}
	public void setSfile2(String sfile2) {
		this.sfile2 = sfile2;
	}
	public String getSfile3() {
		return sfile3;
	}
	public void setSfile3(String sfile3) {
		this.sfile3 = sfile3;
	}
	public int getDowncount() {
		return downcount;
	}
	public void setDowncount(int downcount) {
		this.downcount = downcount;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public int getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(int visitcount) {
		this.visitcount = visitcount;
	}
        
}
