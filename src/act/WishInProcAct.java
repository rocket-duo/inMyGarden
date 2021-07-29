package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class WishInProcAct implements Action {
	// Ư�� ��ǰ�� �򸮽�Ʈ�� ��� �۾��� ó���ϴ� Ŭ����
		public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			String piid = request.getParameter("piid");
			System.out.println(piid);
			int owcnt = Integer.parseInt(request.getParameter("occnt"));
			String owoption = request.getParameter("ocoption");
			HttpSession session = request.getSession();
			MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");
			
			WishInfo wish = new WishInfo();
			wish.setMi_id(loginMember.getMi_id());
			wish.setPi_id(piid);
			wish.setOw_cnt(owcnt);
			wish.setOw_option(owoption);
			
			WishInProcSvc wishInProcSvc = new WishInProcSvc();
			int result = wishInProcSvc.wishInsert(wish);
			if (result == 0) {
				response.setContentType("text/html; charset=utf-8");
				PrintWriter out = response.getWriter();
				out.println("<script>");
				out.println("alert('�򸮽�Ʈ�� �߰��� ������ �߻��߽��ϴ�.\n�ٽ� �õ��� �ּ���.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}

			ActionForward forward = new ActionForward();
			forward.setRedirect(true);	// dispatch�� �ƴ� sendRedirect ������� �̵�
			forward.setPath("wish_list.ord");

			return forward;
		}
}
