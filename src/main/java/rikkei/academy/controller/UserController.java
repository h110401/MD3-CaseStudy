package rikkei.academy.controller;

import rikkei.academy.model.Role;
import rikkei.academy.model.User;
import rikkei.academy.service.role.IRoleService;
import rikkei.academy.service.role.RoleServiceIMPL;
import rikkei.academy.service.user.IUserService;
import rikkei.academy.service.user.UserServiceIMPL;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "UserController", value = "/user")
public class UserController extends HttpServlet {
    IUserService userService = new UserServiceIMPL();
    IRoleService roleService = new RoleServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            String action = request.getParameter("action");
            if (action == null) action = "";
            switch (action) {
                case "create":
                    formCreate(request, response);
                    break;
                case "edit":
                    formEdit(request, response);
                    break;
                case "delete":
                    formDelete(request, response);
                    break;
                default:
                    listUser(request, response);
            }
        } catch (ServletException | IOException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void formDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id", id);

        request.getRequestDispatcher("user/delete.jsp").forward(request, response);

    }

    private void formEdit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        User userEdit = userService.findById(id);
        request.setAttribute("userEdit", userEdit);
        request.getRequestDispatcher("user/edit.jsp").forward(request, response);
    }

    private void formCreate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("user/create.jsp").forward(request, response);
    }

    private void listUser(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, SQLException {

        List<User> userList = userService.findAll();
        request.setAttribute("list", userList);

        request.getRequestDispatcher("user/list.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) {
        try {
            String action = request.getParameter("action");
            if (action == null) action = "";
            switch (action) {
                case "create":
                    actionCreate(request, response);
                    break;
                case "edit":
                    actionEdit(request, response);
                    break;
                case "delete":
                    actionDelete(request, response);
                    break;
                default:
                    listUser(request, response);
            }
        } catch (ServletException | IOException | SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void actionDelete(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        userService.deleteById(id);

        listUser(request, response);
    }

    private void actionEdit(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int idRole = Integer.parseInt(request.getParameter("id_role"));
        String nameRole = request.getParameter("role");

        User user = userService.findById(id);
        user.setName(name);
        user.setUsername(username);
        user.setEmail(email);
        user.setPassword(password);
        user.setRole(new Role(idRole, nameRole));

        userService.save(user);

        listUser(request, response);
    }

    private void actionCreate(HttpServletRequest request, HttpServletResponse response) throws SQLException, ServletException, IOException {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        Role role = roleService.findByName("user");

        User user = new User(name, username, email, password, role);

        userService.save(user);

        listUser(request, response);

    }


}
