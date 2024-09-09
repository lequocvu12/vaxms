package com.web.api;

import com.web.entity.Vaccine;
import com.web.entity.VaccineType;
import com.web.service.VaccineTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping("/api/vaccine-type")
@CrossOrigin
public class VaccineTypeApi {

    @Autowired
    private VaccineTypeService vaccineTypeService;

    @GetMapping("/public/find-all")
    public ResponseEntity<?> getAll(){
        List<VaccineType> result = vaccineTypeService.findAll();
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

}
