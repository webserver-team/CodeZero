package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.Post;

public class PostList {

	Connection conn = null;

	String DRIVER = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/JSP_project";
	String user = "root";
	String passwd = "1234";

	public PostList() {
		try {
			Class.forName(DRIVER);

			conn = DriverManager.getConnection(url, user, passwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public String addPost(String userId, String postTitle, String postContent) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		int postId = 0;
		String result = null;
		int lastId = 0;

		try {
			String sqlFind = "SELECT * FROM post";

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sqlFind);

			while (rs.next()) {
				lastId = rs.getInt("postId");
			}

			postId = ++lastId;

			String sql = "INSERT INTO post VALUES('" + postId + "','" + postTitle + "','" + postContent + "','" + userId
					+ "');";

			stmt = conn.createStatement();
			stmt.executeUpdate(sql);

			result = "게시물을 등록했습니다.";

		} catch (SQLException e) {
			result = "게시물 등록에 실패했습니다.";
			e.printStackTrace();
		} finally {
			if (stmt != null)
				stmt.close();
			if (conn != null)
				conn.close();
		}
		return result;
	}

	public Post getPost(String postId) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		Post post = new Post();

		try {
			String sql = "SELECT * FROM post WHERE postId = '" + postId + "';";

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next()) {
				post = new Post();
				post.setPostID("postId");
				post.setPostTitle(rs.getString("postTitle"));
				post.setPostContent(rs.getString("postContent"));
				post.setUserId(rs.getString("userId"));
			} else {
				post = null;
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
		return post;
	}

	public boolean existPost() throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		try {
			String sql = "SELECT * FROM post;";
			int i = 0;

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			if (rs.next())
				return true;
			else
				return false;
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
		return false;
	}

	public Post[] getPostList() throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		Post[] post = null;

		try {
			String sql = "SELECT * FROM post;";
			int row = 0;
			int i = 0;

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				row++;
			}

			post = new Post[row];

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				post[i] = new Post();
				post[i].setPostID("postId");
				post[i].setPostTitle(rs.getString("postTitle"));
				post[i].setPostContent(rs.getString("postContent"));
				post[i].setUserId(rs.getString("userId"));
				i++;
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

		return post;
	}
}