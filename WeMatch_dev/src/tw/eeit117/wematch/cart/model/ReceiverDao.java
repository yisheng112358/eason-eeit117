package tw.eeit117.wematch.cart.model;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ReceiverDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void insert(Receiver receiver) {
		Session session = sessionFactory.getCurrentSession();
		session.save(receiver);
	}

}
