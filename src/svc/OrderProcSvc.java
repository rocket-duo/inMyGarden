package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class OrderProcSvc {
	
	public String getOiid(String miid, String today) {
		// 받아온 idx에 해당하는 게시글의 데이터들을 NoticeInfo 형 인스턴스로 리턴
			String oiid = "";
			Connection conn = getConnection();	// DB에 연결
			OrderDao orderDao = OrderDao.getInstance();
			orderDao.setConnection(conn);

			oiid = orderDao.getOiid(miid, today);
			// 사용자가 선택한 게시글의 정보를 받아와 article에 저장
			close(conn);
			return oiid;
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
			// loginDao 인스턴스의 getLoginMember() 메소드를 실행시키고 
			// 그 결과를 MemberInfo 형 인스턴스 loginMember 에 저장

			close(conn);

			return loginMember;
	}
	
	public int addrInsert(OrderInfo order) {	// 회원정보반영 배송지 추가버튼에 체크했을 경우 
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
