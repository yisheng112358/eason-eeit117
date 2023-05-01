package tw.eeit117.wematch.product.model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class ProductBeanDAO implements IProductBeanDAO {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<ProductBean> selectAll() {
		Session session = sessionFactory.getCurrentSession();
		List<ProductBean> productBeanList = session.createQuery("FROM ProductBean", ProductBean.class).list();
		return productBeanList;
	}

	@Override
	public void insert(ProductBean productBean) {
		Session session = sessionFactory.getCurrentSession();
		session.save(productBean);
	}

	@Override
	public void deleteById(Integer productId) {
		Session session = sessionFactory.getCurrentSession();
		ProductBean productBean = session.get(ProductBean.class, productId);
		session.delete(productBean);
	}

	@Override
	public ProductBean findById(Integer productId) {
		Session session = sessionFactory.getCurrentSession();
		ProductBean productBean = session.get(ProductBean.class, productId);
		return productBean;
	}

	@Override
	public void update(ProductBean productBean) {
		Session session = sessionFactory.getCurrentSession();
		ProductBean productBeanActive = session.get(ProductBean.class, productBean.getProductId());
		if (productBeanActive != null) {
			productBeanActive.setCategory(productBean.getCategory());
			productBeanActive.setDetailImg(productBean.getDetailImg());
			productBeanActive.setPrice(productBean.getPrice());
			productBeanActive.setProductDescription(productBean.getProductDescription());
			productBeanActive.setProductName(productBean.getProductName());
			productBeanActive.setStock(productBean.getStock());
			productBeanActive.setThumbnail(productBean.getThumbnail());
		} else {
			this.insert(productBean);
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> findByKeyword(String keyword) {
		String hql = "From ProductBean where productName like '%" + keyword + "%' or productDescription like '%"
				+ keyword + "%' or category like '%" + keyword + "%'";
		Session session = sessionFactory.getCurrentSession();
		return session.createQuery(hql).list();
	}

}
