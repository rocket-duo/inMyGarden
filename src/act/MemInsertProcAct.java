package act;

import javax.servlet.http.*;
import act.Action;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class MemInsertProcAct implements Action {
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			int result = 0;
			request.setCharacterEncoding("utf-8");
			MemberInfo memberInfo = null;
			HttpSession session = request.getSession();
			MemberInfo tmpMember = (MemberInfo)session.getAttribute("loginMember");
			memberInfo = new MemberInfo();
			String agree = request.getParameter("user_agree");
			String miid = request.getParameter("user_id").trim().toLowerCase();
			String name = request.getParameter("user_name").trim();
			String pwd = request.getParameter("user_pwd").trim();
			String pwd2 = request.getParameter("user_pwd2").trim();
			String phone2 = request.getParameter("phone2").trim();
			String phone3 = request.getParameter("phone3").trim();
			String domain = request.getParameter("email2");
			if (agree == "n") {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('����Ʈ �̿����� �� ���ǽ�\n������ �Ұ� �մϴ�.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();				
			}			
			if (miid == null || miid.equals("")) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('���̵� �Է��� �ּ���.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			} else if (miid.length() < 5) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('���̵� 5�� �̻� �Է��� �ּ���.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			if (pwd == null || pwd.equals("")) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('��й�ȣ�� �Է��� �ּ���.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();				
			} else if (!pwd.equals(pwd2)) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			if (phone2 == null || phone2.equals("") || phone3 == null || phone3.equals("")) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('����ó�� �Է��� �ּ���.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			} else if (phone2.length() < 3 || phone3.length() < 4) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('����ó�� ��Ȯ�� �Է��� �ּ���.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}
			memberInfo.setMi_name(name);
			memberInfo.setMi_id(miid);
			memberInfo.setMi_pwd(pwd);
			memberInfo.setMi_birth(request.getParameter("birth_year") + "-" + request.getParameter("birth_month") + "-" + request.getParameter("birth_day"));
			memberInfo.setMi_gender(request.getParameter("user_gender"));
			memberInfo.setMi_phone(request.getParameter("phone1") + "-" + phone2 + "-" + phone3);
			memberInfo.setMi_issns(request.getParameter("user_issns"));
			memberInfo.setMi_ismail(request.getParameter("user_ismail"));
			memberInfo.setMi_garden(request.getParameter("user_garden"));
			memberInfo.setMi_rebank(request.getParameter("user_rebank"));
			memberInfo.setMi_account(request.getParameter("user_account"));
			
			if (domain.equals("direct")) {
				memberInfo.setMi_email(request.getParameter("email1").trim() + "@" + request.getParameter("email3").trim());
			} else if (domain == null || domain.equals("")) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('�̸����� ��Ȯ�� �Է��� �ּ���.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			} else {
				memberInfo.setMi_email(request.getParameter("email1").trim() + "@" + domain);
			}
		

			MemProcSvc memProcSvc = new MemProcSvc();
			String lnk = "../index.jsp";
			result = memProcSvc.memberInsertProc(memberInfo);
			lnk = "../login_form.jsp";	

			ActionForward forward = new ActionForward();
			forward.setRedirect(true);	// dispatch�� �ƴ� sendRedirect ������� �̵�
			forward.setPath(lnk);

			return forward;
		}
	}
