package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;

public class AddrAddAct implements Action{	// 결제화면에서 나의배송지 관리 - 등록
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String myAddrName = request.getParameter("myAddrName"); // 배송지 별명
		
		String myAddrPhone = request.getParameter("myAddrP1") + "-" + 
		request.getParameter("myAddrP2") + "-" + request.getParameter("myAddrP3"); // 휴대폰번호
		
		String myAddrReceiver = request.getParameter("myAddrReceiver");	// 받으실분
		String myAddrZip = request.getParameter("myAddrZip");	// 우편번호
		String myAddrAddr1 = request.getParameter("myAddrAddr1");	// 주소1
		String myAddrAddr2 = request.getParameter("myAddrAddr2");	// 주소2
		
		String myAddrIsbasic = request.getParameter("myAddrIsbasic");	// 기본주소 설정 여부
		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");
		AddrAddSvc addrAddSvc = new AddrAddSvc();
		int result = 0;
		
		System.out.println(myAddrIsbasic);
		if ("y".equals(myAddrIsbasic)) {	// 기본주소 설정여부를 체크했을 때 나머지주소의 기본주소설정 n으로 업데이트
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
