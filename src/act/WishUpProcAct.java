package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class WishUpProcAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int    idx  = Integer.parseInt(request.getParameter("idx")); // �򸮽�Ʈ �ε�����ȣ(PK)
		String piid = request.getParameter("piid");	// ��ǰID�� �ɼ� ����� �ʿ�
		String opt  = request.getParameter("opt");	// ��ǰ�ɼ�
		String cnt  = request.getParameter("cnt");	// ��ǰ����
		
		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");

		WishUpProcSvc wishUpProcSvc = new WishUpProcSvc();
		int result = wishUpProcSvc.wishUpdate( idx, piid, opt, cnt , loginMember.getMi_id());

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(result);
		out.close();
		
		return null;
	}
}
