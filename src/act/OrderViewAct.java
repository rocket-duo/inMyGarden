package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class OrderViewAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
	
		String oiid = request.getParameter("oiid");
		int odSavepnt = Integer.parseInt(request.getParameter("savepnt"));
		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");
		OrderViewSvc orderViewSvc = new OrderViewSvc();
		

	
		OrderInfo order = new OrderInfo();
		order = orderViewSvc.getOrderValue(oiid, loginMember.getMi_id());	// �ֹ���ȣ�� �ش��ϴ� �� ��ȸ
		order.setOi_id(oiid);
		order.setOd_savepnt(odSavepnt);
		order.setMi_id(loginMember.getMi_id());
		
//		String oiDate = orderViewSvc.getOiDate(oiid);	// �ֹ���ȣ�� �ش��ϴ� �ֹ��ð��� ��ȸ
//		order.setOi_date(oiDate);
		
		ArrayList<OrderInfo> orderDetail = new ArrayList<OrderInfo>();
		orderDetail = orderViewSvc.getOdPdtName(oiid);
		
		request.setAttribute("order", order);
		request.setAttribute("orderDetail", orderDetail);
		ActionForward forward = new ActionForward();
		forward.setPath("order/order_view.jsp");
	
		return forward;
	}
}

