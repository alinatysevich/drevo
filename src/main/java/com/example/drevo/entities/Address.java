package com.example.drevo.entities;

import javax.persistence.*;
import javax.validation.constraints.Max;

@Entity
@Table
public class Address {

    @Id
    @Column
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    @Column
    private String zipCode;

    @Column
    private String country;

    @Column
    private String region;

    @Column
    private String city;

    @Column
    private String address;

    @OneToOne
    @JoinColumn
    private User user;

    public Address() {}

    public Address(String zipCode, String country, String region, String city, String address, User user) {
        this.zipCode = zipCode;
        this.country = country;
        this.region = region;
        this.city = city;
        this.address = address;
        this.user = user;
    }

    public String getZipCode() {
        return zipCode;
    }

    public void setZipCode(String zipCode) {
        this.zipCode = zipCode;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
