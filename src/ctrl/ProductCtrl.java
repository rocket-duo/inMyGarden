package ctrl;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import act.*;
import vo.*;

@WebServlet("*.pdt")
public class ProductCtrl extends HttpServlet {	// ��ǰ���� ��ɵ��� ����(��Ʈ�ѷ�)
	private static final long serialVersionUID = 1L;
    public ProductCtrl() {
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
    		case "/product_list.pdt" :		// ��ǰ ��� ȭ��              
    			action = new PdtListAct();                   
    			break;                                       
    		case "/product_detail.pdt" :	// ��ǰ �� ȭ��              
    			action = new PdtDetailAct();                   
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
