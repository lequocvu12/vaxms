package com.web.service;

import com.web.entity.Center;
import com.web.entity.Doctor;
import com.web.repository.CenterRepository;
import com.web.repository.DoctorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class DoctorService {

    @Autowired
    private DoctorRepository doctorRepository;

    public List<Doctor> findAll(){
        return doctorRepository.findAll();
    }
}
