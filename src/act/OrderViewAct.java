package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class OrderViewAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		OrderInfo order = new OrderInfo();
		String oiName = request.getParameter("oiName").trim();		// �ֹ��� �̸�
		String oip1 = request.getParameter("oip1");
		String oip2 = request.getParameter("oip2");
		String oip3 = request.getParameter("oip3");
		String oiphone = oip1 + "-" + oip2 + "-" + oip3;	// �ֹ��� �޴�����ȣ
		String e1 = request.getParameter("e1").trim();			
		String e2 = request.getParameter("e2");			
		String e3 = request.getParameter("e3").trim();			
		String oiEmail = e1 + "@";						// �̸���
			if("direct".equals(request.getParameter("e2"))) {
				oiEmail += e3;
			} else {
				oiEmail += e2;
			}	
		String maName = request.getParameter("maName").trim();		// ������ �̸�
		String maZip = request.getParameter("maZip").trim();		// ������ �����ȣ 
		String maAddr1 = request.getParameter("maAddr1").trim();	// ������ �ּ�1
		String maAddr2 = request.getParameter("maAddr2").trim();	// ������ �ּ�2
		

		
		String p1 = request.getParameter("p1");
		String p2 = request.getParameter("p2");
		String p3 = request.getParameter("p3");
		String oiRecphone = p1 + "-" + p2 + "-" + p3;		// ������ ��ȭ��ȣ
		String oiCmt = (request.getParameter("oiCmt") == null ) ? "" : request.getParameter("oiCmt").trim();   
		String addAddrInfo = (request.getParameter("addAddrInfo") == null ) ? "n" : request.getParameter("addAddrInfo");	// ����� �߰�����
		int oiPay = Integer.parseInt(request.getParameter("oiPay"));
		int oiDelipay = Integer.parseInt(request.getParameter("oiDelipay"));
		int odSavepnt = Integer.parseInt(request.getParameter("odSavepnt"));
		int oiUsepnt = Integer.parseInt(request.getParameter("oiUsepnt"));
		int oiTotalpay = oiPay - oiUsepnt + oiDelipay;
		String oiPayment = request.getParameter("oiPayment");
		String today = request.getParameter("today");	// �ֹ���ȣ ������ ���� ���ó�¥
		String oiid = "";

		String wtype = request.getParameter("wtype");	// �ֹ���� ����(�ٷα���, īƮ���� ����)
		
		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");
		OrderProcSvc orderProcSvc = new OrderProcSvc();
		oiid = orderProcSvc.getOiid(loginMember.getMi_id(), today);
		order.setOi_id(oiid);
		order.setMi_id(loginMember.getMi_id());
		order.setOi_name(oiName);
		order.setOi_phone(oiphone);
		order.setOi_email(oiEmail);
		order.setOi_receiver(maName);
		order.setOi_zip(maZip);
		order.setOi_addr1(maAddr1);
		order.setOi_addr2(maAddr2);
		order.setOi_recphone(oiRecphone);
		order.setOi_cmt(oiCmt);
		order.setOi_pay(oiPay);
		order.setOi_delipay(oiDelipay);
		order.setOi_usepnt(oiUsepnt);
		order.setOi_totalpay(oiTotalpay);
		order.setOi_payment(oiPayment);
		order.setOd_savepnt(odSavepnt);
		String where = "";
		int result = 0;
		if("cart".equals(wtype)) {
			String[] arrIdx = request.getParameterValues("idx");
			// idx�� value ������ ���ڿ� �迭�� �޾� ��
			for (int i = 0 ; i < arrIdx.length ; i++) {
				where += " or a.oc_idx = " + arrIdx[i];
			}
			where = " and (" + where.substring(4) + ") ";	// ������ ��ǰ�鸸 �����ϱ� ���� ����
			
			result = orderProcSvc.orderInsert(order, where);
			result = orderProcSvc.orderInDetailCart(order, where);
		 	result = orderProcSvc.cartDelAll(order, where);
		
		} else if("pdt".equals(wtype)) {
			String piid = request.getParameter("piid");
			String occnt = request.getParameter("occnt");
			String ocoption = request.getParameter("ocoption");
			result = orderProcSvc.orderInsert(order, where);
			result = orderProcSvc.orderInDetailPdt(order, piid, occnt, ocoption);
		}
		response.setContentType("text/html; charset=utf-8");
		
		 	
		 	result = orderProcSvc.miUpPoint(order, where);
		 	result = orderProcSvc.memAddPoint(order, where);
		 	result = orderProcSvc.memMinusPoint(order, where);
		
		if ("y".equals(addAddrInfo)) {
		result = orderProcSvc.addrInsert(order);
		}
		String oiDate = orderProcSvc.getOiDate(oiid);	// �ֹ���ȣ�� �ش��ϴ� �ֹ��ð��� ��ȸ
		order.setOi_date(oiDate);
		
		ArrayList<OrderInfo> orderDetail = new ArrayList<OrderInfo>();
		orderDetail = orderProcSvc.getOdPdtName(oiid);
		
		loginMember = orderProcSvc.sessionUpdate(loginMember.getMi_id());
		session.setAttribute("loginMember", loginMember);
		request.setAttribute("order", order);
		request.setAttribute("orderDetail", orderDetail);
	
		ActionForward forward = new ActionForward();
		forward.setPath("order/order_view.jsp");
	
		return forward;
	}
}

