package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class CartListAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<CartInfo> cartList = new ArrayList<CartInfo>();

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");

		CartListSvc cartListSvc = new CartListSvc();
		cartList = cartListSvc.getCartList(loginMember.getMi_id());
		request.setAttribute("cartList", cartList);
		// dispatch������� �̵��� cart_list.jsp���Ͽ��� ����� �� �ֵ��� request��ü�� �Ӽ����� ����
		

		ActionForward forward = new ActionForward();
		forward.setPath("/order/order_cart.jsp");

		return forward;
	}
}
