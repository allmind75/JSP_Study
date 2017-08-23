package dto;

public class PageIn {

	private int start;
	private int pageSize;
	
	public PageIn() {
		
	}
	
	public PageIn(int start, int pageSize) {
		super();
		this.start = start;
		this.pageSize = pageSize;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	
}
