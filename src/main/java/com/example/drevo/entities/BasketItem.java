package com.example.drevo.entities;
import javax.persistence.*;

@Entity
@Table
public class BasketItem {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column(name = "product_id")
    private int productId;

    @Column
    private Integer quantity;

    @ManyToOne
    @JoinColumn
    private Basket basket;

    @ManyToOne
    @JoinColumn(name = "product_id", insertable = false, updatable = false)
    private Product product;

    public BasketItem() {}

    public BasketItem(Integer quantity, Basket basket, int productId) {
        this.quantity = quantity;
        this.basket = basket;
        this.productId = productId;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public Basket getBasket() {
        return basket;
    }

    public void setBasket(Basket basket) {
        this.basket = basket;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
