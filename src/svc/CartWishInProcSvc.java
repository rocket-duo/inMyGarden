package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class CartWishInProcSvc {
		public int getCartWishInsert(String miid, String where) {
			// ��ٱ��Ͽ��� �򸮽�Ʈ�� ��ǰ�� ����Ҷ�
			int result = 0;
			Connection conn = getConnection();
			WishDao wishDao = WishDao.getInstance();
			wishDao.setConnection(conn);
			result = wishDao.getCartWishInsert(miid, where);
			
			if (result >= 1)	commit(conn);
			else				rollback(conn);
			close(conn);
			close(conn);

			return result;
		}
		
		public int CartWishInsert_bk(String miid) {
			// �򸮽�Ʈ�� �ִ� ��ǰ���� �׷�ȭ���Ѽ� �򸮽�Ʈ ������̺� ����
			int result = 0;
			Connection conn = getConnection();
			WishDao wishDao = WishDao.getInstance();
			wishDao.setConnection(conn);
			result = wishDao.CartWishInsert_bk(miid);
			
			if (result >= 1)	commit(conn);
			else				rollback(conn);
			close(conn);
			close(conn);

			return result;
		}
		
		public int CartWishInsert_bk2(String miid) {
			// �򸮽�Ʈ ������̺� ������ �����͸� �򸮽�Ʈ�� �ٽ� ���
			int result = 0;
			Connection conn = getConnection();
			WishDao wishDao = WishDao.getInstance();
			wishDao.setConnection(conn);
			result = wishDao.CartWishInsert_bk2(miid);
			
			if (result >= 1)	commit(conn);
			else				rollback(conn);
			close(conn);
			close(conn);

			return result;
		}
}
