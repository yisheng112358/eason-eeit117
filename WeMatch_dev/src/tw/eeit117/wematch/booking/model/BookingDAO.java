package tw.eeit117.wematch.booking.model;


import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;


@Repository("BookingDAO")

public  class BookingDAO {

	
	private SessionFactory sessionFactory;
	
	@Autowired
	public BookingDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	

	public bookingBean insert(bookingBean bBean) {
		Session session = sessionFactory.getCurrentSession();	
		session.save(bBean);
		return null;
//		bookingBean bookingBean = session.get(bookingBean.class, bBean.getBookingId(),bBean.getBookingDate(),bBean.getBookingTime(),bBean.getEpt1(),bBean.getEpt2(),bBean.getEpt3(),bBean.getEpt4());
}
	
	
	public List<bookingBean> select(String date,String time) {
		Session session = sessionFactory.getCurrentSession();	
		 Query query = session.createQuery("from bookingBean where bookingDate=:date and bookingTime=:time",bookingBean.class);
		
		query.setParameter("date", date);
		query.setParameter("time", time);
		
		return (List <bookingBean>) query.list();
}
	
	
	public List<bookingBean> selectbooking(String name) {
		Session session = sessionFactory.getCurrentSession();	
		 Query query = session.createQuery("from bookingBean where bookingName=:name",bookingBean.class);
		

		query.setParameter("name", name);
		
		return (List <bookingBean>) query.list();
}
	
	public List<bookingBean> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		 Query query = session.createQuery("from bookingBean", bookingBean.class);
		 
	
		 
		return (List <bookingBean>) query.list();
}
	
	
	public void delete(Integer bookingId) {
		Session session = sessionFactory.getCurrentSession();

		String hqlstr = "From bookingBean where bookingId=:Id";
		Query<bookingBean> query = session.createQuery(hqlstr, bookingBean.class);
		
		query.setParameter("Id", bookingId);

		 bookingBean resultVideo = query.uniqueResult();
		session.delete(resultVideo);
	}
	

}
