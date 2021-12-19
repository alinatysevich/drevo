package com.example.drevo.controllers;

import com.example.drevo.auth.UserDetailsImpl;
import com.example.drevo.entities.*;
import com.example.drevo.services.OrderServiceImpl;
import com.example.drevo.services.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/basket")
public class BasketController {

    @Autowired
    private UserServiceImpl userService;

    @Autowired
    private OrderServiceImpl orderService;

    @GetMapping
    public String get() {
        return "basket";
    }

    @PostMapping(value = "/buy/{id}")
    String buy(HttpServletRequest request, @PathVariable int id) {
        orderService.buy(id);
        return "redirect:" + request.getHeader("Referer");
    }

    @ModelAttribute("user")
    public User getUser(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        if (userDetails == null) {
            return null;
        }

        return userDetails.getUser();
    }

    @ModelAttribute("basket")
    public Basket getBasket(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        if (userDetails == null) {
            return null;
        }

        return userService.getBasket(userDetails.getUser());
    }

    @ModelAttribute("total")
    public int getTotal(@AuthenticationPrincipal UserDetailsImpl userDetails) {
        if (userDetails == null) {
            return 0;
        }

        Basket basket = userService.getBasket(userDetails.getUser());

        if (basket == null) {
            return 0;
        }

        int total = 0;

        for (int i = 0; i < basket.getBasketItems().size(); i++) {
            BasketItem basketItem = basket.getBasketItems().get(i);

            total += basketItem.getQuantity() * basketItem.getProduct().getPrice();
        }

        return total;
    }
}
