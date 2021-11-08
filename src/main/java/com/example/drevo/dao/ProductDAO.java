package com.example.drevo.dao;

import com.example.drevo.entities.Product;
import com.example.drevo.entities.ProductCategory;
import com.example.drevo.entities.ProductMaterial;

import java.util.List;

public interface ProductDAO {
    List<Product> getProducts();
    List<Product> getProducts(ProductCategory category);
    List<ProductCategory> getProductCategories();
    List<ProductMaterial> getProductMaterials();
    void add(Product product);
    void delete(Product product);
    void edit(Product product);
    Product getById(int id);
}

