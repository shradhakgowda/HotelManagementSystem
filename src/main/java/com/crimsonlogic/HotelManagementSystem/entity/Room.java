package com.crimsonlogic.HotelManagementSystem.entity;

import javax.persistence.Column;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import org.hibernate.annotations.GenericGenerator;

import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@NoArgsConstructor
@Entity
public class Room {
    @Id
    @Column(name = "room_id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "custom-id-generator")
	@GenericGenerator(name = "custom-id-generator", strategy = "com.crimsonlogic.HotelManagementSystem.util.IdRoomGenerator")
    private String roomId;

    @Column(name = "room_image")
    private String roomImage;


    @Column(name = "room_price")
    private double roomPrice;

    @Column(name = "room_desc")
    private String roomDesc;

    @Column(name = "room_availability")
    private long roomAvailability;

    @Column(name = "room_type")
    private String roomType;

//    @ManyToOne(fetch = FetchType.EAGER)
//    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
//    private User user;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "hotel_id", referencedColumnName = "hotel_id")
    private Hotel hotel;

    @Column(name = "room_reservation")
    private String roomReservation;
    // Getters and Setters
}
