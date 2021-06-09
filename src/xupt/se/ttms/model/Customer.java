package xupt.se.ttms.model;

public class Customer {

    private int id=0      ;
    private String name="" ;
    private String tel="" ;
    private String Email="";
    private String Pwd="";

    public Customer(){
        id = 0;
    }
    public Customer(int ID,String tel,String name, String email, String pwd){
        this.id = ID;
        this.tel = tel;
        this.name=name;
        this.Email = email;
        this.Pwd = pwd;
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

    public void setTel(String tel){
        this.tel=tel;
    }

    public String getTel(){
        return tel;
    }

    public void setEmail(String count){
        this.Email=count;
    }

    public String getEmail(){
        return Email;
    }
    public void setPwd(String pwd){
        this.Pwd=pwd;
    }

    public String getPwd(){
        return Pwd;
    }

}

