package com.crimsonlogic.HotelManagementSystem.service;

import java.util.List;

import com.crimsonlogic.HotelManagementSystem.entity.Payment;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;

public interface PaymentService {
    public Payment registerPayment(Payment payment);
    public List<Payment> listAllPayments();
    public Payment showPaymentById(String paymentId);
    public void deletePayment(String paymentId);
    public void updatePayment(String paymentId, Payment payment) throws ResourceNotFoundException;
    public List<Payment> listAllPaymentsByUserId(String userId);
}
