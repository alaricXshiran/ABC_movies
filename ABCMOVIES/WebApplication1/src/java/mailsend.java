
import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

public class mailsend {

    public static void send(String to, String subject, String msg) {

        final String emailAddress = "ad09f6542c348c";
        final String emailPassword = "5b58e3105569ae";

        try {
            Properties props = new Properties();
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.host", "smtp.mailtrap.io");
            props.put("mail.smtp.port", "2525");
            props.put("mail.smtp.ssl.trust", "smtp.mailtrap.io");

            javax.mail.Session session = javax.mail.Session.getInstance(props,
                    new javax.mail.Authenticator() {
                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(emailAddress, emailPassword);
                }
            });

            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(emailAddress));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(subject);
            
            message.setContent(msg, "text/html;charset=utf-8");
            Transport.send(message);
            System.out.println("send email to " +to);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
