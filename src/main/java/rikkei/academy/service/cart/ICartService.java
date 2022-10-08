package rikkei.academy.service.cart;

import rikkei.academy.model.Cart;
import rikkei.academy.model.Product;
import rikkei.academy.service.IGenericService;

import java.sql.SQLException;
import java.util.List;

public interface ICartService extends IGenericService<Cart> {
    Cart findCartByUSerId(int idUser) throws SQLException;

    List<Product> findProductsByCartId(int idCart) throws SQLException;

    Cart save(int idUser) throws SQLException;

    void addProductToCart(int idCart, int idProduct, int quantity) throws SQLException;
}
