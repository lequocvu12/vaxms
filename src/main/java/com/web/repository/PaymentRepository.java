package com.web.repository;

import com.web.entity.Payment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.Optional;

public interface PaymentRepository extends JpaRepository<Payment, Long> {

    @Query("select h from Payment h where h.orderId = ?1 and h.requestId = ?2")
    Optional<Payment> findByOrderIdAndRequestId(String orderid, String requestId);
}
