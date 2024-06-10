import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JDBC {
    public static void main(String[] args) {
        Connection conn = null;
        try {
            // JDBC 드라이버 로드
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(
            		"jdbc:mysql://localhost:3306/db", "user", "password");

            // 데이터베이스 연결 설정
            String url = "jdbc:mysql://localhost:3306/mydatabase";
            String user = "username";
            String password = "password";
            conn = DriverManager.getConnection(url, user, password);

            // 여기서부터는 Connection 객체를 사용하여 SQL 쿼리를 실행하거나 다른 작업을 수행할 수 있습니다.

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // 연결 닫기
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
