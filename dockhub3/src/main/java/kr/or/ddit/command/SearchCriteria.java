package kr.or.ddit.command;

public class SearchCriteria extends Criteria {

	private String searchType=""; // 검색구분
	private String keyword=""; //검색어
	private String mber_sn;
	private int type_code;
	

	public int getType_code() {
		return type_code;
	}
	public void setType_code(int type_code) {
		this.type_code = type_code;
	}
	public String getMber_sn() {
		return mber_sn;
	}
	public void setMber_sn(String mber_sn) {
		this.mber_sn = mber_sn;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
}
