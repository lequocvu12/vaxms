package com.web.enums;

import lombok.AllArgsConstructor;
import lombok.Getter;

@Getter
@AllArgsConstructor
public enum StatusCustomerSchedule {

    pending, //Đã đăng ký
    confirmed, // hoãn
    cancelled, // hoàn thành tiêm
}
