package tw.eeit117.wematch.courses.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import tw.eeit117.wematch.courses.model.Courses;
import tw.eeit117.wematch.courses.model.Curriculum;
import tw.eeit117.wematch.member.model.Member;

@Repository
@Transactional
public class CurriculumDAOImpl implements CurriculumDAO{

		@Autowired
		private SessionFactory sessionFactory;
			
		public CurriculumDAOImpl(SessionFactory sessionFactory) {
			this.sessionFactory = sessionFactory;
		}
		
		//加選
		@Override
		@Transactional
		public void addCurriculum(Curriculum curriculum) {
			sessionFactory.getCurrentSession().saveOrUpdate(curriculum);
			
		}

		//退選
		@Override
		@Transactional
		public void deleteCurriculum(int curriculumId) {
			Curriculum curriculum = (Curriculum) sessionFactory.getCurrentSession()
					.load(Curriculum.class, curriculumId);
			if (curriculum != null  ) {
				this.sessionFactory.getCurrentSession().delete(curriculum);
			}
			
		}
	
		//查詢"已選"課表
		@SuppressWarnings("unchecked")
		@Transactional
		public List<Curriculum> getAllCurriculum(int memberId) {
			return sessionFactory.getCurrentSession()
					.createQuery("from Curriculum where memberId="+memberId).list();
		}
		
		//確認有無複選
		@Override
		@Transactional
		public boolean checkCourses(int coursesId,int memberId) {
			Session session = sessionFactory.getCurrentSession();
			
			String hqlStr = "from Curriculum where coursesId=:coursesId and memberId=:memberId";
			Query<Curriculum> query = session.createQuery(hqlStr,Curriculum.class);
			

			query.setParameter("coursesId", coursesId);
			query.setParameter("memberId", memberId);
			
			Curriculum resultCurriculum = query.uniqueResult();
			//当确定返回的实例只有一个或者null时 用uniqueResult()方法
			
			if(resultCurriculum != null) {				
				return true;
			}else {
				return false;
			}
		}
		
		//確認有無複選
		@Override
		@Transactional
		public boolean checkCourses(int coursesId) {
			Session session = sessionFactory.getCurrentSession();
			
			String hqlStr = "from Curriculum where coursesId=:coursesId";
			Query<Curriculum> query = session.createQuery(hqlStr,Curriculum.class);
			
			query.setParameter("coursesId", coursesId);
			
			Curriculum resultCurriculum = query.uniqueResult();
			//当确定返回的实例只有一个或者null时 用uniqueResult()方法
			
			if(resultCurriculum != null) {				
				return true;
			}else {
				return false;
			}
		}

		//單筆查詢課表ID
		@Override
		@Transactional
		public Curriculum getCurriculum(int curriculumId) {
			return (Curriculum) sessionFactory.getCurrentSession()
					.get(Curriculum.class, curriculumId);
		}
		
		//課表退選
		@Override
		@Transactional
		public void deleteCurriculumCourses(int coursesId) {
			Session session = sessionFactory.getCurrentSession();
			
			String hqlstr = "From Curriculum where coursesId=:coursesId";
			Query<Curriculum> query = session.createQuery(hqlstr, Curriculum.class);
			query.setParameter("coursesId", coursesId);

			Curriculum resultCurr = query.uniqueResult();
			session.delete(resultCurr);
			
		}
	
}
