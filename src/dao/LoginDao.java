package dao;

import static db.JdbcUtil.*;
import java.sql.*;
import vo.*;

public class LoginDao {
// �α��� ���� ������ �����Ͽ� �����Ű�� Ŭ����
	private static LoginDao loginDao;
	// �ν��Ͻ� ����� �ƴ� Ŭ���� ����� loginDao �ν��Ͻ��� ���������ν� ���� ���� �ƴ� �ϳ��� �����ϰ� ��
	private Connection conn;
	// Ŭ���� ��ü���� Connection �ν��Ͻ� conn�� ����� �� �ְ� ��
	private LoginDao() {}
	// �ܺο��� ���������� �ν��Ͻ��� �����ϴ� ��(new Ű���� ���)�� ���� ���� private���� �⺻ �����ڸ� ����

	public static LoginDao getInstance() {
	// �ν��Ͻ��� �������ִ� �޼ҵ�� �ϳ��� �ν��Ͻ��� ������Ŵ(singleton ���)
	// DB�۾��� ���� �ϴ� Ŭ���� Ư���� ���� ���� �ν��Ͻ��� �����Ǹ� �׸�ŭ 
	// ���� ���� DB����(Connection)�� ����Ƿ� ��ü���� �ӵ� ������ ����� �־� �̱��� ����� ���
		if (loginDao == null) {
		// ����� ����� LoginDao �� �ν��Ͻ� loginDao�� null�̸�(�ν��Ͻ��� �������� �ʾ�����)
			loginDao = new LoginDao();
			// ������ loginDao �ν��Ͻ��� �����Ƿ� ���Ӱ� �ϳ� ������
		}
		return loginDao;
	}
	public void setConnection(Connection conn) {
	// LoginSvc Ŭ�������� ���� Connection��ü�� �޾� ����� conn�� ����
	// �ܺο��� Connection ��ü�� �޴� ������ DB�۾��� ���� ���� ��� 
	// Connection ��ü�� ���� �� �����ϴ� ���� ���� ���� ����� �����Ͽ� ���
		this.conn = conn;
	}
	public MemberInfo getLoginMember(String userid, String userpwd) {
	// ����ڰ� �Է��� ���̵�� ��й�ȣ�� �̿��Ͽ� �α��� �� �ʿ��� ����������� �����Ͽ� MemberInfo ������ �����ϴ� �޼ҵ�
		MemberInfo loginMember = null;	// �α��� �� ����������� ������ �ν��Ͻ�
		Statement stmt = null;
		ResultSet rs = null;
		try {
		// DB���� �۾������� ��κ��� �޼ҵ尡 'throws SQLException'�� ����Ǿ� �ֱ� ������ ����ó���� �ؾ� �� 
			stmt = conn.createStatement();
			String sql = "call sp_member_login_proc('"+userid+"', '"+userpwd+"');";
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			if (rs.next()) {	// �α��� ������
				loginMember = new MemberInfo();	// �α��� �����ÿ��� �����Ǵ� �ν��Ͻ�
				// �α��� ���нÿ��� loginMember�� ��� �ִ� ����(null)�� ���ϵǰ� ��
				loginMember.setMi_id(userid);
				loginMember.setMi_pwd(userpwd);
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
				loginMember.setMi_point(rs.getInt("mi_point"));
				loginMember.setMi_garden(rs.getString("mi_garden"));
				loginMember.setMi_lastlogin(rs.getString("mi_lastlogin"));
				// MemberInfo Ŭ������ �ν��Ͻ� loginMember�� ȸ��������� �⺻�ּҸ� ����
			}

		} catch(Exception e) {
			System.out.println("getLoginMember() �޼ҵ� ����");
			e.printStackTrace();
		} finally {
			close(rs); close(stmt);
		}

		return loginMember;
	}
}
