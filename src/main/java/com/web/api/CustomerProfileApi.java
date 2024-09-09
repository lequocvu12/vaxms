package com.web.api;

import com.web.entity.Center;
import com.web.entity.CustomerProfile;
import com.web.repository.CustomerProfileRepository;
import com.web.service.CenterService;
import com.web.service.CustomerProfileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/customer-profile")
@CrossOrigin
public class CustomerProfileApi {

    @Autowired
    private CustomerProfileService customerProfileService;

    @GetMapping("/customer/find-by-user")
    public ResponseEntity<?> findByUser(){
        CustomerProfile result = customerProfileService.findByUser();
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @PostMapping("/customer/update-profile")
    public ResponseEntity<?> update(@RequestBody CustomerProfile customerProfile){
        CustomerProfile result = customerProfileService.update(customerProfile);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
