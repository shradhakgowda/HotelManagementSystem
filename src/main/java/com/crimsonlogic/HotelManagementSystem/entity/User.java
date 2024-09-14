package com.crimsonlogic.HotelManagementSystem.entity;

import lombok.Data;
import lombok.NoArgsConstructor;


import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import org.hibernate.annotations.GenericGenerator;
@Data
@NoArgsConstructor
@Entity
@Table(name="users")
public class User {
	
    @Id
    @Column(name = "user_id")
    @GeneratedValue(strategy = GenerationType.AUTO, generator = "custom-id-generator")
	@GenericGenerator(name = "custom-id-generator", strategy = "com.crimsonlogic.HotelManagementSystem.util.IdUserGenerator")
    private String userId;

    @Column(name = "user_name")
    private String userName;

    @Column(name = "user_role")
    private String userRole;

    @Column(name = "user_password")
    private String userPassword;

    @Column(name = "user_phoneno")
    private String userPhoneNo;

    @Column(name = "user_idproof")
    private String userIDProof;

    @Column(name = "user_email")
    private String userEmail;
    
    
    

}


