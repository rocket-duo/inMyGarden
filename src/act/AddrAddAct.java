package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class AddrAddAct implements Action{	// ����ȭ�鿡�� ���ǹ���� ���� - ���
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String myAddrName = request.getParameter("myAddrName"); // ����� ����
		
		String myAddrPhone = request.getParameter("myAddrP1") + "-" + 
		request.getParameter("myAddrP2") + "-" + request.getParameter("myAddrP3"); // �޴�����ȣ
		
		String myAddrReceiver = request.getParameter("myAddrReceiver");	// �����Ǻ�
		String myAddrZip = request.getParameter("myAddrZip");	// �����ȣ
		String myAddrAddr1 = request.getParameter("myAddrAddr1");	// �ּ�1
		String myAddrAddr2 = request.getParameter("myAddrAddr2");	// �ּ�2
		
		String myAddrIsbasic = request.getParameter("myAddrIsbasic");	// �⺻�ּ� ���� ����
		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");
		AddrAddSvc addrAddSvc = new AddrAddSvc();
		int result = 0;
		
		System.out.println(myAddrIsbasic);
		if ("y".equals(myAddrIsbasic)) {	// �⺻�ּ� �������θ� üũ���� �� �������ּ��� �⺻�ּҼ��� n���� ������Ʈ
			result = addrAddSvc.myAddrUpdate(loginMember.getMi_id());
		} 
			result = addrAddSvc.myAddrInsert(myAddrName, myAddrPhone, myAddrReceiver, 
					myAddrZip, myAddrAddr1, myAddrAddr2, myAddrIsbasic,loginMember.getMi_id());
		

		
		
		
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(result);
		out.close();

		return null;
	}
}
