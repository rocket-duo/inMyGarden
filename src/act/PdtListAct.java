package act;

import javax.servlet.http.*;
import java.util.*;
import svc.*;
import vo.*;

public class PdtListAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<ProductInfo> pdtList = new ArrayList<ProductInfo>();

		request.setCharacterEncoding("utf-8");
		int cpage = 1, psize = 20, bsize = 10, spage, epage, rcnt, pcnt;
		if (request.getParameter("cpage") != null)
			cpage = Integer.parseInt(request.getParameter("cpage"));
		if (request.getParameter("psize") != null)
			psize = Integer.parseInt(request.getParameter("psize"));

		// �˻�����(�˻���, ��/�Һз�, �귣��, ���ݴ�) ������Ʈ��
		String keyword, bcata, scata, sprice, eprice;
		keyword	= request.getParameter("keyword");	// �˻���
		bcata	= request.getParameter("bcata");	// ��з�
		scata	= request.getParameter("scata");	// �Һз�
		sprice	= request.getParameter("sprice");	// ���ݴ� �� ���� ����
		eprice	= request.getParameter("eprice");	// ���ݴ� �� ���� ����

		// �˻� ���ǿ� ���� where�� ����
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

		// ��������(�Ǹŷ�-��, ����-����, ���-��(�⺻), ��ǰ��-��, ����-��) ������Ʈ��
		String ord = request.getParameter("ord");
		if (ord == null || ord.equals(""))	ord = "idd";	// ��� �������� ������ �⺻��
		String orderBy = " order by a.pi_" + ord.substring(0, ord.length() - 1) + 
			(ord.charAt(ord.length() - 1) == 'a' ? " asc" : " desc");
		// �������ǿ� ���� order by�� ����

		PdtListSvc pdtListSvc = new PdtListSvc();
		rcnt = pdtListSvc.getPdtCount(where);	// �˻��� ��ǰ�� �� ����(������ ������ ���ϱ� ���� �ʿ�)
		pdtList = pdtListSvc.getPdtList(where, orderBy, cpage, psize);
		// �� ������(cpage)���� ������ �˻��� ��ǰ����� �޾ƿ�

		pcnt = rcnt / psize;
		if (rcnt % psize > 0)	pcnt++;				// ��ü ������ ��
		spage = (cpage - 1) / bsize * bsize + 1;	// ����� ���� ������ ��ȣ
		epage = spage + bsize - 1;
		if (epage > pcnt)		epage = pcnt;		// ����� ���� ������ ��ȣ

		PdtPageInfo pageInfo = new PdtPageInfo();	// ����¡�� �ʿ��� �������� ������ �ν��Ͻ�
		// ����¡�� �ʿ��� ������
		pageInfo.setCpage(cpage);		// ���� ������ ��ȣ
		pageInfo.setRcnt(rcnt);			// ��ü �Խñ� ����
		pageInfo.setPcnt(pcnt);			// ��ü ������ ����
		pageInfo.setSpage(spage);		// ��� ���� ������ ��ȣ
		pageInfo.setEpage(epage);		// ��� ���� ������ ��ȣ
		pageInfo.setPsize(psize);		// ������ ũ��
		pageInfo.setBsize(bsize);		// ��� ũ��

		// �˻����� ������
		pageInfo.setKeyword(keyword);	// �˻���
		pageInfo.setBcata(bcata);		// ��з�
		pageInfo.setScata(scata);		// �Һз�
		pageInfo.setSprice(sprice);		// ���ݴ�(���۰�)
		pageInfo.setEprice(eprice);		// ���ݴ�(���ᰡ)

		pageInfo.setOrd(ord);			// ��������

		ArrayList<CataBigInfo> cataBigList = pdtListSvc.getCataBigList();	// ��з� ���
		ArrayList<CataSmallInfo> cataSmallList = pdtListSvc.getCataSmallList();	// �Һз� ���

		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("pdtList", pdtList);
		request.setAttribute("cataBigList", cataBigList);
		request.setAttribute("cataSmallList", cataSmallList);

		ActionForward forward = new ActionForward();
		forward.setPath("/product/product_list.jsp");

		return forward;
	}

	private boolean isEmpty(String str) {	// �Ű������� � ���̵� ��� �ִ��� ���θ� �˻��ϴ� �޼ҵ�
		boolean empty = true;
		if (str != null && !str.equals(""))	empty = false;
		return empty;
	}
}
