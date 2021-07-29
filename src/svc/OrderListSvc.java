package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class OrderListSvc {
	public ArrayList<OrderInfo> getOrderList(String miid, int cpage, int psize, String sch) {
		ArrayList<OrderInfo> orderList = null;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		orderList = orderDao.getOrderList(miid, cpage, psize, sch);
		close(conn);

		return orderList;
	}
	
	public int getOrderCount(String sch, String miid) {
		int rcnt = 0; 
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		rcnt = orderDao.getOrderCount(sch, miid);
		close(conn);
		
		return rcnt;
	}	
}
