package com.web.entity;

import com.nimbusds.openid.connect.sdk.claims.Gender;
import com.web.enums.UserType;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Table(name = "account")
@Getter
@Setter
public class User{

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "account_id")
    private Long id;

    private String email;

    private String password;

    private String googleId;

    private String phoneNumber;

    private Boolean actived;

    private Date createdDate;

    @Column(name = "login_type")
    @Enumerated(EnumType.STRING)
    private UserType userType;

    private String activationKey;

    private String rememberKey;

    @ManyToOne
    @JoinColumn(name = "authority_id")
    private Authority authorities;
}

