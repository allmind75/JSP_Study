package dto;

public class BoardProductDTO {

	private int pnum;
	private String title;
	private String content;
	private String address;
	private String phone;
	private String page;
	private String img;
	private String map;
	private int heart;
	private int reply;
	private int cnt;
	private String regdate;

	public BoardProductDTO() {

	}

	public BoardProductDTO(int pnum, String title, String content, String address, String phone, String page,
			String img, String map, int heart, int reply, int cnt, String regdate) {
		super();
		this.pnum = pnum;
		this.title = title;
		this.content = content;
		this.address = address;
		this.phone = phone;
		this.page = page;
		this.img = img;
		this.map = map;
		this.heart = heart;
		this.reply = reply;
		this.cnt = cnt;
		this.regdate = regdate;
	}

	public int getPnum() {
		return pnum;
	}

	public void setPnum(int pnum) {
		this.pnum = pnum;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPage() {
		return page;
	}

	public void setPage(String page) {
		this.page = page;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getMap() {
		return map;
	}

	public void setMap(String map) {
		this.map = map;
	}

	public int getHeart() {
		return heart;
	}

	public void setHeart(int heart) {
		this.heart = heart;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}

	public int getCnt() {
		return cnt;
	}

	public void setCnt(int cnt) {
		this.cnt = cnt;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

}
