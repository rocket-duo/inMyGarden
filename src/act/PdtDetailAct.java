package act;

import javax.servlet.http.*;
import java.util.*;
import svc.*;
import vo.*;

public class PdtDetailAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");	// 상품ID
		int cpage = Integer.parseInt(request.getParameter("cpage")); // 현재 페이지 번호
		int psize = Integer.parseInt(request.getParameter("psize")); // 페이지크기&목록보기방식

		// 검색조건(검색어, 대/소분류, 브랜드, 가격대) 및 정렬조건 쿼리스트링
		String keyword, bcata, scata, brand, sprice, eprice, ord;
		keyword	= request.getParameter("keyword");	// 검색어
		bcata	= request.getParameter("bcata");	// 대분류
		scata	= request.getParameter("scata");	// 소분류
		sprice	= request.getParameter("sprice");	// 가격대 중 시작 가격
		eprice	= request.getParameter("eprice");	// 가격대 중 종료 가격
		ord 	= request.getParameter("ord");		// 정렬조건
		
		String where = " where a.cs_id = c.cs_id and b.cb_id = c.cb_id and " + 
			" a.pi_isview = 'y' ";
		if (!isEmpty(keyword))	where += " and a.pi_name like '%" + keyword + "%' ";
		else	keyword = "";
		if (!isEmpty(bcata))	where += " and b.cb_id = '" + bcata + "' ";
		else	bcata = "";
		if (!isEmpty(scata))	where += " and c.cs_id = '" + scata + "' ";
		else	scata = "";
		if (!isEmpty(sprice))	where += " and a.pi_price >= '" + sprice + "' ";
		else	sprice = "";
		if (!isEmpty(eprice))	where += " and a.pi_price <= '" + eprice + "' ";
		else	eprice = "";

		PdtDetailSvc pdtDetailSvc = new PdtDetailSvc();
		
		ProductInfo pdtInfo = pdtDetailSvc.getPdtInfo(id);

		request.setAttribute("pdtInfo", pdtInfo);

		ActionForward forward = new ActionForward();
		forward.setPath("/product/product_detail.jsp");

		return forward;
	}
	
	private boolean isEmpty(String str) {	// 매개변수에 어떤 값이든 들어 있는지 여부를 검사하는 메소드
		boolean empty = true;
		if (str != null && !str.equals(""))	empty = false;
		return empty;
	}
}
