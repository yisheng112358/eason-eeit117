package tw.eeit117.wematch.video;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

import com.google.gson.Gson;

import tw.eeit117.wematch.product.model.ProductBeanService;
import tw.eeit117.wematch.video.model.VideoService;


@WebServlet("/RetrieveVideoServlet.do")
public class RetrieveVideoServlet extends BaseServlet {

	private static final long serialVersionUID = 1L;

	protected void RetrieveVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
//		StandardServiceRegistry serviceRegistry = new StandardServiceRegistryBuilder().configure().build();
//		SessionFactory sessionFactory = new MetadataSources(serviceRegistry).buildMetadata().buildSessionFactory();
//		Session session = sessionFactory.openSession();

//		List<Video> videoList = session.createQuery("From Video", Video.class).list();

//		session.close();
//		sessionFactory.close();

		VideoService videoService = (VideoService)getContext().getBean("videoService");
		
		Gson gson = new Gson();
//		String videoJasonString = gson.toJson(videoList);
		String videoJasonString = gson.toJson(videoService.selectAll());
		response.getWriter().write(videoJasonString);
		
		//System.out.println(videoJasonString);
	}

}
