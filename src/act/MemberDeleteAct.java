package act;

import javax.servlet.http.*;
import act.Action;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class MemberDeleteAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int result = 0;
		request.setCharacterEncoding("utf-8");
		MemberInfo memberInfo = null;
		HttpSession session = request.getSession();
		MemberInfo tmpMember = (MemberInfo)session.getAttribute("loginMember");

		String lnk = "../index.jsp";
		MemProcSvc memProcSvc = new MemProcSvc();
		
		result = memProcSvc.memberDelete(tmpMember.getMi_id());
		lnk = "../logout.jsp";

		ActionForward forward = new ActionForward();
		forward.setRedirect(true);		// dispatch가 아닌 sendRedirect 방식으로 이동
		forward.setPath(lnk);
		
		return forward;

	}
}
