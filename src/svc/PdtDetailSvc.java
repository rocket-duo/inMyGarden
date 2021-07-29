package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class PdtDetailSvc {
	public ProductInfo getPdtInfo(String id) {
		ProductInfo pdtInfo = null;
		Connection conn = getConnection();
		ProductDao productDao = ProductDao.getInstance();
		productDao.setConnection(conn);
		pdtInfo = productDao.getPdtInfo(id);

		return pdtInfo;
	}
	
	public ArrayList<ProductInfo> getPdtList(String where, String orderBy, int cpage, int psize) {
		// �˻��� ��ǰ ����� ArrayList<ProductInfo> �� �ν��Ͻ��� �����ϴ� �޼ҵ�
			ArrayList<ProductInfo> pdtList = new ArrayList<ProductInfo>();
			Connection conn = getConnection();
			ProductDao productDao = ProductDao.getInstance();
			productDao.setConnection(conn);
			pdtList = productDao.getPdtList(where, orderBy, cpage, psize);
			close(conn);

			return pdtList;
		}
}
