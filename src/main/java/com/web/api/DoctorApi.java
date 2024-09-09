package com.web.api;

import com.web.entity.Doctor;
import com.web.entity.News;
import com.web.service.DoctorService;
import com.web.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/doctor")
@CrossOrigin
public class DoctorApi {

    @Autowired
    private DoctorService doctorService;

    @GetMapping("/public/find-all")
    public ResponseEntity<?> findAll(){
        List<Doctor> result = doctorService.findAll();
        return new ResponseEntity<>(result, HttpStatus.OK);
    }
}
