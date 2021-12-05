package bbs;

public class BbsDTO {

	private String username,userpass,subject, content, wdate, udate, uip, sec, ct;
	
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getUserpass() {
		return userpass;
	}

	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
	}

	public String getSec() {
		return sec;
	}

	public void setSec(String sec) {
		this.sec = sec;
	}

	

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	
	public String getWdate() {
		return wdate;
	}

	public void setUdate(String udate) {
		this.udate = udate;
	}
	
	public String getUdate() {
		return udate;
	}

	public void setUip(String uip) {
		this.uip = uip;
	}
	
	public String getUip() {
		return uip;
	}
	
}
