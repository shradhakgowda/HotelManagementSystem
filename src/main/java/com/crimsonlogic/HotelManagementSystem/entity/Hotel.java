package com.crimsonlogic.HotelManagementSystem.entity;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Column;


import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.OneToMany;

import org.hibernate.annotations.GenericGenerator;

import java.util.List;
@Data
@NoArgsConstructor
@Entity
public class Hotel {
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "custom-id-generator")
	@GenericGenerator(name = "custom-id-generator", strategy = "com.crimsonlogic.HotelManagementSystem.util.IdHotelGenerator")
    @Column(name = "hotel_id")
    private String hotelId;

    @Column(name = "hotel_name")
    private String hotelName;

    @Column(name = "hotel_location")
    private String hotelLocation;

    @Column(name = "hotel_image")
    private String hotelImage;

 

}

