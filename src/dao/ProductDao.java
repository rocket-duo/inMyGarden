package dao;

import static db.JdbcUtil.*;
import java.util.*;
import javax.sql.*;
import java.sql.*;
import vo.*;

public class ProductDao {
	private static ProductDao productDao;
	private Connection conn;
	private ProductDao() {}

	public static ProductDao getInstance() {
		if (productDao == null)	productDao = new ProductDao();
		return productDao;
	}
	public void setConnection(Connection conn) {
		this.conn = conn;
	}

	public ArrayList<CataBigInfo> getCataBigList() {
	// ��з� ����� �����ϴ� �޼ҵ�
		ArrayList<CataBigInfo> cataBigList = new ArrayList<CataBigInfo>();
		CataBigInfo bigInfo = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from t_cata_big";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				bigInfo = new CataBigInfo();
				bigInfo.setCb_id(rs.getString("cb_id"));
				bigInfo.setCb_name(rs.getString("cb_name"));
				cataBigList.add(bigInfo);
			}

		} catch(Exception e) {
			System.out.println("getCataBigList() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}

		return cataBigList;
	}

	public ArrayList<CataSmallInfo> getCataSmallList() {
	// �Һз� ����� �����ϴ� �޼ҵ�
		ArrayList<CataSmallInfo> cataSmallList = new ArrayList<CataSmallInfo>();
		CataSmallInfo smallInfo = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			String sql = "select * from t_cata_small";
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				smallInfo = new CataSmallInfo();
				smallInfo.setCs_id(rs.getString("cs_id"));
				smallInfo.setCb_id(rs.getString("cb_id"));
				smallInfo.setCs_name(rs.getString("cs_name"));
				cataSmallList.add(smallInfo);
			}

		} catch(Exception e) {
			System.out.println("getCataSmallList() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}

		return cataSmallList;
	}

	public int getPdtCount(String where) {
	// �˻��� ��ǰ�� �� ������ �����ϴ� �޼ҵ�
		Statement stmt = null;
		ResultSet rs = null;
		int rcnt = 0;

		try {
			String sql = "select count(*) from t_product_info a, t_cata_big b, t_cata_small c " + where;
			System.out.println(sql);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next())	rcnt = rs.getInt(1);
		} catch(Exception e) {
			System.out.println("getPdtCount() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}

		return rcnt;
	}

	public ArrayList<ProductInfo> getPdtList(String where, String orderBy, int cpage, int psize) {
	// �˻��� ��ǰ ����� ArrayList<ProductInfo> �� �ν��Ͻ��� �����ϴ� �޼ҵ�
		ArrayList<ProductInfo> pdtList = new ArrayList<ProductInfo>();
		// ��ǰ����� ������ ArrayList�� ���� ProductInfo�� �ν��Ͻ��� �����
		Statement stmt = null;
		ResultSet rs = null;
		ProductInfo productInfo = null;
		// pdtList�� ���� �������� ProductInfo �� �ν��Ͻ��� ����
		int snum = (cpage - 1) * psize;
		// ������ limit ��ɿ��� �����͸� ������ ���� �ε��� ��ȣ

		try {
			String sql = "select a.*, b.cb_id, b.cb_name, c.cs_name " + 
				" from t_product_info a, t_cata_big b, t_cata_small c " + 
				where + orderBy + " limit " + snum + ", " + psize;
			System.out.println(sql);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
			// rs�� ������ ��ǰ�� ���� ���
				productInfo = new ProductInfo();
				// pdtList�� ������ �ϳ��� ��ǰ ������ ���� �ν��Ͻ� ����

				productInfo = new ProductInfo();
				productInfo.setPi_id(rs.getString("pi_id"));
				productInfo.setPi_name(rs.getString("pi_name"));
				productInfo.setCs_id(rs.getString("cs_id"));
				productInfo.setPi_origin(rs.getString("pi_origin"));
				productInfo.setPi_cost(rs.getInt("pi_cost"));
				productInfo.setPi_price(rs.getInt("pi_price"));
				productInfo.setPi_discount(rs.getInt("pi_discount"));
				productInfo.setPi_option(rs.getString("pi_option"));
				productInfo.setPi_img1(rs.getString("pi_img1"));
				productInfo.setPi_img2(rs.getString("pi_img2"));
				productInfo.setPi_img3(rs.getString("pi_img3"));
				productInfo.setPi_desc(rs.getString("pi_desc"));
				productInfo.setPi_relatedpdt1(rs.getString("pi_relatedpdt1"));
				productInfo.setPi_relatedpdt2(rs.getString("pi_relatedpdt2"));
				productInfo.setPi_relatedpdt3(rs.getString("pi_relatedpdt3"));
				productInfo.setPi_relatedpdt4(rs.getString("pi_relatedpdt4"));
				productInfo.setPi_relatedpdt5(rs.getString("pi_relatedpdt5"));
				productInfo.setPi_mainbanner(rs.getString("pi_mainbanner"));
				productInfo.setPi_stock(rs.getInt("pi_stock"));
				productInfo.setPi_salecnt(rs.getInt("pi_salecnt"));
				productInfo.setPi_review(rs.getInt("pi_review"));
				productInfo.setPi_soldout(rs.getString("pi_soldout"));
				productInfo.setPi_star(rs.getFloat("pi_star"));
				productInfo.setPi_isview(rs.getString("pi_isview"));
				productInfo.setPi_date(rs.getString("pi_date"));
				productInfo.setAi_idx(rs.getInt("ai_idx"));
				// �޾ƿ� ���ڵ��� ��ǰ ������ ����

				pdtList.add(productInfo);
				// �� ��ǰ�� ������ ���� productInfo �ν��Ͻ��� pdtList�� ����
			}
		} catch(Exception e) {
			System.out.println("getPdtList() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}

		return pdtList;
	}

	public ProductInfo getPdtInfo(String id) {
	// ������ id�� �ش��ϴ� Ư�� ��ǰ ������ ProductInfo�� �ν��Ͻ��� �����ϴ� �޼ҵ�
		ProductInfo pdtInfo = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			String sql = "select a.*, b.cb_id, b.cb_name, c.cs_name " + 
				" from t_product_info a, t_cata_big b, t_cata_small c " + 
				" where a.cs_id = c.cs_id and b.cb_id = c.cb_id  " + 
				" and a.pi_id = '" + id + "' and a.pi_isview = 'y' and a.pi_stock <> 0";
			System.out.println(sql);
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				pdtInfo = new ProductInfo();
				pdtInfo.setPi_id(rs.getString("pi_id"));
				pdtInfo.setPi_name(rs.getString("pi_name"));
				pdtInfo.setCs_id(rs.getString("cs_id"));
				pdtInfo.setPi_origin(rs.getString("pi_origin"));
				pdtInfo.setPi_cost(rs.getInt("pi_cost"));
				pdtInfo.setPi_price(rs.getInt("pi_price"));
				pdtInfo.setPi_discount(rs.getInt("pi_discount"));
				pdtInfo.setPi_option(rs.getString("pi_option"));
				pdtInfo.setPi_img1(rs.getString("pi_img1"));
				pdtInfo.setPi_img2(rs.getString("pi_img2"));
				pdtInfo.setPi_img3(rs.getString("pi_img3"));
				pdtInfo.setPi_desc(rs.getString("pi_desc"));
				pdtInfo.setPi_relatedpdt1(rs.getString("pi_relatedpdt1"));
				pdtInfo.setPi_relatedpdt2(rs.getString("pi_relatedpdt2"));
				pdtInfo.setPi_relatedpdt3(rs.getString("pi_relatedpdt3"));
				pdtInfo.setPi_relatedpdt4(rs.getString("pi_relatedpdt4"));
				pdtInfo.setPi_relatedpdt5(rs.getString("pi_relatedpdt5"));
				pdtInfo.setPi_mainbanner(rs.getString("pi_mainbanner"));
				pdtInfo.setPi_stock(rs.getInt("pi_stock"));
				pdtInfo.setPi_salecnt(rs.getInt("pi_salecnt"));
				pdtInfo.setPi_review(rs.getInt("pi_review"));
				pdtInfo.setPi_soldout(rs.getString("pi_soldout"));
				pdtInfo.setPi_star(rs.getFloat("pi_star"));
				pdtInfo.setPi_isview(rs.getString("pi_isview"));
				pdtInfo.setPi_date(rs.getString("pi_date"));
				pdtInfo.setAi_idx(rs.getInt("ai_idx"));
			}
		} catch(Exception e) {
			System.out.println("getPdtInfo() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}

		return pdtInfo;
	}
}
