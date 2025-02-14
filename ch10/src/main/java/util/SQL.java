package util;

public class SQL {
	
	//user1
	public static final String INSERT_USER1 = "INSERT INTO user1 VALUES(?,?,?,?)";
	public static final String SELECT_USER1 = "SELECT * FROM user1 WHERE uid=?";
	public static final String SELECT_ALL_USER1 = "SELECT * FROM user1";
	public static final String UPDATE_USER1 = "UPDATE user1 SET name=?, hp=?, age=? WHERE uid=?";
	public static final String DELETE_USER1 = "DELETE FROM user1 WHERE uid=?";
	
	//user2
	public static final String INSERT_USER2 = "INSERT INTO user2 VALUES(?,?,?,?,?)";
	public static final String SELECT_USER2 = "SELECT * FROM user2 WHERE uid=?";
	public static final String SELECT_ALL_USER2 = "SELECT * FROM user2";
	public static final String UPDATE_USER2 = "UPDATE user2 SET name=?, hp=?, age=?, addr=? WHERE uid=?";
	public static final String DELETE_USER2 = "DELETE FROM user2 WHERE uid=?";
	
	
}
