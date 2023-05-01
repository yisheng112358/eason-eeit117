package tw.eeit117.wematch.courses.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.eeit117.wematch.courses.dao.CoursesDAO;
import tw.eeit117.wematch.courses.model.Courses;

@Service
@Transactional
public class CoursesServiceImpl implements CoursesService{

	@Autowired
	private CoursesDAO coursesDao;
	
	@Override
	@Transactional
	public void addCourses(Courses courses) {
		coursesDao.addCourses(courses);
		
	}

	@Override
	@Transactional
	public Courses getCourses(int coursesId) {	
		return coursesDao.getCourses(coursesId);
	}

	@Override
	@Transactional
	public List<Courses> getAllCourses() {
		return coursesDao.getAllCourses();
	}

	@Override
	@Transactional
	public Courses updateCourses(Courses courses) {
		return coursesDao.updateCourses(courses);
	}

	@Override
	@Transactional
	public void deleteCourses(int coursesId) {
		coursesDao.deleteCourses(coursesId);
		
	}
	@Transactional
	public void setCoursesDAO(CoursesDAO coursesDao) {
		 this.coursesDao = coursesDao;
	}

}
