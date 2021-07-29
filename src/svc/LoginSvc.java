package svc;

import static db.JdbcUtil.*;
// db��Ű�� ���� JdbcUtil Ŭ������ ���� ��� ������� �����Ӱ� ����ϰڴٴ� �ǹ�
import java.sql.*;
import dao.*;
import vo.*;

public class LoginSvc {
	public MemberInfo getLoginMember(String userid, String userpwd) {
	// ����ڰ� �Է��� ���̵�� ��й�ȣ�� �Ű������� �޾� �α����� ó���ϴ� �޼ҵ�� MemberInfo�� �ν��Ͻ��� ����� ����
		LoginDao loginDao = LoginDao.getInstance();
		// �α����� DB�۾��� ���� LoginDao�� �ν��Ͻ� loginDao�� ����
		Connection conn = getConnection();
		// JdbcUtil Ŭ������ getConnection()�޼ҵ�� Connection ��ü conn ����
		loginDao.setConnection(conn);
		// loginDao�ν��Ͻ����� ����� Connection ��ü ����

		MemberInfo loginMember = loginDao.getLoginMember(userid, userpwd);
		// loginDao �ν��Ͻ��� getLoginMember() �޼ҵ带 �����Ű�� 
		// �� ����� MemberInfo �� �ν��Ͻ� loginMember �� ����

		close(conn);

		return loginMember;
	}
}
