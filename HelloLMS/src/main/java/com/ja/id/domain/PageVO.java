package com.ja.id.domain;
import java.io.Serializable;
import java.util.ArrayList;

import org.springframework.stereotype.Service;

@Service
public class PageVO implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int curPage=1;
	private int perPage=10;
	private int naviSize=5;
	private int totalCount=0;
	private int totalPage=0;
	private int startN=0;
	private int endN=0;
	private int flimit=1;
	
	public PageVO() {
		// TODO Auto-generated constructor stub
	}

	public PageVO(int perPage, int naviSize, int totalCount) {
		super();
		this.perPage = perPage;
		this.totalCount = totalCount;
		this.naviSize = naviSize;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getNaviSize() {
		return naviSize;
	}

	public void setNaviSize(int naviSize) {
		this.naviSize = naviSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	
	public void setNavi(int totalCount){
		totalPage = totalCount/perPage;
		if(totalPage%perPage!=0){
			totalPage++;
		}
		
		startN = ((curPage-1)/naviSize)*naviSize+1;
		endN = (startN-1)+naviSize;
		if (endN>totalPage){
			endN = totalPage;
		}
	}

	public int getStartN() {
		return startN;
	}

	public void setStartN(int startN) {
		this.startN = startN;
	}

	public int getEndN() {
		return endN;
	}

	public void setEndN(int endN) {
		this.endN = endN;
	}

	public int getFlimit() {
		return flimit;
	}

	public void setFlimit(int flimit) {
		this.flimit = flimit;
	}
	
	
}
