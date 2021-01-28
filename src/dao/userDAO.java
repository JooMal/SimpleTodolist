package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import dto.userDTO;

public class userDAO {
	private userDAO() {}
	private static userDAO instance = new userDAO();
	public static userDAO getInstance() {
		return instance;
	}
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private Connection getConnection() {
		String dbURL = "jdbc:mysql://localhost:3306/todolist";
		String dbID = "root";
		String dbPW = "root";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPW);
		}catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public int userCheck(String id, String pw) {
		int check = -1;
		String dbPW = "";
		
		try {
			conn = getConnection();
			String sql = "select pw from users where id=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbPW = rs.getString("pw");
				if(dbPW.contentEquals(pw)) {
					check = 1;
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		return check;
	}
	
	public userDTO getUser(String id) {
		userDTO udto = null;
		
		try {
			conn = getConnection();
			String sql = "select * from users where id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				udto = new userDTO();
				udto.setId(rs.getString("id"));
				udto.setPw(rs.getString("pw"));
				udto.setName(rs.getString("name"));
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		
		return udto;
	}
	
	public int joinUser(userDTO udto) {
		conn = getConnection();
		String sql = "insert into users values(?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, udto.getId());
			pstmt.setString(2, udto.getPw());
			pstmt.setString(3, udto.getName());
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {e.printStackTrace();}
		}
		return -1;
	}
}
