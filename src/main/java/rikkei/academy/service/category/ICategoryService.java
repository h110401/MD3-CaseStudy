package rikkei.academy.service.category;

import rikkei.academy.model.Category;

import java.util.List;

public interface ICategoryService {
    List<Category> findAll();
    void save (Category category);
    Category findById(int id);
    void deleteById(int id);
    List<Category> findByName(String name);
}
