package com.crimsonlogic.HotelManagementSystem.entity;

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

import java.math.BigDecimal;
import java.util.Date;

@Data
@NoArgsConstructor
@Entity
public class Payment {
	
	 @Id
	    @GeneratedValue(strategy = GenerationType.AUTO, generator = "custom-id-generator")
		@GenericGenerator(name = "custom-id-generator", strategy = "com.crimsonlogic.HotelManagementSystem.util.PaymentBookingGenerator")
	@Column(name = "payment_id")
	private String paymentId;

	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@Column(name = "payment_date", nullable = false)
	private Date paymentDate;

	@Column(name = "total_price")
	private BigDecimal totalPrice;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id", referencedColumnName = "user_id")
	private User user;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "room_id", referencedColumnName = "room_id")
	private Room room;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "bookings_id", referencedColumnName = "booking_id")
	private Bookings booking;

}
