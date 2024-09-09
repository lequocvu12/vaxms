package com.web.service;

import com.web.entity.Doctor;
import com.web.entity.Nurse;
import com.web.repository.DoctorRepository;
import com.web.repository.NurseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class NurseService {

    @Autowired
    private NurseRepository nurseRepository;

    public List<Nurse> findAll(){
        return nurseRepository.findAll();
    }
}
