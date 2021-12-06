package bbs;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
   
   public static int selectAll(String col, String val) throws Exception {
      int count = 0;
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      Connection conn = getMYSQLConnection();
      String sql;
      try {
         switch(col) {
         case "username":
            sql = "select count(*) from bbs01 where username like ?";
         break;
         case "subject":
            sql = "select count(*) from bbs01 where subject like ?";
         break;
         case "content":
            sql = "select count(*) from bbs01 where content like ?";
         break;
         case "all":
            sql = "select count(*) from bbs01 where subject like ? or content like ?";
         break;
         default:
            sql = "select count(*) from bbs01";
         }
         pstmt = conn.prepareStatement(sql);
         if(val != "") {
            pstmt.setString(1, "%" + val + "%");
            if(col.equals("all")) {
               pstmt.setString(2, "%" + val + "%");
            }
         }
         rs = pstmt.executeQuery();
         while(rs.next()) {
            count = rs.getInt("count(*)");
         }
      }catch(SQLException e) {
         e.printStackTrace();
      }finally {
         if(pstmt != null) {
            try {
               pstmt.close();
            }catch(Exception e) {
               e.printStackTrace();
            }
         }
      }
      return count;
   }
   
   public List<BbsDTO> selectPaging(int st, int ed, String col, String val) throws Exception {
      Connection conn = getMYSQLConnection();
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      String sql = null;
      List<BbsDTO> list = new ArrayList<BbsDTO>();
      try {
         switch(col) {
         case "username":
            sql = "";
         break;
         case "subject":
            
         break;
         case "content":
            
         break;
         case "all":
            
         break;
         }
      }finally {
         if(pstmt != null) {
            try {
               pstmt.close();
            }catch(Exception e) {
               e.printStackTrace();
            }
         }
      }
      return list;
   }
}


