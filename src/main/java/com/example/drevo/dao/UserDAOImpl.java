package com.example.drevo.dao;

import com.example.drevo.entities.*;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;
import java.util.stream.Stream;

@Repository
@Transactional
public class UserDAOImpl implements UserDAO {
    @PersistenceContext
    private EntityManager entityManager;

    protected Session getSession() {
        return entityManager.unwrap(Session.class);
    }

    @Override
    public User findByUsername(String username) {
        Query query = entityManager.createQuery("from User U WHERE U.username = :username");
        query.setParameter("username", username);
        return (User) query.getResultList().stream().findFirst().orElse(null);
    }

    @Override
    public Address getAddress(User user) {
        return (Address) entityManager
            .createQuery("from Address a where a.user.id = :user")
            .setParameter("user", user.getId())
            .getResultList().get(0);
    }

    @Override
    public void setAddress(User user, Address address) {
        Session session = this.getSession();
        session.saveOrUpdate(address);
    }

    @Override
    public List<Basket> getOrders(User user) {
        return entityManager
            .createQuery("from Basket b where b.completed = true and b.user.id = :user")
            .setParameter("user", user.getId())
            .getResultList();
    }

    @Override
    public Basket getBasket(User user) {
        return (Basket) entityManager
            .createQuery("from Basket b where b.completed = false and b.user.id = :user")
            .setParameter("user", user.getId())
            .getResultList().stream().findFirst().orElse(null); // https://stackoverflow.com/a/46344029
    }

    @Override
    public void buy(User user, Integer productId) {
        Session session = this.getSession();

        Basket basket = this.getBasket(user);

        if (basket == null) {
            basket = new Basket(user);

            session.persist(basket);

            BasketItem basketItem = new BasketItem(1, basket, productId);

            session.persist(basketItem);
        } else {
            BasketItem basketItem = basket.getBasketItems().stream()
                .filter(item -> item.getProduct().getId().equals(productId))
                .findFirst().orElse(null);

            if (basketItem == null) {
                basketItem = new BasketItem(1, basket, productId);
            }

            basketItem.setQuantity(basketItem.getQuantity() + 1);

            session.persist(basketItem);
        }
    }

    @Override
    public void save(User user) {
        Session session = this.getSession();
        session.persist(user);
    }

    @Override
    public void delete(User user) {
        Session session = this.getSession();
        session.delete(user);
    }

    @Override
    public void edit(User user) {
        Session session = this.getSession();
        session.update(user);
    }

    @Override
    public User getById(int id) {
        Session session = this.getSession();
        return session.get(User.class, id);
    }
}

