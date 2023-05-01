package tw.eeit117.wematch.courses.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.eeit117.wematch.courses.model.Courses;

@Repository//自動處理資料庫的相關操作產生的異常
@Transactional
public class CoursesDAOImpl implements CoursesDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	public CoursesDAOImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	@Override
	@Transactional
	public void addCourses(Courses courses) {
		sessionFactory.getCurrentSession().saveOrUpdate(courses);
	}


	@Override
	@Transactional
	public Courses getCourses(int coursesId) {
		return (Courses) sessionFactory.getCurrentSession()
				.get(Courses.class, coursesId);
	}

	@Override
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Courses> getAllCourses() {
	return sessionFactory.getCurrentSession()
			.createQuery("from Courses").list();
	}

	@Override
	@Transactional
	public Courses updateCourses(Courses courses) {
		sessionFactory.getCurrentSession().update(courses);
		return courses;
	}

	@Override
	@Transactional
	public void deleteCourses(int coursesId) {
		Courses courses = (Courses) sessionFactory.getCurrentSession()
				.get(Courses.class, coursesId);
		if (courses != null  ) {
			this.sessionFactory.getCurrentSession().delete(courses);
		}
			
	}	
}
