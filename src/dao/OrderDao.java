package dao;

import static db.JdbcUtil.*;
import java.sql.*;
import java.util.*;

import vo.*;


public class OrderDao {
	private static OrderDao orderDao;
	private Connection conn;
	private OrderDao() {}

	public static OrderDao getInstance() {
		if (orderDao == null) {
			orderDao = new OrderDao();
		}
		return orderDao;
	}
	public void setConnection(Connection conn) {
		this.conn = conn;
	}

	public ArrayList<CartInfo> getCartList(String miid, String where) {
	// ��ٱ��Ͽ��� ������ Ư�� ȸ���� ��ٱ��� ��� �Ǵ� ���������� ������ ������ ��ǰ ����� �����ϴ� �޼ҵ�
		ArrayList<CartInfo> cartList = new ArrayList<CartInfo>();
		Statement stmt = null;
		ResultSet rs = null;
		CartInfo cart = null;
		String sql = "";
		try {
				
			 sql = 
					
				"	select a.*, b.pi_name, b.pi_img1,  b.pi_option, b.pi_price, b.pi_stock, b.pi_discount " + 
				"	from t_order_cart a, t_product_info b " + 
				"	where a.pi_id = b.pi_id " + 
				"	and b.pi_isview = 'y' " + 
				"	and (b.pi_stock >= a.oc_cnt or b.pi_stock = -1) " + 
				" 	and a.mi_id = '" + miid +"' " + where + 
				" 	order by a.pi_id";
			
			 stmt = conn.createStatement();
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				
				cart = new CartInfo();
				cart.setOc_idx(rs.getInt("oc_idx"));
				cart.setMi_id(rs.getString("mi_id"));
				cart.setOc_cnt(rs.getInt("oc_cnt"));
				cart.setOc_option(rs.getString("oc_option"));
				cart.setPi_id(rs.getString("pi_id"));
				cart.setPi_name(rs.getString("pi_name"));
				cart.setPi_img1(rs.getString("pi_img1"));
				cart.setPi_option(rs.getString("pi_option"));
				cart.setPi_stock(rs.getInt("pi_stock"));
				int price = rs.getInt("pi_price");
				if (rs.getInt("pi_discount") > 0) {	// �������� ������
					float rate = (float)rs.getInt("pi_discount") / 100;	// ������
					price = Math.round(price - (price * rate));
					// �������� �ִ� ��ǰ�� ��� �������� ������ ������ ������
				} 
				cart.setPi_price(price);
				cartList.add(cart);
			}
		} catch(Exception e) {
			System.out.println("getCartList() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}

		return cartList;
	}

	
	public MemberInfo getAddrList(String miid) {
		// ����ȭ�鿡�� ������ ȸ������, �ּ�����
			MemberInfo addrList = null;
			Statement stmt = null;
			ResultSet rs = null;

			String sql = "";
			try {
				stmt = conn.createStatement();
				sql = 	
					"	select " + 
					"	a.mi_id, a.mi_name, a.mi_phone, a.mi_email, a.mi_point, " + 
					" 	b.ma_name, b.ma_phone, b.ma_zip, " + 
					" 	b.ma_addr1, b.ma_addr2"  + 
					" 	from t_member_info a, t_member_addr b " + 
					" 	where a.mi_id = b.mi_id " + 
					" 	and a.mi_isactive = 'y' " +
					" 	and b.ma_basic = 'y' " + 
					" 	and a.mi_id = '" + miid + "' ";
				
				System.out.println(sql);
				rs = stmt.executeQuery(sql);
				if (rs.next()) {
					addrList = new MemberInfo();
					addrList.setMi_id(miid);
					addrList.setMi_name(rs.getString("mi_name"));
					addrList.setMi_phone(rs.getString("mi_phone"));
					addrList.setMi_email(rs.getString("mi_email"));
					addrList.setMi_point(rs.getInt("mi_point"));
					addrList.setMa_name(rs.getString("ma_name"));
					addrList.setMa_phone(rs.getString("ma_phone"));
					addrList.setMa_zip(rs.getString("ma_zip"));
					addrList.setMa_addr1(rs.getString("ma_addr1"));
					addrList.setMa_addr2(rs.getString("ma_addr2"));
				}
			} catch(Exception e) {
				System.out.println("getAddrList() �޼ҵ� ����");
				e.printStackTrace();
			} finally {
				close(rs);	close(stmt);
			}

			return addrList;
		}
	
	public ArrayList<AddrInfo> getAddrListInfo(String miid) {
		// ��ٱ��Ͽ��� ������ Ư�� ȸ���� ��ٱ��� ��� �Ǵ� ���������� ������ ������ ��ǰ ����� �����ϴ� �޼ҵ�
			ArrayList<AddrInfo> addrListInfo = new ArrayList<AddrInfo>();
			Statement stmt = null;
			ResultSet rs = null;
			AddrInfo addr = null;
			String sql = "";
			try {

				stmt = conn.createStatement();
				sql = 
						
					"	select * " + 
					"	from t_member_addr " + 
					" 	where mi_id = '" + miid + "' " + 
					" 	order by ma_date desc ";
				
				System.out.println(sql);
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					
					addr = new AddrInfo();
					addr.setMa_idx(rs.getInt("ma_idx"));
					addr.setMi_id(miid);
					addr.setMa_name(rs.getString("ma_name"));
					addr.setMa_phone(rs.getString("ma_phone"));
					addr.setMa_addrname(rs.getString("ma_addrname"));
					addr.setMa_zip(rs.getString("ma_zip"));
					addr.setMa_addr1(rs.getString("ma_addr1"));
					addr.setMa_addr2(rs.getString("ma_addr2"));
					addr.setMa_basic(rs.getString("ma_basic"));
					addr.setMa_date(rs.getString("ma_date"));
					
					addrListInfo.add(addr);
				}
			} catch(Exception e) {
				System.out.println("getAddrListInfo() �޼ҵ� ����");
				e.printStackTrace();
			} finally {
				close(rs);	close(stmt);
			}

			return addrListInfo;
		}
	
	
	
	
	public int cartInsert(CartInfo cart) {
	// ��ٱ��Ͽ� Ư�� ��ǰ�� ����ϴ� �޼ҵ�
		int result = 0;
		Statement stmt = null;
		ResultSet rs = null;

		try {
			stmt = conn.createStatement();
			String sql = "select a.oc_idx, a.oc_cnt, b.pi_stock " + 
			"from t_order_cart a, t_product_info b where a.pi_id = b.pi_id and " + 
			"a.mi_id = '" + cart.getMi_id() + "' and a.pi_id = '" + 
			cart.getPi_id() + "' and a.oc_option = '" + cart.getOc_option() + "'";
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
			// ���� �߰��Ϸ��� ��ǰ�� ������ ��ǰ�� �̹� ��ٱ��Ͽ� ���� ���
				sql = "update t_order_cart set oc_cnt = oc_cnt + " + cart.getOc_cnt() + 
				" where oc_idx = " + rs.getInt("oc_idx");
				if (rs.getInt("pi_stock") > 0)	// ��� ������(-1)�� �ƴϸ�
					sql += " and (oc_cnt + " + cart.getOc_cnt() + ") <= " + rs.getInt("pi_stock");
			} else {
				sql = "insert into t_order_cart (mi_id, pi_id, oc_option, oc_cnt) " + 
				"values ('" + cart.getMi_id() + "', '" + cart.getPi_id() + 
				"', '" + cart.getOc_option() + "', " + cart.getOc_cnt() + ")";
			}
			result = stmt.executeUpdate(sql);

		} catch(Exception e) {
			System.out.println("cartInsert() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}

		return result;
	}

	public int cartUpdate(int idx, String piid, String opt, String cnt , String miid) {
	// ��ٱ��ϳ� ���� �� �ɼ� ���� �޼ҵ�
		Statement stmt = null;
		ResultSet rs = null;
		int result = 0;

		try {
			stmt = conn.createStatement();
			String sql = "";   
			sql = 
						"	select oc_idx, oc_cnt  "
					+ 	"	from t_order_cart	   "
					+ 	"	where mi_id 		= '" + miid + "'"
					+ 	" 	and pi_id 			= '" + piid + "'"
					+ 	" 	and oc_option 		= '" + opt  + "'";
			
			// ���� ȸ���� ��ٱ��� �ӿ� ������ ��ǰ�� ������ �ɼ��� �ִ��� �˻��� ����
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			if (rs.next()) {	// ������ ��ǰ�� ������ �ɼ��� ������
				if(rs.getInt("oc_idx") == idx ) { 
					sql = 
							
						"	UPDATE t_order_cart  "                       
					+	"	SET    oc_option  = '" + opt  +"'"           
					+	"     ,    oc_cnt     = '" + cnt  +"'"           
					+	"   WHERE  mi_id      = '" + miid +"'"           
					+   "   AND    oc_idx     = '" + idx  +"'"           
				    ;     
					
				} else {
				sql = "update t_order_cart set oc_option = '" + opt + 
						"', oc_cnt = oc_cnt + " + rs.getInt("oc_cnt") + 
						" where oc_idx = " + idx ;
				
				cartDelete(" where mi_id = '" + miid + "' and oc_idx = " + rs.getInt("oc_idx"));
				// ������ �ִ� ���ϻ�ǰ ���Ͽɼ��� īƮ ���ڵ带 ����
				}
			} else {	// ó�� ���õǴ� �ɼ��̸�
				sql = 
				
							"	UPDATE t_order_cart  "                       
					+	"	SET    oc_option  = '" + opt  +"'"           
					+	"     ,    oc_cnt     = '" + cnt  +"'"           
					+	"   WHERE  mi_id      = '" + miid +"'"           
					+   "   AND    oc_idx     = '" + idx  +"'"           
				    ;     

			}
			System.out.println(sql);
			result = stmt.executeUpdate(sql);

		} catch(Exception e) {
			System.out.println("cartUpdate() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(rs);	
			close(stmt);
		}

		return result;
	}

	public int cartDelete(String where) {
	// ��ٱ��ϳ� ��ǰ(��)�� �����ϴ� �޼ҵ�
		Statement stmt = null;
		int result = 0;

		try {
			stmt = conn.createStatement();
			String sql = "DELETE FROM t_order_cart " + where;
			result = stmt.executeUpdate(sql);

		} catch(Exception e) {
			System.out.println("cartDelete() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(stmt);
		}

		return result;
	}
	
	public ArrayList<CartInfo> getReceiptList(String miid, String where) {
		// ��ٱ��Ͽ��� ������ Ư�� ȸ���� ��ٱ��� ��� �Ǵ� ���������� ������ ������ ��ǰ ����� �����ϴ� �޼ҵ�
			ArrayList<CartInfo> receiptList = new ArrayList<CartInfo>();
			Statement stmt = null;
			ResultSet rs = null;
			CartInfo receipt = null;

			try {
				String sql = "select a.*, b.pi_name, b.pi_img1,  b.pi_option, " + 
				"b.pi_price, b.pi_stock, b.pi_discount from t_order_cart a, t_product_info b " + 
				"where a.pi_id = b.pi_id and b.pi_isview = 'y' and " + 
				"(b.pi_stock >= a.oc_cnt or b.pi_stock = -1) and a.mi_id = '" + miid + 
				"' " + where + " order by a.pi_id";
				System.out.println(sql);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					receipt = new CartInfo();
					receipt.setOc_idx(rs.getInt("oc_idx"));
					receipt.setMi_id(rs.getString("mi_id"));
					receipt.setOc_cnt(rs.getInt("oc_cnt"));
					receipt.setOc_option(rs.getString("oc_option"));
					receipt.setPi_id(rs.getString("pi_id"));
					receipt.setPi_name(rs.getString("pi_name"));
					receipt.setPi_img1(rs.getString("pi_img1"));
					receipt.setPi_option(rs.getString("pi_option"));
					receipt.setPi_stock(rs.getInt("pi_stock"));
					int price = rs.getInt("pi_price");
					if (rs.getInt("pi_discount") > 0) {	// �������� ������
						float rate = (float)rs.getInt("pi_discount") / 100;	// ������
						price = Math.round(price - (price * rate));
						// �������� �ִ� ��ǰ�� ��� �������� ������ ������ ������
					}
					receipt.setPi_price(price);

					receiptList.add(receipt);
				}
			} catch(Exception e) {
				System.out.println("getReceiptList() �޼ҵ� ����");
				e.printStackTrace();
			} finally {
				close(rs);	close(stmt);
			}

			return receiptList;
		}
	
	public int getWishCartInsert(String miid, String where) {
		// ��ٱ��Ͽ��� �򸮽�Ʈ�� ��ǰ�� ����Ҷ�
			Statement stmt = null;
			ResultSet rs = null;
			
			int result = 0;
			try {
				String sql = 		// ��ٱ��Ͽ��� üũ�� ��ǰ ��ȸ
					"  	select a.*, b.pi_name, b.pi_img1, b.pi_option, " + 
					"  	b.pi_price, b.pi_stock, b.pi_discount " + 
					"	from t_order_wishlist a, t_product_info b " + 
					"  	where a.pi_id = b.pi_id  " + 
					"	and b.pi_isview = 'y' "	+ 
					"	and (b.pi_stock >= a.ow_cnt or b.pi_stock = -1) " + 
					"	and a.mi_id = '" + miid +"' " + where + 
					" 	order by a.pi_id";
				System.out.println(sql);
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				if (rs.next()) {	// üũ�� ��ǰ�� ������
					sql = 	
						" 	insert into t_order_cart (mi_id, pi_id, oc_option, oc_cnt) " + 
						" 	select a.mi_id, a.pi_id, a.ow_option, a.ow_cnt " + 
						" 	from t_order_wishlist a, t_product_info b " + 
						" 	where a.pi_id = b.pi_id  and b.pi_isview = 'y' " + 
						" 	and (b.pi_stock >= a.ow_cnt or b.pi_stock = -1) " + 
						" 	and a.mi_id = '"+ miid +"' " + where + " order by a.pi_id";
					System.out.println(sql);
					result = stmt.executeUpdate(sql);

				}
			} catch(Exception e) {
				System.out.println("getWishCartInsert() �޼ҵ� ����");
				e.printStackTrace();
			} finally {
				close(rs);	close(stmt);
			}

			return result;
		}
	
	
	
	public int WishCartInsert_bk(String miid) {
		// �򸮽�Ʈ�� �ִ� ��ǰ���� �׷�ȭ���Ѽ� �򸮽�Ʈ ������̺� ����
			Statement stmt = null;
			int result = 0;
			try {
				String sql = 	
					"  	INSERT INTO t_order_cart_bk (mi_id, pi_id, oc_option, oc_cnt) " + 
					"	SELECT a.mi_id, a.pi_id, a.oc_option, sum(oc_cnt) oc_cnt " + 
					" 	FROM t_order_cart a, t_product_info b " + 
					" 	WHERE a.pi_id = b.pi_id " + 
					" 	AND b.pi_isview = 'y' " + 
					" 	AND (b.pi_stock >= a.oc_cnt OR b.pi_stock = -1) " + 
					" 	AND a.mi_id = '"+ miid +"' " + 
					" 	GROUP BY pi_id, oc_option " + 
					" 	ORDER BY a.pi_id";
				System.out.println(sql);
				stmt = conn.createStatement();
				result = stmt.executeUpdate(sql);
					sql = 	
						" DELETE FROM t_order_cart WHERE mi_id = '"+ miid +"'";
					System.out.println(sql);
					result = stmt.executeUpdate(sql);
			} catch(Exception e) {
				System.out.println("WishCartInsert_bk() �޼ҵ� ����");
				e.printStackTrace();
			} finally {
				close(stmt); 
			}

			return result;
		}
	
	public int WishCartInsert_bk2(String miid) {
		// �򸮽�Ʈ ������̺� ������ �����͸� �򸮽�Ʈ�� �ٽ� ���
			Statement stmt = null;
			int result = 0;
			try {
				String sql = 	
					"  	INSERT INTO t_order_cart " + 
					" 	(mi_id, pi_id, oc_option, oc_cnt) " + 
					" 	SELECT mi_id, pi_id, oc_option, oc_cnt FROM t_order_cart_bk " + 
					" 	WHERE mi_id = '"+ miid +"';";
				System.out.println(sql);
				stmt = conn.createStatement();
				result = stmt.executeUpdate(sql);
					sql = 	
						" DELETE FROM t_order_cart_bk WHERE mi_id = '"+ miid +"'";
					System.out.println(sql);
					result = stmt.executeUpdate(sql);
			} catch(Exception e) {
				System.out.println("WishCartInsert_bk2() �޼ҵ� ����");
				e.printStackTrace();
			} finally {
				close(stmt); 
			}

			return result;
		}
	
	
	
	
	
	
	
	
	
	public String getOiid(String miid, String today) {
		// ���ó�¥�� �ֹ��� �ֹ���ȣ�� �ִ��� �˻�
			Statement stmt = null;
			ResultSet rs = null;
			String oiid = today + "001";
			String sql = "";
			try {
				stmt = conn.createStatement();
				sql = 	
					"	SELECT MAX(RIGHT(oi_id,3)) oi_id " + 
					" 	FROM t_order_info " + 
					" 	WHERE mi_id = '"+ miid + "' " + 
					" 	AND LEFT(oi_id,6) = '" + today.substring(0, 6) + "' "+
					" 	GROUP BY LEFT(oi_id,6)";
				
				System.out.println(sql);
				rs = stmt.executeQuery(sql);
				if (rs.next()) {	// �˻� ����� ������
					int n = Integer.parseInt(rs.getString(1)) + 1;
					if (n < 10)			oiid = today +"00" + n;
					else if (n < 100)	oiid = today +"0" + n;
					else				oiid = today + n;
				}

			} catch(Exception e) {
				System.out.println("getOiid() �޼ҵ� ����");
				e.printStackTrace();
			} finally {
				close(rs);	close(stmt);
			}

			return oiid;
		}
	
	public String getOiDate(String oiid) {
		// �ֹ���ȣ�� �ش��ϴ� �ֹ��ð��� ��ȸ
			Statement stmt = null;
			ResultSet rs = null;
			String oiDate = "";
			try {
				stmt = conn.createStatement();
				String sql = 	
					"	SELECT oi_date FROM t_order_info WHERE oi_id = '"+ oiid +"'";
				
				System.out.println(sql);
				rs = stmt.executeQuery(sql);
				
				if (rs.next()) {
					oiDate = rs.getString("oi_date");
				}
					

			} catch(Exception e) {
				System.out.println("getOiDate() �޼ҵ� ����");
				e.printStackTrace();
			} finally {
				close(rs);	close(stmt);
			}

			return oiDate;
		}
	
	
	
	public int orderInsert2(OrderInfo order, String where) {
		// ��ǰ�� �����ϴ� �޼ҵ�
			int result = 0;
			Statement stmt = null;
			
			try {
				stmt = conn.createStatement();
				String 	sql = 	// �ֹ����� ���̺� ������ �Է�
						
					"		INSERT INTO t_order_info " + 
					" (		oi_id, mi_id, oi_name, oi_phone, oi_email, oi_receiver, oi_recphone, " 					+ 
					" 		oi_zip, oi_addr1, oi_addr2, oi_payment, oi_pay, oi_usepnt, oi_delipay, oi_totalpay, oi_cmt	) " 	+ 
					"		VALUES " 																				+ 
					" ('"+ 	order.getOi_id() +"', '"+ order.getMi_id() +"', '"+ order.getOi_name() +"', '"+ 
							order.getOi_phone() +"', '"+ order.getOi_email() +"', " 					+ 
					" '"+ 	order.getOi_receiver() +"', '"+ order.getOi_recphone() +"', '"+ 
							order.getOi_zip() +"', '"+ order.getOi_addr1() +"', '"+ order.getOi_addr2() +"', " 						+ 
					" '"+ 	order.getOi_payment() +"', '"+ order.getOi_pay() +"', '"+ order.getOi_usepnt() +
					"', '"+ order.getOi_delipay() +"', '"+ order.getOi_totalpay() +"', '"+ order.getOi_cmt() +"')" ;
				
				System.out.println(sql);
				result = stmt.executeUpdate(sql);
				sql = 	// �ֹ������� ���̺� ������ �Է�
					" 		INSERT INTO t_order_detail " + 
					" 		(oi_id, pi_id, od_pdtname, od_pdtimg, od_pdtprice, od_cnt, od_option, od_savepnt) " + 
					" 		SELECT '"+ order.getOi_id() +"', a.pi_id, b.pi_name, b.pi_img1," + 
					" 		b.pi_price, a.oc_cnt, a.oc_option, TRUNCATE(b.pi_price*a.oc_cnt/20,-1) " + 
					" 		FROM t_order_cart a, t_product_info b " + 
					"		WHERE a.pi_id = b.pi_id  " + 
					"		AND b.pi_isview = 'y' " + 
					"		AND (b.pi_stock >= a.oc_cnt or b.pi_stock = -1)  " + 
					"		AND a.mi_id = '" + order.getMi_id() + "' " + where +
					"  		ORDER BY a.pi_id"; 
						
				System.out.println(sql);
				result = stmt.executeUpdate(sql);
				sql = 	// ��ǰ���ſ����� ����Ʈ ����, ���� ������Ʈ
					"		UPDATE t_member_info SET mi_point = mi_point + '"+ order.getOd_savepnt() +"' - '"+ 
							order.getOi_usepnt() +"' WHERE mi_id = '"+ order.getMi_id() +"'";
					
					result = stmt.executeUpdate(sql);
					
				sql = 	// ����Ʈ ���������� ������ �Է�
					"	INSERT INTO t_member_point " + 
					" 	(mi_id, mp_point, mp_content) " + 
					" 	VALUES " + 
					" 	( '"+ order.getMi_id() +"', '"+ order.getOd_savepnt() +"', '��ǰ���ŷ� ���� ����Ʈ ����');";	
					System.out.println(sql);
					result = stmt.executeUpdate(sql);
					
					
					if (order.getOi_usepnt() > 0) {
						sql = 	// �������� ��������� ����Ʈ ���������� ������ �Է�
								"	INSERT INTO t_member_point " + 
								" 	(mi_id, mp_kind, mp_point, mp_content) " + 
								" 	VALUES " + 
								" 	( '"+ order.getMi_id() +"', 'u', '-"+ order.getOi_usepnt() +"', '��ǰ���ŷ� ���� ����Ʈ ����');";
						System.out.println(sql);
						result = stmt.executeUpdate(sql);
					}
					sql = 	// īƮ����
							"DELETE FROM t_order_cart WHERE mi_id = '"+ order.getMi_id() +"'";	
							System.out.println(sql);
							result = stmt.executeUpdate(sql);
			} catch(Exception e) {
				System.out.println("orderInsert() �޼ҵ� ����");
				e.printStackTrace();
			} finally {	
				close(stmt);
			}
		return result;
	}
	
		public int orderInsert(OrderInfo order, String where) {
			// ��ǰ�� �����ϴ� �޼ҵ�
				int result = 0;
				Statement stmt = null;
				String sql = "";
				try {
					stmt = conn.createStatement();
					
					if ("a".equals(order.getOi_payment())) {
						sql = 	// �ֹ����� ���̺� ������ �Է�
							"		INSERT INTO t_order_info " + 
							" (		oi_id, mi_id, oi_name, oi_phone, oi_email, oi_receiver, oi_recphone, " 					+ 
							" 		oi_zip, oi_addr1, oi_addr2, oi_payment, oi_pay, oi_usepnt, oi_delipay, oi_totalpay, oi_status, oi_cmt	) " 	+ 
							"		VALUES " 																				+ 
							" ('"+ 	order.getOi_id() +"', '"+ order.getMi_id() +"', '"+ order.getOi_name() +"', '"+ 
									order.getOi_phone() +"', '"+ order.getOi_email() +"', " 					+ 
							" '"+ 	order.getOi_receiver() +"', '"+ order.getOi_recphone() +"', '"+ 
									order.getOi_zip() +"', '"+ order.getOi_addr1() +"', '"+ order.getOi_addr2() +"', " 						+ 
							" '"+ 	order.getOi_payment() +"', '"+ order.getOi_pay() +"', '"+ order.getOi_usepnt() +
							"', '"+ order.getOi_delipay() +"', '"+ order.getOi_totalpay() +"', 'a','"+ order.getOi_cmt() +"')" ;
					} else {
						sql = 	// �ֹ����� ���̺� ������ �Է�
								"		INSERT INTO t_order_info " + 
								" (		oi_id, mi_id, oi_name, oi_phone, oi_email, oi_receiver, oi_recphone, " 					+ 
								" 		oi_zip, oi_addr1, oi_addr2, oi_payment, oi_pay, oi_usepnt, oi_delipay, oi_totalpay, oi_cmt	) " 	+ 
								"		VALUES " 																				+ 
								" ('"+ 	order.getOi_id() +"', '"+ order.getMi_id() +"', '"+ order.getOi_name() +"', '"+ 
										order.getOi_phone() +"', '"+ order.getOi_email() +"', " 					+ 
								" '"+ 	order.getOi_receiver() +"', '"+ order.getOi_recphone() +"', '"+ 
										order.getOi_zip() +"', '"+ order.getOi_addr1() +"', '"+ order.getOi_addr2() +"', " 						+ 
								" '"+ 	order.getOi_payment() +"', '"+ order.getOi_pay() +"', '"+ order.getOi_usepnt() +
								"', '"+ order.getOi_delipay() +"', '"+ order.getOi_totalpay() +"', '"+ order.getOi_cmt() +"')" ;
					}
					System.out.println(sql);
					result = stmt.executeUpdate(sql);
					
				} catch(Exception e) {
					System.out.println("orderInsert() �޼ҵ� ����");
					e.printStackTrace();
				} finally {	
					close(stmt);
				}
			return result;
		}
	
		public int orderInDetailCart(OrderInfo order, String where) {
			// ��ٱ��Ϸ� �ֹ��Ѱ�� �ֹ������� ���̺� ������ �Է�	
				int result = 0;
				Statement stmt = null;
				
				try {
					stmt = conn.createStatement();
					String sql = 	// �ֹ������� ���̺� ������ �Է�
						" 		INSERT INTO t_order_detail " + 
						" 		(oi_id, pi_id, od_pdtname, od_pdtimg, od_pdtprice, od_cnt, od_option, od_savepnt) " + 
						" 		SELECT '"+ order.getOi_id() +"', a.pi_id, b.pi_name, b.pi_img1," + 
						" 		b.pi_price, a.oc_cnt, a.oc_option, TRUNCATE(b.pi_price*a.oc_cnt/20,-1) " + 
						" 		FROM t_order_cart a, t_product_info b " + 
						"		WHERE a.pi_id = b.pi_id  " + 
						"		AND b.pi_isview = 'y' " + 
						"		AND (b.pi_stock >= a.oc_cnt or b.pi_stock = -1)  " + 
						"		AND a.mi_id = '" + order.getMi_id() + "' " + where +
						"  		ORDER BY a.pi_id"; 
							
					System.out.println(sql);
					result = stmt.executeUpdate(sql);
	
				} catch(Exception e) {
					System.out.println("orderInDetail() �޼ҵ� ����");
					e.printStackTrace();
				} finally {	
					close(stmt);
				}
	
			return result;
		}
		
		public int orderInDetailPdt(OrderInfo order, String piid, String occnt, String ocoption) {
			// �ٷα��ŷ� �ֹ��Ѱ�� �ֹ������� ���̺� ������ �Է�	
				int result = 0;
				Statement stmt = null;
				
				try {
					stmt = conn.createStatement();
					String sql = 	// �ֹ������� ���̺� ������ �Է�
						" 		INSERT INTO t_order_detail " + 
						" 		(oi_id, pi_id, od_pdtname, od_pdtimg, od_pdtprice, od_cnt, od_option, od_savepnt) " + 
						" 		SELECT '"+ order.getOi_id() +"', pi_id, pi_name, pi_img1, pi_price, '"+ occnt +"', '"+ 
								ocoption +"', '"+ order.getOd_savepnt() +"' " + 
						" 		FROM t_product_info " + 
						" 		WHERE pi_id = '"+ piid +"' "; 
							
					System.out.println(sql);
					result = stmt.executeUpdate(sql);
	
				} catch(Exception e) {
					System.out.println("orderInDetailPdt() �޼ҵ� ����");
					e.printStackTrace();
				} finally {	
					close(stmt);
				}
	
			return result;
		}
		
		public int miUpPoint(OrderInfo order, String where) {
		// ��ǰ���ſ����� ����Ʈ ����, ���� ������Ʈ
				int result = 0;
				Statement stmt = null;
				
				try {
					stmt = conn.createStatement();
					String sql = 
						"		UPDATE t_member_info SET mi_point = mi_point + '"+ order.getOd_savepnt() +"' - '"+ 
								order.getOi_usepnt() +"' WHERE mi_id = '"+ order.getMi_id() +"'";
						
						result = stmt.executeUpdate(sql);
					
				} catch(Exception e) {
					System.out.println("miUpPoint() �޼ҵ� ����");
					e.printStackTrace();
				} finally {	
					close(stmt);
				}
			return result;
		}
	
		public int memAddPoint(OrderInfo order, String where) {
			// ����Ʈ ���������� ������ �Է�
			int result = 0;
			Statement stmt = null;
			
			try {
				stmt = conn.createStatement();
				String sql = 
					"	INSERT INTO t_member_point " + 
					" 	(mi_id, mp_point, mp_content) " + 
					" 	VALUES " + 
					" 	( '"+ order.getMi_id() +"', '"+ order.getOd_savepnt() +"', '��ǰ���ŷ� ���� ����Ʈ ����');";	
					System.out.println(sql);
					result = stmt.executeUpdate(sql);
				
			} catch(Exception e) {
				System.out.println("memAddPoint() �޼ҵ� ����");
				e.printStackTrace();
			} finally {	
				close(stmt);
			}
			return result;
		}
		
		public int memMinusPoint(OrderInfo order, String where) {
			// ����Ʈ ���������� ������ �Է�
			int result = 0;
			Statement stmt = null;
			String sql = "";	
			try {
				stmt = conn.createStatement();
				
				if (order.getOi_usepnt() > 0) {
					sql = 	// �������� ��������� ����Ʈ ���������� ������ �Է�
							"	INSERT INTO t_member_point " + 
							" 	(mi_id, mp_kind, mp_point, mp_content) " + 
							" 	VALUES " + 
							" 	( '"+ order.getMi_id() +"', 'u', '-"+ order.getOi_usepnt() +"', '��ǰ���ŷ� ���� ����Ʈ ����');";
					System.out.println(sql);
					result = stmt.executeUpdate(sql);
				}
			} catch(Exception e) {
				System.out.println("memMinusPoint() �޼ҵ� ����");
				e.printStackTrace();
			} finally {	
				close(stmt);
			}
			return result;
		}
		
		public int cartDelAll(OrderInfo order, String where) {
			// īƮ����
			int result = 0;
			Statement stmt = null;
			String sql = "";	
			try {
				stmt = conn.createStatement();
				sql = 
					"DELETE FROM t_order_cart WHERE mi_id = '"+ order.getMi_id() +"'";	
				
					System.out.println(sql);
					result = stmt.executeUpdate(sql);
			} catch(Exception e) {
				System.out.println("cartDelAll() �޼ҵ� ����");
				e.printStackTrace();
			} finally {	
				close(stmt);
			}
			return result;
		}
		
		
	public MemberInfo sessionUpdate(String miid) {
	// ����ó�� �Ϸ��� ���� ������Ʈ�� ����
		MemberInfo loginMember = null;	
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			String sql = 
					"	SELECT * FROM " + 
					" 	t_member_info " + 
					" 	WHERE " + 
					" 	mi_id = '"+miid+"' " + 
					" 	AND mi_isactive = 'y'";
			
			System.out.println(sql);
			rs = stmt.executeQuery(sql);

			if (rs.next()) {	
				loginMember = new MemberInfo();
				
				loginMember.setMi_id(miid);
				loginMember.setMi_pwd(rs.getString("mi_pwd"));
				loginMember.setMi_name(rs.getString("mi_name"));
				loginMember.setMi_birth(rs.getString("mi_birth"));
				loginMember.setMi_gender(rs.getString("mi_gender"));
				loginMember.setMi_phone(rs.getString("mi_phone"));
				loginMember.setMi_email(rs.getString("mi_email"));
				loginMember.setMi_issns(rs.getString("mi_issns"));
				loginMember.setMi_ismail(rs.getString("mi_ismail"));
				loginMember.setMi_rebank(rs.getString("mi_rebank"));
				loginMember.setMi_account(rs.getString("mi_account"));
				loginMember.setMi_date(rs.getString("mi_date"));
				loginMember.setMi_isactive(rs.getString("mi_isactive"));
				loginMember.setMi_lastlogin(rs.getString("mi_lastlogin"));
				loginMember.setMi_point(rs.getInt("mi_point"));
			}

		} catch(Exception e) {
			System.out.println("sessionUpdate() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}

		return loginMember;
	}
	
	public int addrInsert(OrderInfo order) {
		// ȸ�������ݿ� ����� �߰���ư�� üũ���� ���  ����� �߰��ϴ� �޼ҵ�
			int result = 0;
			Statement stmt = null;

			try {
				stmt = conn.createStatement();
				String sql = 
					"		INSERT INTO t_member_addr " + 
					" 		(mi_id, ma_name, ma_phone, ma_addrname, ma_zip, ma_addr1, ma_addr2, ma_basic) " + 
					" 		values " + 
					" ('"+ 	order.getMi_id() +			"', '"+ 
							order.getOi_receiver() +	"', '"+ 
							order.getOi_recphone() +	"',  "+
						"	'�������', '"+ 
							order.getOi_zip() +			"', '"+ 
							order.getOi_addr1() +		"', '"+ 
							order.getOi_addr2() +		"', 'n');";
				
				System.out.println(sql);
				result = stmt.executeUpdate(sql);
				
			} catch(Exception e) {
				System.out.println("addrInsert() �޼ҵ� ����");
				e.printStackTrace();
			} finally {	close(stmt);
			}

			return result;
		}
	
	public ArrayList<OrderInfo> getOdPdtName(String oiid) {
			Statement stmt = null;
			ResultSet rs = null;
			ArrayList<OrderInfo> orderDetail = new ArrayList<OrderInfo>();
			OrderInfo orderInfo = null;
			try {
				String sql = "SELECT od_pdtname, od_cnt FROM t_order_detail WHERE oi_id = '" + oiid + "' ";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
				// rs�� ������ �Խñ��� ���� ��� 
					orderInfo = new OrderInfo();
					// articleList�� ������ �� �Խñ��� ������ ��� �ν��Ͻ� ����
					
					orderInfo.setOd_pdtname(rs.getString("od_pdtname"));
					orderInfo.setOd_cnt(rs.getInt("od_cnt"));
					
					orderDetail.add(orderInfo);
					// �� �Խñ��� ������ ���� noticeInfo �ν��Ͻ��� articleList�� ����
				}
			} catch(Exception e) {
				System.out.println("getOdPdtName() �޼ҵ� ����");
				e.printStackTrace();
			} finally {
				close(rs); close(stmt);
			}
			
			return orderDetail;
		}
	
		public int addrDelete(String idx, String miid) {
		// ������ �ּҸ�  �����ϴ� �޼ҵ�
			Statement stmt = null;
			int result = 0;

				try {
					stmt = conn.createStatement();
					String sql = "  DELETE FROM t_member_addr where mi_id = '"+ miid +"' and ma_idx = '"+ idx +"'";
					
					System.out.println(sql);
					result = stmt.executeUpdate(sql);
	
				} catch(Exception e) {
					System.out.println("addrDelete() �޼ҵ� ����");
					e.printStackTrace();
				} finally {
					close(stmt);
				}

			return result;
		}
		
		public int myAddrUpdate(String miid) {
		// �ּ��� �⺻�ּҿ��θ� n���� �ٲٴ� �޼ҵ�
			Statement stmt = null;
			int result = 0;

				try {
					stmt = conn.createStatement();
					String sql = "  UPDATE t_member_addr SET ma_basic = 'n' WHERE mi_id = '"+ miid +"' ";
					
					System.out.println(sql);
					result = stmt.executeUpdate(sql);
	
				} catch(Exception e) {
					System.out.println("myAddrUpdate() �޼ҵ� ����");
					e.printStackTrace();
				} finally {
					close(stmt);
				}

			return result;
		}
		
		public int myAddrInsert(String myAddrName, String myAddrPhone, String myAddrReceiver, 
				String myAddrZip, String myAddrAddr1, String myAddrAddr2, String myAddrIsbasic, String miid) {
		// �ּ��� �⺻�ּҿ��θ� n���� �ٲٴ� �޼ҵ�
			Statement stmt = null;
			int result = 0;

				try {
					stmt = conn.createStatement();
					String sql = "  INSERT INTO t_member_addr " + 
					" 	(mi_id, ma_name, ma_phone, ma_addrname, ma_zip, ma_addr1, ma_addr2, ma_basic)  " +
					" 	values " + 
					" 	('"+ miid +"', '" + myAddrReceiver + "', '" + myAddrPhone + "', '"+ myAddrName +"', '" + 
						myAddrZip + "', '"+ myAddrAddr1 +"', '"+ myAddrAddr2 +"', '"+ myAddrIsbasic +"') ";
					
					System.out.println(sql);
					result = stmt.executeUpdate(sql);
	
				} catch(Exception e) {
					System.out.println("myAddrInsert() �޼ҵ� ����");
					e.printStackTrace();
				} finally {
					close(stmt);
				}

			return result;
		}
		
		public ArrayList<OrderInfo> getOrderList(String miid, int cpage, int psize, String sch) {
			// �������������� �ֹ������ ��ȸ�ϴ� �޼ҵ�
				ArrayList<OrderInfo> orderList = new ArrayList<OrderInfo>();
				Statement stmt = null;
				ResultSet rs = null;
				OrderInfo order = null;
				int snum = (cpage - 1) * psize;
				String sql = "";
				try {
						
					 sql = 
							
						"	SELECT a.*, " + 
						" 	b.od_idx, b.pi_id, b.od_pdtname, b.od_pdtimg, b.od_pdtprice, b.od_cnt, b.od_option, b.od_savepnt " + 
						" 	FROM t_order_info a, t_order_detail b " + 
						" 	WHERE a.oi_id = b.oi_id and mi_id = '"+ miid +"' " + sch +
						" 	ORDER BY a.oi_id DESC limit " + snum + ", " + psize;
					
					 stmt = conn.createStatement();
					System.out.println(sql);
					rs = stmt.executeQuery(sql);
					while (rs.next()) {
						if ("a".equals(rs.getString("oi_status")) || "b".equals(rs.getString("oi_status"))
								|| "c".equals(rs.getString("oi_status")) || "d".equals(rs.getString("oi_status"))
								|| "e".equals(rs.getString("oi_status"))) {
							order = new OrderInfo();
							order.setMi_id(miid);
							order.setOi_id(rs.getString("oi_id"));
							order.setOi_name(rs.getString("oi_name"));
							order.setOi_phone(rs.getString("oi_phone"));
							order.setOi_email(rs.getString("oi_email"));
							order.setOi_receiver(rs.getString("oi_receiver"));
							order.setOi_recphone(rs.getString("oi_recphone"));
							order.setOi_zip(rs.getString("oi_zip"));
							order.setOi_addr1(rs.getString("oi_addr1"));
							order.setOi_addr2(rs.getString("oi_addr2"));
							order.setOi_payment(rs.getString("oi_payment"));
							order.setOi_pay(rs.getInt("oi_pay"));
							order.setOi_status(rs.getString("oi_status"));
							order.setOi_cmt(rs.getString("oi_cmt"));
							order.setOi_invoice(rs.getString("oi_invoice"));
							order.setOi_date(rs.getString("oi_date"));
							order.setOi_modify(rs.getString("oi_modify"));
							order.setPi_id(rs.getString("pi_id"));
							
							order.setOd_pdtname(rs.getString("od_pdtname"));
							order.setOd_pdtimg(rs.getString("od_pdtimg"));
							order.setOd_option(rs.getString("od_option"));
							
							order.setOd_idx(rs.getInt("od_idx"));
							order.setOd_pdtprice(rs.getInt("od_pdtprice"));
							order.setOd_cnt(rs.getInt("od_cnt"));
							order.setOd_savepnt(rs.getInt("od_savepnt"));
							
							order.setOi_usepnt(rs.getInt("oi_usepnt"));
							order.setOi_delipay(rs.getInt("oi_delipay"));
							order.setOi_totalpay(rs.getInt("oi_totalpay"));
							orderList.add(order);
						}
					}
				} catch(Exception e) {
					System.out.println("getOrderList() �޼ҵ� ����");
					e.printStackTrace();
				} finally {
					close(rs);	close(stmt);
				}

				return orderList;
			}
		
			public int getOrderCount(String sch, String miid) {
				// �˻��� ��ǰ�� �� ������ �����ϴ� �޼ҵ�
				Statement stmt = null;	
				ResultSet rs = null;	
				int rcnt = 0;	
				
				try {
					String sql = 
							"	SELECT COUNT(*) " + 
							" 	FROM t_order_info a, t_order_detail b " + 
							" 	WHERE mi_id = '"+ miid +"' " + 
							" 	AND a.oi_id = b.oi_id " + sch; 
							
					
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					if(rs.next()) {	
						rcnt = rs.getInt(1);
					
					}
				} catch(Exception e) {
					System.out.println("getOrderCount() �޼ҵ� ����");
					e.printStackTrace();
				} finally {
					close(rs); close(stmt);
				}
				return rcnt;
			}
		
			public OrderInfo getOrderDetail(String id, String miid) {
			// ������ �ֹ���ȣ�� �ش��ϴ� �ֹ� ������ OrderInfo�� �ν��Ͻ��� �����ϴ� �޼ҵ�
				OrderInfo orderInfo = null;
				Statement stmt = null;
				ResultSet rs = null;
			
				try {
					
					String sql = 
						"	SELECT * FROM t_order_info " + 
						" 	WHERE " + 
						" 	mi_id = '"+ miid +"' " + 
						" 	AND oi_id = '"+ id +"';";
					System.out.println(sql);
					
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					if (rs.next()) {
						orderInfo = new OrderInfo();
						// pdtList�� ������ �ϳ��� ��ǰ ������ ��� �ν��Ͻ� ����
						orderInfo.setOi_id(id);
						orderInfo.setMi_id(miid);
						orderInfo.setOi_name(rs.getString("oi_name"));
						orderInfo.setOi_phone(rs.getString("oi_phone"));
						orderInfo.setOi_email(rs.getString("oi_email"));
						orderInfo.setOi_receiver(rs.getString("oi_receiver"));
						orderInfo.setOi_recphone(rs.getString("oi_recphone"));
						orderInfo.setOi_zip(rs.getString("oi_zip"));
						orderInfo.setOi_addr1(rs.getString("oi_addr1"));
						orderInfo.setOi_addr2(rs.getString("oi_addr2"));
						orderInfo.setOi_payment(rs.getString("oi_payment"));
						orderInfo.setOi_status(rs.getString("oi_status"));
						orderInfo.setOi_cmt(rs.getString("oi_cmt"));
						orderInfo.setOi_invoice(rs.getString("oi_invoice"));
						orderInfo.setOi_date(rs.getString("oi_date"));
						orderInfo.setOi_modify(rs.getString("oi_modify"));
						
						orderInfo.setOi_pay(rs.getInt("oi_pay"));
						orderInfo.setOi_usepnt(rs.getInt("oi_usepnt"));
						orderInfo.setOi_delipay(rs.getInt("oi_delipay"));
						orderInfo.setOi_totalpay(rs.getInt("oi_totalpay"));

						
					}
				} catch(Exception e) {
					System.out.println("getOrderDetail() �޼ҵ� ����");
					e.printStackTrace();
				} finally {
					close(rs); close(stmt);
				}
				
				return orderInfo;
			}
			
			public ArrayList<OrderInfo> getOrderDetailInfo(String id) {
			// ������ �ֹ���ȣ�� �ش��ϴ� �ֹ� ������ OrderInfo�� �ν��Ͻ��� �����ϴ� �޼ҵ�
				// ��ٱ��Ͽ��� ������ Ư�� ȸ���� ��ٱ��� ��� �Ǵ� ���������� ������ ������ ��ǰ ����� �����ϴ� �޼ҵ�
				ArrayList<OrderInfo> orderList = new ArrayList<OrderInfo>();
				Statement stmt = null;
				ResultSet rs = null;
				OrderInfo order = null;

				try {
					String sql = 
							"	SELECT * " + 
							" 	FROM t_order_detail " + 
							" 	WHERE oi_id = '"+ id +"'";
					
					System.out.println(sql);
					stmt = conn.createStatement();
					rs = stmt.executeQuery(sql);
					while (rs.next()) {
						order = new OrderInfo();
						order.setOd_idx(rs.getInt("od_idx"));
						order.setOi_id(id);
						order.setPi_id(rs.getString("pi_id"));
						order.setOd_pdtname(rs.getString("od_pdtname"));
						order.setOd_pdtimg(rs.getString("od_pdtimg"));
						order.setOd_option(rs.getString("od_option"));
						
						order.setOd_pdtprice(rs.getInt("od_pdtprice"));
						order.setOd_cnt(rs.getInt("od_cnt"));
						order.setOd_savepnt(rs.getInt("od_savepnt"));
						

						orderList.add(order);
					}
				} catch(Exception e) {
					System.out.println("getOrderDetailInfo() �޼ҵ� ����");
					e.printStackTrace();
				} finally {
					close(rs);	close(stmt);
				}

				return orderList;
			}
			
	public OrderInfo getOrderValue(String oiid, String miid) {
	// �����Ϸ�â���� �������� �ҷ�����
		OrderInfo order = null;	
		Statement stmt = null;
		ResultSet rs = null;
		try {
			stmt = conn.createStatement();
			String sql = 
					"	SELECT a.* " + 
					"	FROM t_order_info a " + 
					" 	WHERE a.oi_id = '"+ oiid +"' " + 
					" 	and a.mi_id = '"+ miid +"'";
			
			System.out.println(sql);
			rs = stmt.executeQuery(sql);

			if (rs.next()) {	
				order = new OrderInfo();
				
				order.setOi_name(rs.getString("oi_name"));
				order.setOi_phone(rs.getString("oi_phone"));
				order.setOi_email(rs.getString("oi_email"));
				order.setOi_receiver(rs.getString("oi_receiver"));
				order.setOi_recphone(rs.getString("oi_recphone"));
				order.setOi_zip(rs.getString("oi_zip"));
				order.setOi_addr1(rs.getString("oi_addr1"));
				order.setOi_addr2(rs.getString("oi_addr2"));
				order.setOi_payment(rs.getString("oi_payment"));
				order.setOi_status(rs.getString("oi_status"));
				order.setOi_cmt(rs.getString("oi_cmt"));
				order.setOi_invoice(rs.getString("oi_invoice"));
				order.setOi_date(rs.getString("oi_date"));
				order.setOi_modify(rs.getString("oi_modify"));
				
				order.setOi_pay(rs.getInt("oi_pay"));
				order.setOi_usepnt(rs.getInt("oi_usepnt"));
				order.setOi_delipay(rs.getInt("oi_delipay"));
				order.setOi_totalpay(rs.getInt("oi_totalpay"));
			}

		} catch(Exception e) {
			System.out.println("getOrderValue() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(rs);	close(stmt);
		}

		return order;
	}
		
}
