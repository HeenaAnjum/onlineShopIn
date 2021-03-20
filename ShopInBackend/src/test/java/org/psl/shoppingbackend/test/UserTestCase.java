package org.psl.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.psl.shoppingbackend.dao.CartLineDAO;
import org.psl.shoppingbackend.dao.UserDAO;
import org.psl.shoppingbackend.dto.Address;
import org.psl.shoppingbackend.dto.Cart;
import org.psl.shoppingbackend.dto.User;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class UserTestCase {

	private static AnnotationConfigApplicationContext context;
	private static UserDAO userDAO;
	private User user = null;
	private Cart cart = null;
	private Address address = null;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("org.psl.shoppingbackend");
		context.refresh();
		userDAO = (UserDAO) context.getBean("userDAO");
	}

//working succesfully
	@Test
	public void testAddUser() {
		user = new User();
		user.setFirstName("navya");
		user.setLastName("sravya");
		user.setEmail("navyasravya@gmail.com");
		user.setContactNumber("9884512478");
		user.setRole("CUSTOMER");
		user.setEnabled(true);
		user.setPassword("12375");
// add the user
		assertEquals("sucessfully added the user!", true, userDAO.add(user));
	}

	// working for uni-directional

	// working sucessfully
	@Test
	public void testAddAddress() {
//user = userDAO.get(1);
		address = new Address();
		address.setAddressLineOne("302/B Jadoo Society, King Uncle Nagar");
		address.setAddressLineTwo("Near Store");
		address.setCity("Mumbai");
		address.setState("Maharashtra");
		address.setCountry("India");
		address.setPostalCode("400001");
		address.setUserId(1);
// add the address
		assertEquals("sucessfully added the address!", true, userDAO.addAddress(address));
	}

}
