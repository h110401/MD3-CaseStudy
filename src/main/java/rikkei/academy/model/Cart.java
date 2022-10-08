package rikkei.academy.model;

import java.util.ArrayList;
import java.util.List;

public class Cart {

    private int id;

    private User user;

    private int status = 0;

    private List<Product> products = new ArrayList<>();

    public Cart() {
    }

    public Cart(int id, User user, int status) {
        this.id = id;
        this.user = user;
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public List<Product> getProducts() {
        return products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    @Override
    public String toString() {
        return "Cart{" +
                "id=" + id +
                ", user=" + user +
                ", products=" + products +
                ", status=" + status +
                '}';
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }
}
