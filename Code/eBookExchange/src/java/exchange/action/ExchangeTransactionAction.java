/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package exchange.action;

import book_list.bean.BookListBean;
import exchange.bean.ExchangeTransactionBean;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import dbconfig.Ibatis;
import java.io.IOException;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;

/**
 *
 * @author Shampa Dey
 */
public class ExchangeTransactionAction extends ActionSupport implements SessionAware, Preparable {

    private BookListBean booklistBean = new BookListBean();
    private ExchangeTransactionBean exchangeTransactionBean = new ExchangeTransactionBean();
    private List<ExchangeTransactionBean> exchangeTransactionList;
    Map<String, Object> session;

    public ExchangeTransactionAction() {
    }

    @SkipValidation
    public String showPlaceExchangeTransactionRequest() {
        try {
            booklistBean = (BookListBean) Ibatis.sqlMap().queryForObject("book_list.getBookDetailsForUpdate", booklistBean.getBook_id());
            session.put("booklistBean", booklistBean);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return SUCCESS;
        }
    }

    public String placeExchangeTransactionRequest() {
        try {
            booklistBean = (BookListBean) session.get("booklistBean");
            exchangeTransactionBean.setBook_id(booklistBean.getBook_id());
            exchangeTransactionBean.setSender_id(Integer.parseInt(session.get("id").toString()));
            exchangeTransactionBean.setReceiver_id(booklistBean.getBeneficiary_id());
            exchangeTransactionBean.setTransaction_status("Pending");
            Ibatis.sqlMap().insert("exchange.placeExchangeRequest", exchangeTransactionBean);
            addActionMessage("Book Exchange request fowraded successfully.");
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            addActionError("Unable to place book Exchange request.");
            return ERROR;
        }
    }

    @SkipValidation
    public String getPendingTransactions() {
        try {
            exchangeTransactionList = Ibatis.sqlMap().queryForList("exchange.getPendingExchangeTransactionList", Integer.parseInt(session.get("id").toString()));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return SUCCESS;
        }
    }

    @SkipValidation
    public String getAllTransactionStatus() {
        try {
            exchangeTransactionList = Ibatis.sqlMap().queryForList("exchange.getAllTransactionList", Integer.parseInt(session.get("id").toString()));
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return SUCCESS;
        }
    }

    @SkipValidation
    public String showReplyTransactionRequest() {
        try {
            exchangeTransactionBean = (ExchangeTransactionBean) Ibatis.sqlMap().queryForObject("exchange.getTransactionDetails", exchangeTransactionBean.getTransaction_id());
            booklistBean = (BookListBean) Ibatis.sqlMap().queryForObject("book_list.getBookDetailsForUpdate", exchangeTransactionBean.getBook_id());
            session.put("booklistBean", booklistBean);
            session.put("exchangeTransactionBean", exchangeTransactionBean);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return SUCCESS;
        }
    }

    @SkipValidation
    public String replyExchangeTransactionRequest() {
        try {
            ExchangeTransactionBean selected_transaction= new ExchangeTransactionBean();
            selected_transaction=(ExchangeTransactionBean) session.get("exchangeTransactionBean");
            if (exchangeTransactionBean.getTransaction_status().equals("modified")) {
                if (exchangeTransactionBean.getDelivery_method().trim() == null || exchangeTransactionBean.getDelivery_method().isEmpty() || exchangeTransactionBean.getExchange_duration().trim() == null || exchangeTransactionBean.getExchange_duration().isEmpty()) {
                   exchangeTransactionBean=(ExchangeTransactionBean) session.get("exchangeTransactionBean");
                   booklistBean = (BookListBean) session.get("booklistBean");
                   addActionError("Delivery Method and Exchange Duration is mandatory for modifying a request.");
                   return ERROR;
                }else{
                     exchangeTransactionBean.setTransaction_id(selected_transaction.getTransaction_id());
                     Ibatis.sqlMap().update("exchange.modifyExchangeRequest", exchangeTransactionBean);
                     addActionMessage("Exchange request modified successfully.");
                }
            } else{
                 Ibatis.sqlMap().update("exchange.replyExchangeRequest", exchangeTransactionBean);
                 addActionMessage("Exchange request replied successfully.");
            }
            
            exchangeTransactionBean = (ExchangeTransactionBean) Ibatis.sqlMap().queryForObject("exchange.getTransactionDetails", selected_transaction.getTransaction_id());
            booklistBean = (BookListBean) Ibatis.sqlMap().queryForObject("book_list.getBookDetailsForUpdate", exchangeTransactionBean.getBook_id());
        } catch (Exception e) {
            e.printStackTrace();
            addActionError("Unable to reply exchange request.");
        } finally {
            return SUCCESS;
        }
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    @Override
    public void validate() {
        if (exchangeTransactionBean.getDelivery_method().trim() == null || exchangeTransactionBean.getDelivery_method().isEmpty()) {
            addActionError("Delivery method is required.");
        }
        if (exchangeTransactionBean.getExchange_duration().trim() == null || exchangeTransactionBean.getExchange_duration().isEmpty()) {
            addActionError("Excahnge duration is required.");
        }
    }

    public BookListBean getBooklistBean() {
        return booklistBean;
    }

    public void setBooklistBean(BookListBean booklistBean) {
        this.booklistBean = booklistBean;
    }

    public ExchangeTransactionBean getExchangeTransactionBean() {
        return exchangeTransactionBean;
    }

    public void setExchangeTransactionBean(ExchangeTransactionBean exchangeTransactionBean) {
        this.exchangeTransactionBean = exchangeTransactionBean;
    }

    public List<ExchangeTransactionBean> getExchangeTransactionList() {
        return exchangeTransactionList;
    }

    public void setExchangeTransactionList(List<ExchangeTransactionBean> exchangeTransactionList) {
        this.exchangeTransactionList = exchangeTransactionList;
    }

    @Override
    public void prepare() {

    }

}
