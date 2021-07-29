package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class WishCartInProcAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		request.setCharacterEncoding("utf-8");
		String where = "";
		int result = 0;
		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");
		WishCartInProcSvc wishCartInProcSvc = new WishCartInProcSvc();

	
		String[] arrIdx = request.getParameterValues("chk");
		// üũ�Ǿ� �ִ� üũ�ڽ��� value ������ ���ڿ� �迭�� �޾� ��
		for (int i = 0 ; i < arrIdx.length ; i++)
			where += " or a.ow_idx = " + arrIdx[i];
		where = " and (" + where.substring(4) + ") ";	// ������ ��ǰ�鸸 �����ϱ� ���� ����
		result = wishCartInProcSvc.getWishCartInsert(loginMember.getMi_id(), where);
		result = wishCartInProcSvc.WishCartInsert_bk(loginMember.getMi_id());
		result = wishCartInProcSvc.WishCartInsert_bk2(loginMember.getMi_id());
		ActionForward forward = new ActionForward();
		forward.setRedirect(true);	// dispatch�� �ƴ� sendRedirect ������� �̵�
		forward.setPath("wish_list.ord");

		return forward;
	}
}
