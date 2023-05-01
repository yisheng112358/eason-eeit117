package tw.eeit117.wematch.courses.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import tw.eeit117.wematch.courses.model.Curriculum;

@Transactional
public interface CurriculumService {
	
		//加選
		@Transactional
		public void addCurriculum(Curriculum curriculum);
		
		//退選
		@Transactional
		public void deleteCurriculum(int curriculumId);
				
		//列出會員所有課表
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
		
		//課表退選
		@Transactional
		public void deleteCurriculumCourses(int coursesId);
}
