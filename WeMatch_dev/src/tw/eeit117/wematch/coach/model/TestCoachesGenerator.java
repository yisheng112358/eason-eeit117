package tw.eeit117.wematch.coach.model;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.boot.MetadataSources;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import tw.eeit117.wematch.config.SpringJavaConfig;

public class TestCoachesGenerator {
	public static void main(String[] args) throws IOException {
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfig.class);
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactoryForLocal");
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();
		
		Coach coach1 = new Coach(imageToByteArray("resource\\coaches\\01.jpg"),
				"歐陽修","Jack",25,"初階自由搏擊","格鬥競技類","A級教練證照");
		session.save(coach1);
		
		Coach coach2 = new Coach(imageToByteArray("resource\\coaches\\02.jpg"),
				"蘇軾","Ben",30,"有氧體操","有氧健身類","S級教練證照");
		session.save(coach2);
		
		Coach coach3 = new Coach(imageToByteArray("resource\\coaches\\03.jpg"),
				"白居易","Peter",27,"進階自由搏擊","格鬥競技類","S級教練證照");
		session.save(coach3);
		
		Coach coach4 = new Coach(imageToByteArray("resource\\coaches\\04.jpg"),
				"韓愈","Leo",21,"流行街舞","有氧舞蹈類","S級教練證照");
		session.save(coach4);
		
		Coach coach5 = new Coach(imageToByteArray("resource\\coaches\\05.jpg"),
				"秦史皇","Jason",35,"皮拉提斯","瑜珈類","S級教練證照");
		session.save(coach5);
		
		Coach coach6 = new Coach(imageToByteArray("resource\\coaches\\06.jpg"),
				"蘇轍","Steve",26,"瑜珈伸展","瑜珈類","A級教練證照");
		session.save(coach6);
		
		Coach coach7 = new Coach(imageToByteArray("resource\\coaches\\07.jpg"),
				"曾鞏","David",24,"爵士舞","有氧舞蹈類","S級教練證照");
		session.save(coach7);
		
		Coach coach8 = new Coach(imageToByteArray("resource\\coaches\\08.jpg"),
				"武則天","Dora",28,"瑜珈基礎","瑜珈類","A級教練證照");
		session.save(coach8);
		
		Coach coach9 = new Coach(imageToByteArray("resource\\coaches\\09.jpg"),
				"李清照","Rice",25,"階梯有氧","有氧健身類","S級教練證照");
		session.save(coach9);
		
		Coach coach10 = new Coach(imageToByteArray("resource\\coaches\\10.jpg"),
				"楊玉環","Rebecca",29,"瑜珈基礎","瑜珈類","S級教練證照");
		session.save(coach10);
		
		Coach coach11 = new Coach(imageToByteArray("resource\\coaches\\11.jpg"),
				"龍應台","Sana",25,"流行街舞","有氧舞蹈類","S級教練證照");
		session.save(coach11);
		
		Coach coach12 = new Coach(imageToByteArray("resource\\coaches\\12.jpg"),
				"官沛臻","Sandy",24,"瑜珈伸展","瑜珈類","S級教練證照");
		session.save(coach12);
		
		Coach coach13 = new Coach(imageToByteArray("resource\\coaches\\13.jpg"),
				"周紫瑜","Melody",23,"MV舞蹈","有氧舞蹈類","A級教練證照");
		session.save(coach13);
		
		Coach coach14 = new Coach(imageToByteArray("resource\\coaches\\14.jpg"),
				"陳宣","Vicky",28,"完美體態","體塑類","S級教練證照");
		session.save(coach14);
		
		Coach coach15 = new Coach(imageToByteArray("resource\\coaches\\15.jpg"),
				"柳宗元","Hanter",20,"初階自由搏擊","格鬥競技類","S級教練證照");
		session.save(coach15);
		
		
		sessionFactory.getCurrentSession().getTransaction().commit();
		session.close();
		sessionFactory.close();
		((ConfigurableApplicationContext) context).close();
	}
	
	private static byte[] imageToByteArray(String imagePath) throws IOException {
		BufferedImage bufferedImage = ImageIO.read(new File(imagePath));
		ByteArrayOutputStream byteArrayOutputStream = new ByteArrayOutputStream();
		ImageIO.write(bufferedImage, "jpg", byteArrayOutputStream);
		byteArrayOutputStream.flush();
		byte[] byteArray = byteArrayOutputStream.toByteArray();
		byteArrayOutputStream.close();
		return byteArray;
	}
	

}
