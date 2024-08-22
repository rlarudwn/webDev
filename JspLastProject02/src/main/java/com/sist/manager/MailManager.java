/*package com.sist.manager;

import java.net.PasswordAuthentication;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailManager {
	private String style="body{"
			+ "padding:1.5em;"
			+ "background:#F5F5F5;"
			+ "}"
			+ "table{"
			+ "border:1px solid #EDEDED;"
			+ "font-size:9em;"
			+ "box-shadow:0 2px 5px rgba(0, 0, 0,  .25);"
			+ "width:100%;"
			+ "border-collapse:collapse";
	public void mailSender(String result) {
		String host="smtp.naver.com";
		String user="";
		String password="";
		
		Properties props=new Properties();
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", 587);
		props.put("mail.smtp.auth", true);
		Session session=Session.getDefaultInstance(props,new javax.mail.Authenticator(
				@Override
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user, password);
				}
				));
		try {
			MimeMessage message=new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress());
			message.setSubject("제목");
			message.setContent(result, "text/html;charset=UTF-8");
			Transport.send(message);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
*/