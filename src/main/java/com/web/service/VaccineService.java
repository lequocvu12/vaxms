package com.web.service;

import com.web.dto.VaccineTypeResponse;
import com.web.entity.Vaccine;
import com.web.entity.VaccineType;
import com.web.repository.VaccineRepository;
import com.web.repository.VaccineTypeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

@Component
public class VaccineService {

    @Autowired
    private VaccineRepository vaccineRepository;

    @Autowired
    private VaccineTypeRepository vaccineTypeRepository;

    public List<Vaccine> findAll(){
        return vaccineRepository.findAll();
    }

    public List<Vaccine> findByType(Long typeId){
        return vaccineRepository.findByType(typeId);
    }

    public List<VaccineTypeResponse> allVaccinType(){
        List<VaccineTypeResponse> list = new ArrayList<>();
        List<VaccineType> vaccineTypes = vaccineTypeRepository.findAll();
        for(VaccineType v : vaccineTypes){
            VaccineTypeResponse n = new VaccineTypeResponse();
            List<Vaccine> vc = vaccineRepository.findByType(v.getId());
            n.setVaccines(vc);
            n.setVaccineType(v);
            list.add(n);
        }
        return list;
    }
}
