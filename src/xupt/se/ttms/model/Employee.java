package xupt.se.ttms.model;

public class Employee {

    private int id=0      ;
    private String name="" ;
    private String Email="";
    private String Pwd="";

    public Employee(){
        id = 0;
    }
    public Employee(int ID, String name, String email, String pwd){
        this.id = ID;
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
