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

@WebServlet("*.member")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());

		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");

		if (command.equals("/Register.member")) {
			try {
				register(request, response);
			} catch (ClassNotFoundException | IOException e) {
				e.printStackTrace();
			}
		} else if (command.equals("/Login.member")) {
			try {
				login(request, response);
			} catch (ClassNotFoundException | IOException | SQLException e) {
				e.printStackTrace();
			}
		}
	}

	public void register(HttpServletRequest request, HttpServletResponse response)
			throws IOException, ClassNotFoundException {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");

		String referer = request.getHeader("Referer");

		String message = null;

		try {
			Member member = new Member(id, passwd, name, phone, email);
			MemberList memberlist = new MemberList();
			message = memberlist.addMember(member);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		HttpSession session = request.getSession();
		session.setAttribute("message", message);

		if (message.equals("이미 사용중인 ID입니다.")) {
			session.setAttribute("regi_modal_status", "on");
		}

		response.sendRedirect(referer);
	}

	public void login(HttpServletRequest request, HttpServletResponse response)
			throws IOException, SQLException, ClassNotFoundException {
		request.setCharacterEncoding("utf-8");

		String id = request.getParameter("id");
		String passwd = request.getParameter("passwd");

		String referer = request.getHeader("Referer");

		String[] result = null;

		try {
			MemberList memberlist = new MemberList();
			result = memberlist.checkMember(id, passwd);
		} catch (SQLException e) {
			e.printStackTrace();
		}

		HttpSession session = request.getSession();

		if (result[0].equals("비밀번호가 일치하지 않습니다.")) {
			session.setAttribute("message", result[0]);
			session.setAttribute("login_modal_status", "on");
			response.sendRedirect(referer);
		} else if (result[0].equals("사용자가 존재하지 않습니다.")) {
			session.setAttribute("message", result[0]);
			session.setAttribute("login_modal_status", "on");
			response.sendRedirect(referer);
		} else {
			session.setAttribute("id", result[0]);
			session.setAttribute("name", result[1]);
			response.sendRedirect(referer);
		}
	}

}