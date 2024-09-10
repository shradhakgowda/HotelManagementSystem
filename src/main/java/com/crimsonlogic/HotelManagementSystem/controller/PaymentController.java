package com.crimsonlogic.HotelManagementSystem.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.crimsonlogic.HotelManagementSystem.entity.Payment;
import com.crimsonlogic.HotelManagementSystem.exception.ResourceNotFoundException;
import com.crimsonlogic.HotelManagementSystem.service.PaymentService;

@RestController
@RequestMapping("/api/payments")
public class PaymentController {

    @Autowired
    private PaymentService paymentService;

    @PostMapping("/registerpayment")
    public Payment registerPayment(@RequestBody Payment payment) {
        return paymentService.registerPayment(payment);
    }

    @GetMapping("/listallpayments")
    public List<Payment> listAllPayments() {
        return paymentService.listAllPayments();
    }

    @GetMapping("/showpaymentbyid/{paymentid}")
    public Payment showPaymentById(@PathVariable("paymentid") String paymentId) {
        return paymentService.showPaymentById(paymentId);
    }

    @DeleteMapping("/deletepayment/{paymentid}")
    public void deletePayment(@PathVariable("paymentid") String paymentId) {
        paymentService.deletePayment(paymentId);
    }

    @PutMapping("/updatepayment/{paymentid}")
    public void updatePayment(@PathVariable("paymentid") String paymentId, @RequestBody Payment payment) {
        try {
			paymentService.updatePayment(paymentId, payment);
		} catch (ResourceNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
