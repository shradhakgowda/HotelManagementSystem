package com.crimsonlogic.HotelManagementSystem.util;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

import java.io.Serializable;
import java.util.Random;

public class CustomIdGenerator implements IdentifierGenerator {

    private String prefix;

    @Override
    public Serializable generate(SharedSessionContractImplementor session, Object obj) {
        return prefix + new Random().nextInt(10000);
    }

    public void configure(org.hibernate.type.Type type, java.util.Properties params, org.hibernate.dialect.Dialect dialect) {
        prefix = params.getProperty("prefix");
    }
}
