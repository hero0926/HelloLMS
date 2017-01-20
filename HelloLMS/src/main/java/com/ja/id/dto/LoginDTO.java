package com.ja.id.dto;

public class LoginDTO {
	
	private String mxid;
	private String mxpw;
	
	public LoginDTO() {
		// TODO Auto-generated constructor stub
	}

	public LoginDTO(String mxid, String mxpw) {
		super();
		this.mxid = mxid;
		this.mxpw = mxpw;
	}

	public String getMxid() {
		return mxid;
	}

	public void setMxid(String mxid) {
		this.mxid = mxid;
	}

	public String getMxpw() {
		return mxpw;
	}

	public void setMxpw(String mxpw) {
		this.mxpw = mxpw;
	}

	@Override
	public String toString() {
		return "LoginDTO [mxid=" + mxid + ", mxpw=" + mxpw + "]";
	}
	
	

}
