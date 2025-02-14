package util;

public class SQL {
	
	//Customer
	public static final String INSERT_CUSTOMER = "INSERT INTO customer VALUES(?,?,?,?,NOW())";
	public static final String SELECT_CUSTOMER = "SELECT * FROM user1 WHERE uid=?";
	public static final String SELECT_ALL_CUSTOMER = "SELECT * FROM user1";
	public static final String UPDATE_CUSTOMER = "UPDATE user1 SET name=?, hp=?, age=? WHERE uid=?";
	public static final String DELETE_CUSTOMER = "DELETE FROM user1 WHERE uid=?";
	
	//user2
	public static final String INSERT_USER2 = "INSERT INTO user1 VALUES(?,?,?,?,?)";
	public static final String SELECT_USER2 = "SELECT * FROM user1 WHERE uid=?";
	public static final String SELECT_ALL_USER2 = "SELECT * FROM user1";
	public static final String UPDATE_USER2 = "UPDATE user1 SET name=?, hp=?, age=?, addr=? WHERE uid=?";
	public static final String DELETE_USER2 = "DELETE FROM user1 WHERE uid=?";
	
	
}
