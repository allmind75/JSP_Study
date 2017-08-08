package db;

public class Member {
	
	private int num;
	private String name;
	private String position;
	private String part;
	
	public Member(int num, String name, String position, String part) {
		this.num = num;
		this.name = name;
		this.position = position;
		this.part = part;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPosition() {
		return position;
	}
	public void setPosition(String position) {
		this.position = position;
	}
	public String getPart() {
		return part;
	}
	public void setPart(String part) {
		this.part = part;
	}
	

	
}
