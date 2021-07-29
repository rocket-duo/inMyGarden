package dao;

import static db.JdbcUtil.*;
import java.sql.*;
import java.util.*;
import vo.*;

public class WishDao {
	private static WishDao wishDao;
	private Connection conn;
	private WishDao() {}

	public static WishDao getInstance() {
		if (wishDao == null) {
			wishDao = new WishDao();
		}
		return wishDao;
	}
	public void setConnection(Connection conn) {
		this.conn = conn;
	}
	
	public ArrayList<WishInfo> getWishList(String miid, String where) {
		// �򸮽�Ʈ���� ������ Ư�� ȸ���� �򸮽�Ʈ ��� �Ǵ� ���������� ������ ������ ��ǰ ����� �����ϴ� �޼ҵ�
			ArrayList<WishInfo> wishList = new ArrayList<WishInfo>();
			Statement stmt = null;
			ResultSet rs = null;
			WishInfo wish = null;

			try {
				String sql = "select a.*, b.pi_name, b.pi_img1,  b.pi_option, " + 
				"b.pi_price, b.pi_stock, b.pi_discount from t_order_wishlist a, t_product_info b " + 
				"where a.pi_id = b.pi_id and b.pi_isview = 'y' and " + 
				"(b.pi_stock >= a.ow_cnt or b.pi_stock = -1) and a.mi_id = '" + miid + 
				"' " + where + " order by a.pi_id";
				System.out.println(sql);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					wish = new WishInfo();
					wish.setOw_idx(rs.getInt("ow_idx"));
					wish.setMi_id(rs.getString("mi_id"));
					wish.setOw_cnt(rs.getInt("ow_cnt"));
					wish.setOw_option(rs.getString("ow_option"));
					wish.setPi_id(rs.getString("pi_id"));
					wish.setPi_name(rs.getString("pi_name"));
					wish.setPi_img1(rs.getString("pi_img1"));
					wish.setPi_option(rs.getString("pi_option"));
					wish.setPi_stock(rs.getInt("pi_stock"));
					int price = rs.getInt("pi_price");
					if (rs.getInt("pi_discount") > 0) {	// �������� ������
						float rate = (float)rs.getInt("pi_discount") / 100;	// ������
						price = Math.round(price - (price * rate));
						// �������� �ִ� ��ǰ�� ��� �������� ������ ������ ������
					}
					wish.setPi_price(price);

					wishList.add(wish);
				}
			} catch(Exception e) {
				System.out.println("getWishList() �޼ҵ� ����");
				e.printStackTrace();
			} finally {
				close(rs);	close(stmt);
			}

			return wishList;
		}
	
	public int wishInsert(WishInfo wish) {
		// �򸮽�Ʈ�� Ư�� ��ǰ�� ����ϴ� �޼ҵ�
			int result = 0;
			Statement stmt = null;
			ResultSet rs = null;

			try {
				stmt = conn.createStatement();
				String sql = "select a.ow_idx, a.ow_cnt, b.pi_stock " + 
				"from t_order_wishlist a, t_product_info b where a.pi_id = b.pi_id and " + 
				"a.mi_id = '" + wish.getMi_id() + "' and a.pi_id = '" + 
				wish.getPi_id() + "' and a.ow_option = '" + wish.getOw_option() + "'";
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
				// ���� �߰��Ϸ��� ��ǰ�� ������ ��ǰ�� �̹� �򸮽�Ʈ�� ���� ���
					sql = "update t_order_wishlist set ow_cnt = ow_cnt + " + wish.getOw_cnt() + 
					" where ow_idx = " + rs.getInt("ow_idx");
					if (rs.getInt("pi_stock") > 0)	// ��� ������(-1)�� �ƴϸ�
						sql += " and (ow_cnt + " + wish.getOw_cnt() + ") <= " + rs.getInt("pi_stock");
				} else {
					sql = "insert into t_order_wishlist (mi_id, pi_id, ow_option, ow_cnt) " + 
					"values ('" + wish.getMi_id() + "', '" + wish.getPi_id() + 
					"', '" + wish.getOw_option() + "', " + wish.getOw_cnt() + ")";
				}
				result = stmt.executeUpdate(sql);

			} catch(Exception e) {
				System.out.println("wishInsert() �޼ҵ� ����");
				e.printStackTrace();
			} finally {
				close(rs);	close(stmt);
			}

			return result;
		}

		public int wishUpdate(int idx, String piid, String opt, String cnt , String miid) {
		// �򸮽�Ʈ�� ���� �� �ɼ� ���� �޼ҵ�
			Statement stmt = null;
			ResultSet rs = null;
			int result = 0;

			try {
				stmt = conn.createStatement();
				String sql = "";   
				sql = 
							"	select ow_idx, ow_cnt  "
						+ 	"	from t_order_wishlist  "
						+ 	"	where mi_id 		= '" + miid + "'"
						+ 	" 	and pi_id 			= '" + piid + "'"
						+ 	" 	and ow_option 		= '" + opt  + "'";
				
				// ���� ȸ���� �򸮽�Ʈ �ӿ� ������ ��ǰ�� ������ �ɼ��� �ִ��� �˻��� ����
				System.out.println(sql);
				rs = stmt.executeQuery(sql);
				if (rs.next()) {	// ������ ��ǰ�� ������ �ɼ��� ������
					if(rs.getInt("ow_idx") == idx ) { 
						sql = 
								
								"	UPDATE t_order_wishlist	   "                       
						+	"	SET    ow_option  = '" + opt  +"'"           
						+	"     ,    ow_cnt     = '" + cnt  +"'"           
						+	"   WHERE  mi_id      = '" + miid +"'"           
						+   "   AND    ow_idx     = '" + idx  +"'"           
					    ;     
						
					} else {
					sql = "update t_order_wishlist set ow_option = '" + opt + 
							"', ow_cnt = ow_cnt + " + rs.getInt("ow_cnt") + 
							" where ow_idx = " + idx ;
					
					wishDelete(" where mi_id = '" + miid + "' and ow_idx = " + rs.getInt("ow_idx"));
					// ������ �ִ� ���ϻ�ǰ ���Ͽɼ��� �򸮽�Ʈ ���ڵ带 ����
					}
				} else {	// ó�� ���õǴ� �ɼ��̸�
					sql = 
					
								"	UPDATE t_order_wishlist  "                       
						+	"	SET    ow_option  = '" + opt  +"'"           
						+	"     ,    ow_cnt     = '" + cnt  +"'"           
						+	"   WHERE  mi_id      = '" + miid +"'"           
						+   "   AND    ow_idx     = '" + idx  +"'"           
					    ;     

				}
				System.out.println(sql);
				result = stmt.executeUpdate(sql);

			} catch(Exception e) {
				System.out.println("wishUpdate() �޼ҵ� ����");
				e.printStackTrace();
			} finally {
				close(rs);	
				close(stmt);
			}

			return result;
		}

		public int wishDelete(String where) {
		// �򸮽�Ʈ�� ��ǰ(��)�� �����ϴ� �޼ҵ�
			Statement stmt = null;
			int result = 0;

			try {
				stmt = conn.createStatement();
				String sql = "delete from t_order_wishlist " + where;
				result = stmt.executeUpdate(sql);

			} catch(Exception e) {
				System.out.println("wishDelete() �޼ҵ� ����");
				e.printStackTrace();
			} finally {
				close(stmt);
			}

			return result;
		}
		
		
		public int getCartWishInsert(String miid, String where) {
			// ��ٱ��Ͽ��� �򸮽�Ʈ�� ��ǰ�� ����Ҷ�
				Statement stmt = null;
				ResultSet rs = null;
				int result = 0;
				try {
					String sql = 		// ��ٱ��Ͽ��� üũ�� ��ǰ ��ȸ
						"  	select a.*, b.pi_name, b.pi_img1, b.pi_option, " + 
						"  	b.pi_price, b.pi_stock, b.pi_discount " + 
						"	from t_order_cart a, t_product_info b " + 
						"  	where a.pi_id = b.pi_id  " + 
						"	and b.pi_isview = 'y' "	+ 
						"	and (b.pi_stock >= a.oc_cnt or b.pi_stock = -1) " + 
						"	and a.mi_id = '" + miid +"' " + where + 
						" 	order by a.pi_id";
					System.out.println(sql);
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					if (rs.next()) {	// üũ�� ��ǰ�� ������
						sql = 	
							" 	insert into t_order_wishlist (mi_id, pi_id, ow_option, ow_cnt) " + 
							" 	select a.mi_id, a.pi_id, a.oc_option, a.oc_cnt " + 
							" 	from t_order_cart a, t_product_info b " + 
							" 	where a.pi_id = b.pi_id  and b.pi_isview = 'y' " + 
							" 	and (b.pi_stock >= a.oc_cnt or b.pi_stock = -1) " + 
							" 	and a.mi_id = '"+ miid +"' " + where + " order by a.pi_id";
						System.out.println(sql);
						result = stmt.executeUpdate(sql);
					}
				} catch(Exception e) {
					System.out.println("getCartWishInsert() �޼ҵ� ����");
					e.printStackTrace();
				} finally {
					close(rs);	close(stmt); 
				}

				return result;
			}
		
		public int CartWishInsert_bk(String miid) {
			// �򸮽�Ʈ�� �ִ� ��ǰ���� �׷�ȭ���Ѽ� �򸮽�Ʈ ������̺� ����
				Statement stmt = null;
				int result = 0;
				try {
					String sql = 	
						"  	INSERT INTO t_order_wishlist_bk (mi_id, pi_id, ow_option, ow_cnt) " + 
						"	SELECT a.mi_id, a.pi_id, a.ow_option, sum(ow_cnt) ow_cnt " + 
						" 	FROM t_order_wishlist a, t_product_info b " + 
						" 	WHERE a.pi_id = b.pi_id " + 
						" 	AND b.pi_isview = 'y' " + 
						" 	AND (b.pi_stock >= a.ow_cnt OR b.pi_stock = -1) " + 
						" 	AND a.mi_id = '"+ miid +"' " + 
						" 	GROUP BY pi_id, ow_option " + 
						" 	ORDER BY a.pi_id";
					System.out.println(sql);
					stmt = conn.createStatement();
					result = stmt.executeUpdate(sql);
						sql = 	
							" DELETE FROM t_order_wishlist WHERE mi_id = '"+ miid +"'";
						System.out.println(sql);
						result = stmt.executeUpdate(sql);
				} catch(Exception e) {
					System.out.println("CartWishInsert_bk() �޼ҵ� ����");
					e.printStackTrace();
				} finally {
					close(stmt); 
				}

				return result;
			}
		
		public int CartWishInsert_bk2(String miid) {
			// �򸮽�Ʈ ������̺� ������ �����͸� �򸮽�Ʈ�� �ٽ� ���
				Statement stmt = null;
				int result = 0;
				try {
					String sql = 	
						"  	INSERT INTO t_order_wishlist " + 
						" 	(mi_id, pi_id, ow_option, ow_cnt) " + 
						" 	SELECT mi_id, pi_id, ow_option, ow_cnt FROM t_order_wishlist_bk " + 
						" 	WHERE mi_id = '"+ miid +"';";
					System.out.println(sql);
					stmt = conn.createStatement();
					result = stmt.executeUpdate(sql);
						sql = 	
							" DELETE FROM t_order_wishlist_bk WHERE mi_id = '"+ miid +"'";
						System.out.println(sql);
						result = stmt.executeUpdate(sql);
				} catch(Exception e) {
					System.out.println("CartWishInsert_bk2() �޼ҵ� ����");
					e.printStackTrace();
				} finally {
					close(stmt); 
				}

				return result;
			}
		
}
