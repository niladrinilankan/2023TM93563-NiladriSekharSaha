package exchange.bean;

/**
 *
 * @author niladri.saha
 */
public class ExchangeTransactionBean {

    private int transaction_id;
    private int sender_id;
    private String sender_name;
    private int receiver_id;
    private String receiver_name;
    private String book_ser_no;
    private int book_id;
    private String title;
    private String delivery_method;
    private String exchange_duration;
    private String transaction_date;
    private String transaction_status;

    public ExchangeTransactionBean() {
    }

    public int getTransaction_id() {
        return transaction_id;
    }

    public void setTransaction_id(int transaction_id) {
        this.transaction_id = transaction_id;
    }

   
    public int getSender_id() {
        return sender_id;
    }

    public void setSender_id(int sender_id) {
        this.sender_id = sender_id;
    }

    public int getReceiver_id() {
        return receiver_id;
    }

    public void setReceiver_id(int receiver_id) {
        this.receiver_id = receiver_id;
    }

    public int getBook_id() {
        return book_id;
    }

    public void setBook_id(int book_id) {
        this.book_id = book_id;
    }

    public String getDelivery_method() {
        return delivery_method;
    }

    public void setDelivery_method(String delivery_method) {
        this.delivery_method = delivery_method;
    }

    public String getExchange_duration() {
        return exchange_duration;
    }

    public void setExchange_duration(String exchange_duration) {
        this.exchange_duration = exchange_duration;
    }


    public String getTransaction_date() {
        return transaction_date;
    }

    public void setTransaction_date(String transaction_date) {
        this.transaction_date = transaction_date;
    }

    public String getTransaction_status() {
        return transaction_status;
    }

    public void setTransaction_status(String transaction_status) {
        this.transaction_status = transaction_status;
    }

    public String getSender_name() {
        return sender_name;
    }

    public void setSender_name(String sender_name) {
        this.sender_name = sender_name;
    }

    public String getReceiver_name() {
        return receiver_name;
    }

    public void setReceiver_name(String receiver_name) {
        this.receiver_name = receiver_name;
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
    
    

}
