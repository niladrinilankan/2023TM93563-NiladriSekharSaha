/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import java.math.*;

/**
 *
 * @author CDAC-01
 */
public class ScriptCheck {

    public String error;
    private static Pattern[] patterns = new Pattern[]{
        // Script fragments
        Pattern.compile("<script>(.*?)</script>", Pattern.CASE_INSENSITIVE),
        Pattern.compile("<script (.*?)>(.*?)", Pattern.CASE_INSENSITIVE),
        // src='...'
        Pattern.compile("src[\r\n]*=[\r\n]*\\\'(.*?)\\\'", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        Pattern.compile("src[\r\n]*=[\r\n]*\\\"(.*?)\\\"", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        // lonely script tags
        Pattern.compile("</script>", Pattern.CASE_INSENSITIVE),
        Pattern.compile("<script(.*?)>", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        Pattern.compile("(.*?)<script(.*?)>", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        Pattern.compile("(.*?)<script(.*?)>(.*?)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        // eval(...)
        Pattern.compile("eval\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        // expression(...)
        Pattern.compile("expression\\((.*?)\\)", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        // javascript:...
        Pattern.compile("javascript:", Pattern.CASE_INSENSITIVE),
        // vbscript:...
        Pattern.compile("vbscript:", Pattern.CASE_INSENSITIVE),
        Pattern.compile("jsp:", Pattern.CASE_INSENSITIVE),
        Pattern.compile("sql:", Pattern.CASE_INSENSITIVE),
        Pattern.compile("<jsp:", Pattern.CASE_INSENSITIVE),
        Pattern.compile("<sql:", Pattern.CASE_INSENSITIVE),
        // onload(...)=...
        Pattern.compile("onload(.*?)=", Pattern.CASE_INSENSITIVE | Pattern.MULTILINE | Pattern.DOTALL),
        Pattern.compile("<img(\\s+.*?)(?:src\\s*=\\s*(?:'|\")(.*?)(?:'|\"))(.*?)/>",
        Pattern.DOTALL | Pattern.CASE_INSENSITIVE),
        Pattern.compile("(.*?)<iframe>(.*?)</iframe>", Pattern.CASE_INSENSITIVE),
        Pattern.compile("(.*?)<(.*?)iframe(.*?)>(.*?)", Pattern.CASE_INSENSITIVE),
        Pattern.compile("(.*?)<(.*?)object(.*?)>(.*?)", Pattern.CASE_INSENSITIVE),
        Pattern.compile("(.*?)<(.*?)div(.*?)>(.*?)", Pattern.CASE_INSENSITIVE),
        Pattern.compile("(.*?)<(.*?)table(.*?)>", Pattern.CASE_INSENSITIVE),
        Pattern.compile("(.*?)<(.*?)textarea(.*?)>", Pattern.CASE_INSENSITIVE),
        Pattern.compile("(.*?)<(.*?)tr(.*?)>(.*?)", Pattern.CASE_INSENSITIVE),
        Pattern.compile("(.*?)<(.*?)td(.*?)>(.*?)", Pattern.CASE_INSENSITIVE),
        Pattern.compile("(.*?)<(.*?)link(.*?)>(.*?)", Pattern.CASE_INSENSITIVE),
        Pattern.compile("(.*?)<(.*?)input(.*?)>(.*?)", Pattern.CASE_INSENSITIVE),
        Pattern.compile("(.*?)<(.*?)body(.*?)>(.*?)", Pattern.CASE_INSENSITIVE)
    };
    private int hasscript = 0;

    public boolean Check(String str) {

        //System.out.println(patterns);
        for (Pattern scriptPattern : patterns) {
            //System.out.println(scriptPattern);
            if (scriptPattern.matcher(str.toLowerCase()).matches()) {
                hasscript++;
            }
        }
        if (hasscript > 0) {
            // System.out.println("script:" + hasscript);
            return true;
        } else {
            return false;
        }
    }

    public boolean CheckNumber(String str) {
        String pattern = "\\d{0,9}";
        if (str.matches(pattern)) {
            return true;
        } else {
            return false;
        }

    }

    public boolean isDouble(String str) {
        try {
            Double.parseDouble(str);
            return true;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    public boolean CheckPhoneNumber(String str) {
        String pattern = "^(\\+91[\\-\\s]?)?[0]?(91)?[789]\\d{9}$";
        if (str.matches(pattern)) {
            return true;
        } else {
            return false;
        }

    }

    public boolean CheckMobileNumber(String str) {
        String pattern = "^(?:(?:\\+|0{0,2})91(\\s*[\\-]\\s*)?|[0]?)?[789]\\d{9}$";
        if (str.matches(pattern)) {
            return true;
        } else {
            return false;
        }

    }

    public boolean checkPassword(String password) {
        char c[] = password.toCharArray();
        boolean upper = false;
        boolean lower = false;
        boolean number = false;
        boolean special = false;
        String splChr = "/*!@#$%^&*()\"{}_[]|\\?/<>,.";

        if (password.length() < 7) {
            error = "Password should be minimum 7 characters with one or more Upper/Lower case letter,Number and Special Character";
            return false;
        }
        for (int count = 0; count < c.length; count++) {
            if (Character.isUpperCase(c[count])) {
                upper = true;
            } else if (Character.isLowerCase(c[count])) {
                lower = true;
            } else if (Character.isDigit(c[count])) {
                number = true;
            }

        }
        for (int count = 0; count < password.length(); count++) {
            System.out.println(count + " " + password.substring(count, count + 1));
            if (splChr.contains(password.substring(count, count + 1))) {
                System.out.println("Special Character Found");
                special = true;
            }
        }
        System.out.println(upper + " " + lower + " " + number + " " + special);
        if (upper == false || lower == false || number == false || special == false) {
            error = "Password should be minimum 7 characters with one or more Upper/Lower case letter,Number and Special Character";
            return false;
        } else {
            return true;
        }
    }

    public boolean checkSpecialChars(String Str) {
        Pattern p = Pattern.compile("[^a-z ]", Pattern.CASE_INSENSITIVE);
        Matcher m = p.matcher(Str);
        boolean flag = m.find();
        if (flag) {
            return true;
        } else {
            return false;
        }
    }

    public boolean checkSpecialCharsForDesc(String Str) {
        Pattern p = Pattern.compile("[^a-z0-9\\.\\'\\-\"\\_@#(),&?/\\ \n\r]", Pattern.CASE_INSENSITIVE);
        Matcher m = p.matcher(Str);
        boolean flag = m.find();
        System.out.println("test123: " + flag);
        if (flag) {
            return true;
        } else {
            return false;
        }
    }

    public boolean checkNoSplChr(String Str) {

        Pattern p = Pattern.compile("[^a-z0-9]", Pattern.CASE_INSENSITIVE);
        Matcher m = p.matcher(Str);
        boolean flag = m.find();
        if (flag) {
            return true;
        } else {
            return false;
        }

    }

    public boolean CheckCurrency(String str) {
        Pattern p = Pattern.compile("[^0-9\\.]", Pattern.CASE_INSENSITIVE);
        Matcher m = p.matcher(str);
        boolean flag = m.find();
        if (flag) {
            return true;
        } else {
            return false;
        }

    }

    public boolean isValidEmailAddress(String email) {
        Pattern p = Pattern.compile("[a-zA-Z0-9\\+\\.\\_\\%\\-\\+]{1,256}"
                + "\\@"
                + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}"
                + "("
                + "\\."
                + "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}"
                + ")+");
        return p.matcher(email).matches();
    }
}
