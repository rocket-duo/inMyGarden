package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class WishInProcSvc {
	public int wishInsert(WishInfo wish) {
		int result = 0;
		Connection conn = getConnection();
		WishDao wishDao = WishDao.getInstance();
		wishDao.setConnection(conn);
		result = wishDao.wishInsert(wish);

		if (result == 1)	commit(conn);
		else				rollback(conn);
		close(conn);

		return result;
	}
}
