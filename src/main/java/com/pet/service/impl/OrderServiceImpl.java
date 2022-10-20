package com.pet.service.impl;

import com.pet.entity.Orders;
import com.pet.entity.OrdersExample;
import com.pet.mapper.OrdersMapper;
import com.pet.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrdersMapper orderMapper;

    @Override
    public List<Orders> getAllOrder() {
        return orderMapper.selectByExample(null);
    }

    @Override
    public Orders getOrderById(Integer id) {
        return orderMapper.selectByPrimaryKey(id);
    }

    @Override
    public void removeOrderById(Integer id) {
        orderMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void saveOrder(Orders orders) {
        orderMapper.insert(orders);
    }

    @Override
    public List<Orders> getOrderByUserId(Integer userId) {
        //创建条件
        OrdersExample example = new OrdersExample();
        OrdersExample.Criteria criteria = example.createCriteria();
        criteria.andMemberidEqualTo(userId);
        return orderMapper.selectByExample(example);
    }
}
