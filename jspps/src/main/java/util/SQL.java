package util;

public class SQL {
	
	public static final String INSERT_USER1 = "INSERT INTO user1 VALUES(?,?,?,?)";
	public static final String SELECT_ALL_USER1 = "SELECT * FROM user1";
	public static final String SELECT_USER1 = "SELECT * FROM user1 WHERE uid =?";
	public static final String UPDATE_USER1 = "UPDATE user1 SET name=?, hp=?, age=? WHERE uid=?";
	public static final String DELETE_USER1 = "DELETE FROM user1 WHERE uid=?";
}
