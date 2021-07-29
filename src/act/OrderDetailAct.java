package act;

import javax.servlet.http.*;
import java.util.*;
import svc.*;
import vo.*;

public class OrderDetailAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("utf-8");
        String id = request.getParameter("id");	// ��ǰID
        int cpage = Integer.parseInt(request.getParameter("cpage"));	// ���� ������ ��ȣ
        int psize = Integer.parseInt(request.getParameter("psize"));	// ������ũ�� & ��Ϻ�����
        
        System.out.println(id);
        System.out.println(cpage);
        System.out.println(psize);
        // �˻�����(�˻���, ��/�Һз�, �귣��, ���ݴ�) �� �������� ������Ʈ��
        String oistatus, sdate, edate;
        oistatus = request.getParameter("oistatus"); // �ֹ�����
		sdate = request.getParameter("sdate");	// ���۳�¥ 
		edate = request.getParameter("edate");	// ���� ��¥
        
		ArrayList<OrderInfo> orderList = new ArrayList<OrderInfo>();
		OrderInfo orderInfo = new OrderInfo();
		
		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");
		
        OrderDetailSvc orderDetailSvc = new OrderDetailSvc();
        orderInfo = orderDetailSvc.getOrderDetail(id, loginMember.getMi_id());		// �ֹ���ȣ�� �´� �ֹ����� ��ȸ
        orderList = orderDetailSvc.getOrderDetailInfo(id);	// �ֹ���ȣ�� �´� �ֹ������� ��ȸ(��ǰ,����,���ݵ�)

        request.setAttribute("orderInfo", orderInfo);
        request.setAttribute("orderList", orderList);

        ActionForward forward = new ActionForward();
        forward.setPath("/order/order_detail_info.jsp");
  
        return forward;
    }
}
