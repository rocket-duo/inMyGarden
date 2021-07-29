package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class CartUpProcAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int    idx  = Integer.parseInt(request.getParameter("idx")); // 카트 인덱스번호(PK)
		String piid = request.getParameter("piid");	// 상품ID로 옵션 변경시 필요
		String opt  = request.getParameter("opt");	// 상품옵션
		String cnt  = request.getParameter("cnt");	// 상품수량
		
		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");

		CartUpProcSvc cartUpProcSvc = new CartUpProcSvc();
		int result = cartUpProcSvc.cartUpdate( idx, piid, opt, cnt , loginMember.getMi_id());

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(result);
		out.close();
		
		return null;
	}
}
