package xupt.se.ttms.model;

public class Play {

    private int id=0      ;
    private String name="" ;
    private String Kind="";
    private String Intro="" ;
    private String Img="";
    private String Imgbg="";
    private int Length=0;
    private int TicketPrice=0; //���

    public Play(){
        id = 0;
    }
    public Play(int ID, String name, String kind,String intro, String img,String img_bg, int length, int ticketPrice){
        this.id = ID;
        this.name=name;
        this.Kind = kind;
        this.Intro=intro;
        this.Img = img;
        this.Imgbg = img_bg;
        this.Length = length;
        this.TicketPrice = ticketPrice;
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

    public void setName(String name){
        this.name=name;
    }

    public String getName(){
        return name;
    }

    public void setIntro(String intro){
        this.Intro=intro;
    }

    public String getIntro(){
        return Intro;
    }

    public void setImg(String img){
        this.Img=img;
    }

    public String getImg(){
        return Img;
    }

    public void setImgbg(String imgbg){
        this.Imgbg=imgbg;
    }

    public String getImgbg(){
        return Imgbg;
    }

    public void setKind(String count){
        this.Kind=count;
    }

    public String getKind(){
        return Kind;
    }
    public void setLength(int length){
        this.Length=length;
    }

    public int getLength(){
        return Length;
    }

    public void setTicketPrice(int intro){
        this.TicketPrice=intro;
    }

    public int getTicketPrice(){
        return TicketPrice;
    }

}
