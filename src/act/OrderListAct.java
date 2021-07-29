package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;


public class OrderListAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<OrderInfo> orderList = new ArrayList<OrderInfo>();
		request.setCharacterEncoding("utf-8");
		
		int cpage = 1, psize = 10, bsize = 10, spage, epage, rcnt, pcnt;
		if (request.getParameter("cpage") != null)
			cpage = Integer.parseInt(request.getParameter("cpage"));
		if (request.getParameter("psize") != null)
			psize = Integer.parseInt(request.getParameter("psize"));
		
		// �˻����� ������Ʈ��
		String sdate, edate, oistatus;
		oistatus = request.getParameter("oistatus"); // �ֹ�����
		sdate = request.getParameter("sdate");	// ���۳�¥ 
		edate = request.getParameter("edate");	// ���� ��¥
		String sch = "";
		if (!isEmpty(oistatus)) 	sch += " and a.oi_status = '" + oistatus +"' ";
		else oistatus = "";
		if (!isEmpty(sdate)) 	sch += " and a.oi_date >= '" + sdate +"' ";
		else sdate = "";
		if (!isEmpty(edate)) 	sch += " and a.oi_date <= '" + edate +" 23:59:59' ";
		else edate = "";
		
		
		
		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");

		OrderListSvc orderListSvc = new OrderListSvc();
		rcnt = orderListSvc.getOrderCount(sch, loginMember.getMi_id());
		orderList = orderListSvc.getOrderList(loginMember.getMi_id(), cpage, psize, sch);
		
		pcnt = rcnt / psize;
		if (rcnt % psize > 0) pcnt++;				// ��ü ������ ��
		
		spage = (cpage - 1) / bsize * bsize + 1;	// ����� ���� ������ ��ȣ
		epage = spage + bsize - 1;		
		if(epage > pcnt) 		epage = pcnt;		// ����� ���� ������ ��ȣ
		OrderPageInfo pageInfo = new OrderPageInfo(); 	// ����¡�� �ʿ��� �������� ������ �ν��Ͻ�
		// ����¡�� �ʿ��� ������
		pageInfo.setCpage(cpage);		// ���� ������ ��ȣ
		pageInfo.setRcnt(rcnt);			// ��ü �Խñ� ����
		pageInfo.setPcnt(pcnt);			// ��ü ������ ����
		pageInfo.setSpage(spage);		// ��� ���� ������ ��ȣ
		pageInfo.setEpage(epage);		// ��� ���� ������ ��ȣ
		pageInfo.setPsize(psize);		// ������ ũ��
		pageInfo.setBsize(bsize);		// ��� ũ��
		
		pageInfo.setOistatus(oistatus);
		pageInfo.setSdate(sdate);
		pageInfo.setEdate(edate);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("orderList", orderList);
	
		ActionForward forward = new ActionForward();
		forward.setPath("my_page/my_shop_ord.jsp");
	
		return forward;
	}
	private boolean isEmpty(String str) {	// �Ű������� � ���̵� ����ִ��� ���θ� �˻��ϴ� �޼ҵ�
		boolean empty = true;
		if (str != null && !str.equals("")) empty = false;
        
		return empty;
	}
}
