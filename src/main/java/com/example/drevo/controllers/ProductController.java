package com.example.drevo.controllers;

import com.example.drevo.auth.UserDetailsImpl;
import com.example.drevo.entities.Product;
import com.example.drevo.entities.ProductCategory;
import com.example.drevo.entities.ProductMaterial;
import com.example.drevo.entities.User;
import com.example.drevo.services.ProductServiceImpl;
import com.example.drevo.services.UserServiceImpl;
import com.sun.istack.Nullable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping
public class ProductController {

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private ProductServiceImpl productService;

    @GetMapping(value = "/products")
    public String get() {
        return "products";
    }

    @PostMapping(value = "/products")
    String createProduct(HttpServletRequest request, @ModelAttribute("product") Product product) {
        productService.add(product);
        return "redirect:" + request.getHeader("Referer");
    }

    @PostMapping(value = "/products/buy/{id}")
    String buy(HttpServletRequest request, @AuthenticationPrincipal UserDetailsImpl userDetails, @PathVariable int id) {
        userService.buy(userDetails.getUser(), id);
        return "redirect:" + request.getHeader("Referer");
    }

    @ModelAttribute("user")
    public User getUser(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        if (userDetails == null) {
            return null;
        }

        return userDetails.getUser();
    }

    @ModelAttribute("product")
    public Product getProduct() {
        return new Product();
    }

    @ModelAttribute("products")
    public List<Product> getProducts(@RequestParam(name = "category", required = false) ProductCategory category) {
        return productService.getProducts(category);
    }

    @ModelAttribute("productCategories")
    public List<ProductCategory> getProductCategories() {
        return productService.getProductCategories();
    }

    @ModelAttribute("productMaterials")
    public List<ProductMaterial> getProductMaterials() {
        return productService.getProductMaterials();
    }
}
