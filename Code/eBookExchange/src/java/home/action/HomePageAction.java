/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package home.action;

import book_list.bean.BookListBean;
import com.opensymphony.xwork2.ActionSupport;
import dbconfig.Ibatis;
import java.util.List;
import java.util.Map;

import org.apache.struts2.interceptor.SessionAware;

/**
 *
 * @author CDAC-49
 */
public class HomePageAction extends ActionSupport implements SessionAware {

    Map<String, Object> session;

    private List<BookListBean> bookList;
    private BookListBean booklistBean = new BookListBean();

    public HomePageAction() {
    }

    public String show() {
        return "user";
    }

    public String showAbout() {
        return SUCCESS;
    }

    public String showContact() {
        return SUCCESS;
    }

   public String showAllBooks() {
        try {
            booklistBean = new BookListBean();
            bookList = Ibatis.sqlMap().queryForList("book_list.getAllBooks",Integer.valueOf(session.get("id").toString()));
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    public String searchBooks() {
        try {
            booklistBean.setBeneficiary_id(Integer.parseInt(session.get("id").toString()));
            bookList = Ibatis.sqlMap().queryForList("book_list.searchBooks",booklistBean);
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    public String showOwnBooks() {
        try {
            bookList = Ibatis.sqlMap().queryForList("book_list.getOwnBooks", Integer.valueOf(session.get("id").toString()));
            return SUCCESS;
        } catch (Exception e) {
            e.printStackTrace();
            return ERROR;
        }
    }

    public List<BookListBean> getBookList() {
        return bookList;
    }

    public void setBookList(List<BookListBean> bookList) {
        this.bookList = bookList;
    }

    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public BookListBean getBooklistBean() {
        return booklistBean;
    }

    public void setBooklistBean(BookListBean booklistBean) {
        this.booklistBean = booklistBean;
    }

    
}
