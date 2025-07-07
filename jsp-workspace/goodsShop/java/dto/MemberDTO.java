package dto;

import java.io.Serializable;
import java.sql.Date;


public class MemberDTO implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 705295201283842865L;
	
	private String m_id;         // 아이디
	private String m_password;   // 비밀번호
	private String m_name;       // 이름
	private String m_gender;     // 성별
	private String m_birth;      // 생년월일
	private String m_mail;       // 이메일
	private String m_phone;      // 전화번호
	private String m_address;    // 주소
	private Date  m_regist_day;   // 가입날짜
	
	
	public MemberDTO() { // 기본생성자
		super();
	}



	public String getM_id() {
		return m_id;
	}


	public String getM_password() {
		return m_password;
	}


	public String getM_name() {
		return m_name;
	}


	public String getM_gender() {
		return m_gender;
	}


	public String getM_birth() {
		return m_birth;
	}


	public String getM_mail() {
		return m_mail;
	}


	public String getM_phone() {
		return m_phone;
	}


	public String getM_address() {
		return m_address;
	}


	public Date getM_regist_day() {
		return m_regist_day;
	}


	public void setM_id(String m_id) {
		this.m_id = m_id;
	}


	public void setM_password(String m_password) {
		this.m_password = m_password;
	}


	public void setM_name(String m_name) {
		this.m_name = m_name;
	}


	public void setM_gender(String m_gender) {
		this.m_gender = m_gender;
	}


	public void setM_birth(String m_birth) {
		this.m_birth = m_birth;
	}


	public void setM_mail(String m_mail) {
		this.m_mail = m_mail;
	}


	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}


	public void setM_address(String m_address) {
		this.m_address = m_address;
	}


	public void setM_regist_day(Date m_regist_day) {
		this.m_regist_day = m_regist_day;
	}



	@Override
	public String toString() {
		return "MemberDTO [m_id=" + m_id + ", m_password=" + m_password + ", m_name=" + m_name + ", m_gender="
				+ m_gender + ", m_birth=" + m_birth + ", m_mail=" + m_mail + ", m_phone=" + m_phone + ", m_address="
				+ m_address + ", m_regist_day=" + m_regist_day + "]";
	}



	
	
	
	
	
	
	
}
