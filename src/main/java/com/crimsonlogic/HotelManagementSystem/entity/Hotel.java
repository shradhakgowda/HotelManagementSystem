package com.crimsonlogic.HotelManagementSystem.entity;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import org.hibernate.annotations.GenericGenerator;

import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.OneToMany;
import java.util.List;
@Data
@NoArgsConstructor
@Entity
public class Hotel {
    @Id
    @Column(name = "hotel_id")
    private String hotelId;

    @Column(name = "hotel_name")
    private String hotelName;

    @Column(name = "hotel_location")
    private String hotelLocation;

    @Column(name = "hotel_image")
    private String hotelImage;

    @OneToMany(mappedBy = "hotel")
    private List<Room> rooms;

}

