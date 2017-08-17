package dto;

public class MemDTOIn {

	private String id;
	private String pw;
	private String name;
	private String phone;
	private String email;
	private String path;

	public MemDTOIn() {
	}

	public MemDTOIn(String id, String pw) {
		super();
		this.id = id;
		this.pw = pw;
	}

	public MemDTOIn(String id, String pw, String name, String phone, String email, String path) {
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.phone = phone;
		this.email = email;
		this.path = path;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
