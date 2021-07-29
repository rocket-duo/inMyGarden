package ctrl;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import act.*;
import vo.*;

import java.io.IOException;
@WebServlet("*.profile")
public class MemberProcCtrl extends HttpServlet {
	// 회원관련 작업(가입, 정보수정, 탈퇴)을 처리하는 컨트롤러
		private static final long serialVersionUID = 1L;
	    public MemberProcCtrl() {
	        super();
	    }

		protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	request.setCharacterEncoding("utf-8");

	    	String requestUri = request.getRequestURI();
	    	String contextPath = request.getContextPath();
	    	String command = requestUri.substring(contextPath.length());

	    	ActionForward forward = null;
	    	Action action = null;

	    	switch (command) {
	    		case "/member/insert.profile" : 	// 회원 가입 요청
	    			action = new MemInsertProcAct();
	    			break;
	    		case "" :			// 회원 정보 수정 폼 요청
//	    			action = new MemberUpdateAct();
	    			break;
	    		case "/member/delete.profile" :			// 회원 정보 수정 폼 요청
	    			action = new MemberDeleteAct();
	    			break;
	    	}

	    	try {
	    		forward = action.execute(request, response);
	    	} catch(Exception e) {
	    		e.printStackTrace();
	    	}
	    	
	    	if (forward != null) {
	    		if (forward.isRedirect()) {
	    			response.sendRedirect(forward.getPath());
	    		} else {
	    			RequestDispatcher dispatcher = 
	    				request.getRequestDispatcher(forward.getPath());
	    			dispatcher.forward(request, response);
	    		}
	    	}
		}

		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request, response);
		}
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doProcess(request, response);
		}
	}
