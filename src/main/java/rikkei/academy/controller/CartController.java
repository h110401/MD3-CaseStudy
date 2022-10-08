package rikkei.academy.controller;

import rikkei.academy.model.Cart;
import rikkei.academy.model.User;
import rikkei.academy.service.cart.CartServiceIMPL;
import rikkei.academy.service.cart.ICartService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "CartController", value = "/cart")
public class CartController extends HttpServlet {
    private final ICartService cartService = new CartServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String action = request.getParameter("action");
            if (action == null) action = "";
            switch (action) {
                case "add":
                    addToCart(request, response);
                    break;
                default:
                    listCart(request, response);
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

    private void addToCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, IOException {
        User userLogin = (User) request.getSession().getAttribute("userLogin");

        Cart cart = cartService.findCartByUSerId(userLogin.getId());

        if (cart == null) {
            cart = cartService.save(userLogin.getId());
        }

        int qty = Integer.parseInt(request.getParameter("qty"));
        int idProduct = Integer.parseInt(request.getParameter("id"));

        cartService.addProductToCart(cart.getId(), idProduct, qty);

        response.sendRedirect("home");
    }

    private void listCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        User userLogin = (User) request.getSession().getAttribute("userLogin");

        Cart cart = cartService.findCartByUSerId(userLogin.getId());

        request.setAttribute("cart", cart);

        request.getRequestDispatcher("cart/cart.jsp").forward(request, response);

//        userCart(request, response);

    }

    private void userCart(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        List<Cart> cartList = cartService.findAll();

        request.setAttribute("cartList", cartList);
        request.getRequestDispatcher("cart/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
