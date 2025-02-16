package dto;

public class User3DTO {

	private String uid;
	private String name;
	private int age;
	private String hp;
	private String job;
	private String addr;
	
	@Override
	public String toString() {
		return "User3DTO [uid=" + uid + ", name=" + name + ", age=" + age + ", hp=" + hp + ", job=" + job + ", addr="
				+ addr + "]";
	}
	
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setAge(String age) {
		if(age != null) {			
			this.age = Integer.parseInt(age);
		}
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
}
