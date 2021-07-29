package act;

import javax.servlet.http.*;
import java.util.*;
import svc.*;
import vo.*;

public class OrderDetailAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");	// 상품ID
        int cpage = Integer.parseInt(request.getParameter("cpage"));	// 현재 페이지 번호
        int psize = Integer.parseInt(request.getParameter("psize"));	// 페이지크기 & 목록보기방식
        
        System.out.println(id);
        System.out.println(cpage);
        System.out.println(psize);
        // 검색조건(검색어, 대/소분류, 브랜드, 가격대) 및 정렬조건 쿼리스트링
        String oistatus, sdate, edate;
        oistatus = request.getParameter("oistatus"); // 주문상태
		sdate = request.getParameter("sdate");	// 시작날짜 
		edate = request.getParameter("edate");	// 종료 날짜
        
		ArrayList<OrderInfo> orderList = new ArrayList<OrderInfo>();
		OrderInfo orderInfo = new OrderInfo();
		
		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");
		
        OrderDetailSvc orderDetailSvc = new OrderDetailSvc();
        orderInfo = orderDetailSvc.getOrderDetail(id, loginMember.getMi_id());		// 주문번호에 맞는 주문정보 조회
        orderList = orderDetailSvc.getOrderDetailInfo(id);	// 주문번호에 맞는 주문상세정보 조회(상품,개수,가격등)

        request.setAttribute("orderInfo", orderInfo);
        request.setAttribute("orderList", orderList);

        ActionForward forward = new ActionForward();
        forward.setPath("/order/order_detail_info.jsp");
  
        return forward;
    }
}
