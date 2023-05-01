package tw.eeit117.wematch.video.model;

import java.util.List;

public interface IVideoService {
	public Video insertVideo(Video vBean);
	public List<Video> selectAllVideo();
	public void deleteVideo(Integer videoId);
}
