package Model;

public class roomBean {

    private int roomID;
    private int roomNumber;
    private String status;
    private typeRoomBean typeRoom;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public typeRoomBean getTypeRoom() {
        return typeRoom;
    }

    public void setTypeRoom(typeRoomBean typeRoom) {
        this.typeRoom = typeRoom;
    }
}
