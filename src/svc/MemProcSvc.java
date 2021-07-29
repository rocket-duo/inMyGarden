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
		if (result == 1)	commit(conn);		// 추가된 레코드(가입된 회원)가 있으면 쿼리를 적용한다.
		else				rollback(conn);		// 추가된 레코드가 없으면(회원가입이 이루어지지 않았거나 실패) 원래대로 롤백
		close(conn);
		
		return result;
	}

	public int memberUpdateProc(MemberInfo memberInfo) {
	// 회원 가입 및 수정을 위해 DB연결 및 쿼리 실행 매서드를 호출하는 매서드
		int result = 0;
		Connection conn = getConnection();
		MemberDao memberDao = MemberDao.getInstance();
		memberDao.setConnection(conn);
		result = memberDao.memberUpdate(memberInfo);
		if (result == 3)	commit(conn);		// 추가된 레코드(가입된 회원)가 있으면 쿼리를 적용한다.
		else				rollback(conn);		// 추가된 레코드가 없으면(회원가입이 이루어지지 않았거나 실패) 원래대로 롤백
		close(conn);
		
		return result;
	}
	
	public int memberDelete(String miid) {
		// 회원 탈퇴를 위해 DB연결 및 쿼리 실행 매서드를 호출하는 매서드
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
