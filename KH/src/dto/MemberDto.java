package dto;

public class MemberDto {
	
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String address;
	private String phone;
	private String img;
	private int auth;
	
	private void Memeber() {
		// TODO Auto-generated method stub

	}
	
	
	
	public MemberDto(String id, String pwd) {
		super();
		this.id = id;
		this.pwd = pwd;
	}



	public MemberDto(String id, String pwd, String name, String email, String address, String phone, String img,
			int auth) {
		super();
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.address = address;
		this.phone = phone;
		this.img = img;
		this.auth = auth;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
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

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "MemberDto [id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email + ", address=" + address
				+ ", phone=" + phone + ", img=" + img + ", auth=" + auth + "]";
	}
	
	
	
	

}
