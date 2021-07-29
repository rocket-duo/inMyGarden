package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class WishUpProcSvc {
	public int wishUpdate(int idx, String piid, String opt, String cnt , String miid) {
		int result = 0;
		Connection conn = getConnection();
		WishDao wishDao = WishDao.getInstance();
		wishDao.setConnection(conn);
		result = wishDao.wishUpdate(idx, piid, opt, cnt, miid);

		if (result == 1)	commit(conn);
		else				rollback(conn);
		close(conn);

		return result;
	}
}
