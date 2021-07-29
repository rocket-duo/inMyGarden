package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class WishDelProcSvc {
	public int wishDelete(String where) {
		int result = 0;
		Connection conn = getConnection();
		WishDao wishDao = WishDao.getInstance();
		wishDao.setConnection(conn);
		result = wishDao.wishDelete(where);

		if (result >= 1)	commit(conn);	// ���� ��ǰ ���� ������ ������ commit ��Ŵ
		else				rollback(conn);
		close(conn);

		return result;
	}
}
