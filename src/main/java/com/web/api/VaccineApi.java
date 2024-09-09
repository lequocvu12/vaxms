package com.web.api;

import com.web.dto.VaccineTypeResponse;
import com.web.entity.Center;
import com.web.entity.Vaccine;
import com.web.service.CenterService;
import com.web.service.VaccineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/vaccine")
@CrossOrigin
public class VaccineApi {

    @Autowired
    private VaccineService vaccineService;

    @GetMapping("/all/find-all")
    public ResponseEntity<?> getAll(){
        List<Vaccine> result = vaccineService.findAll();
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/all/find-by-type")
    public ResponseEntity<?> findByType(@RequestParam Long typeId){
        List<Vaccine> result = vaccineService.findByType(typeId);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/public/vaccine-type")
    public ResponseEntity<?> findByType(){
        List<VaccineTypeResponse> result = vaccineService.allVaccinType();
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

}
