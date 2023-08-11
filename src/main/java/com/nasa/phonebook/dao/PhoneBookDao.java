package com.nasa.phonebook.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.nasa.phonebook.dto.PhoneBookDto;

@Repository
public class PhoneBookDao {
   final String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
   final String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";
   
   public Connection open() {
      Connection conn = null;
      try {
         Class.forName(JDBC_DRIVER);
         conn = DriverManager.getConnection(JDBC_URL,"ora_user","hong");
      } catch (Exception e) {
         e.printStackTrace();
      }
      return conn;
   }//open() end
   
//   로그인하기
   public int logIn(String loginid, String loginpw) throws Exception{
      Connection conn = open();
      int result = 1;
      
      String sql = "SELECT * FROM login WHERE loginid=? AND loginpw=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, loginid);
      pstmt.setString(2, loginpw);
     
      result = pstmt.executeUpdate();
      
      return result;
   }
   
   public String logincheck(String loginid) throws Exception{
	      Connection conn = open();
	      String idcheck= null;
	      
	      String sql = "SELECT loginid FROM login WHERE loginid=? ";
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, loginid);
	     
	      ResultSet rs = pstmt.executeQuery();
	      if(rs.next()) {
	    	  idcheck = rs.getString("loginid");
	      }
	      return idcheck;
	   }
//   회원가입하기
   public void addloginList(PhoneBookDto n) throws Exception{
      Connection conn = open();
      
      String sql = "INSERT INTO LOGIN VALUES(?, ?, ?)";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      try(conn; pstmt){
         pstmt.setString(1, n.getLoginid());
         pstmt.setString(2, n.getLoginpw());
         pstmt.setString(3, n.getLoginph());
         
         pstmt.executeUpdate();
      }

   }//signUp() end

//   list 출력하기
   public List<PhoneBookDto> getAll(String loginid) throws Exception {
      Connection conn = open();
      List<PhoneBookDto> phonebookList = new ArrayList<>();
      
      String sql = "SELECT a.USERNAME , a.USERPH , a.USERADDR ,b.GROUPNAME FROM phonebook a, phonegroup b WHERE a.GROUPID = b.GROUPID AND a.LOGINID LIKE ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, loginid);
      ResultSet rs = pstmt.executeQuery();
      
      try(conn; pstmt; rs) {
         while(rs.next()) {
            PhoneBookDto n = new PhoneBookDto();
            n.setUsername(rs.getString("username"));
            n.setUserph(rs.getString("userph"));
            n.setUseraddr(rs.getString("useraddr")); 
            n.setGroupname(rs.getString("groupname")); 
            
            phonebookList.add(n);
         }
         return phonebookList;         
      }
   }//getAll() end
   
//   전화번호 회원추가
   public void addPhonebook(PhoneBookDto n) throws Exception {
      Connection conn = open();
      String sql = "INSERT INTO phonebook VALUES (?, ?, ?, ?, ?)";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      try(conn; pstmt){
         pstmt.setString(1, n.getLoginid());
         pstmt.setString(2, n.getUsername());
         pstmt.setString(3, n.getUserph());
         pstmt.setString(4, n.getUseraddr());
         pstmt.setString(5, n.getGroupid());
         
         pstmt.executeUpdate();
         
      }
   }//addNews()end
   
//   전화번호 회원수정
   public void updatePhonebook(PhoneBookDto n) throws Exception{
      Connection conn = open();
      
      StringBuilder sql = new StringBuilder();
      sql.append("UPDATE    phonebook        ");
      sql.append("   SET    username = ?     ");
      sql.append("      ,   useraddr = ?     ");
      sql.append("      ,   groupid  = ?     ");
      sql.append(" WHERE    userph 	 = ?     ");
      PreparedStatement pstmt = conn.prepareStatement(sql.toString());
      
      try(conn; pstmt){
         pstmt.setString(1, n.getUsername());
         pstmt.setString(2, n.getUseraddr());
         pstmt.setString(3, n.getGroupid());
         pstmt.setString(4, n.getUserph());
         
         pstmt.executeUpdate();
      }
   }//updatePhonebook() end
   
//   전화번호 회원삭제
   public void deletePhonebook(PhoneBookDto n) throws SQLException {
      Connection conn = open();
      
      String sql = "DELETE FROM PHONEBOOK WHERE USERPH=? AND LOGINID=?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      
      try(conn; pstmt) {
         pstmt.setString(1, n.getUserph());
         pstmt.setString(2, n.getLoginid());
         
         int a= pstmt.executeUpdate();
         if(a==1) {
         System.out.println("삭제성공");
         }
      }
      
   }//delete() end
// 아이디 중복 확인
 public int idCheck(String loginid) throws Exception {
    ArrayList<PhoneBookDto> phonebookList = new ArrayList<>();
    Connection conn = open();
    String sql = "SELECT loginid FROM login where loginid=?";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, loginid);
    ResultSet rs = pstmt.executeQuery();
    int intrs =0;
    try(conn; pstmt; rs) {
       while(rs.next()) {
          PhoneBookDto n = new PhoneBookDto();
          n.setLoginid(rs.getString("loginid"));
          phonebookList.add(n);
       }
    }
    if(phonebookList.isEmpty()) {
       return intrs;
    }else {
       return intrs=1;
    }
 }//idCheck() end
   public int phCheck(String userph) throws Exception {
	      ArrayList<PhoneBookDto> phonebookList = new ArrayList<>();
	      Connection conn = open();
	      String sql = "SELECT userph FROM phonebook WHERE userph=?";
	      PreparedStatement pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, userph);
	      ResultSet rs = pstmt.executeQuery();
	      int intrs =0;
	      try(conn; pstmt; rs) {
	         while(rs.next()) {
	            PhoneBookDto n = new PhoneBookDto();
	            n.setLoginid(rs.getString("userph"));
	            phonebookList.add(n);
	         }
	      }
	      if(phonebookList.isEmpty()) {
	         return intrs;
	      }else {
	         return intrs=1;
	      }
	   }//idCheck() end
}