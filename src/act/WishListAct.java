package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class WishListAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<WishInfo> wishList = new ArrayList<WishInfo>();

		request.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");

		WishListSvc wishListSvc = new WishListSvc();
		wishList = wishListSvc.getWishList(loginMember.getMi_id());
		request.setAttribute("wishList", wishList);
		// dispatch������� �̵��� cart_list.jsp���Ͽ��� ����� �� �ֵ��� request��ü�� �Ӽ����� ����

		ActionForward forward = new ActionForward();
		forward.setPath("/my_page/my_shop_wish.jsp");

		return forward;
	}
}
