package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class AddrAddSvc {
	public int myAddrUpdate(String miid) {
		int result = 0;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		result = orderDao.myAddrUpdate(miid);

		if (result >= 1)	commit(conn);	// 여러 주소의 변경을 성공시 쿼리를 commit 시킴
		else				rollback(conn);
		close(conn);

		return result;
	}
	
	public int myAddrInsert(String myAddrName, String myAddrPhone, String myAddrReceiver, 
			String myAddrZip, String myAddrAddr1, String myAddrAddr2, String myAddrIsbasic, String miid	) {
		int result = 0;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		result = orderDao.myAddrInsert(myAddrName, myAddrPhone, myAddrReceiver, 
				myAddrZip, myAddrAddr1, myAddrAddr2, myAddrIsbasic, miid);

		if (result >= 1)	commit(conn);	// 여러 주소의 변경을 성공시 쿼리를 commit 시킴
		else				rollback(conn);
		close(conn);

		return result;
	}
}
