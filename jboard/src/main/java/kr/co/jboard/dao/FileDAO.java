package kr.co.jboard.dao;

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
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertFile(FileDTO dto) {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.INSERT_FILE);
			pstmt.setInt(1, dto.getAno());
			pstmt.setString(2, dto.getoName());
			pstmt.setString(3, dto.getsName());
			pstmt.executeUpdate();
			closeAll();
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public FileDTO selectFile(String fno) {
		
		FileDTO fileDTO = null;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.SELECT_FILE_BY_FNO);
			pstmt.setString(1, fno);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				fileDTO = new FileDTO();
				fileDTO.setFno(rs.getInt(1));
				fileDTO.setAno(rs.getInt(2));
				fileDTO.setoName(rs.getString(3));
				fileDTO.setsName(rs.getString(4));
				fileDTO.setDownload(rs.getInt(5));
				fileDTO.setRdate(rs.getString(6));
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return fileDTO;
	}
	
	public List<FileDTO> selectAllFile() {
		return null;
	}
	
	public void updateFile(FileDTO dto) {
		
	}
	
	public void updateFileDownloadCount(String fno) {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.UPDATE_FILE_DOWNLOAD_COUNT);
			pstmt.setString(1, fno);
			pstmt.executeUpdate();
			closeAll();			
		}catch (Exception e) {
			logger.error(e.getMessage());
		}
	}
	
	public void deleteFile(int fno) {
		
	}
}