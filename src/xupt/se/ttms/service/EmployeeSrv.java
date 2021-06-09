package xupt.se.ttms.service;

import xupt.se.ttms.dao.EmployeeDAO;
import xupt.se.ttms.idao.DAOFactory;
import xupt.se.ttms.idao.iEmployeeDAO;
import xupt.se.ttms.model.Employee;

import java.util.List;

public class EmployeeSrv {
    private iEmployeeDAO employeeDAO= DAOFactory.creatEmployeeDAO();

    public int add(Employee play){
        return employeeDAO.insert(play);
    }

//    public int modify(Play play){
//        return employeeDAO.update(play);
//    }
//
//    public int delete(int ID){
//        return employeeDAO.delete(ID);
//    }

    public List<Employee> Fetch(String email){
        return employeeDAO.select(email);
    }

}
