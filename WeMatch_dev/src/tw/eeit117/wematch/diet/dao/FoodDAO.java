package tw.eeit117.wematch.diet.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import tw.eeit117.wematch.booking.model.bookingBean;
import tw.eeit117.wematch.diet.bean.Food;

@Repository
public class FoodDAO implements IFoodDAO {

	@Autowired
	private SessionFactory sessionFactory;

	public FoodDAO(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	public void addFood(Food food) {
		sessionFactory.getCurrentSession().saveOrUpdate(food);
	}

	@Override
	public List<Food> selectSome(String oneday) {
		Session session = sessionFactory.openSession();
		session.beginTransaction();

		Query query = session.createQuery("from Food where addDate = :oneday", Food.class);
		query.setParameter("oneday", oneday);
		List<Food> result = (List<Food>) query.list(); // 取資料

		session.getTransaction().commit();
		session.close();
		return result;
	}

}
