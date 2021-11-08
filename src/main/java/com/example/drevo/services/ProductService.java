package com.example.drevo.services;

import com.example.drevo.entities.Product;
import com.example.drevo.entities.ProductCategory;
import com.example.drevo.entities.ProductMaterial;
import com.sun.istack.Nullable;

import java.util.List;

public interface ProductService {
    List<Product> getProducts();
    List<Product> getProducts(ProductCategory category);
    List<ProductCategory> getProductCategories();
    List<ProductMaterial> getProductMaterials();
    Product add(Product film);
    void delete(Product film);
    void edit(Product film);
    Product getById(int id);
}

