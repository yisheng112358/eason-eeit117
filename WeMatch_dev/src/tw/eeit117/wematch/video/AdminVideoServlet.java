package tw.eeit117.wematch.video;

import java.io.PrintWriter;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AdminVideoServlet.do")
public class AdminVideoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		processAction(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException {
		processAction(request, response);
	}

	private void processAction(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
			response.setContentType("text/html;charset=UTF-8");
			out = response.getWriter();
			
			String videoName = request.getParameter("videoName");
			String videoCategory = request.getParameter("videoCategory");
			String videoLink = request.getParameter("videoLink");
			String videoDesc = request.getParameter("videoDesc");
			
			processInsert(videoName, videoCategory, videoLink, videoDesc);
			
			response.sendRedirect("video");
			
			out.close();
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}

	private void processInsert(String videoName, String videoCategory, String videoLink, String videoDesc) throws Exception {
		
		ConnServlet connServlet = new ConnServlet();
		String sqlstr = "INSERT INTO Video(videoName, videoCategory, videoLink, videoDesc) Values(?, ?, ?, ?);";
		PreparedStatement preState = connServlet.getConn().prepareStatement(sqlstr);
		preState.setString(1, videoName);
		preState.setString(2, videoCategory);
		preState.setString(3, videoLink);
		preState.setString(4, videoDesc);
		preState.execute();
		System.out.println( videoName + " 影片已新增完成");
		preState.close();

		connServlet.closeConn();
		
	}

	
	
//	protected void RetrieveVideo(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure().build();
//		SessionFactory sessionFactory = new MetadataSources(serviceRegistry).buildMetadata().buildSessionFactory();
//		Session session = sessionFactory.openSession();
//
//		
//		List<Video> videoList = session.createQuery("From Video", Video.class).list();
//
//		session.close();
//		sessionFactory.close();
//
//		Gson gson = new Gson();
//		String videoJasonString = gson.toJson(videoList);
//		response.getWriter().write(videoJasonString);
//		
//		//System.out.println(videoJasonString);
//	}

}
