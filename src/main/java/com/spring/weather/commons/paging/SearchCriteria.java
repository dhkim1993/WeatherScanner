package com.spring.weather.commons.paging;

public class SearchCriteria extends Criteria{
	
	private String condition;
	private String keyword;
	
	public SearchCriteria() {
		super();
		this.keyword="";
		this.condition = "";
		
	}

	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
}
