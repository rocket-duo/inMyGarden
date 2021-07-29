package dao;

import static db.JdbcUtil.*;
import java.sql.*;
import vo.*;

public class LoginDao {
// 로그인 관련 쿼리를 생성하여 실행시키는 클래스
	private static LoginDao loginDao;
	// 인스턴스 멤버가 아닌 클래스 멤버로 loginDao 인스턴스를 선언함으로써 여러 개가 아닌 하나만 존재하게 됨
	private Connection conn;
	// 클래스 전체에서 Connection 인스턴스 conn을 사용할 수 있게 됨
	private LoginDao() {}
	// 외부에서 직접적으로 인스턴스를 생성하는 것(new 키워드 사용)을 막기 위해 private으로 기본 생성자를 선언

	public static LoginDao getInstance() {
	// 인스턴스를 생성해주는 메소드로 하나의 인스턴스만 생성시킴(singleton 방식)
	// DB작업을 많이 하는 클래스 특성상 여러 개의 인스턴스가 생성되면 그만큼 
	// 많은 수의 DB연결(Connection)이 생기므로 전체적인 속도 저하의 우려가 있어 싱글톤 방식을 사용
		if (loginDao == null) {
		// 멤버로 선언된 LoginDao 형 인스턴스 loginDao가 null이면(인스턴스가 생성되지 않았으면)
			loginDao = new LoginDao();
			// 생성된 loginDao 인스턴스가 없으므로 새롭게 하나 생성함
		}
		return loginDao;
	}
	public void setConnection(Connection conn) {
	// LoginSvc 클래스에서 보낸 Connection객체를 받아 멤버인 conn에 저장
	// 외부에서 Connection 객체를 받는 이유는 DB작업이 여러 번일 경우 
	// Connection 객체를 여러 번 생성하는 것을 막기 위해 멤버로 지정하여 사용
		this.conn = conn;
	}
	public MemberInfo getLoginMember(String userid, String userpwd) {
	// 사용자가 입력한 아이디와 비밀번호를 이용하여 로그인 후 필요한 사용자정보를 추출하여 MemberInfo 형으로 리턴하는 메소드
		MemberInfo loginMember = null;	// 로그인 후 사용자정보를 저장할 인스턴스
		Statement stmt = null;
		ResultSet rs = null;
		try {
		// DB관련 작업에서는 대부분의 메소드가 'throws SQLException'로 선언되어 있기 때문에 예외처리를 해야 함 
			stmt = conn.createStatement();
			String sql = "call sp_member_login_proc('"+userid+"', '"+userpwd+"');";
			System.out.println(sql);
			rs = stmt.executeQuery(sql);
			if (rs.next()) {	// 로그인 성공시
				loginMember = new MemberInfo();	// 로그인 성공시에만 생성되는 인스턴스
				// 로그인 실패시에는 loginMember가 비어 있는 상태(null)로 리턴되게 함
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
				// MemberInfo 클래스의 인스턴스 loginMember에 회원정보들과 기본주소를 저장
			}

		} catch(Exception e) {
			System.out.println("getLoginMember() 메소드 오류");
			e.printStackTrace();
		} finally {
			close(rs); close(stmt);
		}

		return loginMember;
	}
}
