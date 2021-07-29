package dao;

import static db.JdbcUtil.*;
import javax.sql.*;
import java.sql.*;
import java.util.*;
import vo.*;

public class MemberDao {
	// 회원 관련 DB작업을 실제로 처리하는 메소드들을 담은 클래스
		private static MemberDao memberDao;
		private Connection conn;
		private MemberDao() {}

		public static MemberDao getInstance() {
			if (memberDao == null)	memberDao = new MemberDao();
			return memberDao;
		}
		public void setConnection(Connection conn) {
			this.conn = conn;
		}
		
		public int memberJoin(MemberInfo memberInfo) {
			int result = 0;
			Statement stmt = null;
			
			try {
				String sql = "insert into t_member_info (mi_id, mi_pwd, mi_name, mi_birth, mi_gender, mi_phone"
						+ ", mi_email, mi_issns, mi_ismail, mi_point, mi_rebank, mi_account) values"
						+ " ('"+memberInfo.getMi_id()+"','"+memberInfo.getMi_pwd()+"' ,'"+memberInfo.getMi_name()+"' "
						+ ",'"+memberInfo.getMi_birth()+"' ,'"+memberInfo.getMi_gender()+"' ,'"+memberInfo.getMi_phone()+"' "
						+ ",'"+memberInfo.getMi_email()+"' ,'"+memberInfo.getMi_issns()+"' ,'"+memberInfo.getMi_ismail()+"' "
						+ ",1000, '"+memberInfo.getMi_rebank()+"', '"+memberInfo.getMi_account()+"')";
				System.out.println(sql);
				stmt = conn.createStatement();
				result = stmt.executeUpdate(sql);
				if (result > 0) {					
					sql = "insert into t_member_point (mi_id, mp_point, mp_content) " + 
						"values ('"+memberInfo.getMi_id()+"',1000,'가입축하금')";
					System.out.println(sql);
					stmt = conn.createStatement();
					result = stmt.executeUpdate(sql);
				}
			} catch(Exception e) {
				System.out.println("memberJoin() 메소드 오류");
				e.printStackTrace();
			} finally {
				close(stmt);
			}
			return result;
		}
		
		public int memberUpdate(MemberInfo memberInfo) {
		// 회원 정보를 수정하는 메소드
			int result = 0;
			Statement stmt = null;

			try {
				String sql = "update t_member_info set ";
				if (!memberInfo.getMi_pwd().equals("")) {	// 비밀번호도 변경시
					sql += "mi_pwd = '" + memberInfo.getMi_pwd() + "', ";
				}
				sql += "mi_phone = '"	+ memberInfo.getMi_phone()	+ "', ";
				sql += "mi_email = '"	+ memberInfo.getMi_email()	+ "', ";
				sql += "mi_issns = '"	+ memberInfo.getMi_issns()	+ "', ";
				sql += "mi_ismail = '"	+ memberInfo.getMi_ismail()	+ "' ";
				sql += "where mi_id = '"+ memberInfo.getMi_id() 	+ "' ";
				stmt = conn.createStatement();
				result = stmt.executeUpdate(sql);

			} catch(Exception e) {
				System.out.println("memberUpdate() 메소드 오류");
				e.printStackTrace();
			} finally {
				close(stmt);
			}

			return result + 2;
		}

		public int memberDelete(String miid) {
		// 회원을 탈퇴시키는 메소드
			int result = 0;
			Statement stmt = null;

			try {
				String sql = "update t_member_info set mi_isactive = 'n' " + 
					" where mi_id = '" + miid + "' ";
				stmt = conn.createStatement();
				result = stmt.executeUpdate(sql);

			} catch(Exception e) {
				System.out.println("memberDelete() 메소드 오류");
				e.printStackTrace();
			} finally {
				close(stmt);
			}

			return result;
		}
	}
