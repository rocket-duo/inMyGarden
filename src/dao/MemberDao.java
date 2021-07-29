package dao;

import static db.JdbcUtil.*;
import javax.sql.*;
import java.sql.*;
import java.util.*;
import vo.*;

public class MemberDao {
	// ȸ�� ���� DB�۾��� ������ ó���ϴ� �޼ҵ���� ���� Ŭ����
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
						"values ('"+memberInfo.getMi_id()+"',1000,'�������ϱ�')";
					System.out.println(sql);
					stmt = conn.createStatement();
					result = stmt.executeUpdate(sql);
				}
			} catch(Exception e) {
				System.out.println("memberJoin() �޼ҵ� ����");
				e.printStackTrace();
			} finally {
				close(stmt);
			}
			return result;
		}
		
		public int memberUpdate(MemberInfo memberInfo) {
		// ȸ�� ������ �����ϴ� �޼ҵ�
			int result = 0;
			Statement stmt = null;

			try {
				String sql = "update t_member_info set ";
				if (!memberInfo.getMi_pwd().equals("")) {	// ��й�ȣ�� �����
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
				System.out.println("memberUpdate() �޼ҵ� ����");
				e.printStackTrace();
			} finally {
				close(stmt);
			}

			return result + 2;
		}

		public int memberDelete(String miid) {
		// ȸ���� Ż���Ű�� �޼ҵ�
			int result = 0;
			Statement stmt = null;

			try {
				String sql = "update t_member_info set mi_isactive = 'n' " + 
					" where mi_id = '" + miid + "' ";
				stmt = conn.createStatement();
				result = stmt.executeUpdate(sql);

			} catch(Exception e) {
				System.out.println("memberDelete() �޼ҵ� ����");
				e.printStackTrace();
			} finally {
				close(stmt);
			}

			return result;
		}
	}
