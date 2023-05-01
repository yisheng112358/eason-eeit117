package tw.eeit117.wematch.coach.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.eeit117.wematch.coach.dao.CoachDAO;
import tw.eeit117.wematch.coach.model.Coach;

@Service
@Transactional
public class CoachServiceImpl implements CoachService {

	@Autowired
	private CoachDAO coachDAO;

	@Override
	@Transactional
	public void insert(Coach coach) {
		coachDAO.insert(coach);
	}

	@Override
	@Transactional
	public Coach select(Integer coachId) {
		return coachDAO.select(coachId);
	}

	@Override
	@Transactional
	public List<Coach> selectAll() {
		return coachDAO.selectAll();
	}

	@Override
	@Transactional
	public Coach update(Coach coach) {
		return coachDAO.update(coach);
	}

	@Override
	@Transactional
	public void delete(Integer coachId) {
		coachDAO.delete(coachId);
	}

	@Transactional
	public List<Coach> findByKeyword(String keyword) {
		return coachDAO.findByKeyword(keyword);
	}

	public void setCoachDAO(CoachDAO coachDAO) {
		this.coachDAO = coachDAO;
	}

}
