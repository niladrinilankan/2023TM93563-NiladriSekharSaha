/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package book_list.action;

import book_list.bean.BookListBean;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import dbconfig.Ibatis;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.struts2.interceptor.SessionAware;
import org.apache.struts2.interceptor.validation.SkipValidation;
import register.bean.RegistrationBean;

/**
 *
 * @author Shampa Dey
 */
public class AddNewBookAction extends ActionSupport implements SessionAware, Preparable {

    private BookListBean booklistBean = new BookListBean();

    Map<String, Object> session;

    public AddNewBookAction() {
    }

    @SkipValidation
    public String showAddBook() {
        booklistBean = new BookListBean();
        session.put("isUpdate", false);
        return SUCCESS;
    }

    public String addBookAction() {
        booklistBean.setBeneficiary_id(Integer.parseInt(session.get("id").toString()));
        try {
            if (session.get("isUpdate").equals(false)) {
                Ibatis.sqlMap().insert("book_list.addBook", booklistBean);
                addActionMessage("New Book inserted successfully");
            } else {
                booklistBean.setBook_id(Integer.parseInt(session.get("book_id").toString()));
                Ibatis.sqlMap().update("book_list.updateBook", booklistBean);
                addActionMessage("Book details updated successfully");
            }
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            addActionError("Unable to add/update new book!");
            return ERROR;
        }
    }

    @SkipValidation
    public String showUpdateBook() {
        try {
            session.put("book_id", booklistBean.getBook_id());
            session.put("isUpdate", true);
            booklistBean = (BookListBean) Ibatis.sqlMap().queryForObject("book_list.getBookDetailsForUpdate", booklistBean.getBook_id());
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            return SUCCESS;
        }
    }

    @SkipValidation
    public String deleteBookAction() {
        try {
            Ibatis.sqlMap().update("book_list.deleteBook", booklistBean.getBook_id());
            addActionMessage("Book details deleted successfully");
        } catch (Exception e) {
            addActionError("Unable to delete Book details!");
            e.printStackTrace();
        } finally {
            return SUCCESS;
        }
    }

    @Override
    public void validate() {
        if (booklistBean.getTitle().trim() == null || booklistBean.getTitle().trim().isEmpty()) {
            addActionError("Title is required.");
        }

        if (booklistBean.getAuthor().trim() == null || booklistBean.getAuthor().trim().isEmpty()) {
            addActionError("Author is required.");
        }

        if (booklistBean.getBook_condition().trim() == null || booklistBean.getBook_condition().trim().isEmpty()) {
            addActionError("Book condition is required.");
        }
        
        if (booklistBean.getLocation().trim() == null || booklistBean.getLocation().trim().isEmpty()) {
            addActionError("Location is required.");
        }

        if (booklistBean.getGenre().trim() == null || booklistBean.getGenre().trim().isEmpty()) {
            addActionError("Genre is required.");
        }
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    @Override
    public void prepare() {
    }

    public BookListBean getBooklistBean() {
        return booklistBean;
    }

    public void setBooklistBean(BookListBean booklistBean) {
        this.booklistBean = booklistBean;
    }

}
