package com.crimsonlogic.HotelManagementSystem.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import org.hibernate.annotations.GenericGenerator;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
@Data
@NoArgsConstructor
@Entity
public class Payment {
    @Id
    @Column(name = "payment_id")
    private String paymentId;

    @Column(name = "room_price")
    private BigDecimal roomPrice;

    @Column(name = "total_price")
    private BigDecimal totalPrice;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "room_id", referencedColumnName = "room_id")
    private Room room;

    @ManyToOne
    @JoinColumn(name = "bookings_id", referencedColumnName = "booking_id")
    private Bookings booking;

}

