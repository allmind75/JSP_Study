package dto;

public class PageOut {
	private int pageNum;	//현재 페이지
	private int pageSize;	//페이지 글의 개수
	private int totalPage;		//총 글의 개수
	private int pageCnt;		//페이지 개수
	private int prevPage;	//이전 페이지
	private int nextPage;	//다음 페이지
	
	public PageOut() {
		
	}
	
	public PageOut(int pageNum, int pageSize, int totalPage, int pageCnt, int prevPage, int nextPage) {
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.totalPage = totalPage;
		this.pageCnt = pageCnt;
		this.prevPage = prevPage;
		this.nextPage = nextPage;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotal() {
		return totalPage;
	}

	public void setTotal(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}
}