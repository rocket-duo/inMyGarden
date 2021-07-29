package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class AddrDelSvc {
	public int addrDelete(String idx, String miid) {
		int result = 0;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		result = orderDao.addrDelete(idx, miid);

		if (result >= 1)	commit(conn);	// ���� ��ǰ ���� ������ ������ commit ��Ŵ
		else				rollback(conn);
		close(conn);

		return result;
	}
}
