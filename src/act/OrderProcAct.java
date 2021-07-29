package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class OrderProcAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
	request.setCharacterEncoding("utf-8");
	OrderInfo order = new OrderInfo();
	String oiName = request.getParameter("oiName");		// 주문자 이름
	String oiphone = request.getParameter("oiPhone");	// 주문자 휴대폰번호
	String e1 = request.getParameter("e1");			
	String e2 = request.getParameter("e2");			
	String e3 = request.getParameter("e3");			
	String oiEmail = e1 + "@";						// 이메일
		if("direct".equals(request.getParameter("e2"))) {
			oiEmail += e3;
		} else {
			oiEmail += e2;
		}
	String maName = request.getParameter("maName");		// 수취인 이름
	String maZip = request.getParameter("maZip");		// 수취인 우편번호 
	String maAddr1 = request.getParameter("maAddr1");	// 수취인 주소1
	String maAddr2 = request.getParameter("maAddr2");	// 수취인 주소2
	String p1 = request.getParameter("p1");
	String p2 = request.getParameter("p2");
	String p3 = request.getParameter("p3");
	String oiRecphone = p1 + "-" + p2 + "-" + p3;		// 수취인 전화번호
	
	String oiCmt = request.getParameter("oiCmt");
	int oiPay = Integer.parseInt(request.getParameter("oiPay"));
	int oiDelipay = Integer.parseInt(request.getParameter("oiDelipay"));
	int odSavepnt = Integer.parseInt(request.getParameter("odSavepnt"));
	int oiUsepnt = Integer.parseInt(request.getParameter("oiUsepnt"));
	String oiPayment = request.getParameter("oiPayment");
	String today = request.getParameter("today");	// 주문번호 생성을 위한 오늘날짜
	
	
	HttpSession session = request.getSession();
	MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");
	
	order.setMi_id(loginMember.getMi_id());
	order.setOi_name(oiName);
	order.setOi_name(oiphone);
	order.setOi_email(oiEmail);
	order.setOi_receiver(maName);
	order.setOi_zip(maZip);
	order.setOi_addr1(maAddr1);
	order.setOi_addr2(maAddr2);
	order.setOi_recphone(oiRecphone);
	order.setOi_cmt(oiCmt);
	order.setOi_pay(oiPay);
	order.setOi_delipay(oiDelipay);
	order.setOi_usepnt(odSavepnt);
	order.setOi_usepnt(oiUsepnt);
	order.setOi_payment(oiPayment);
	
	
	OrderProcSvc orderProcSvc = new OrderProcSvc();
	int result = orderProcSvc.orderInsert(order, today);
	if (result == 0) {
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('주문 결제시 문제가 발생했습니다.\n다시 시도해 주세요.');");
		out.println("history.back();");
		out.println("</script>");
		out.close();
	}

	ActionForward forward = new ActionForward();
	forward.setRedirect(true);	// dispatch가 아닌 sendRedirect 방식으로 이동
	forward.setPath("cart_list.ord");

	return forward;
	}
}
