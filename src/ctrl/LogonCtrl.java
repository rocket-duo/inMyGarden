package ctrl;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;	// request, response, session ���� ��ü�� ����ϱ� ����
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
		} else {	// �α��� ���н�
			out.println("<script>");
			out.println("alert('�α��ο� �����߽��ϴ�.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}
