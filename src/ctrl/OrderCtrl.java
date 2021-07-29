package ctrl;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.*;
import javax.servlet.http.*;
import act.*;
import vo.*;

@WebServlet("*.ord")
public class OrderCtrl extends HttpServlet {
// 주문관련 기능들에 대한 컨트롤러(장바구니, 결제 등)
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
    		case "/cart_list.ord" :		// 장바구니 폼 화면 처리
    			action = new CartListAct();
    			break;
    		case "/cart_in_proc.ord" :	// 장바구니 담기 처리
    			action = new CartInProcAct();
    			break;
    		case "/cart_up_proc.ord" :	// 장바구니 수정 처리
    			action = new CartUpProcAct();
    			break;
    		case "/cart_del_proc.ord" :	// 장바구니 삭제 처리
    			action = new CartDelProcAct();
    			break;
    		case "/cart_wish_in_proc.ord" :	// 장바구니에서 찜리스트 담기처리
    			action = new CartWishInProcAct();
    			break;
    		case "/cart_receipt.ord" :		// 견적서 폼 화면 처리
    			action = new CartReceiptAct();
    			break;
    		case "/wish_list.ord" :		// 찜리스트 폼 화면 처리
    			action = new WishListAct();
    			break;
    		case "/wish_in_proc.ord" :	// 찜리스트 담기 처리
    			action = new WishInProcAct();
    			break;
    		case "/wish_up_proc.ord" :	// 찜리스트 수정 처리
    			action = new WishUpProcAct();
    			break;
    		case "/wish_del_proc.ord" :	// 찜리스트 삭제 처리
    			action = new WishDelProcAct();
    			break;
    		case "/wish_cart_in_proc.ord" :	// 찜리스트에서 장바구니 담기처리
    			action = new WishCartInProcAct();
    			break;
    		case "/order_form.ord" :	// 결제 폼 화면 처리
    			action = new OrderFormAct();
    			break;
    		case "/order_proc.ord" :	// 결제 처리후 결제완료 폼
    			action = new OrderProcAct();
    			break;
    		case "/order_view.ord" :	// 결제 처리후 결제완료 폼
    			action = new OrderViewAct();
    			break;
    		case "/addr_del_proc.ord" :	// 결제처리폼 (주소삭제)
    			action = new AddrDelAct();
    			break;
    		case "/addr_List_proc.ord" :	// 결제처리폼 (주소조회)
    			action = new AddrListAct();
    			break;
    		case "/addr_add_proc.ord" :	// 결제처리폼 (주소등록)
    			action = new AddrAddAct();
    			break;
    			
    			
    		
    		case "/order_list.ord" :	// 주문조회
    			action = new OrderListAct();
    			break;
    		case "/order_detail.ord" :	// 주문상세정보
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
