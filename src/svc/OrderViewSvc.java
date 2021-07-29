package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class OrderViewSvc {
	public ArrayList<OrderInfo> getOdPdtName(String oiid) {
	// 주문번호에 해당하는 상품 조회
			ArrayList<OrderInfo> orderDetail = null;
			Connection conn = getConnection();
			OrderDao orderDao = OrderDao.getInstance();
			orderDao.setConnection(conn);
			orderDetail = orderDao.getOdPdtName(oiid);
			close(conn);
			
		return orderDetail;
	}
	
	public String getOiDate(String oiid) {
		// 주문번호에 해당하는 주문시간을 조회
			String oiDate = "";
			Connection conn = getConnection();	// DB에 연결
			OrderDao orderDao = OrderDao.getInstance();
			orderDao.setConnection(conn);

			oiDate = orderDao.getOiDate(oiid);
			close(conn);
			return oiDate;
		}
	public OrderInfo getOrderValue(String oiid, String miid) {
		// 주문번호에 해당하는 주문시간을 조회
			OrderInfo order = new OrderInfo();
			Connection conn = getConnection();	// DB에 연결
			OrderDao orderDao = OrderDao.getInstance();
			orderDao.setConnection(conn);

			order = orderDao.getOrderValue(oiid, miid);
			close(conn);
			return order;
		}
}
