package com.web.repository;

import com.web.entity.CustomerProfile;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface CustomerProfileRepository extends JpaRepository<CustomerProfile, Long> {

    @Query("select c from CustomerProfile c where c.user.id = ?1")
    public CustomerProfile findByUser(Long userId);
}
