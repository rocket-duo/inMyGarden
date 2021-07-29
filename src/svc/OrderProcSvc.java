package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class OrderProcSvc {
	
	public String getOiid(String miid, String today) {
		// �޾ƿ� idx�� �ش��ϴ� �Խñ��� �����͵��� NoticeInfo �� �ν��Ͻ��� ����
			String oiid = "";
			Connection conn = getConnection();	// DB�� ����
			OrderDao orderDao = OrderDao.getInstance();
			orderDao.setConnection(conn);

			oiid = orderDao.getOiid(miid, today);
			// ����ڰ� ������ �Խñ��� ������ �޾ƿ� article�� ����
			close(conn);
			return oiid;
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
	
	public int orderInsert(OrderInfo order, String where) {
		int result = 0;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		result = orderDao.orderInsert(order, where);

		if (result >= 1)	commit(conn);
		else				rollback(conn);
		close(conn);

		return result;
	}
	
	public int orderInDetailCart(OrderInfo order, String where) {
		int result = 0;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		result = orderDao.orderInDetailCart(order, where);

		if (result >= 1)	commit(conn);
		else				rollback(conn);
		close(conn);

		return result;
	}
	
	public int orderInDetailPdt(OrderInfo order, String piid, String occnt, String ocoption) {
		int result = 0;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		result = orderDao.orderInDetailPdt(order, piid, occnt, ocoption);

		if (result >= 1)	commit(conn);
		else				rollback(conn);
		close(conn);

		return result;
	}
	
	public int miUpPoint(OrderInfo order, String where) {
		int result = 0;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		result = orderDao.miUpPoint(order, where);

		if (result >= 1)	commit(conn);
		else				rollback(conn);
		close(conn);

		return result;
	}
	
	public int memAddPoint(OrderInfo order, String where) {
		int result = 0;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		result = orderDao.memAddPoint(order, where);

		if (result >= 1)	commit(conn);
		else				rollback(conn);
		close(conn);

		return result;
	}
	
	public int memMinusPoint(OrderInfo order, String where) {
		int result = 0;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		result = orderDao.memMinusPoint(order, where);

		if (result >= 1)	commit(conn);
		else				rollback(conn);
		close(conn);

		return result;
	}
	
	public int cartDelAll(OrderInfo order, String where) {
		int result = 0;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		result = orderDao.cartDelAll(order, where);

		if (result >= 1)	commit(conn);
		else				rollback(conn);
		close(conn);

		return result;
	}
	
	public MemberInfo sessionUpdate(String miid) {
			OrderDao orderDao = OrderDao.getInstance();
			Connection conn = getConnection();
			orderDao.setConnection(conn);

			MemberInfo loginMember = orderDao.sessionUpdate(miid);
			// loginDao �ν��Ͻ��� getLoginMember() �޼ҵ带 �����Ű�� 
			// �� ����� MemberInfo �� �ν��Ͻ� loginMember �� ����

			close(conn);

			return loginMember;
	}
	
	public int addrInsert(OrderInfo order) {	// ȸ�������ݿ� ����� �߰���ư�� üũ���� ��� 
		int result = 0;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		result = orderDao.addrInsert(order);

		if (result == 1)	commit(conn);
		else				rollback(conn);
		close(conn);

		return result;
	}
	
	public ArrayList<OrderInfo> getOdPdtName(String oiid) {
			ArrayList<OrderInfo> orderDetail = null;
			Connection conn = getConnection();
			OrderDao orderDao = OrderDao.getInstance();
			orderDao.setConnection(conn);
			orderDetail = orderDao.getOdPdtName(oiid);
			close(conn);
			
			
			return orderDetail;
		}
	
}
