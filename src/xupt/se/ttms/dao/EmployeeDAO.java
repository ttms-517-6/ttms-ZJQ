package xupt.se.ttms.dao;

import xupt.se.ttms.idao.iEmployeeDAO;
import xupt.se.ttms.model.Employee;
import xupt.se.util.DBUtil;

import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class EmployeeDAO implements iEmployeeDAO {
    @SuppressWarnings("finally")
    @Override
    public int insert(Employee play)
    {
        int resultPlay=0;
        try
        {
            String sql="insert into employee(emp_name, emp_email, emp_pwd)"
                    + " values('" + play.getName() + "', '" + play.getEmail() + "', '" + play.getPwd() + "' )";
            DBUtil db=new DBUtil();
            db.openConnection();
            ResultSet rst=db.getInsertObjectIDs(sql);
            if(rst != null && rst.first())
            {
                play.setID(rst.getInt(1));
            }
            db.close(rst);
            db.close();
            resultPlay=1;
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            return resultPlay;
        }
    }
//
//    @SuppressWarnings("finally")
//    @Override
//    public int update(Play play)
//    {
//        int result=0;
//        try
//        {
//            String sql="update play set " + " play_name  ='" + play.getName() + "', " + " play_kind  = "
//                    + play.getKind() + ", " + " play_length  = " + play.getLength() + ", "
//                    + " play_ticket_price  = '" + play.getTicketPrice() + "' ";
//            sql+=" where play_id = " + play.getID();
//            DBUtil db=new DBUtil();
//            db.openConnection();
//            result=db.execCommand(sql);
//            db.close();
//        }
//        catch(Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            return result;
//        }
//    }
//
//    @Override
//    public int delete(int ID)
//    {
//        int result=0;
//        try
//        {
//            String sql="delete from play where play_id = " + ID;
//            DBUtil db=new DBUtil();
//            db.openConnection();
//            result=db.execCommand(sql);
//            db.close();
//        }
//        catch(Exception e)
//        {
//            e.printStackTrace();
//        }
//        return result;
//    }
//
//    @SuppressWarnings("finally")
//    public String selectplayid(int condt)
//    {
//        DBUtil db=null;
//        String result="";
//        try
//        {
//            String sql="select play_name from play  where play_id= " + condt;
//            db=new DBUtil();
//            if(!db.openConnection())
//            {
//                System.out.print("fail to connect database");
//                return null;
//            }
//            ResultSet rst=db.execQuery(sql);
//            if(rst != null)
//            {
//                while(rst.next())
//                {
//                    result=rst.getString("play_name");
//                }
//            }
//            db.close(rst);
//            db.close();
//        }
//        catch(Exception e)
//        {
//            e.printStackTrace();
//        }
//        finally
//        {
//            return result;
//        }
//    }


    @SuppressWarnings("finally")
    @Override
    public List<Employee> select(String employeeEmail)
    {
        DBUtil db=null;
        List<Employee> employeeList=null;
        employeeList=new LinkedList<Employee>();
        try
        {
            employeeEmail.trim();
            String sql="select * from employee where emp_email like '%" + employeeEmail + "%'";

            db=new DBUtil();
            if(!db.openConnection())
            {
                System.out.print("fail to connect database table play");
                return null;
            }
            ResultSet rst=db.execQuery(sql);
            if(rst != null)
            {
                while(rst.next())
                {
                    Employee employee = new Employee();
                    employee.setID(rst.getInt("emp_id"));
                    employee.setName(rst.getString("emp_name"));
                    employee.setEmail(rst.getString("emp_email"));
                    employee.setPwd(rst.getString("emp_pwd"));
                    employeeList.add(employee);
                }
            }
            db.close(rst);
            db.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            return employeeList;
        }
    }
}
