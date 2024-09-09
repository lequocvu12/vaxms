package com.web.repository;

import com.web.entity.Vaccine;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface VaccineRepository extends JpaRepository<Vaccine, Long> {

    @Query("select v from Vaccine v where v.vaccineType.id = ?1")
    public List<Vaccine> findByType(Long typeId);
}
