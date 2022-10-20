package com.pet.service.impl;


import com.pet.entity.User;
import com.pet.entity.UserExample;
import com.pet.mapper.UserMapper;
import com.pet.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User getUserByUsernameAndPassword(User user) {
        //创建查询条件
        UserExample example = new UserExample();
        //进行条件拼接
        UserExample.Criteria criteria = example.createCriteria();
        //一个criteria中拼接的条件都是and (可以选择什么字段的范围查询、模糊查询等等)
        criteria.andUsernameEqualTo(user.getUsername());
        criteria.andPasswordEqualTo(user.getPassword());
        List<User> users = userMapper.selectByExample(example);
        //如果查到了则返回集合的第一个元素
        if (users != null && users.size() > 0){
            return users.get(0);
        }
        return null;
    }

    @Override
    public List<User> getAllUser() {
        List<User> users = userMapper.selectByExample(null);
        return users;
    }

    @Override
    public void removeUserById(Integer id) {
        userMapper.deleteByPrimaryKey(id);
    }

    @Override
    public User getUserById(Integer id) {
        return userMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateUser(User user) {
        userMapper.updateByPrimaryKey(user);
    }

    @Override
    public void saveUser(User user) {
        userMapper.insert(user);
    }
}
