package org.psl.ShopInBackend.daoImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.SessionFactory;
import org.psl.ShopInBackend.dao.CategoryDAO;
import org.psl.ShopInBackend.dto.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository(value="categoryDAO")
@Transactional
public class CategoryDAOImpl implements CategoryDAO {
	
	@Autowired
	private SessionFactory sessionFactory ;
	
	private static List<Category> categories =new ArrayList<>();
	
	static {
		Category category=new Category();
		
		//adding first category
		category.setId(1);
		category.setName("Television");
		category.setDescription("Desciption for Television");
		category.setImageURL("CAT_1.png");
		
		categories.add(category);
		
		//adding second category
		category=new Category();
		category.setId(2);
		category.setName("Mobile");
		category.setDescription("Desciption for Mobile");
		category.setImageURL("CAT_2.png");
		
		categories.add(category);

		//adding third category
		category=new Category();
		category.setId(3);
		category.setName("Laptop");
		category.setDescription("Desciption for Laptop");
		category.setImageURL("CAT_3.png");
		
		categories.add(category);
	}
	
	@Override
	public List<Category> list() {
		// TODO Auto-generated method stub
		return categories;
	}
	
	@Override
	public Category get(int id) {
		// enhaanced for lopp
		for(Category category:categories) {
			if(category.getId()==id)
				return category;
		}
		return null;
	}
	
	@Override
	
	public boolean add(Category category) {
		try {
			//add Category to db
			sessionFactory.getCurrentSession().persist(category); 
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
		
	}

	@Override
	public boolean update(Category category) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(Category category) {
		// TODO Auto-generated method stub
		return false;
	}

}
