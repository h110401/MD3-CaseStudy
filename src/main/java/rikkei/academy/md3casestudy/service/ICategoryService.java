package rikkei.academy.md3casestudy.service;

import rikkei.academy.md3casestudy.model.Category;

import java.util.List;

public interface ICategoryService {
    List<Category> findAll();
    void save (Category category);
    Category findById(int id);
    void deleteById(int id);
    List<Category> findByName(String name);
}
