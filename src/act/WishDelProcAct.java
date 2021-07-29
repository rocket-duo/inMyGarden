package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class WishDelProcAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String kind = request.getParameter("kind");	// ��ü(0), �Ϻ�(-1), �ϳ��� ���� ����
		String idx = request.getParameter("idx");	// ������ īƮ�ε�����ȣ(��)

		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");

		String where = " where mi_id = '" + loginMember.getMi_id() + "' ";
		if (kind.equals("-1")) {	// ������ ��ǰ(��)�� ������ ���
			String[] arr = idx.split(",");
			String tmpWhere = "";
			for (int i = 0 ; i < arr.length ; i++) {
				tmpWhere += " or ow_idx = " + arr[i];
			}
			where += " and (" + tmpWhere.substring(4) + ")";
		} else if (!kind.equals("0")) {	// �� ��ǰ�� ������ ���
			where += " and ow_idx = " + idx;
		}

		WishDelProcSvc wishDelProcSvc = new WishDelProcSvc();
		int result = wishDelProcSvc.wishDelete(where);

		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(result);
		out.close();

		return null;
	}
}
