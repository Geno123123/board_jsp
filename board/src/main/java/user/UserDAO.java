package user;

import java.awt.image.MultiPixelPackedSampleModel;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt; //sql 실행 관련 객체
	private ResultSet rs; //sql 조회 결과 객체
	
	public UserDAO() {
		try { //db 연결 설정
			String dbURL="jdbc:mysql://localhost:3306/Board"; 
			String dbID="root";
			String dbPassword="1234";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL,dbID,dbPassword);
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL="SELECT userPassword FROM USER WHERE userID=?";
		try {
			pstmt=conn.prepareStatement(SQL); //조회
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();	//database 데이터
			
			if(rs.next()) { 
				if(rs.getString(1).equals(userPassword))
					return 1;
				else {
					return 0;
				}
				
			}
			return -1; //아이디없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //db오류
	}
	
	public int join(User user) {
		String SQL="INSERT INTO USER VALUES(?,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(SQL); //조회
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; //회원가입 x
	}

}
