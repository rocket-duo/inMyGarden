package ctrl;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import act.*;
import vo.*;

@WebServlet("*.ord")
public class OrderCtrl extends HttpServlet {
// �ֹ����� ��ɵ鿡 ���� ��Ʈ�ѷ�(��ٱ���, ���� ��)
	private static final long serialVersionUID = 1L;
    public OrderCtrl() {
        super();
    }

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");

    	String requestUri = request.getRequestURI();
    	String contextPath = request.getContextPath();
    	String command = requestUri.substring(contextPath.length());

    	ActionForward forward = null;
    	Action action = null;
    	System.out.println(command);
    	switch (command) {
    		case "/cart_list.ord" :		// ��ٱ��� �� ȭ�� ó��
    			action = new CartListAct();
    			break;
    		case "/cart_in_proc.ord" :	// ��ٱ��� ��� ó��
    			action = new CartInProcAct();
    			break;
    		case "/cart_up_proc.ord" :	// ��ٱ��� ���� ó��
    			action = new CartUpProcAct();
    			break;
    		case "/cart_del_proc.ord" :	// ��ٱ��� ���� ó��
    			action = new CartDelProcAct();
    			break;
    		case "/cart_wish_in_proc.ord" :	// ��ٱ��Ͽ��� �򸮽�Ʈ ���ó��
    			action = new CartWishInProcAct();
    			break;
    		case "/cart_receipt.ord" :		// ������ �� ȭ�� ó��
    			action = new CartReceiptAct();
    			break;
    		case "/wish_list.ord" :		// �򸮽�Ʈ �� ȭ�� ó��
    			action = new WishListAct();
    			break;
    		case "/wish_in_proc.ord" :	// �򸮽�Ʈ ��� ó��
    			action = new WishInProcAct();
    			break;
    		case "/wish_up_proc.ord" :	// �򸮽�Ʈ ���� ó��
    			action = new WishUpProcAct();
    			break;
    		case "/wish_del_proc.ord" :	// �򸮽�Ʈ ���� ó��
    			action = new WishDelProcAct();
    			break;
    		case "/wish_cart_in_proc.ord" :	// �򸮽�Ʈ���� ��ٱ��� ���ó��
    			action = new WishCartInProcAct();
    			break;
    		case "/order_form.ord" :	// ���� �� ȭ�� ó��
    			action = new OrderFormAct();
    			break;
    		case "/order_proc.ord" :	// ���� ó���� �����Ϸ� ��
    			action = new OrderProcAct();
    			break;
    		case "/order_view.ord" :	// ���� ó���� �����Ϸ� ��
    			action = new OrderViewAct();
    			break;
    		case "/addr_del_proc.ord" :	// ����ó���� (�ּһ���)
    			action = new AddrDelAct();
    			break;
    		case "/addr_List_proc.ord" :	// ����ó���� (�ּ���ȸ)
    			action = new AddrListAct();
    			break;
    		case "/addr_add_proc.ord" :	// ����ó���� (�ּҵ��)
    			action = new AddrAddAct();
    			break;
    			
    			
    		
    		case "/order_list.ord" :	// �ֹ���ȸ
    			action = new OrderListAct();
    			break;
    		case "/order_detail.ord" :	// �ֹ�������
    			action = new OrderDetailAct();
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
