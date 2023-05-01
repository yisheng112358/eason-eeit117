package tw.eeit117.wematch.video;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class ConnServlet {
	private Connection conn;

	public ConnServlet() throws Exception {
		createConn();
	}

	public Connection getConn() {
		return conn;
	}

	private void createConn() throws Exception {
		InitialContext context = new InitialContext();
		DataSource ds = (DataSource) context.lookup("java:comp/env/connectSQLServerJdbc/WeMatch");
		this.conn = ds.getConnection();

		boolean status2 = !conn.isClosed();
		System.out.println("Connected:" + status2);
	}

	public void closeConn() throws SQLException {
		if (conn != null) {
			conn.close();
			System.out.println("Connection Closed.");
		}
	}
}
