package dto;

public class SearchCriteria extends Criteria {

	private String searchType;
	private String keyword;

	public SearchCriteria() {
		
	}
	
	public SearchCriteria(String searchType, String keyword) {
		this.searchType = searchType;
		this.keyword = keyword;
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

	@Override
	public String toString() {
		return "SearchCriteria [page=" + super.getPage() + ", perPageNum=" + super.getPerPageNum() + ", searchType=" + searchType + ", keyword=" + keyword + "]";
	}

}
