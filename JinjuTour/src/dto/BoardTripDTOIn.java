package dto;

public class BoardTripDTOIn {

	private int tnum;
	private String title;
	private String content;
	private String address;
	private String phone;
	private String time;
	private String img;
	private String map;
	private int heart;
	private int reply;
	private int cnt;
	private String regdate;

	public BoardTripDTOIn() {

	}

	public BoardTripDTOIn(String title, String content, String address, String phone, String time, String img, String map) {
		super();
		this.title = title;
		this.content = content;
		this.address = address;
		this.phone = phone;
		this.time = time;
		this.img = img;
		this.map = map;
	}

	public int getTnum() {
		return tnum;
	}

	public void setTnum(int tnum) {
		this.tnum = tnum;
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

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
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

	@Override
	public String toString() {
		return "BoardDTOIn [tnum=" + tnum + ", title=" + title + ", content=" + content + ", address=" + address
				+ ", phone=" + phone + ", time=" + time + ", img=" + img + ", map=" + map + ", heart=" + heart
				+ ", reply=" + reply + ", cnt=" + cnt + ", regdate=" + regdate + "]";
	}

	
}
