package tw.eeit117.wematch.cart.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ReceiverService {
	@Autowired
	private ReceiverDao receiverDao;

	public void insert(Receiver receiver) {
		receiverDao.insert(receiver);
	}

}
