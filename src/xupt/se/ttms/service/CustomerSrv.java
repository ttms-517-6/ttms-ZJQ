package xupt.se.ttms.service;

import xupt.se.ttms.dao.CustomerDAO;
import xupt.se.ttms.idao.DAOFactory;
import xupt.se.ttms.idao.iCustomerDAO;
import xupt.se.ttms.model.Customer;

import java.util.List;

public class CustomerSrv {

    private iCustomerDAO customerDAO= DAOFactory.creatCustomerDAO();

    public int add(Customer customer){
        return customerDAO.insert(customer);
    }
//
//    public int modify(Play play){
//        return employeeDAO.update(play);
//    }
//
    public int delete(int ID){
        return customerDAO.delete(ID);
    }

    public List<Customer> Fetch(String email,String method){
        return customerDAO.select(email,method);
    }
}
