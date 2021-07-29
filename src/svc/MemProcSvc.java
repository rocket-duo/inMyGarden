package svc;

import static db.JdbcUtil.*;
import java.util.*;
import java.sql.*;
import dao.*;
import vo.*;

public class MemProcSvc {
	public int memberInsertProc(MemberInfo memberInfo) {
		int result = 0;
		Connection conn = getConnection();
		MemberDao memberDao = MemberDao.getInstance();
		memberDao.setConnection(conn);
		result = memberDao.memberJoin(memberInfo);
		if (result == 1)	commit(conn);		// �߰��� ���ڵ�(���Ե� ȸ��)�� ������ ������ �����Ѵ�.
		else				rollback(conn);		// �߰��� ���ڵ尡 ������(ȸ�������� �̷������ �ʾҰų� ����) ������� �ѹ�
		close(conn);
		
		return result;
	}

	public int memberUpdateProc(MemberInfo memberInfo) {
	// ȸ�� ���� �� ������ ���� DB���� �� ���� ���� �ż��带 ȣ���ϴ� �ż���
		int result = 0;
		Connection conn = getConnection();
		MemberDao memberDao = MemberDao.getInstance();
		memberDao.setConnection(conn);
		result = memberDao.memberUpdate(memberInfo);
		if (result == 3)	commit(conn);		// �߰��� ���ڵ�(���Ե� ȸ��)�� ������ ������ �����Ѵ�.
		else				rollback(conn);		// �߰��� ���ڵ尡 ������(ȸ�������� �̷������ �ʾҰų� ����) ������� �ѹ�
		close(conn);
		
		return result;
	}
	
	public int memberDelete(String miid) {
		// ȸ�� Ż�� ���� DB���� �� ���� ���� �ż��带 ȣ���ϴ� �ż���
		int result = 0;
		Connection conn = getConnection();
		MemberDao memberDao = MemberDao.getInstance();
		memberDao.setConnection(conn);
		result = memberDao.memberDelete(miid);
		
		if (result == 1 ) commit(conn);
		else rollback(conn);
		return result;
	}

}
