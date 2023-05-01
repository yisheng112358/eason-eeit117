package tw.eeit117.wematch.booking.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class BookingService {

	@Autowired
	BookingDAO bookingDAO;

	public BookingService(BookingDAO bookingDAO) {
		this.bookingDAO = bookingDAO;
	}

	@Transactional
	public bookingBean insert(bookingBean bBean) {

		return bookingDAO.insert(bBean);

	}

	@Transactional
	public List<bookingBean> select(String date, String time) {

		return bookingDAO.select(date, time);
	}
	
	@Transactional
	public List<bookingBean> selectbooking(String name) {

		return bookingDAO.selectbooking(name);
	}

	@Transactional
	public List<bookingBean> selectAll() {

		return bookingDAO.selectAll();
	}

	@Transactional
	public void delete(Integer bookingId) {
		bookingDAO.delete(bookingId);
	}
	
	

}
