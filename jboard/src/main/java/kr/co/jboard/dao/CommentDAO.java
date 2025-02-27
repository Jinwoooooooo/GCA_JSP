package kr.co.jboard.dao;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import kr.co.jboard.dto.CommentDTO;
import kr.co.jboard.util.DBHelper;
import kr.co.jboard.util.SQL;

public class CommentDAO extends DBHelper {
	private static final CommentDAO INSTANCE = new CommentDAO();
	public static CommentDAO getInstance() {
		return INSTANCE;
	}
	private CommentDAO() {}
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void insertComment(CommentDTO dto) {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.INSERT_COMMENT);
			pstmt.setInt(1, dto.getParent());
			pstmt.setString(2, dto.getContent());
			pstmt.setString(3, dto.getWriter());
			pstmt.setString(4, dto.getRegip());
			pstmt.executeUpdate();
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		
	}
	
	public CommentDTO selectComment(int cno) {
		return null;
	}
	
	public List<CommentDTO> selectAllComment(String parent) {
		
		List<CommentDTO> dtos = new ArrayList<>();
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.SELECT_ALL_COMMENT_BY_PARENT);
			pstmt.setString(1, parent);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CommentDTO dto = new CommentDTO();
				dto.setCno(rs.getInt(1));
				dto.setParent(rs.getInt(2));
				dto.setContent(rs.getString(3));
				dto.setWriter(rs.getString(4));
				dto.setRegip(rs.getString(5));
				dto.setWdate(rs.getString(6).substring(0, 10));
				dto.setNick(rs.getString(7));
				dtos.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			logger.error(e.getMessage());
		}
		return dtos;
	}
	
	public void updateComment(CommentDTO dto) {
		
	}
	
	public void deleteComment(int cno) {
		
	}
}