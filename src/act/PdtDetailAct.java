package act;

import javax.servlet.http.*;
import java.util.*;
import svc.*;
import vo.*;

public class PdtDetailAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");	// ��ǰID
		int cpage = Integer.parseInt(request.getParameter("cpage")); // ���� ������ ��ȣ
		int psize = Integer.parseInt(request.getParameter("psize")); // ������ũ��&��Ϻ�����

		// �˻�����(�˻���, ��/�Һз�, �귣��, ���ݴ�) �� �������� ������Ʈ��
		String keyword, bcata, scata, brand, sprice, eprice, ord;
		keyword	= request.getParameter("keyword");	// �˻���
		bcata	= request.getParameter("bcata");	// ��з�
		scata	= request.getParameter("scata");	// �Һз�
		sprice	= request.getParameter("sprice");	// ���ݴ� �� ���� ����
		eprice	= request.getParameter("eprice");	// ���ݴ� �� ���� ����
		ord 	= request.getParameter("ord");		// ��������
		
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
	
	private boolean isEmpty(String str) {	// �Ű������� � ���̵� ��� �ִ��� ���θ� �˻��ϴ� �޼ҵ�
		boolean empty = true;
		if (str != null && !str.equals(""))	empty = false;
		return empty;
	}
}
