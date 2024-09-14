package com.web.service;

import com.web.entity.VaccineSchedule;
import com.web.exception.MessageException;
import com.web.repository.CustomerScheduleRepository;
import com.web.repository.VaccineScheduleRepository;
import com.web.utils.UserUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Component;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@Component
public class VaccineScheduleService {

    @Autowired
    private VaccineScheduleRepository vaccineScheduleRepository;

    @Autowired
    private CustomerScheduleRepository customerScheduleRepository;

    @Autowired
    private UserUtils userUtils;


    /*
    * api này dùng để thêm lịch tiêm vaccine
    * */
    public VaccineSchedule save(VaccineSchedule vaccineSchedule) {
        vaccineSchedule.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        vaccineSchedule.setUser(userUtils.getUserWithAuthority());
        return vaccineScheduleRepository.save(vaccineSchedule);
    }


    /*
     * api này dùng để cập nhật lịch tiêm vaccine
     * */
    public VaccineSchedule update(VaccineSchedule vaccineSchedule) {
        if (vaccineSchedule.getId() == null){
            throw new MessageException("Id không được null");
        }
        Optional<VaccineSchedule> exist = vaccineScheduleRepository.findById(vaccineSchedule.getId());
        if (exist.isEmpty()){
            throw new MessageException("Không tìm thấy lịch tiêm có id: "+vaccineSchedule.getId());
        }
        vaccineSchedule.setCreatedDate(exist.get().getCreatedDate());
        vaccineSchedule.setUser(exist.get().getUser());
        return vaccineScheduleRepository.save(vaccineSchedule);
    }

    /*
     * api này dùng để xóa lịch tiêm vaccine
     * */
    public void delete(Long id){
        try {
            vaccineScheduleRepository.deleteById(id);
        }
        catch (Exception e){
            throw new MessageException("Lịch tiêm này đã được đăng ký, không thể xóa");
        }
    }

    /*
     * api này dùng để lấy danh sách lịch tiêm vaccine, truyền vào ngày bắt đầu và kết thúc
     * nếu không truyền ngày bd hoặc kt thì lấy mặc định tất cả
     * */

    public Page<VaccineSchedule> vaccineSchedules(Date from, Date to, Pageable pageable){
        Page<VaccineSchedule> page = null;
        if (from == null || to == null) {
            page = vaccineScheduleRepository.findAll(pageable);
        }
        else{
            page = vaccineScheduleRepository.findByDate(from, to , pageable);
        }
        return page;
    }

    public List<VaccineSchedule> findByVacxin(Long vacxinId) {
        LocalDateTime now = LocalDateTime.now();
        List<VaccineSchedule> list = vaccineScheduleRepository.findByVacxin(vacxinId, now);
        return list;
    }

    public VaccineSchedule findById(Long id) {
        Optional<VaccineSchedule> vaccineSchedule = vaccineScheduleRepository.findById(id);
        if (vaccineSchedule.isEmpty()) {
            throw new MessageException("Không tìm thấy lịch tiêm với id: "+id);
        }
        return vaccineSchedule.get();
    }

    public Page<VaccineSchedule> nextSchedule(String param, Pageable pageable){
        if(param == null){
            param = "";
        }
        param = "%"+param+"%";
        Page<VaccineSchedule> page = vaccineScheduleRepository.findByParam(param, LocalDateTime.now(), pageable);
        for(VaccineSchedule v : page.getContent()){
            if(customerScheduleRepository.countRegis(v.getId()) < v.getLimitPeople()){
                v.setInStock(true);
            }
        }
        return page;
    }

    public Page<VaccineSchedule> preSchedule(String param, Pageable pageable){
        if(param == null){
            param = "";
        }
        param = "%"+param+"%";
        Page<VaccineSchedule> page = vaccineScheduleRepository.preFindByParam(param, LocalDateTime.now(), pageable);
        return page;
    }
}
