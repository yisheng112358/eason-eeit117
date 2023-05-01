package tw.eeit117.wematch.courses.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.eeit117.wematch.courses.dao.CurriculumDAO;
import tw.eeit117.wematch.courses.model.Curriculum;


@Service
@Transactional
public class CurriculumServiceImpl implements CurriculumService {
	@Autowired
	private CurriculumDAO curriculumDao;

	@Override
	@Transactional
	public void addCurriculum(Curriculum curriculum) {
		curriculumDao.addCurriculum(curriculum);
		
	}

	@Override
	@Transactional
	public void deleteCurriculum(int curriculumId) {
		curriculumDao.deleteCurriculum(curriculumId);
		
	}

	@Override
	@Transactional
	public List<Curriculum> getAllCurriculum(int memberId) {
		return curriculumDao.getAllCurriculum(memberId);
	}

	@Override
	@Transactional
	public boolean checkCourses(int coursesId,int memberId) {
		return curriculumDao.checkCourses(coursesId,memberId);
	}
	
	
	@Transactional
	public boolean checkCourses(int coursesId) {
		return curriculumDao.checkCourses(coursesId);
	}

	@Override
	@Transactional
	public Curriculum getCurriculum(int curriculumId) {
		return curriculumDao.getCurriculum(curriculumId);
	}
	
	@Override
	@Transactional
	public void deleteCurriculumCourses(int coursesId) {
		curriculumDao.deleteCurriculumCourses(coursesId);
		
	}

}
