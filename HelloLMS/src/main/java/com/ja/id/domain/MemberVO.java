package com.ja.id.domain;

public class MemberVO {
	
	private String mxid;
	private String mxpw;
	private String mxname;
	
	public MemberVO() {
		// TODO Auto-generated constructor stub
	}

	public MemberVO(String mxid, String mxpw, String mxname) {
		super();
		this.mxid = mxid;
		this.mxpw = mxpw;
		this.mxname = mxname;
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

	public String getMxname() {
		return mxname;
	}

	public void setMxname(String mxname) {
		this.mxname = mxname;
	}

	@Override
	public String toString() {
		return "MemberVO [mxid=" + mxid + ", mxpw=" + mxpw + ", mxname=" + mxname + "]";
	}
	
	
	
}
