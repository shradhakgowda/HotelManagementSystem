package com.crimsonlogic.HotelManagementSystem.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
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
    private String roomId;

    @Column(name = "room_image")
    private String roomImage;


    @Column(name = "room_price")
    private double roomPrice;

    @Column(name = "room_desc")
    private long roomDesc;

    @Column(name = "room_availability")
    private long roomAvailability;

    @Column(name = "room_type")
    private String roomType;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private User user;

    @ManyToOne
    @JoinColumn(name = "hotel_id", referencedColumnName = "hotel_id")
    private Hotel hotel;

    // Getters and Setters
}
