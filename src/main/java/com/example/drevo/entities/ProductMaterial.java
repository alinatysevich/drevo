package com.example.drevo.entities;

import javax.persistence.*;

@Entity
@Table
public class ProductMaterial {

    @Id
    @Column
    private String name;

    public ProductMaterial() {}

    public ProductMaterial(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}