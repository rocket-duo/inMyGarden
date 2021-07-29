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

		if ("cart".equals(kind)) {	// 장바구니를 통해 구매할 경우
			String[] arrIdx = request.getParameterValues("chk");
			// 체크되어 있는 체크박스의 value 값들을 문자열 배열로 받아 옴
			for (int i = 0 ; i < arrIdx.length ; i++) {
				where += " or a.oc_idx = " + arrIdx[i];
			}
			where = " and (" + where.substring(4) + ") ";	// 구매할 상품들만 추출하기 위한 조건
			cartList = orderFormSvc.getCartList(loginMember.getMi_id(), where);
		}  else {	// 상품 상세화면에서 '바로 구매' 클릭 시
			String piid = request.getParameter("piid");		// 상품ID
			String occnt = request.getParameter("occnt");	// 구매수량
			String ocoption = request.getParameter("ocoption");	// 상품 옵션
			ProductInfo pdtInfo = orderFormSvc.getPdtInfo(piid);
			request.setAttribute("pdtInfo", pdtInfo);
			request.setAttribute("occnt", occnt);
			request.setAttribute("ocoption", ocoption);
		}
		addrList = orderFormSvc.getAddrList(loginMember.getMi_id());
		addrListInfo = addrListSvc.getAddrListInfo(loginMember.getMi_id());
			
		request.setAttribute("cartList", cartList);
		request.setAttribute("addrList", addrList);	// 배송지 정보 - 기본주소 추출
		request.setAttribute("addrListInfo", addrListInfo); // 배송정보-나의 주소록 주소정보 추출	
		
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
