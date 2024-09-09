package com.web.entity;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Timestamp;

@Entity
@Table(name = "payment")
@Getter
@Setter
public class Payment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private Integer amount;

    private Timestamp createdDate;

    private String requestId;

    private String orderId;

    @ManyToOne
    @JoinColumn(name = "customer_schedule_id")
    private CustomerSchedule customerSchedule;

    @ManyToOne
    @JoinColumn(name = "created_by")
    private User createdBy;
}
