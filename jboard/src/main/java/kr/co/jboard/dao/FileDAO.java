package kr.co.jboard.dao;

import java.sql.PreparedStatement;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard.dto.FileDTO;
import kr.co.jboard.util.DBHelper;
import kr.co.jboard.util.SQL;

public class FileDAO extends DBHelper {
	private static final FileDAO INSTANCE = new FileDAO();
	public static FileDAO getInstance() {
		return INSTANCE;
	}
	private FileDAO() {}
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	public void insertFile(FileDTO dto) {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.INSERT_FILE);
			pstmt.setInt(1, dto.getAno());
			pstmt.setString(2, dto.getoName());
			pstmt.setString(3, dto.getsName());
			pstmt.executeUpdate();
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public FileDTO selectFile(int fno) {
		return null;
	}
	
	public List<FileDTO> selectAllFile() {
		return null;
	}
	
	public void updateFile(FileDTO dto) {
		
	}
	
	public void deleteFile(int fno) {
		
	}
}