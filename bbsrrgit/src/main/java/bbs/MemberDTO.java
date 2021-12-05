package bbs;

import java.text.*;
import java.util.*;

public class MemberDTO {

	private String userid, userpass, username, useremail, tel, gender, geo, wdate, udate, level;
	Calendar time = Calendar.getInstance();
	SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String ntime = sd.format(time.getTime());
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getUserpass() {
		return userpass;
	}
	public void setUserpass(String userpass) {
		this.userpass = userpass;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getUseremail() {
		return useremail;
	}
	public void setUseremail(String useremail) {
		this.useremail = useremail;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getGeo() {
		return geo;
	}
	public void setGeo(String geo) {
		this.geo = geo;
	}
	public String getWdate() {
		return ntime;
	}
	public void setWdate(String wdate) {
		this.wdate = ntime;
	}
	public String getUdate() {
		return ntime;
	}
	public void setUdate() {
		this.udate = ntime;
	}
	public String getLevel() {
		return "1";
	}
	public void setLevel(String level) {
		this.level = level;			
	}
	public Calendar getTime() {
		return time;
	}
	public void setTime(Calendar time) {
		this.time = time;
	}
	
}
