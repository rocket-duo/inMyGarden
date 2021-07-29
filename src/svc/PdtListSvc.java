package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class PdtListSvc {
	public ArrayList<CataBigInfo> getCataBigList() {
		ArrayList<CataBigInfo> cataBigList = null;
		Connection conn = getConnection();
		ProductDao productDao = ProductDao.getInstance();
		productDao.setConnection(conn);
		cataBigList = productDao.getCataBigList();
		close(conn);

		return cataBigList;
	}

	public ArrayList<CataSmallInfo> getCataSmallList() {
		ArrayList<CataSmallInfo> cataSmallList = null;
		Connection conn = getConnection();
		ProductDao productDao = ProductDao.getInstance();
		productDao.setConnection(conn);
		cataSmallList = productDao.getCataSmallList();
		close(conn);

		return cataSmallList;
	}

	public int getPdtCount(String where) {
	// ��Ͽ��� ������ ��ü �Խñ��� ������ �����ϴ� �޼ҵ�
		int rcnt = 0;	// ��ü �Խñ� ������ ������ ����
		Connection conn = getConnection();	// DB�� ����
		ProductDao productDao = ProductDao.getInstance();
		// ProductDao �� �ν��Ͻ��� getInstance()�޼ҵ带 ���� ����
		productDao.setConnection(conn);
		// ProductDao �� �ν��Ͻ� productDao�� Connection��ü�� ����
		rcnt = productDao.getPdtCount(where);
		// �Խñ��� ��ü ������ ���� getArticleCount() �޼ҵ� ȣ��
		close(conn);

		return rcnt;
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
