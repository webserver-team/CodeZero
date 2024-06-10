package servlet.before;

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

//@WebServlet("/Register")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");

		String referer = request.getHeader("Referer");

		String message = null;

		Member member = new Member(id, passwd, name, phone, email);
		MemberList memberlist = new MemberList();
		try {
			message = memberlist.addMember(member);
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		HttpSession session = request.getSession();
		session.setAttribute("message", message);

		if (message.equals("이미 사용중인 ID입니다.")) {
			session.setAttribute("regi_modal_status", "on");
		}

		response.sendRedirect(referer);
	}
}