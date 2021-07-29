package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class CartWishInProcAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		String where = "";
		int result = 0;
		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");
		CartWishInProcSvc cartWishInProcSvc = new CartWishInProcSvc();

	
		String[] arrIdx = request.getParameterValues("chk");
		// 체크되어 있는 체크박스의 value 값들을 문자열 배열로 받아 옴
		for (int i = 0 ; i < arrIdx.length ; i++)
			where += " or a.oc_idx = " + arrIdx[i];
		where = " and (" + where.substring(4) + ") ";	// 구매할 상품들만 추출하기 위한 조건
		result = cartWishInProcSvc.getCartWishInsert(loginMember.getMi_id(), where);
		result = cartWishInProcSvc.CartWishInsert_bk(loginMember.getMi_id());
		result = cartWishInProcSvc.CartWishInsert_bk2(loginMember.getMi_id());
		
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);	// dispatch가 아닌 sendRedirect 방식으로 이동
		forward.setPath("cart_list.ord");

		return forward;
	}
}
