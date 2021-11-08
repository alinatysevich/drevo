package com.example.drevo.services;

import com.example.drevo.entities.*;

import java.util.List;

public interface UserService {
    Address getAddress(User user);
    void setAddress(User user, Address address);
    List<Basket> getOrders(User user);
    Basket getBasket(User user);
    void buy(User user, Integer productId);
    boolean save(User user);
    void delete(User user);
    void edit(User user);
    User getById(int id);
}

