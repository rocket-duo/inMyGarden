package db;

import java.sql.*;
import javax.sql.*;
import javax.naming.*;

public class JdbcUtil {
// DB ���� ���� �� ���� �޼ҵ���� ������ Ŭ����
	public static Connection getConnection() {
	// DB�� �����Ͽ� ���ؼ� ��ü�� �����ϴ� �޼ҵ�
		Connection conn = null;
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context)initCtx.lookup("java:comp/env");
			DataSource ds = (DataSource)envCtx.lookup("jdbc/MySQLDB");
			conn = ds.getConnection();
			conn.setAutoCommit(false);
			// ������ �ڵ����� commit �Ǵ� ���� ���� Ʈ������� ���۽�Ŵ
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static void close(Connection conn) {	// DB���� ������ �����ִ� �޼ҵ�
		try { conn.close();	} 
		catch(Exception e) { 
			e.printStackTrace(); 
		}
	}
	public static void close(Statement stmt) {	// Statement�� �ݴ� �޼ҵ�
	// PreparedStatement�� CallabledStatement�� Statement�� ��ӹ����Ƿ� ���� close() �޼ҵ带 �ȸ��� ��
		try { stmt.close();	} 
		catch(Exception e) { 
			e.printStackTrace(); 
		}
	}
	public static void close(ResultSet rs) {	// ResultSet�� �ݴ� �޼ҵ�
		try { rs.close();	} 
		catch(Exception e) { 
			e.printStackTrace(); 
		}
	}
	public static void commit(Connection conn) {	// transaction�� commit��Ű�� �޼ҵ�
		try {
			conn.commit();
			System.out.println("���� ���� ����");
		} catch(Exception e) { 
			e.printStackTrace(); 
		}
	}
	public static void rollback(Connection conn) {	// transaction�� rollback��Ű�� �޼ҵ�
		try {
			conn.rollback();
			System.out.println("���� ���� ����");
		} catch(Exception e) { 
			e.printStackTrace(); 
		}
	}
}
