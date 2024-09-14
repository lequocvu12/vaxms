package com.web.api;

import com.web.entity.Vaccine;
import com.web.entity.VaccineSchedule;
import com.web.exception.MessageException;
import com.web.service.VaccineScheduleService;
import com.web.service.VaccineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

@RestController
@RequestMapping("/api/vaccine-schedule")
@CrossOrigin
public class VaccineScheduleApi {

    @Autowired
    private VaccineScheduleService vaccineScheduleService;

    @GetMapping("/all/find-all-page")
    public ResponseEntity<?> getAll(@RequestParam(value = "from", required = false)Date from,
                                    @RequestParam(value = "to", required = false)Date to, Pageable pageable){
        Page<VaccineSchedule> result = vaccineScheduleService.vaccineSchedules(from, to, pageable);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/all/find-by-vacxin")
    public ResponseEntity<?> findByVacxin(@RequestParam Long idVacxin){
        List<VaccineSchedule> result = vaccineScheduleService.findByVacxin(idVacxin);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/all/find-by-id")
    public ResponseEntity<?> getById(@RequestParam(value = "id") Long id){
        VaccineSchedule result = vaccineScheduleService.findById(id);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @PostMapping("/admin/create")
    public ResponseEntity<?> createByAdmin(@RequestBody VaccineSchedule vaccineSchedule) {
        VaccineSchedule result = vaccineScheduleService.save(vaccineSchedule);
        return new ResponseEntity(result, HttpStatus.CREATED);
    }

    @PostMapping("/admin/update")
    public ResponseEntity<?> updateByAdmin(@RequestBody VaccineSchedule vaccineSchedule) {
        VaccineSchedule result = vaccineScheduleService.update(vaccineSchedule);
        return new ResponseEntity(result, HttpStatus.CREATED);
    }

    @DeleteMapping("/admin/delete")
    public void delete(@RequestParam("id") Long id){
        vaccineScheduleService.delete(id);
    }


    @GetMapping("/public/next-schedule")
    public ResponseEntity<?> nextSchedule(Pageable pageable, @RequestParam(required = false) String param){
        Page<VaccineSchedule> result = vaccineScheduleService.nextSchedule(param, pageable);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/public/pre-schedule")
    public ResponseEntity<?> preSchedule(Pageable pageable, @RequestParam(required = false) String param){
        Page<VaccineSchedule> result = vaccineScheduleService.preSchedule(param, pageable);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }

    @GetMapping("/public/find-by-id")
    public ResponseEntity<?> findById(@RequestParam(value = "id") Long id){
        VaccineSchedule result = vaccineScheduleService.findById(id);
        return new ResponseEntity<>(result, HttpStatus.OK);
    }


}
