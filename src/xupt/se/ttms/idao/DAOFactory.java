package xupt.se.ttms.idao;

import xupt.se.ttms.dao.*;

public class DAOFactory
{
    private static iStudioDAO stuDao;

    private static iPlayDAO playDao;

    private static iEmployeeDAO empDao;

    private static iCustomerDAO cusDao;

    private static iScheduleDAO scheDao;

    public static synchronized iStudioDAO creatStudioDAO()
    {
        if(null == stuDao)
            stuDao=new StudioDAO();
        return stuDao;
    }

    public static synchronized iPlayDAO creatPlayDAO()
    {
        if(null == playDao)
            playDao=new PlayDAO();
        return playDao;
    }

    public static synchronized iEmployeeDAO creatEmployeeDAO()
    {
        if(null == empDao)
            empDao=new EmployeeDAO();
        return empDao;
    }

    public static synchronized iCustomerDAO creatCustomerDAO()
    {
        if(null == cusDao)
            cusDao=new CustomerDAO();
        return cusDao;
    }

    public static synchronized iScheduleDAO creatScheduleDAO()
    {
        if(null == scheDao)
            scheDao=new ScheduleDAO();
        return scheDao;
    }
}
