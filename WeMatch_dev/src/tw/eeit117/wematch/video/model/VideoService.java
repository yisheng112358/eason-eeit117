package tw.eeit117.wematch.video.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class VideoService implements IVideoService {
	private VideoDAO videoDao;
	
	
	public VideoService() {
	}

	@Autowired
	public VideoService(VideoDAO videoDao) {
		this.videoDao = videoDao;
	}
	
	public List<Video> selectAll() {
		return videoDao.selectAll();
	}

	@Override
	public Video insertVideo(Video vBean) {
		return videoDao.insertVideo(vBean);
	}

	@Override
	public List<Video> selectAllVideo() {
		return videoDao.selectAllVideo();
	}

	@Override
	public void deleteVideo(Integer videoId) {
		videoDao.deleteVideo(videoId);
		
	}
}
