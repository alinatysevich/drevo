package com.example.drevo.controllers;

import com.example.drevo.entities.Basket;
import com.example.drevo.services.OrderServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping(value = "/admin/orders")
public class OrdersController {

    @Autowired
    private OrderServiceImpl orderService;

    @GetMapping
    public String get() {
        return "orders";
    }

    @PostMapping(value = "/complete/{id}")
    String complete(HttpServletRequest request, @PathVariable int id) {
        orderService.complete(id);
        return "redirect:" + request.getHeader("Referer");
    }

    @ModelAttribute("orders")
    public List<Basket> getOrders() {
        return orderService.getNotCompletedOrders();
    }
}
