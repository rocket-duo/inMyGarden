package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class CartReceiptAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<CartInfo> receiptList = new ArrayList<CartInfo>();

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");

		CartReceiptSvc cartReceiptSvc = new CartReceiptSvc();
		receiptList = cartReceiptSvc.getReceiptList(loginMember.getMi_id());
		request.setAttribute("receiptList", receiptList);

		ActionForward forward = new ActionForward();
		forward.setPath("/receipt.jsp");

		return forward;
	}
}
