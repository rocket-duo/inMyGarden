package act;

import javax.servlet.http.*;

import dao.ProductDao;

import java.util.*;

import static db.JdbcUtil.getConnection;

import java.io.*;
import java.sql.Connection;

import svc.*;
import vo.*;


public class OrderFormAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<CartInfo> cartList = new ArrayList<CartInfo>();
		ArrayList<AddrInfo> addrListInfo = new ArrayList<AddrInfo>();
		request.setCharacterEncoding("utf-8");
		String kind = request.getParameter("kind");
		String where = "";

		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");
		MemberInfo addrList = new MemberInfo();
		
		OrderFormSvc orderFormSvc = new OrderFormSvc();
		AddrListSvc addrListSvc = new AddrListSvc();

		if ("cart".equals(kind)) {	// ��ٱ��ϸ� ���� ������ ���
			String[] arrIdx = request.getParameterValues("chk");
			// üũ�Ǿ� �ִ� üũ�ڽ��� value ������ ���ڿ� �迭�� �޾� ��
			for (int i = 0 ; i < arrIdx.length ; i++) {
				where += " or a.oc_idx = " + arrIdx[i];
			}
			where = " and (" + where.substring(4) + ") ";	// ������ ��ǰ�鸸 �����ϱ� ���� ����
			cartList = orderFormSvc.getCartList(loginMember.getMi_id(), where);
		}  else {	// ��ǰ ��ȭ�鿡�� '�ٷ� ����' Ŭ�� ��
			String piid = request.getParameter("piid");		// ��ǰID
			String occnt = request.getParameter("occnt");	// ���ż���
			String ocoption = request.getParameter("ocoption");	// ��ǰ �ɼ�
			ProductInfo pdtInfo = orderFormSvc.getPdtInfo(piid);
			request.setAttribute("pdtInfo", pdtInfo);
			request.setAttribute("occnt", occnt);
			request.setAttribute("ocoption", ocoption);
		}
		addrList = orderFormSvc.getAddrList(loginMember.getMi_id());
		addrListInfo = addrListSvc.getAddrListInfo(loginMember.getMi_id());
			
		request.setAttribute("cartList", cartList);
		request.setAttribute("addrList", addrList);	// ����� ���� - �⺻�ּ� ����
		request.setAttribute("addrListInfo", addrListInfo); // �������-���� �ּҷ� �ּ����� ����	
		
		ActionForward forward = new ActionForward();
		forward.setPath("/order/order_detail.jsp");

		return forward;
	}
	public ProductInfo getPdtInfo(String id) {
		ProductInfo pdtInfo = null;
		Connection conn = getConnection();
		ProductDao productDao = ProductDao.getInstance();
		productDao.setConnection(conn);
		pdtInfo = productDao.getPdtInfo(id);

		return pdtInfo;
	}
}
