package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class WishListSvc {
	public ArrayList<WishInfo> getWishList(String miid) {
		ArrayList<WishInfo> wishList = null;
		Connection conn = getConnection();
		WishDao wishDao = WishDao.getInstance();
		wishDao.setConnection(conn);
		wishList = wishDao.getWishList(miid, "");
		close(conn);

		return wishList;
	}
}
