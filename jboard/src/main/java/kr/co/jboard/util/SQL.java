package kr.co.jboard.util;

public class SQL {

	// terms
	public static final String SELECT_TERMS = "SELECT * FROM `terms` WHERE `no`=?";
	public static final String INSERT_USER = "INSERT INTO user SET " + "uid = ?,"
																	 + "pass = ?,"
																	 + "name = ?,"
																	 + "nick = ?,"
																	 + "email = ?,"
																	 + "hp = ?,"
																	 + "zip = ?,"
																	 + "addr1 = ?,"
																	 + "addr2 = ?,"
																	 + "regip = ?,"
																	 + "regDate = NOW()";
			
																	
	
	

	
	
}
