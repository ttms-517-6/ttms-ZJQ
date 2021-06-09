package xupt.se.ttms.service;

import xupt.se.ttms.idao.DAOFactory;
import xupt.se.ttms.idao.iScheduleDAO;
import xupt.se.ttms.idao.iStudioDAO;
import xupt.se.ttms.model.Schedule;
import xupt.se.ttms.model.Studio;

import java.util.List;

public class ScheduleSrv {
    private iScheduleDAO scheDAO= DAOFactory.creatScheduleDAO();

    public int add(Schedule stu){
        return scheDAO.insert(stu);
    }

    public int modify(Schedule stu){
        return scheDAO.update(stu);
    }

    public int delete(int ID){
        return scheDAO.delete(ID);
    }

    public List<Schedule> Fetch(int playid){
        return scheDAO.select(playid);
    }

    public List<Schedule> FetchSchedid(int schedid){
        return scheDAO.selectSchedid(schedid);
    }

    public List<Schedule> FetchName(String playname){
        return scheDAO.selectName(playname);
    }
}
