package usst.model;

public class Room {
    private String      room_id;
    private String     roomtype;//大床房 标间 三人间 单人间
    private String     orientation;
    private int        floor;
    private int        price;
    private int        orderNum;
    private int        engaged;

    public String getRoom_id() {
        return room_id;
    }

    public void setRoom_id(String room_id) {
        this.room_id = room_id;
    }

    public String getRoomtype() {
        return roomtype;
    }

    public void setRoomtype(String roomtype) {
        this.roomtype = roomtype;
    }

    public String getOrientation() {
        return orientation;
    }

    public void setOrientation(String orientation) {
        this.orientation = orientation;
    }

    public int getFloor() {
        return floor;
    }

    public void setFloor(int floor) {
        this.floor = floor;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getOrderNum() {
        return orderNum;
    }

    public void setOrderNum(int orderNum) {
        this.orderNum = orderNum;
    }

    public int getEngaged() {
        return engaged;
    }

    public void setEngaged(int engaged) {
        this.engaged = engaged;
    }
}
