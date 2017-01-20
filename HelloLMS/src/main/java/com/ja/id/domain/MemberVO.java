package com.ja.id.domain;

public class MemberVO {
	
	private String mxid;
	private String mxpw;
	private String mxname;
	private int mxseq;
	private int mxoffice;
	private char mxdiv;
	
	
	public MemberVO() {
		// TODO Auto-generated constructor stub
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


	public int getMxseq() {
		return mxseq;
	}


	public void setMxseq(int mxseq) {
		this.mxseq = mxseq;
	}


	public int getMxoffice() {
		return mxoffice;
	}


	public void setMxoffice(int mxoffice) {
		this.mxoffice = mxoffice;
	}


	public char getMxdiv() {
		return mxdiv;
	}


	public void setMxdiv(char mxdiv) {
		this.mxdiv = mxdiv;
	}


	public MemberVO(String mxid, String mxpw, String mxname, int mxseq, int mxoffice, char mxdiv) {
		super();
		this.mxid = mxid;
		this.mxpw = mxpw;
		this.mxname = mxname;
		this.mxseq = mxseq;
		this.mxoffice = mxoffice;
		this.mxdiv = mxdiv;
	}


	@Override
	public String toString() {
		return "MemberVO [mxid=" + mxid + ", mxpw=" + mxpw + ", mxname=" + mxname + ", mxseq=" + mxseq + ", mxoffice="
				+ mxoffice + ", mxdiv=" + mxdiv + "]";
	}
	
	
	
}
