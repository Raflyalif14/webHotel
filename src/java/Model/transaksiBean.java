package Model;

import Model.customerBean;
import Model.roomBean;
import Model.typeRoomBean;
import java.util.Date;

public class transaksiBean {

    private int transactionID;
    private customerBean customer;
    private Date checkIn;
    private Date checkOut;
    private roomBean room;
    private typeRoomBean typeRoom;
    private Double totalPrice;

    public Double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(Double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getTransactionID() {
        return transactionID;
    }

    public void setTransactionID(int transactionID) {
        this.transactionID = transactionID;
    }

    public typeRoomBean getTypeRoom() {
        return typeRoom;
    }

    public void setTypeRoom(typeRoomBean typeRoom) {
        this.typeRoom = typeRoom;
    }
    

    

    public customerBean getCustomer() {
        return customer;
    }

    public void setCustomer(customerBean customer) {
        this.customer = customer;
    }

    

    public roomBean getRoom() {
        return room;
    }

    public void setRoom(roomBean room) {
        this.room = room;
    }

    public Date getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }

    public Date getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }
}
