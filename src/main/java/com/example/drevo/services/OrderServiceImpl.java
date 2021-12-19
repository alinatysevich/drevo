package com.example.drevo.services;

import com.example.drevo.dao.OrderDAOImpl;
import com.example.drevo.dao.ProductDAOImpl;
import com.example.drevo.entities.Basket;
import com.example.drevo.entities.Product;
import com.example.drevo.entities.ProductCategory;
import com.example.drevo.entities.ProductMaterial;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderDAOImpl orderDAO;

    @Override
    public List<Basket> getNotCompletedOrders() {
        return orderDAO.getNotCompletedOrders();
    }

    @Override
    public void buy(int basketId) {
        orderDAO.buy(basketId);
    }

    @Override
    public void complete(int basketId) {
        orderDAO.complete(basketId);
    }
}
