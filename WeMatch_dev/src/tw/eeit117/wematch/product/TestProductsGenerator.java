package tw.eeit117.wematch.product;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import tw.eeit117.wematch.config.SpringJavaConfig;
import tw.eeit117.wematch.product.model.ProductBean;

public class TestProductsGenerator {

	public static void main(String[] args) throws IOException {
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfig.class);
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactoryForLocal");
		Session session = sessionFactory.getCurrentSession();
		session.beginTransaction();

		ProductBean product0 = new ProductBean(null, "Massager", "Reak Hot Mask Treatment", 999999., 0,
				"5 Modes amp New Year Gift Equipped with vibration air pressure warming and music functions you can select combination modes as .",
				imageToByteArray("resource\\massager\\massager0_t.jpg"),
				imageToByteArray("resource\\massager\\massager0_d.jpg"));
		session.save(product0);

		ProductBean product1 = new ProductBean(null, "Massager", "3D massager 鑽石按摩儀", 299., 2, "微雕按摩儀/體雕棒(按摩儀)",
				imageToByteArray("resource\\massager\\massager1_t.jpg"),
				imageToByteArray("resource\\massager\\massager1_d.jpg"));
		session.save(product1);

		ProductBean product2 = new ProductBean(null, "Massager", "Thera-Band Roller Massager", 1000., 8,
				"標準版 滾筒按摩器(免運費)", imageToByteArray("resource\\massager\\massager2_t.jpg"),
				imageToByteArray("resource\\massager\\massager2_d.jpg"));
		session.save(product2);

		ProductBean product3 = new ProductBean(null, "Massager", "Fascia Gun Storage Massage", 584., 2,
				"Gun Base Massage Gun Stand Fasc", imageToByteArray("resource\\massager\\massager3_t.jpg"),
				imageToByteArray("resource\\massager\\massager3_d.jpg"));
		session.save(product3);

		ProductBean product4 = new ProductBean(null, "Massager", " Melon low-frequency electric therapy", 2489., 1,
				"Massage machine white HV-F022-W F/S", imageToByteArray("resource\\massager\\massager4_t.jpg"),
				imageToByteArray("resource\\massager\\massager4_d.jpg"));
		session.save(product4);

		ProductBean product5 = new ProductBean(null, "Massager", "HOT Electric Pulse Neck Massager", 770., 10,
				"Pain Relief Magnetic Therapy Vertebra Treatment",
				imageToByteArray("resource\\massager\\massager5_t.jpg"),
				imageToByteArray("resource\\massager\\massager5_d.jpg"));
		session.save(product5);

		ProductBean product6 = new ProductBean(null, "Yoga", "高密度瑜珈墊", 179., 99, "10mm NBR環保瑜珈墊",
				imageToByteArray("resource\\yoga\\yoga1_t.jpg"), imageToByteArray("resource\\yoga\\yoga1_d.jpg"));
		session.save(product6);

		ProductBean product7 = new ProductBean(null, "Yoga", "瑜珈球", 299., 99, "加厚防爆  高承重力 環保PVC",
				imageToByteArray("resource\\yoga\\yoga2_t.jpg"), imageToByteArray("resource\\yoga\\yoga2_d.jpg"));
		session.save(product7);

		ProductBean product8 = new ProductBean(null, "Yoga", "瑜伽柱", 299., 99, "月牙型/按摩輔助/滾輪泡沫軸",
				imageToByteArray("resource\\yoga\\yoga3_t.jpg"), imageToByteArray("resource\\yoga\\yoga3_d.jpg"));
		session.save(product8);

		ProductBean product9 = new ProductBean(null, "Yoga", "空中瑜伽吊床瑜珈秋千", 1487., 59, "健身吊床戶外降落傘布YOGA HAMMOCKYXS",
				imageToByteArray("resource\\yoga\\yoga4_t.jpg"), imageToByteArray("resource\\yoga\\yoga4_d.jpg"));
		session.save(product9);

		ProductBean product10 = new ProductBean(null, "Yoga", "Yoga Block", 483., 99, "LIVEUPEVA 瑜伽輔助用品家用瑜伽館工具裝備",
				imageToByteArray("resource\\yoga\\yoga5_t.jpg"), imageToByteArray("resource\\yoga\\yoga5_d.jpg"));
		session.save(product10);

		ProductBean product11 = new ProductBean(null, "Supplement", "Rule One R1", 1495., 14,
				"水解乳清蛋白 天然無調味ON,BSN,MP,Myprotein", imageToByteArray("resource\\supplement\\protein1_t.jpeg"),
				imageToByteArray("resource\\supplement\\protein1_d.jpeg"));
		session.save(product11);

		ProductBean product12 = new ProductBean(null, "Supplement", "MusclePharm MP Combat", 1345., 30, "乳清蛋白 4磅 高蛋白乳清",
				imageToByteArray("resource\\supplement\\protein2_t.jpeg"),
				imageToByteArray("resource\\supplement\\protein2_d.jpeg"));
		session.save(product12);

		ProductBean product13 = new ProductBean(null, "Supplement", "Rule One R1 Whey Blend", 3645., 24, "10磅 高蛋白乳清",
				imageToByteArray("resource\\supplement\\protein3_t.jpeg"),
				imageToByteArray("resource\\supplement\\protein3_d.jpeg"));
		session.save(product13);

		ProductBean product14 = new ProductBean(null, "Supplement", "Optimum Nutrition ON", 1945., 99,
				"金牌乳清蛋白五磅 高蛋白 附防偽標籤", imageToByteArray("resource\\supplement\\protein4_t.jpeg"),
				imageToByteArray("resource\\supplement\\protein4_d.jpeg"));
		session.save(product14);

		ProductBean product15 = new ProductBean(null, "Supplement", "MYPROTEIN", 2599., 99,
				"正品 附發票（現貨）5公斤 2.5公斤 1公斤 原廠 高蛋白 乳清蛋白 蛋白粉", imageToByteArray("resource\\supplement\\protein4_t.jpeg"),
				imageToByteArray("resource\\supplement\\protein4_d.jpeg"));
		session.save(product15);

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