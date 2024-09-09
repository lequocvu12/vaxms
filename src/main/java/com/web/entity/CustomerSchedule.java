package com.web.entity;

import com.web.enums.StatusCustomerSchedule;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Date;
import java.sql.Timestamp;

@Entity
@Table(name = "customer_schedule")
@Getter
@Setter
public class CustomerSchedule {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private Timestamp createdDate;

    private Boolean payStatus;

    private String fullName;

    private Date dob;

    private String phone;

    private String address;

    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private StatusCustomerSchedule statusCustomerSchedule;

    @ManyToOne
    @JoinColumn(name = "account_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "vaccine_schedule_id")
    private VaccineSchedule vaccineSchedule;
}
