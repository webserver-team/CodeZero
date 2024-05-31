package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.Member;

public class MemberList{
	
	Connection conn=null;

	String DRIVER = "com.mysql.cj.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/JSP_project";
	String user="root";
	String passwd="1234";
	Statement stmt = null;
	ResultSet rs = null;
	
	public MemberList() {
		try {
			Class.forName(DRIVER);
			
			conn=DriverManager.getConnection(url, user, passwd);
		} catch(ClassNotFoundException e) {
			e.printStackTrace();
		} catch(SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String addMember(String id, String passwd, String name, String phone, String email) throws SQLException {
		
		String result = null;
		
		try {
			String sqlCheckId = "SELECT * FROM member WHERE id = '" + id + "'";
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sqlCheckId);
			
			if (rs.next()) {
				result = "이미 사용중인 ID입니다.";
			}
			else {
				String sql="INSERT INTO member VALUES('" + id + "','" + passwd + "','" + name + "','" + phone + "','" + email + "')";
				
				stmt = conn.createStatement();
				stmt.executeUpdate(sql);
				
				result = "회원이 되신 것을 환영합니다.";
			}
		}catch (SQLException e) {
			result = "회원가입에 실패했습니다.";
			e.printStackTrace();
		} finally {
			if (stmt!=null)
				stmt.close();
			if (conn!=null)
				conn.close();
		}
		return result;
	}
	
	public String[] checkMember(String id, String passwd) throws SQLException {
		String[] result = new String[2];
		
		try {
			String sql = "SELECT * FROM member WHERE id = '" + id + "'";
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			if (rs.next()) {
				String storedPasswd = rs.getString("passwd");
				String storedName = rs.getString("name");
				
				if (passwd.equals(storedPasswd)) {
					result[0] = id;
					result[1] = storedName;
				} else {
					result[0] = "비밀번호가 일치하지 않습니다.";
					result[1] = "on";
				}
			}
			else {
				result[0] = "사용자가 존재하지 않습니다.";
				result[1] = "on";
			}
		}catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}
	
	public Member getMember(String id) throws SQLException {
		
		Member member = null;
		
		String db_id = null;
		String db_passwd = null;
		String db_name = null;
		String db_phone = null;
		String db_email = null;
		
		try {
			String sql = "SELECT * FROM member WHERE id='" + id + "'";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				db_id = rs.getString("id");
				db_passwd = rs.getString("passwd");
				db_name = rs.getString("name");
				db_phone = rs.getString("phone");
				db_email = rs.getString("email");
				member = new Member(db_id, db_passwd, db_name, db_phone, db_email);
			}
			else {
				member = new Member();
				db_id = null;
				db_passwd = null;
				db_name = null;
				db_phone = null;
				db_email = null;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		
		return member;
	}
	
	public String changeInfo(String id, String name, String phone, String email) throws SQLException {
		String message = null;
		
		try {
			String sql = "UPDATE member SET name = '" + name + "', phone = '" + phone + "', email = '" + email + "' WHERE id = '" + id + "';";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			
			message = "회원정보가 수정되었습니다.";
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return message;
	}
	
	public String deleteMember(String id) throws SQLException {
		String message = null;
		
		try {
			String sql = "DELETE FROM member WHERE id = '" + id + "';";
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			
			message = "회원탈퇴하였습니다.";
		} catch (SQLException e) {
			message = "회원탈퇴에 실패하였습니다.";
			e.printStackTrace();
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return message;
	}
}