package com.example.drevo.services;

import com.example.drevo.dao.ProductDAOImpl;
import com.example.drevo.entities.Product;
import com.example.drevo.entities.ProductCategory;
import com.example.drevo.entities.ProductMaterial;
import com.sun.istack.Nullable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductServiceImpl implements ProductService {

    @Autowired
    private ProductDAOImpl productDAO;

    @Override
    public List<Product> getProducts() {
        return productDAO.getProducts();
    }

    @Override
    public List<Product> getProducts(ProductCategory category) {
        return productDAO.getProducts(category);
    }

    @Override
    public List<ProductCategory> getProductCategories() {
        return productDAO.getProductCategories();
    }

    @Override
    public List<ProductMaterial> getProductMaterials() {
        return productDAO.getProductMaterials();
    }

    @Override
    public Product add(Product film) {
        productDAO.add(film);
        return film;
    }

    @Override
    public void delete(Product film) {
        productDAO.delete(film);
    }

    @Override
    public void edit(Product film) {
        productDAO.edit(film);
    }

    @Override
    public Product getById(int id) {
        return productDAO.getById(id);
    }
}
