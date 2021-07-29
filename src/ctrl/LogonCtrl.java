package ctrl;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;	// request, response, session 등의 객체를 사용하기 위함
import svc.*;
import vo.*;

@WebServlet("/logon")
public class LogonCtrl extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public LogonCtrl() {
        super();
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String userid = request.getParameter("user_id");
		String userpwd = request.getParameter("user_pwd");
		
		LoginSvc loginSvc = new LoginSvc();
		MemberInfo loginMember = loginSvc.getLoginMember(userid, userpwd);
		HttpSession session = request.getSession();
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();

		if (loginMember != null) {
			session.setAttribute("loginMember", loginMember);
			out.println("<script>");
			out.println("location.href = 'inmygarden.jsp';");
			out.println("</script>");
		} else {	// 로그인 실패시
			out.println("<script>");
			out.println("alert('로그인에 실패했습니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}
