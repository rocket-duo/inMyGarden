package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class OrderDetailSvc {
	public OrderInfo getOrderDetail(String id, String miid) {
		OrderInfo orderInfo = null;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		
		orderInfo = orderDao.getOrderDetail(id, miid);
		return orderInfo;
	}
	
	public ArrayList<OrderInfo> getOrderDetailInfo(String id) {
		ArrayList<OrderInfo> orderList = null;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		
		orderList = orderDao.getOrderDetailInfo(id);
		return orderList;
	}
}
