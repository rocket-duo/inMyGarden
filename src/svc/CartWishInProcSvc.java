package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class CartWishInProcSvc {
		public int getCartWishInsert(String miid, String where) {
			// 장바구니에서 찜리스트로 상품을 등록할때
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
			// 찜리스트에 있는 상품들을 그룹화시켜서 찜리스트 백업테이블에 저장
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
			// 찜리스트 백업테이블에 저장한 데이터를 찜리스트에 다시 담기
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
