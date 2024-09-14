package com.crimsonlogic.HotelManagementSystem.util;
import org.hibernate.HibernateException;

import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

import java.io.Serializable;
import java.util.Random;

public class IdRoomGenerator implements IdentifierGenerator {
	private static final int MIN_ID = 100;
	private static final int MAX_ID = 999;
	private Random random = new Random();
 
	@Override
	public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
		long lid = MIN_ID + random.nextInt(MAX_ID - MIN_ID + 1);
		String id = "ROOM" + lid;
		return id;
	}
}