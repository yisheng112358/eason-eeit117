package tw.eeit117.wematch.courses.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import tw.eeit117.wematch.courses.model.Courses;

public interface CoursesDAO {
	//新增
	@Transactional
	public void addCourses(Courses courses);
	//單筆查詢
	@Transactional
	public Courses getCourses(int coursesId);
	//全部查詢
	@Transactional
	public List<Courses> getAllCourses();
	//更新
	@Transactional
	public Courses updateCourses(Courses courses);
	//刪除
	@Transactional
	public void deleteCourses(int coursesId);
		
}
