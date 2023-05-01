package tw.eeit117.wematch.courses.dao;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import tw.eeit117.wematch.courses.model.Courses;
import tw.eeit117.wematch.courses.model.Curriculum;

public interface CurriculumDAO {
	
	//加選
	@Transactional
	public void addCurriculum(Curriculum curriculum);
	
	//退選
	@Transactional
	public void deleteCurriculum(int curriculumId);

	//查詢會員的課程
	@Transactional
	public List<Curriculum> getAllCurriculum(int memberId);
	
	//單筆查詢課表
	@Transactional
	public Curriculum getCurriculum(int curriculumId);
	
	//確認有無複選
	@Transactional
	public boolean checkCourses(int coursesId,int memberId);
	
	//確認有無複選
	@Transactional
	public boolean checkCourses(int coursesId);
	
	//退選
	@Transactional
	public void deleteCurriculumCourses(int coursesId);
	
	
}
