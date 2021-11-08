package com.example.drevo.services;

import com.example.drevo.entities.Basket;

import java.util.List;

public interface OrderService {
    List<Basket> getNotCompletedOrders();
    void complete(int basketId);
}

