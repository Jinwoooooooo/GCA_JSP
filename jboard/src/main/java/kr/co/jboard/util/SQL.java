package kr.co.jboard.util;

public class SQL {

	// terms
	public static final String SELECT_TERMS = "SELECT * FROM `terms` WHERE `no`=?";
	
	//user
	public static final String SELECT_COUNT_USER = "SELECT COUNT(*) FROM user ";
	public static final String WHERE_UID = "WHERE uid=?";
	public static final String WHERE_NICK = "WHERE nick=?";
	public static final String WHERE_EMAIL = "WHERE email=?";
	public static final String WHERE_HP = "WHERE hp=?";
	public static final String SELECT_USER = "SELECT * FROM user WHERE uid = ? and pass = SHA2(?, 256)";
	public static final String INSERT_USER = "INSERT INTO user SET " + "uid = ?,"
																	 + "pass = SHA2(?, 256),"
																	 + "name = ?,"
																	 + "nick = ?,"
																	 + "email = ?,"
																	 + "hp = ?,"
																	 + "zip = ?,"
																	 + "addr1 = ?,"
																	 + "addr2 = ?,"
																	 + "regip = ?,"
																	 + "regDate = NOW()";
	
	//article
	public static final String SELECT_ALL_ARTICLE_BY_SEARCH = "SELECT a.*, u.nick FROM article AS a JOIN user AS u ON a.writer = u.uid ";
	public static final String SELECT_COUNT_ARTICLE_BY_SEARCH = "SELECT COUNT(*) FROM article AS a ";
	public static final String JOIN_FOR_SEARCH_NICK  = "JOIN `user` as u ON a.writer = u.uid ";
	public static final String WHERE_FOR_SEARCH_TITLE = "WHERE title LIKE ? ";
	public static final String WHERE_FOR_SEARCH_CONTENT = "WHERE content LIKE ? ";
	public static final String WHERE_FOR_SEARCH_WRITER = "WHERE nick LIKE ? ";
	public static final String ORDER_FOR_SEARCH = "ORDER BY no DESC ";
	public static final String LIMIT_FOR_SEARCH = "LIMIT ?, 10";
	
	
	
	public static final String SELECT_ARTICLE_WITH_FILE = "SELECT "
															+ "a.*,"
															+ "f.*,"
															+ "u.`nick` "
															+ "FROM `article` AS a "
															+ "LEFT JOIN `file` AS f ON a.no = f.ano "
															+ "JOIN `user` AS u ON a.writer = u.uid "
															+ "WHERE a.`no`=?";
	
	
	public static final String SELECT_MAX_NO = "SELECT MAX(no) FROM article";
	public static final String SELECT_COUNT_ARTICLE = "SELECT COUNT(*) FROM article";
	public static final String SELECT_ALL_ARTICLE = "SELECT a.*, u.nick FROM article AS a JOIN user AS u ON a.writer = u.uid ORDER BY a.no desc LIMIT ?, 10";
	public static final String INSERT_ARTICLE = "INSERT INTO article SET " + "title = ?,"
																		   + "content = ?,"
																		   + "file = ?,"
																		   + "writer = ?,"
																		   + "regip = ?,"
																		   + "wdate = NOW()";
	
	//file
	public static final String INSERT_FILE = "INSERT INTO file SET " + "ano = ?,"
																	 + "oName = ?,"
																	 + "sName = ?,"
																	 + "rdate = NOW()";
	public final static String SELECT_FILE_BY_FNO = "SELECT * FROM `file` WHERE `fno`=?";
	public final static String UPDATE_FILE_DOWNLOAD_COUNT = "UPDATE `file` SET `download` = `download` + 1 WHERE `fno`=?";
			
																	
	
	

	
	
}

