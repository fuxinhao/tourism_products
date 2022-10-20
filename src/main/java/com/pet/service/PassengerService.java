package com.pet.service;

import com.pet.entity.Passenger;

import java.util.List;

public interface PassengerService {

    public List<Passenger> getAllPassenger();

    public void savePassenger(Passenger passenger);

    public Passenger selectPassengerById(Integer id);

    public void updatePassenger(Passenger passenger);

    public void removePassengerById(Integer id);
}
