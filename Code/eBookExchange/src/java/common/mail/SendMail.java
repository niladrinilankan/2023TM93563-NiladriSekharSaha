/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common.mail;

/**
 *
 * @author CDAC-01
 */
import java.io.InputStream;
import java.util.Properties;
import javax.mail.*;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author Manas Chakraborty
 */
public class SendMail {

    private String toAddress;
    private String fromAddress;
    private String bccAddress = "";
    private String ccAddress;
    private String subject;
    private String message;
    private Address address;
    private static final String PROP_FILE = "mailConfig_CDAC.properties";
    String username;
    String password;

    public SendMail() {
    }

    public String getBccAddress() {
        return bccAddress;
    }

    public void setBccAddress(String bccAddress) {
        this.bccAddress = bccAddress;
    }

    public String getCcAddress() {
        return ccAddress;
    }

    public void setCcAddress(String ccAddress) {
        this.ccAddress = ccAddress;
    }

    public String getFromAddress() {
        return fromAddress;
    }

    public void setFromAddress(String fromAddress) {
        this.fromAddress = fromAddress;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getToAddress() {
        return toAddress;
    }

    public void setToAddress(String toAddress) {
        this.toAddress = toAddress;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    
    
    public int sendMail() {
        try {
            InputStream is = SendMail.class.getResourceAsStream(PROP_FILE);
            Properties props = new Properties();
            props.load(is);
            username = props.getProperty("user.name");
            password = props.getProperty("user.password");
            fromAddress = props.getProperty("user.name");
            
            System.out.println("Message sent to " + getToAddress() + " OK.");
            

            System.out.println("user: " + username);
            Session session = Session.getInstance(props,
                    new javax.mail.Authenticator() {
                        protected PasswordAuthentication getPasswordAuthentication() {
                            return new PasswordAuthentication(username, password);
                        }
                    });

            // -- Create a new message --
            Message msg = new MimeMessage(session);

            // -- Set the FROM and TO fields --
            msg.setFrom(new InternetAddress(getFromAddress()));

            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toAddress, false));
            
            //msg.setRecipients(Message.RecipientType.CC, InternetAddress.parse(ccAddress, false));
            //msg.setRecipients(Message.RecipientType.BCC, InternetAddress.parse(bccAddress, false));

            address = new InternetAddress(fromAddress, "FSTP Online Portal");
            msg.setFrom(address);
            msg.setSubject(subject);
            //String body=(String)message;
            //msg.setText(message);
            msg.setContent(message, "text/html");
            //msg.setContent(body,"text/html","html");
            Transport.send(msg);

            System.out.println("Message sent to " + getToAddress() + " OK.");
            return 1;
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception " + ex);
            return 0;
        }
    }
}