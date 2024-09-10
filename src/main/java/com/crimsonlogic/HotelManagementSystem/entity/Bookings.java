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

import java.util.Date;
@Data
@NoArgsConstructor
@Entity

public class Bookings {
    @Id
    @Column(name = "booking_id")
    private String bookingId;

    @Column(name = "booking_date")
    private Date bookingDate;

    @Column(name = "booking_date_from")
    private Date bookingDateFrom;

    @Column(name = "booking_date_to")
    private Date bookingDateTo;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "room_id", referencedColumnName = "room_id")
    private Room room;

}
