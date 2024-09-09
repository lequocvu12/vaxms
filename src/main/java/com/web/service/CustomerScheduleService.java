package com.web.service;

import com.web.config.Environment;
import com.web.constants.LogUtils;
import com.web.entity.CustomerSchedule;
import com.web.entity.Payment;
import com.web.entity.User;
import com.web.entity.VaccineSchedule;
import com.web.enums.StatusCustomerSchedule;
import com.web.exception.MessageException;
import com.web.models.QueryStatusTransactionResponse;
import com.web.processor.QueryTransactionStatus;
import com.web.repository.CustomerScheduleRepository;
import com.web.repository.PaymentRepository;
import com.web.repository.VaccineScheduleRepository;
import com.web.utils.UserUtils;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.sql.Timestamp;
import java.util.List;
import java.util.Optional;

@Component
public class CustomerScheduleService {

    @Autowired
    private CustomerScheduleRepository customerScheduleRepository;

    @Autowired
    private UserUtils userUtils;

    @Autowired
    private PaymentRepository paymentRepository;

    @Autowired
    private VaccineScheduleRepository vaccineScheduleRepository;

    public CustomerSchedule create(CustomerSchedule customerSchedule, String orderId, String requestId){
        LogUtils.init();
        if(paymentRepository.findByOrderIdAndRequestId(orderId, requestId).isPresent()){
            throw new MessageException("Không được thực hiện hành động này");
        }
        Environment environment = Environment.selectEnv("dev");
        try {
            QueryStatusTransactionResponse queryStatusTransactionResponse = QueryTransactionStatus.process(environment, orderId, requestId);
            System.out.println("qqqq-----------------------------------------------------------"+queryStatusTransactionResponse.getMessage());
            if(queryStatusTransactionResponse.getResultCode() != 0){
                throw new MessageException("Chưa được thanh toán");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new MessageException("Chưa được thanh toán");
        }
        User user = userUtils.getUserWithAuthority();
        customerSchedule.setUser(user);
        customerSchedule.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        customerSchedule.setStatusCustomerSchedule(StatusCustomerSchedule.pending);
        customerSchedule.setPayStatus(true);
        customerScheduleRepository.save(customerSchedule);

        VaccineSchedule vaccineSchedule = vaccineScheduleRepository.findById(customerSchedule.getVaccineSchedule().getId()).get();
        Payment payment = new Payment();
        payment.setCreatedDate(new Timestamp(System.currentTimeMillis()));
        payment.setCreatedBy(user);
        payment.setCustomerSchedule(customerSchedule);
        payment.setAmount(vaccineSchedule.getVaccine().getPrice());
        payment.setOrderId(orderId);
        payment.setRequestId(requestId);
        paymentRepository.save(payment);
        return customerSchedule;
    }

    public List<CustomerSchedule> mySchedule(){
        User user = userUtils.getUserWithAuthority();
        List<CustomerSchedule> list = customerScheduleRepository.findByUser(user.getId());
        return list;
    }

    public void cancel(Long id) {
        Optional<CustomerSchedule> customerSchedule = customerScheduleRepository.findById(id);
        if (customerSchedule.isEmpty()) {
            throw new MessageException("Không tìm thấy lịch đã đăng ký");
        }
        if(customerSchedule.get().getUser().getId() != userUtils.getUserWithAuthority().getId()){
            throw new MessageException("Bạn không đủ quyền");
        }
        if (customerSchedule.get().getPayStatus() == true) {
            throw new MessageException("Đã thanh toán, không thể hoãn");
        }
        if (customerSchedule.get().getStatusCustomerSchedule().equals(StatusCustomerSchedule.cancelled)) {
            throw new MessageException("Không được lặp lại hành động");
        }
        customerSchedule.get().setStatusCustomerSchedule(StatusCustomerSchedule.cancelled);
        customerScheduleRepository.save(customerSchedule.get());
    }
}
