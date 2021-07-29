package act;

import javax.servlet.http.*;
import java.util.*;
import java.io.*;
import svc.*;
import vo.*;


public class AddrListAct implements Action {
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<AddrInfo> addrListInfo = new ArrayList<AddrInfo>();

		request.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		MemberInfo loginMember = (MemberInfo)session.getAttribute("loginMember");

		AddrListSvc addrListSvc = new AddrListSvc();

		
		addrListInfo = addrListSvc.getAddrListInfo(loginMember.getMi_id());
			request.setAttribute("addrListInfo", addrListInfo);
			
		ActionForward forward = new ActionForward();
		forward.setPath("/order/order_detail.jsp");

		return null;
	}
}
