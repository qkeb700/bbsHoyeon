package bbs;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBClass {

	
	public static Connection getMYSQLConnection() throws Exception{
		
		Context context = new InitialContext();
		DataSource source = (DataSource)context.lookup("java:comp/env/jdbc/mycon");
		return source.getConnection();
	}
	
	// insert 실행
	public static void insert(Connection conn, String query) throws SQLException{
		PreparedStatement stmt = conn.prepareStatement(query);
		stmt.executeUpdate();
		stmt.close();
		//conn.close();
	}
	
	public static void setInsert(String table, String[] column, String[] value, Connection conn) throws SQLException {
		String colKey = null;
		String colVal = null;
		
		colKey = String.join(", ", column);
		for(int i = 0; i < value.length; i++) { 
			value[i] = "'" + value[i] + "'";
		}
		colVal = String.join(", ", value);
		
		String query = "insert into " + table + "(" + colKey + ") value (" + colVal + ");";
		insert(conn, query);
	}
	
	public static void setUpdate(String table, String cv, String where, Connection conn) throws SQLException {
		String query = "update " + table + " set " + cv + " where 1" + where;
		insert(conn, query);
	}
	public static void setUpdate2(String table, String cv, String where, Connection conn) throws SQLException {
		String query = "update " + table + " set " + cv + " where " + where;
		insert(conn, query);
	}
}
