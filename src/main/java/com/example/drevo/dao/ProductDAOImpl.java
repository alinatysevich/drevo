package com.example.drevo.dao;

import com.example.drevo.entities.Product;
import com.example.drevo.entities.ProductCategory;
import com.example.drevo.entities.ProductMaterial;
import com.sun.istack.Nullable;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.transaction.Transactional;
import java.util.List;

@Repository
@Transactional
public class ProductDAOImpl implements ProductDAO {
    @PersistenceContext
    private EntityManager entityManager;

    protected Session getSession() {
        return entityManager.unwrap(Session.class);
    }

    @Override
    public List<Product> getProducts() {
        return entityManager.createQuery("from Product").getResultList();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Product> getProducts(ProductCategory category) {
        if (category == null) {
            return entityManager.createQuery("from Product").getResultList();
        }

        Query query = entityManager.createQuery("from Product P WHERE P.category = :category");

        query.setParameter("category", category);

        return query.getResultList();
    }

    @Override
    public List<ProductCategory> getProductCategories() {
        return entityManager.createQuery("from ProductCategory ").getResultList();
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<ProductMaterial> getProductMaterials() {
        return entityManager.createQuery("from ProductMaterial ").getResultList();
    }

    @Override
    public void add(Product product) {
        Session session = this.getSession();
        session.persist(product);
    }

    @Override
    public void delete(Product product) {
        Session session = this.getSession();
        session.delete(product);
    }

    @Override
    public void edit(Product product) {
        Session session = this.getSession();
        session.update(product);
    }

    @Override
    public Product getById(int id) {
        Session session = this.getSession();
        return session.get(Product.class, id);
    }
}

