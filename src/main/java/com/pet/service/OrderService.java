package com.pet.service;

import com.pet.entity.Orders;

import java.util.List;

public interface OrderService {

    public List<Orders> getAllOrder();

    public Orders getOrderById(Integer id);

    public void removeOrderById(Integer id);

    public void saveOrder(Orders orders);

    public List<Orders> getOrderByUserId(Integer userId);
}
