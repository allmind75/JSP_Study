package dto;

public class PageIn {

	private int start;		//가져올 글의 시작위
	private int pageSize;	//가져올 글의 개수

	private String word;	//검색어
	private int mode;		//검색 방식
	
	public PageIn(int start, int pageSize) {
		this.start = start;
		this.pageSize = pageSize;
	}
	
	public PageIn(String word, int mode) {
		this.word = word;
		this.mode = mode;
	}
	
	public PageIn(int start, int pageSize, String word, int mode) {
		this.start = start;
		this.pageSize= pageSize;
		this.word = word;
		this.mode = mode;
	}
	
	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public int getMode() {
		return mode;
	}

	public void setMode(int mode) {
		this.mode = mode;
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