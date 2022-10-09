package rikkei.academy.service.cart;


import rikkei.academy.config.ConnectMySQL;
import rikkei.academy.model.Cart;
import rikkei.academy.model.Product;
import rikkei.academy.service.product.IProductService;
import rikkei.academy.service.product.ProductServiceIMPL;
import rikkei.academy.service.user.IUserService;
import rikkei.academy.service.user.UserServiceIMPL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartServiceIMPL implements ICartService {

    private final Connection connection = ConnectMySQL.getConnection();
    private final IUserService userService = new UserServiceIMPL();
    private final IProductService productService = new ProductServiceIMPL();
    private final String LIST_CART = "select id,iduser,status from cart";
    private final String INSERT_CART = "insert into cart(iduser) value (?)";
    private final String FIND_BY_ID = "select iduser,status from cart where id = ?";
    private final String FIND_USER_ID = "select id from cart where iduser = ? and status = ?";
    private final String FIND_CART_STATUS = "select id,iduser from cart where status = ?";
    private final String FIND_PRODUCT_OF_CART = "select idproduct, quantity from cartproduct where idcart = ?";
    private final String REMOVE_CART = "delete from cart where id = ?";
    private final String REMOVE_PRODUCT_OF_CART = "delete from cartproduct where idcart = ? and idproduct = ?";
    private final String EDIT_CART_STATUS = "update cart set status = ? where id = ?";

    @Override
    public List<Cart> findAll() throws SQLException {
        List<Cart> cartList = new ArrayList<>();
        try (
                PreparedStatement ps = connection.prepareStatement(LIST_CART);
        ) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int idUser = rs.getInt("iduser");
                int status = rs.getInt("status");

                Cart cart = new Cart(id, userService.findById(idUser), status);
                cart.setProducts(this.findProductsByCartId(id));

                cartList.add(cart);
            }
        }
        return cartList;
    }

    @Override
    public void save(Cart cart) throws SQLException {

    }

    @Override
    public Cart save(int idUser) throws SQLException {
        try (
                PreparedStatement ps = connection.prepareStatement(INSERT_CART, Statement.RETURN_GENERATED_KEYS)
        ) {
            ps.setInt(1, idUser);
            ps.executeUpdate();
            ResultSet rs = ps.getGeneratedKeys();
            int idCart = 0;
            if (rs.next()) {
                idCart = rs.getInt(1);
            }
            return new Cart(idCart, userService.findById(idUser), 0);
        }
    }

    @Override
    public void addProductToCart(int idCart, int idProduct, int quantity) throws SQLException {
        try (
                PreparedStatement ps_check = connection.prepareStatement("select quantity from cartproduct where idcart = ? and idproduct = ?");
                PreparedStatement ps_save = connection.prepareStatement("insert into cartproduct(idcart,idproduct,quantity) value (?,?,?)");
                PreparedStatement ps_update = connection.prepareStatement("update cartproduct set quantity = ? where idcart = ? and idproduct = ?");
        ) {
            ps_check.setInt(1, idCart);
            ps_check.setInt(2, idProduct);
            ResultSet rs = ps_check.executeQuery();
            if (rs.next()) {
                int old_quantity = rs.getInt("quantity");
                ps_update.setInt(1, old_quantity + quantity);
                ps_update.setInt(2, idCart);
                ps_update.setInt(3, idProduct);
                ps_update.executeUpdate();
            } else {
                ps_save.setInt(1, idCart);
                ps_save.setInt(2, idProduct);
                ps_save.setInt(3, quantity);
                ps_save.executeUpdate();
            }
        }
    }

    @Override
    public void removeProductFromCart(int idCart, int idProduct) throws SQLException {
        try (
                PreparedStatement ps = connection.prepareStatement(REMOVE_PRODUCT_OF_CART)
        ) {
            ps.setInt(1, idCart);
            ps.setInt(2, idProduct);
            ps.executeUpdate();
        }
    }

    @Override
    public void editCartStatus(int idCart, int status) throws SQLException {
        try (
                PreparedStatement ps = connection.prepareStatement(EDIT_CART_STATUS)
        ) {
            ps.setString(1, String.valueOf(status));
            ps.setInt(2, idCart);
            ps.executeUpdate();
        }
    }

    @Override
    public List<Cart> findCartByStatus(int status) throws SQLException {
        List<Cart> result = new ArrayList<>();
        try (
                PreparedStatement ps = connection.prepareStatement(FIND_CART_STATUS)
        ) {
            ps.setString(1, String.valueOf(status));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                int idUser = rs.getInt("iduser");
                Cart cart = new Cart(id, userService.findById(idUser), status);
                cart.setProducts(this.findProductsByCartId(id));
                result.add(cart);
            }
        }
        return result;
    }

    @Override
    public Cart findById(int id) throws SQLException {
        Cart cart = null;
        try (
                PreparedStatement ps = connection.prepareStatement(FIND_BY_ID)
        ) {
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idUser = rs.getInt(1);
                int status = rs.getInt(2);
                cart = new Cart(id, userService.findById(idUser), status);
                cart.setProducts(this.findProductsByCartId(id));
            }
        }
        return cart;
    }

    @Override
    public void deleteById(int id) throws SQLException {
        try (
                PreparedStatement ps = connection.prepareStatement(REMOVE_CART)
        ) {
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    @Override
    public List<Cart> findCartByUSerId(int idUser, int status) throws SQLException {
        List<Cart> cartList = new ArrayList<>();
        try (
                PreparedStatement ps = connection.prepareStatement(FIND_USER_ID);
        ) {
            ps.setInt(1, idUser);
            ps.setString(2, String.valueOf(status));
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                Cart cart = new Cart(id, userService.findById(idUser), status);
                cart.setProducts(this.findProductsByCartId(id));
                cartList.add(cart);
            }
        }
        return cartList;
    }

    @Override
    public List<Product> findProductsByCartId(int idCart) throws SQLException {
        List<Product> products = new ArrayList<>();
        try (
                PreparedStatement ps = connection.prepareStatement(FIND_PRODUCT_OF_CART)
        ) {
            ps.setInt(1, idCart);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int idproduct = rs.getInt("idproduct");
                int quantity = rs.getInt("quantity");
                Product product = productService.findById(idproduct);
                product.setQuantity(quantity);
                products.add(product);
            }
        }
        return products;
    }
}
