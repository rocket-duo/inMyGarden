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
		// dispatch방식으로 이동할 cart_list.jsp파일에서 사용할 수 있도록 request객체에 속성으로 저장

		ActionForward forward = new ActionForward();
		forward.setPath("/my_page/my_shop_wish.jsp");

		return forward;
	}
}
