package org.psl.shoppingbackend.test;

import static org.junit.Assert.assertEquals;

import org.junit.BeforeClass;
import org.junit.Test;
import org.psl.shoppingbackend.dao.CartLineDAO;
import org.psl.shoppingbackend.dao.ProductDAO;
import org.psl.shoppingbackend.dao.UserDAO;
import org.psl.shoppingbackend.dto.Cart;
import org.psl.shoppingbackend.dto.CartLine;
import org.psl.shoppingbackend.dto.Product;
import org.psl.shoppingbackend.dto.User;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class CartLineTestCase {

	private static AnnotationConfigApplicationContext context;

	private static CartLineDAO cartLineDAO;
	private static ProductDAO productDAO;
	private static UserDAO userDAO;

	private CartLine cartLine = null;

	@BeforeClass
	public static void init() {
		context = new AnnotationConfigApplicationContext();
		context.scan("org.psl.shoppingbackend");
		context.refresh();
		cartLineDAO = (CartLineDAO) context.getBean("cartLineDAO");
		productDAO = (ProductDAO) context.getBean("productDAO");
		userDAO = (UserDAO) context.getBean("userDAO");
	}

	@Test
	public void testAddCartLine() {
// fetch the user and then cart of that user
		User user = userDAO.getByEmail("saurabh7.sk21@gmail.com");
		Cart cart = user.getCart();
// fetch the product
		Product product = productDAO.get(2);
// Create a new CartLine
		cartLine = new CartLine();
		cartLine.setCartId(cart.getId());
		cartLine.setProduct(product);
		cartLine.setProductCount(1);
		double oldTotal = cartLine.getTotal();
		cartLine.setTotal(product.getUnitPrice() * cartLine.getProductCount());
		cart.setCartLines(cart.getCartLines() + 1);
		cart.setGrandTotal(cart.getGrandTotal() + (cartLine.getTotal() - oldTotal));
		assertEquals("Failed to add the CartLine!", true, cartLineDAO.add(cartLine));
		assertEquals("Failed to update the cart!", true, cartLineDAO.updateCart(cart));
	}

}