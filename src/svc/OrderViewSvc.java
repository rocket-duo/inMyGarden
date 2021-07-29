package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class OrderViewSvc {
	public ArrayList<OrderInfo> getOdPdtName(String oiid) {
	// �ֹ���ȣ�� �ش��ϴ� ��ǰ ��ȸ
			ArrayList<OrderInfo> orderDetail = null;
			Connection conn = getConnection();
			OrderDao orderDao = OrderDao.getInstance();
			orderDao.setConnection(conn);
			orderDetail = orderDao.getOdPdtName(oiid);
			close(conn);
			
		return orderDetail;
	}
	
	public String getOiDate(String oiid) {
		// �ֹ���ȣ�� �ش��ϴ� �ֹ��ð��� ��ȸ
			String oiDate = "";
			Connection conn = getConnection();	// DB�� ����
			OrderDao orderDao = OrderDao.getInstance();
			orderDao.setConnection(conn);

			oiDate = orderDao.getOiDate(oiid);
			close(conn);
			return oiDate;
		}
	public OrderInfo getOrderValue(String oiid, String miid) {
		// �ֹ���ȣ�� �ش��ϴ� �ֹ��ð��� ��ȸ
			OrderInfo order = new OrderInfo();
			Connection conn = getConnection();	// DB�� ����
			OrderDao orderDao = OrderDao.getInstance();
			orderDao.setConnection(conn);

			order = orderDao.getOrderValue(oiid, miid);
			close(conn);
			return order;
		}
}
