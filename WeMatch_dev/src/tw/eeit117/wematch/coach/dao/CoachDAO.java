package tw.eeit117.wematch.coach.dao;

import java.util.List;

import tw.eeit117.wematch.coach.model.Coach;

public interface CoachDAO {
	
	// 新增
	public void insert(Coach coach);

	// 單筆查詢
	public Coach select(Integer coachId);

	// 多筆查詢
	public List<Coach> selectAll();

	// 更新
	public Coach update(Coach coach);

	// 刪除
	public void delete(Integer coachId);
	
	//搜尋
	public List<Coach> findByKeyword(String keyword);
}
