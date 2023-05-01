package tw.wematch.util;

import java.util.Properties;

import org.apache.commons.mail.DefaultAuthenticator;
import org.apache.commons.mail.EmailException;
import org.apache.commons.mail.HtmlEmail;

/**
 * @author https://blog.yslifes.com/archives/930
 *
 */
public class Sender extends java.lang.Thread {
	private String content;
	private org.apache.log4j.Logger log;
	private String subject;
	private String to;
	private static Properties property = null;

	public static void loadProperties() {
		try {
			property = new Properties();
			System.out.println("使用設定檔路徑：" + Sender.class.getResource("/mail.properties"));
			java.io.BufferedReader reader = new java.io.BufferedReader(
					new java.io.FileReader(Sender.class.getResource("/mail.properties").getFile()));
			String maillSettings = null;
			while ((maillSettings = reader.readLine()) != null) {
				String maillSettingKeyValue[] = maillSettings.split("=");
				property.put(maillSettingKeyValue[0].trim(), maillSettingKeyValue[1].trim());
				System.out.println(maillSettingKeyValue[0].trim() + ": " + maillSettingKeyValue[1].trim());
			}
			reader.close();
		} catch (java.io.IOException e) {
		}
	}

	public Sender(String to, String subject, String content) {
		super();
		if (property == null)
			loadProperties();
		this.content = content;
		this.to = to;
		log = org.apache.log4j.Logger.getLogger(this.getClass());
		this.subject = subject;
	}

	public void run() {
		HtmlEmail email = new HtmlEmail();
		try {
			String host = property.getProperty("host");
			String from = property.getProperty("from");
			String from_name = property.getProperty("fromName");
			String user = property.getProperty("user");
			String pwd = property.getProperty("pwd");
			String port = property.getProperty("port");
			email.setStartTLSEnabled(true);
			email.setHostName(host);
			email.setAuthenticator(new DefaultAuthenticator(user, pwd));
			email.setSmtpPort(Integer.parseInt(port));
			email.setFrom(from, from_name);
			email.setCharset("utf-8");
			email.addTo(to);
			email.setSubject(subject);
			email.setHtmlMsg(content);
			email.send();
		} catch (EmailException e) {
			e.printStackTrace();
			log.info(e);
		} catch (Exception e) {
			e.printStackTrace();
			log.info(e);
		}
	}

}