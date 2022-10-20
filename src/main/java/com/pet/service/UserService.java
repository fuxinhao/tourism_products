package com.pet.service;

import com.pet.entity.User;

import java.util.List;

public interface UserService{

    public User getUserByUsernameAndPassword(User user);

    public List<User> getAllUser();

    public void removeUserById(Integer id);

    public User getUserById(Integer id);

    public void updateUser(User user);

    public void saveUser(User user);
}
