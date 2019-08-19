package com.jsj.converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.core.convert.converter.Converter;

/**
 * String->Date 日期转换器
 */
public class DateConverter implements Converter<String, Date>{
	
	//日期格式
	private String pattern;

    public void setPattern(String pattern) {
        this.pattern = pattern;
    }
    
	public Date convert(String source) {
		SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
		try {
			return dateFormat.parse(source);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return null;
	}

}
