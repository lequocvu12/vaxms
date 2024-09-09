package com.web.api;
import com.nimbusds.openid.connect.sdk.assurance.evidences.Voucher;
import com.web.config.Environment;
import com.web.constants.LogUtils;
import com.web.constants.RequestType;
import com.web.dto.PaymentDto;
import com.web.dto.ResponsePayment;
import com.web.entity.Vaccine;
import com.web.entity.VaccineSchedule;
import com.web.exception.MessageException;
import com.web.models.PaymentResponse;
import com.web.models.QueryStatusTransactionResponse;
import com.web.processor.CreateOrderMoMo;
import com.web.processor.QueryTransactionStatus;
import com.web.repository.CustomerScheduleRepository;
import com.web.repository.VaccineScheduleRepository;
import com.web.service.VaccineScheduleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Optional;

@RestController
@RequestMapping("/api/payment")
@CrossOrigin
public class MomoApi {

    @Autowired
    private VaccineScheduleRepository vaccineScheduleRepository;

    @Autowired
    private CustomerScheduleRepository customerScheduleRepository;


    @PostMapping("/customer/create-url-payment")
    public ResponsePayment getUrlPayment(@RequestBody PaymentDto paymentDto){
        LogUtils.init();
        VaccineSchedule vaccineSchedule = vaccineScheduleRepository.findById(paymentDto.getIdSchedule()).get();
        if(customerScheduleRepository.countRegis(paymentDto.getIdSchedule()) >= vaccineSchedule.getLimitPeople()){
            throw new MessageException("Lịch tiêm vaccine đã hết lượt đăng ký");
        }
        Long td = Long.valueOf(vaccineSchedule.getVaccine().getPrice());
        System.out.println("td: "+td);
        String orderId = String.valueOf(System.currentTimeMillis());
        String requestId = String.valueOf(System.currentTimeMillis());
        Environment environment = Environment.selectEnv("dev");
        PaymentResponse captureATMMoMoResponse = null;
        try {
            captureATMMoMoResponse = CreateOrderMoMo.process(environment, orderId, requestId, Long.toString(td), paymentDto.getContent(), paymentDto.getReturnUrl(), paymentDto.getNotifyUrl(), "", RequestType.PAY_WITH_ATM, null);
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println("url ====: "+captureATMMoMoResponse.getPayUrl());
        ResponsePayment responsePayment = new ResponsePayment(captureATMMoMoResponse.getPayUrl(),orderId,requestId);
        return responsePayment;
    }



}
