package db;

public class BoardDTOIn {

	private String title;
	private String Content;
	private int count;
	private String reg_date;
	
	public BoardDTOIn(String title, String Content) {
		this.title = title;
		this.Content = Content;
	}
	
	public BoardDTOIn(){}
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
}
