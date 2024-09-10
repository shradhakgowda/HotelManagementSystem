package com.crimsonlogic.HotelManagementSystem.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class EventManagementSystemServletInitializer extends AbstractAnnotationConfigDispatcherServletInitializer{

	@Override
	protected Class<?>[] getRootConfigClasses() {

		return new Class[] {AppPersistentContext.class};
	}

	@Override
	protected Class<?>[] getServletConfigClasses() {
	
		return new Class[] {AppConfig.class};
	}

	@Override
	protected String[] getServletMappings() {
		return new String[] { "/" };
	}
	
}