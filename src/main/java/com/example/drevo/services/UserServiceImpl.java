package com.example.drevo.services;

import com.example.drevo.dao.UserDAOImpl;
import com.example.drevo.entities.Address;
import com.example.drevo.entities.Basket;
import com.example.drevo.entities.User;
import com.example.drevo.entities.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.Collections;
import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDAOImpl userDAO;

    @Autowired
    BCryptPasswordEncoder bCryptPasswordEncoder;

    @Override
    public Address getAddress(User user) {
        return userDAO.getAddress(user);
    }

    @Override
    public void setAddress(User user, Address address) {
        userDAO.setAddress(user, address);
    }

    @Override
    public List<Basket> getOrders(User user) {
        return userDAO.getOrders(user);
    }

    @Override
    public Basket getBasket(User user) {
        return userDAO.getBasket(user);
    }

    @Override
    public void buy(User user, Integer productId) {
        userDAO.buy(user, productId);
    }

    @Override
    public boolean save(User user) {
        User userFromDB = userDAO.findByUsername(user.getUsername());

        if (userFromDB != null) {
            return false;
        }

        user.setRole(new UserRole( "CUSTOMER"));
        user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        userDAO.save(user);
        return true;
    }

    @Override
    public void delete(User user) {
        userDAO.delete(user);
    }

    @Override
    public void edit(User user) {
        userDAO.edit(user);
    }

    @Override
    public User getById(int id) {
        return userDAO.getById(id);
    }
}
