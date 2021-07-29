package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;


public class AddrListSvc {
	public ArrayList<AddrInfo> getAddrListInfo(String miid) {
		ArrayList<AddrInfo> addrListInfo = null;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		addrListInfo = orderDao.getAddrListInfo(miid);
		close(conn);

		return addrListInfo;
	}
}
