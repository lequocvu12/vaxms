package com.web.repository;

import com.web.entity.VaccineSchedule;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.sql.Date;
import java.time.LocalDateTime;
import java.util.List;

public interface VaccineScheduleRepository extends JpaRepository<VaccineSchedule, Long> {

    @Query(value = "select * from vaccine_schedule v where DATE(v.start_date) >= ?1 and DATE(v.end_date) <= ?2", nativeQuery = true)
    public Page<VaccineSchedule> findByDate(Date from , Date to, Pageable pageable);

    @Query(value = "select v.* from vaccine_schedule v where v.end_date >= ?2 and v.vaccine_id = ?1 " +
            "and (v.limit_people > " +
            "(select count(cs.id) from customer_schedule cs where cs.vaccine_schedule_id = v.id and cs.status != 'cancelled') )", nativeQuery = true)
    public List<VaccineSchedule> findByVacxin(Long vacxinId, LocalDateTime now);

    @Query("select v from VaccineSchedule v where v.vaccine.name like ?1 and v.endDate> ?2")
    public Page<VaccineSchedule> findByParam(String param, LocalDateTime now, Pageable pageable);

    @Query("select v from VaccineSchedule v where v.vaccine.name like ?1 and v.endDate <= ?2")
    public Page<VaccineSchedule> preFindByParam(String param, LocalDateTime now, Pageable pageable);
}
