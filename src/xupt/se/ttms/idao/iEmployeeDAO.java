package xupt.se.ttms.idao;

import xupt.se.ttms.model.Employee;

import java.util.List;

public interface iEmployeeDAO {

//
    public int insert(Employee employee);
//
//    public int update(Play play);
//
//    public int delete(int ID);
//

    public List<Employee> select(String employeeEmail);
}
