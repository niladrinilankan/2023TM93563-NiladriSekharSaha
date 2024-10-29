package book_list.bean;

/**
 *
 * @author niladri.saha
 */
public class BookListBean {

    private int book_id;
    private int beneficiary_id;
    private String book_ser_no;
    private String title;
    private String author;
    private String book_condition;
    private String location;
    private String genre;
    private String availability_status;
    private String activation_status;
    private String owner;
    private String update_date;
    private int pending_request;

    public BookListBean() {
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public int getBeneficiary_id() {
        return beneficiary_id;
    }

    public void setBeneficiary_id(int beneficiary_id) {
        this.beneficiary_id = beneficiary_id;
    }

    public String getBook_ser_no() {
        return book_ser_no;
    }

    public void setBook_ser_no(String book_ser_no) {
        this.book_ser_no = book_ser_no;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getBook_condition() {
        return book_condition;
    }

    public void setBook_condition(String book_condition) {
        this.book_condition = book_condition;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getAvailability_status() {
        return availability_status;
    }

    public void setAvailability_status(String availability_status) {
        this.availability_status = availability_status;
    }

    public String getActivation_status() {
        return activation_status;
    }

    public void setActivation_status(String activation_status) {
        this.activation_status = activation_status;
    }

    public String getOwner() {
        return owner;
    }

    public void setOwner(String owner) {
        this.owner = owner;
    }

    public String getUpdate_date() {
        return update_date;
    }

    public void setUpdate_date(String update_date) {
        this.update_date = update_date;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public int getPending_request() {
        return pending_request;
    }

    public void setPending_request(int pending_request) {
        this.pending_request = pending_request;
    }

}
