package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import dto.Lecture;

public class LectureList {

	Connection conn = null;

	String DRIVER = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/JSP_project";
	String user = "root";
	String passwd = "1234";

	public LectureList() {
		try {
			Class.forName(DRIVER);

			conn = DriverManager.getConnection(url, user, passwd);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public Lecture[] getLectureList(String search, String category) throws SQLException {
		Statement stmt = null;
		ResultSet rs = null;

		Lecture[] lecture = null;

		String sql = "SELECT * FROM lecture";

		try {
			if (search != null) {
				sql = "SELECT * FROM lecture WHERE lecName LIKE '%" + search + "%';";
			} else if (category != null) {
				if (category.equals("programming")) {
					sql = "SELECT * FROM lecture WHERE lecCategory IN ('프론트엔드', '백엔드', '앱 개발', '데이터베이스', '개발도구')";
				} else if (category.equals("game")) {
					sql = "SELECT * FROM lecture WHERE lecCategory IN ('게임 프로그래밍', '게임 기획', '게임 그래픽')";
				} else if (category.equals("bigdata")) {
					sql = "SELECT * FROM lecture WHERE lecCategory IN ('데이터 분석', '컴퓨터 비전', '자연어 처리')";
				} else if (category.equals("security")) {
					sql = "SELECT * FROM lecture WHERE lecCategory IN ('보안', '네트워크', '클라우드', '시스템')";
				} else
					sql = "SELECT * FROM post WHERE category = '" + category + "';";
			} 

			int row = 0;

			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				row++;
			}

			lecture = new Lecture[row];

			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				row--;
				lecture[row] = new Lecture();
				lecture[row].setLecId(Integer.toString(rs.getInt("lecId")));
				lecture[row].setLecName((rs.getString("lecName")));
				lecture[row].setTeacherName((rs.getString("teacherName")));
				lecture[row].setLecDescription((rs.getString("lecDescription")));
				lecture[row].setLecCategory((rs.getString("lecCategory")));
				lecture[row].setLecLevel((rs.getString("lecLevel")));
				lecture[row].setLecPrice((rs.getInt("lecPrice")));
				lecture[row].setLecReviewCount((rs.getInt("lecReviewCount")));
				lecture[row].setImage((rs.getString("image")));
				lecture[row].setVideo((rs.getString("video")));
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

		return lecture;
	}
}
