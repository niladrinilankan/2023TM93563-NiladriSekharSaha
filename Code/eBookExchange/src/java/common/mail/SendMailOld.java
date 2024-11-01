/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package common.mail;

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
 * @author Niladri Sekhar Saha
 */
public class SendMailOld {

    private String toAddress;
    private String fromAddress;
    private String bccAddress = "";
    private String ccAddress;
    private String subject;
    private String message;
    private static final String PROP_FILE = "mailConfig.properties";

    public SendMailOld() {
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

    public int sendMail() {
        try {
            InputStream is = SendMailOld.class.getResourceAsStream(PROP_FILE);
            Properties props = new Properties();
            props.load(is);
            
            Session session = Session.getInstance(props, new javax.mail.Authenticator() {
                
            protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(
                            "niladri.saha", "sab_kamalik_11");// Specify the Username and the PassWord
                }
            });

            //Session session = Session.getInstance(props);
            // -- Create a new message --
            Message msg = new MimeMessage(session);
            // -- Set the FROM and TO fields --
            msg.setFrom(new InternetAddress(getFromAddress()));

            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(toAddress, false));
            if (!getBccAddress().equals("")) {
                msg.setRecipients(Message.RecipientType.BCC, InternetAddress.parse(bccAddress, false));
            }

            msg.setSubject(subject);
            msg.setText(message);

            Transport.send(msg);

            System.out.println("Message sent to " + getToAddress() + " OK.");
            System.out.println("Message sent to CC " + getCcAddress() + " OK.");
            return 0;
        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("Exception " + ex);
            return -1;
        }
    }

// Also include an inner class that is used for authentication purposes
    private class SMTPAuthenticator extends javax.mail.Authenticator {

        @Override
        public PasswordAuthentication getPasswordAuthentication() {
            String username = "niladri.saha@cdac.in";           // specify your email id here (sender's email id)
            String password = "sab_kamalik_11";                                      // specify your password here
            return new PasswordAuthentication(username, password);
        }
    }
}
