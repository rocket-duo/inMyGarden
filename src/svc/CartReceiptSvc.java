package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class CartReceiptSvc {
	public ArrayList<CartInfo> getReceiptList(String miid) {
		ArrayList<CartInfo> receiptList = null;
		Connection conn = getConnection();
		OrderDao orderDao = OrderDao.getInstance();
		orderDao.setConnection(conn);
		receiptList = orderDao.getReceiptList(miid, "");
		close(conn);

		return receiptList;
	}
}
