package tw.eeit117.wematch.video.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("videoDAO")
public class VideoDAO implements IVideoDAO {
	private SessionFactory sessionFactory;

	public VideoDAO() {
	}

	@Autowired
	public VideoDAO(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public List<Video> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery("FROM Video", Video.class).list();
	}

	@Override
	public Video insertVideo(Video vBean) {
		Session session = sessionFactory.getCurrentSession();
		if (vBean != null) {
			session.save(vBean);
		}

		return vBean;

	}

	@Override
	public List<Video> selectAllVideo() {
		Session session = sessionFactory.getCurrentSession();

		Query<Video> query = session.createQuery("From Video", Video.class);
		List<Video> resultVideo = query.getResultList();
		return resultVideo;
	}

	@Override
	public void deleteVideo(Integer videoId) {
		Session session = sessionFactory.getCurrentSession();

		String hqlstr = "From Video where videoId=:videoId";
		Query<Video> query = session.createQuery(hqlstr, Video.class);
		query.setParameter("videoId", videoId);

		Video resultVideo = query.uniqueResult();
		session.delete(resultVideo);
	}

	
}
