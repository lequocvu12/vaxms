package com.web.repository;

import com.web.entity.VaccineType;
import org.springframework.data.jpa.repository.JpaRepository;

public interface VaccineTypeRepository extends JpaRepository<VaccineType, Long> {
}
