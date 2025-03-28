package dao;

import java.util.ArrayList;
import java.util.List;

import dto.User1DTO;
import util.DBHelper;
import util.SQL;

public class User1DAO extends DBHelper {
	
	private static final User1DAO INSTANCE = new User1DAO();
	public static User1DAO getInstance() {
		return INSTANCE;
	}
	private User1DAO(){}
	
	public void insertUser1(User1DTO dto) {
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.INSERT_USER1);
			pstmt.setString(1, dto.getUid());
			pstmt.setString(2, dto.getName());
			pstmt.setString(3, dto.getHp());
			pstmt.setInt(4, dto.getAge());
			pstmt.executeUpdate();
			closeAll();
					
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public List<User1DTO> selectAllUser1() {
		
		List<User1DTO> dtos = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(SQL.SELECT_ALL_USER1);
			while(rs.next()) {
				User1DTO dto = new User1DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAge(rs.getInt(4));
				dtos.add(dto);
			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dtos;
	}
	
	public User1DTO selectUser1(String uid) {
		
		User1DTO dto = null;
		
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.SELECT_USER1);
			pstmt.setString(1, uid);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dto = new User1DTO();
				dto.setUid(rs.getString(1));
				dto.setName(rs.getString(2));
				dto.setHp(rs.getString(3));
				dto.setAge(rs.getInt(4));
			}
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
	
	public void updateUser1(User1DTO dto) {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.UPDATE_USER1);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getHp());
			pstmt.setInt(3, dto.getAge());
			pstmt.setString(4, dto.getUid());
			pstmt.executeUpdate();
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void deleteUser1(String uid) {
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement(SQL.DELETE_USER1);
			pstmt.setString(1, uid);
			pstmt.executeUpdate();
			closeAll();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}


