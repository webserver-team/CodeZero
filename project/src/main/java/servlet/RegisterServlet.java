package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		
		try {
			String url="jdbc:mysql://localhost:3306/JSP_project";
			String user="root";
			String password="1234";

			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(url, user, password);

			String sql = "SELECT * FROM member WHERE id ='" + id + "'";

            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
			
            if (rs.next()) {
            	request.setAttribute("idError", "이미 사용 중인 ID입니다.");
                request.getRequestDispatcher("/home/home.jsp").forward(request, response);
            }
            else {
            	String sqlInsert="INSERT INTO member VALUES('" + id + "','" + passwd + "','" + name + "','" + phone + "','" + email + "')";
    			stmt=conn.createStatement();
    			stmt.executeUpdate(sqlInsert);
    			
    			response.sendRedirect("/project/home/home.jsp");
            }
		}catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
}