package xupt.se.ttms.model;

public class Schedule {
    private int id=0      ;
    private int studioid=0;
    private int playid=0;
    private String playname="";
    private String schedtime="";
    private int price=0;


    public Schedule(){
        id = 0;
    }
    public Schedule(int ID, int studioid, int playid,String playname, String schedtime, int price){
        id = ID;
        this.studioid=studioid;
        this.playid = playid;
        this.playname = playname;
        this.schedtime = schedtime;
        this.price = price;
    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public void setID(int ID){
        this.id=ID;
    }

    public int getID(){
        return id;
    }

    public void setStudioid(int studioid){
        this.studioid=studioid;
    }

    public int getStudioid(){
        return studioid;
    }

    public void setPlayid(int count){
        this.playid=count;
    }

    public int getPlayid(){
        return playid;
    }

    public void setPlayname(String playname){
        this.playname=playname;
    }

    public String getPlayname(){
        return playname;
    }

    public void setSchedtime(String intro){
        this.schedtime=intro;
    }

    public String getSchedtime(){
        return schedtime;
    }

    public void setPrice(int count){
        this.price=count;
    }

    public int getPrice(){
        return price;
    }

}
