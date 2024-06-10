package dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

public class LectureList {
	
	Connection conn=null;

	String DRIVER = "com.mysql.cj.jdbc.Driver";
	String url="jdbc:mysql://localhost:3306/zero";
	String user="root";
	String passwd="1234";
	Statement stmt = null;
	ResultSet rs = null;

	public LectureList() {
		// TODO Auto-generated constructor stub
	}

}
