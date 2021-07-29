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
		// 찜리스트에서 보여줄 특정 회원의 찜리스트 목록 또는 결제폼에서 보여줄 결제할 상품 목록을 리턴하는 메소드
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
					if (rs.getInt("pi_discount") > 0) {	// 할인율이 있으면
						float rate = (float)rs.getInt("pi_discount") / 100;	// 할인율
						price = Math.round(price - (price * rate));
						// 할인율이 있는 상품일 경우 할인율을 적용한 가격을 저장함
					}
					wish.setPi_price(price);

					wishList.add(wish);
				}
			} catch(Exception e) {
				System.out.println("getWishList() 메소드 오류");
				e.printStackTrace();
			} finally {
				close(rs);	close(stmt);
			}

			return wishList;
		}
	
	public int wishInsert(WishInfo wish) {
		// 찜리스트에 특정 상품을 등록하는 메소드
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
				// 현재 추가하려는 상품과 동일한 상품이 이미 찜리스트에 있을 경우
					sql = "update t_order_wishlist set ow_cnt = ow_cnt + " + wish.getOw_cnt() + 
					" where ow_idx = " + rs.getInt("ow_idx");
					if (rs.getInt("pi_stock") > 0)	// 재고가 무제한(-1)이 아니면
						sql += " and (ow_cnt + " + wish.getOw_cnt() + ") <= " + rs.getInt("pi_stock");
				} else {
					sql = "insert into t_order_wishlist (mi_id, pi_id, ow_option, ow_cnt) " + 
					"values ('" + wish.getMi_id() + "', '" + wish.getPi_id() + 
					"', '" + wish.getOw_option() + "', " + wish.getOw_cnt() + ")";
				}
				result = stmt.executeUpdate(sql);

			} catch(Exception e) {
				System.out.println("wishInsert() 메소드 오류");
				e.printStackTrace();
			} finally {
				close(rs);	close(stmt);
			}

			return result;
		}

		public int wishUpdate(int idx, String piid, String opt, String cnt , String miid) {
		// 찜리스트내 수량 및 옵션 변경 메소드
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
				
				// 현재 회원의 찜리스트 속에 동일한 상품의 동일한 옵션이 있는지 검사할 쿼리
				System.out.println(sql);
				rs = stmt.executeQuery(sql);
				if (rs.next()) {	// 동일한 상품의 동일한 옵션이 있으면
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
					// 기존에 있던 동일상품 동일옵션의 찜리스트 레코드를 삭제
					}
				} else {	// 처음 선택되는 옵션이면
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
				System.out.println("wishUpdate() 메소드 오류");
				e.printStackTrace();
			} finally {
				close(rs);	
				close(stmt);
			}

			return result;
		}

		public int wishDelete(String where) {
		// 찜리스트내 상품(들)을 삭제하는 메소드
			Statement stmt = null;
			int result = 0;

			try {
				stmt = conn.createStatement();
				String sql = "delete from t_order_wishlist " + where;
				result = stmt.executeUpdate(sql);

			} catch(Exception e) {
				System.out.println("wishDelete() 메소드 오류");
				e.printStackTrace();
			} finally {
				close(stmt);
			}

			return result;
		}
		
		
		public int getCartWishInsert(String miid, String where) {
			// 장바구니에서 찜리스트로 상품을 등록할때
				Statement stmt = null;
				ResultSet rs = null;
				int result = 0;
				try {
					String sql = 		// 장바구니에서 체크한 상품 조회
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
					if (rs.next()) {	// 체크한 상품이 있으면
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
					System.out.println("getCartWishInsert() 메소드 오류");
					e.printStackTrace();
				} finally {
					close(rs);	close(stmt); 
				}

				return result;
			}
		
		public int CartWishInsert_bk(String miid) {
			// 찜리스트에 있는 상품들을 그룹화시켜서 찜리스트 백업테이블에 저장
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
					System.out.println("CartWishInsert_bk() 메소드 오류");
					e.printStackTrace();
				} finally {
					close(stmt); 
				}

				return result;
			}
		
		public int CartWishInsert_bk2(String miid) {
			// 찜리스트 백업테이블에 저장한 데이터를 찜리스트에 다시 담기
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
					System.out.println("CartWishInsert_bk2() 메소드 오류");
					e.printStackTrace();
				} finally {
					close(stmt); 
				}

				return result;
			}
		
}
