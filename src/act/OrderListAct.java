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
		
		// 검색조건 쿼리스트링
		String sdate, edate, oistatus;
		oistatus = request.getParameter("oistatus"); // 주문상태
		sdate = request.getParameter("sdate");	// 시작날짜 
		edate = request.getParameter("edate");	// 종료 날짜
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
		if (rcnt % psize > 0) pcnt++;				// 전체 페이지 수
		
		spage = (cpage - 1) / bsize * bsize + 1;	// 블록의 시작 페이지 번호
		epage = spage + bsize - 1;		
		if(epage > pcnt) 		epage = pcnt;		// 블록의 종료 페이지 번호
		OrderPageInfo pageInfo = new OrderPageInfo(); 	// 페이징에 필요한 정보들을 저장할 인스턴스
		// 페이징에 필요한 정보들
		pageInfo.setCpage(cpage);		// 현재 페이지 번호
		pageInfo.setRcnt(rcnt);			// 전체 게시글 개수
		pageInfo.setPcnt(pcnt);			// 전체 페이지 개수
		pageInfo.setSpage(spage);		// 블록 시작 페이지 번호
		pageInfo.setEpage(epage);		// 블록 종료 페이지 번호
		pageInfo.setPsize(psize);		// 페이지 크기
		pageInfo.setBsize(bsize);		// 블록 크기
		
		pageInfo.setOistatus(oistatus);
		pageInfo.setSdate(sdate);
		pageInfo.setEdate(edate);
		
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("orderList", orderList);
	
		ActionForward forward = new ActionForward();
		forward.setPath("my_page/my_shop_ord.jsp");
	
		return forward;
	}
	private boolean isEmpty(String str) {	// 매개변수에 어떤 값이든 들어있는지 여부를 검사하는 메소드
		boolean empty = true;
		if (str != null && !str.equals("")) empty = false;
        
		return empty;
	}
}
