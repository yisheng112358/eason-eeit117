package tw.eeit117.wematch.coach.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import tw.eeit117.wematch.coach.model.Coach;

@Repository
public class CoachDAOImpl implements CoachDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public CoachDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}
	
	@Override
	public void insert(Coach coach) {
		sessionFactory.getCurrentSession().saveOrUpdate(coach);
	}

	@Override
	public Coach select(Integer coachId) {
		return (Coach) sessionFactory.getCurrentSession()
				.get(Coach.class, coachId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Coach> selectAll() {
		return sessionFactory.getCurrentSession()
				.createQuery("from Coach").list();
	}

	@Override
	public Coach update(Coach coach) {
		sessionFactory.getCurrentSession().update(coach);
		return coach;

	}

	@Override
	public void delete(Integer coachId) {
		Coach coach = (Coach) sessionFactory.getCurrentSession()
				.load(Coach.class, coachId);
		if (coach != null ) {
			this.sessionFactory.getCurrentSession().delete(coach);
		}

	}
	
	@SuppressWarnings("unchecked")
	public List<Coach> findByKeyword(String keyword) {
		String hql = "From Coach where coachName like '%" + keyword + "%' or coachNickname like '%"
				+ keyword + "%' or courseName like '%" + keyword + "%'";
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery(hql).list();
	}
	

}
