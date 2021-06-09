package xupt.se.ttms.idao;

import xupt.se.ttms.model.Customer;
import xupt.se.ttms.model.Employee;

import java.util.List;

public interface iCustomerDAO {

//
    public int insert(Customer customer);
//
//    public int update(Play play);
//
    public int delete(int ID);
//

    public List<Customer> select(String customerEmail,String method);
}
