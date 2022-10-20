package com.pet.service.impl;

import com.pet.entity.Passenger;
import com.pet.mapper.PassengerMapper;
import com.pet.service.PassengerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PassengerServiceImpl implements PassengerService {

    @Autowired
    private PassengerMapper passengerMapper;


    @Override
    public List<Passenger> getAllPassenger() {
        return passengerMapper.selectByExample(null);
    }

    @Override
    public void savePassenger(Passenger passenger) {
        passengerMapper.insert(passenger);
    }

    @Override
    public Passenger selectPassengerById(Integer id) {
        return passengerMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updatePassenger(Passenger passenger) {
        passengerMapper.updateByPrimaryKey(passenger);
    }

    @Override
    public void removePassengerById(Integer id) {
        passengerMapper.deleteByPrimaryKey(id);
    }
}
