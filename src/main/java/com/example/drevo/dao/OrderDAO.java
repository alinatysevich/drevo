package com.example.drevo.dao;

import com.example.drevo.entities.Basket;
import com.example.drevo.entities.Product;
import com.example.drevo.entities.ProductCategory;
import com.example.drevo.entities.ProductMaterial;

import java.util.List;

public interface OrderDAO {
    List<Basket> getNotCompletedOrders();
    void buy(int basketId);
    void complete(int basketId);
}

