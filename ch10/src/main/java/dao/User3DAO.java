package dao;

import java.util.ArrayList;
import java.util.List;

import dto.User3DTO;
import util.DBHelper;
import util.SQL;

public class User3DAO extends DBHelper {
	
	//싱글톤
	private static final User3DAO INSTANCE = new User3DAO();
	public static User3DAO getInstance() {
		return INSTANCE;
	}
	private User3DAO() {}
	
	//기본 CRUD
	public User3DTO selectUser3(String uid) {
		
		User3DTO dto = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.SELECT_USER3);
			pstmt.setString(1, uid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new User3DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setAge(rs.getInt(3));
				dto.setHp(rs.getString(4));
				dto.setJob(rs.getString(5));
				dto.setAddr(rs.getString(6));
			}
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public List<User3DTO> selectAllUser3() {
		
		List<User3DTO> dtos = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_ALL_USER3);
			
			while(rs.next()) {
				User3DTO dto = new User3DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setAge(rs.getInt(3));
				dto.setHp(rs.getString(4));
				dto.setJob(rs.getString(5));
				dto.setAddr(rs.getString(6));
				dtos.add(dto);
			}
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	public void insertUser3(User3DTO dto) {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.INSERT_USER3);
			pstmt.setString(1, dto.getUid());
			pstmt.setString(2, dto.getName());
			pstmt.setInt(3, dto.getAge());
			pstmt.setString(4, dto.getHp());
			pstmt.setString(5, dto.getJob());
			pstmt.setString(6, dto.getAddr());
			pstmt.executeUpdate();
			
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void updateUser3(User3DTO dto) {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.UPDATE_USER3);
			pstmt.setString(1, dto.getName());
			pstmt.setInt(2, dto.getAge());
			pstmt.setString(3, dto.getHp());
			pstmt.setString(4, dto.getJob());
			pstmt.setString(5, dto.getAddr());
			pstmt.setString(6, dto.getUid());
			pstmt.executeUpdate();
			
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteUser3(String uid) {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.DELETE_USER3);
			pstmt.setString(1, uid);
			pstmt.executeUpdate();
			
			closeAll();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
