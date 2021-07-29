package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class WishInProcAct implements Action {
	// 특정 상품을 찜리스트에 담는 작업을 처리하는 클래스
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
				out.println("alert('찜리스트에 추가시 문제가 발생했습니다.\n다시 시도해 주세요.');");
				out.println("history.back();");
				out.println("</script>");
				out.close();
			}

			ActionForward forward = new ActionForward();
			forward.setRedirect(true);	// dispatch가 아닌 sendRedirect 방식으로 이동
			forward.setPath("wish_list.ord");

			return forward;
		}
}
