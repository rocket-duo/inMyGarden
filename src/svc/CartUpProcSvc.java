package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class CartUpProcSvc {
	public int cartUpdate(int idx, String piid, String opt, String cnt , String miid) {
		int result = 0;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		result = orderDao.cartUpdate(idx, piid, opt, cnt, miid);

		if (result == 1)	commit(conn);
		else				rollback(conn);
		close(conn);

		return result;
	}
}
