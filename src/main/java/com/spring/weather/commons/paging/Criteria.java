package com.spring.weather.commons.paging;

public class Criteria {
	
	//사용자가 요청한 페이지번호
	private int page;
	//한 페이지당 들어갈 게시물 수
	private int countPerPage;	
	
	public Criteria() {
		this.page = 1;
		this.countPerPage = 10;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	public int getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(int countPerPage) {
		if(countPerPage <= 0 || countPerPage > 100) {
			this.countPerPage = 10;
			return;
		}
		this.countPerPage = countPerPage;
	}
	public int getPageStart() {
		return (this.page - 1) * countPerPage;
	}
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", countPerPage=" + countPerPage + "]";
	}
	
}








