/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author CDAC-49
 */
public class GetMonthYear {

    private Date current_date = new Date();

    public GetMonthYear() {
    }

    public String getYear() {
        String pattern = "yyyy";
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        return format.format(current_date);
    }

    public String getMonth() {
        String pattern = "MM";
        SimpleDateFormat format = new SimpleDateFormat(pattern);
        return format.format(current_date);
    }

    public String getFinYear() {
        int month = Integer.parseInt(getMonth());
        System.out.println("Month:-" + month);
        int year = Integer.parseInt(getYear());
        if (month >= 3) {
            return (year) + "-" + (year + 1);
        } else {
            return (year - 1) + "-" + (year);
        }
    }

    public List getFinYearList() {
        List<String> yearList = new ArrayList();
        String currentYear = getYear();
        String nextYear = String.valueOf(Integer.parseInt(currentYear) + 1);
        String lastYear = String.valueOf(Integer.parseInt(currentYear) - 1);
        yearList.add(currentYear);
        yearList.add(nextYear);
        yearList.add(lastYear);
        return yearList;
    }

    public Date getCurrent_date() {
        return current_date;
    }

    public void setCurrent_date(Date current_date) {
        this.current_date = current_date;
    }

    public boolean compareDates(String fromDate, String toDate) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            Date from_date = sdf.parse(fromDate);
            Date to_date = sdf.parse(toDate);
            if (from_date.compareTo(to_date) > 0) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
     public boolean compareDateFormat(String fromDate, String toDate) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy");
            Date from_date = sdf.parse(fromDate);
            Date to_date = sdf.parse(toDate);
            if (from_date.compareTo(to_date) > 0) {
                return false;
            } else {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private long compareTo(Date from_date, Date to_date) {
        return from_date.getTime() - to_date.getTime();
    }
}
