package com.web.api;

import com.web.entity.CustomerSchedule;
import com.web.entity.VaccineSchedule;
import com.web.service.CustomerScheduleService;
import com.web.service.VaccineScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/customer-schedule")
@CrossOrigin
public class CustomerScheduleApi {

    @Autowired
    private CustomerScheduleService customerScheduleService;

    @PostMapping("/customer/create")
    public ResponseEntity<?> create(@RequestBody CustomerSchedule customerSchedule,
                                    @RequestParam String orderId, @RequestParam String requestId) {
        CustomerSchedule result = customerScheduleService.create(customerSchedule, orderId, requestId);
        return new ResponseEntity(result, HttpStatus.CREATED);
    }

    @GetMapping("/customer/my-schedule")
    public ResponseEntity<?> mySchedule() {
        List<CustomerSchedule> result = customerScheduleService.mySchedule();
        return new ResponseEntity(result, HttpStatus.OK);
    }


    @PostMapping("/customer/cancel")
    public ResponseEntity<?> cancel(@RequestParam Long id) {
        customerScheduleService.cancel(id);
        return new ResponseEntity(HttpStatus.OK);
    }
}
