package org.psl.ShopInBackend.dao;

import java.util.List;

import org.psl.ShopInBackend.dto.Category;

public interface CategoryDAO {

	List<Category> list();
	
	Category get(int id);
	
}
