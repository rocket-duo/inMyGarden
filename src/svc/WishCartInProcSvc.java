package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class WishCartInProcSvc {
	public int getWishCartInsert(String miid, String where) {
		int result = 0;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		result = orderDao.getWishCartInsert(miid, where);
		
		if (result >= 1)	commit(conn);
		else				rollback(conn);
		close(conn);
		close(conn);

		return result;
	}
	
	public int WishCartInsert_bk(String miid) {
		int result = 0;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		result = orderDao.WishCartInsert_bk(miid);
		
		if (result >= 1)	commit(conn);
		else				rollback(conn);
		close(conn);
		close(conn);

		return result;
	}
	
	public int WishCartInsert_bk2(String miid) {
		int result = 0;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		result = orderDao.WishCartInsert_bk2(miid);
		
		if (result >= 1)	commit(conn);
		else				rollback(conn);
		close(conn);
		close(conn);

		return result;
	}
}
