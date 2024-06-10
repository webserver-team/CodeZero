package servlet;

import java.io.IOException;
import java.sql.SQLException;

import dao.MemberList;
import dto.Member;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");

		String referer = request.getHeader("Referer");

		String[] result = null;

		MemberList memberlist = new MemberList();

		try {
			result = memberlist.checkMember(id, passwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		HttpSession session = request.getSession();

		if (result[0].equals("비밀번호가 일치하지 않습니다.")){
        	session.setAttribute("message", result[0]);
        	session.setAttribute("login_modal_status", "on");
        	response.sendRedirect(referer);
        }
        else if (result[0].equals("사용자가 존재하지 않습니다.")){
        	session.setAttribute("message", result[0]);
        	session.setAttribute("login_modal_status", "on");
        	response.sendRedirect(referer);
        }
        else {
        	session.setAttribute("id", result[0]);
        	session.setAttribute("name", result[1]);
        	response.sendRedirect(referer);
        }
	}
}