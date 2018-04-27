package com.kd.mvc.jms;

import javax.jms.JMSException;
import javax.jms.Message;
import javax.jms.Session;
import javax.jms.TextMessage;

import org.springframework.jms.support.converter.MessageConversionException;
import org.springframework.jms.support.converter.MessageConverter;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;

@Service("innerMessageConverter")
public class TextMessageConverter implements MessageConverter {

	@Override
	public Object fromMessage(Message message) throws JMSException,
			MessageConversionException {
		TextMessage objMessage = (TextMessage) message;
		return objMessage.getText();

	}

	@Override
	public Message toMessage(Object object, Session session)
			throws JMSException, MessageConversionException {
		return session.createTextMessage(JSONObject.toJSONString(object));
	}

}
