package tw.wematch.util;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.log4j.Logger;
/**
 * @author https://blog.yslifes.com/archives/930
 *
 */
public class MailUtils {
	private static Properties mailServerProperties = null;

	private static Logger logger = Logger.getLogger(MailUtils.class);

	public static void generateAndSendEmail(String[] to, String subject, String html)
			throws AddressException, MessagingException {

		if (mailServerProperties == null) {
			logger.info("\n 1st ===> setup Mail Server Properties..");
			mailServerProperties = System.getProperties();
			mailServerProperties.put("mail.smtp.port", "587");
			mailServerProperties.put("mail.smtp.ssl.trust", "smtp.gmail.com");
			mailServerProperties.put("mail.smtp.auth", "true");
			mailServerProperties.put("mail.smtp.starttls.enable", "true");
			logger.info("Mail Server Properties have been setup successfully..");

		}
		logger.info("\n\n 2nd ===> get Mail Session..");
		Session getMailSession = Session.getDefaultInstance(mailServerProperties, null);
		MimeMessage generateMailMessage = new MimeMessage(getMailSession);
		for (int i = 0; i < to.length; i++)
			generateMailMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(to[i]));

		generateMailMessage.setSubject(subject);
		String emailBody = html;
		generateMailMessage.setContent(emailBody, "text/html; charset=UTF-8");
		logger.info("Mail Session has been created successfully..");

		logger.info("\n\n 3rd ===> Get Session and Send mail");
		Transport transport = getMailSession.getTransport("smtp");

		transport.connect("smtp.gmail.com", 587, "jmtforg@gmail.com", "eeit117P@ssw0rd");
		transport.sendMessage(generateMailMessage, generateMailMessage.getAllRecipients());
		transport.close();
	}

}
