package com.crimsonlogic.HotelManagementSystem.entity;
/*entity class storing booking details
name:shradha
date:13th september
*/
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
@Data
@NoArgsConstructor
@Entity
public class Bookings {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "custom-id-generator")
	@GenericGenerator(name = "custom-id-generator", strategy = "com.crimsonlogic.HotelManagementSystem.util.IdBookingGenerator")
    @Column(name = "booking_id")
    private String bookingId;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "booking_date", nullable = false)
   private Date bookingDate;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "booking_date_from")
    private Date bookingDateFrom;

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column(name = "booking_date_to")
    private Date bookingDateTo;

    
    @Column(name = "room_total_price")
    private Double roomTotalPrice;
    
    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "user_id", referencedColumnName = "user_id")
    private User user;

    @ManyToOne(fetch = FetchType.EAGER)
    @JoinColumn(name = "room_id", referencedColumnName = "room_id")
    private Room room;

	


}
