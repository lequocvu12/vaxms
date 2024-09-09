package com.web.service;

import com.web.entity.CustomerProfile;
import com.web.entity.User;
import com.web.repository.CustomerProfileRepository;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;

@Component
public class CustomerProfileService {

    @Autowired
    private CustomerProfileRepository customerProfileRepository;

    @Autowired
    private UserUtils userUtils;

    public CustomerProfile findByUser(){
        User user = userUtils.getUserWithAuthority();
        CustomerProfile customerProfile = customerProfileRepository.findByUser(user.getId());
        return customerProfile;
    }

    public CustomerProfile update(CustomerProfile customerProfile){
        User user = userUtils.getUserWithAuthority();
        CustomerProfile ex = customerProfileRepository.findByUser(user.getId());
        customerProfile.setId(ex.getId());
        customerProfile.setCreatedDate(ex.getCreatedDate()==null?new Timestamp(System.currentTimeMillis()):ex.getCreatedDate());
        customerProfile.setUser(user);
        customerProfileRepository.save(customerProfile);
        return customerProfile;
    }
}
