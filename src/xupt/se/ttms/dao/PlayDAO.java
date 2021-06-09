package xupt.se.ttms.dao;

import xupt.se.ttms.idao.iPlayDAO;
import xupt.se.ttms.model.Play;
import xupt.se.util.DBUtil;

import java.sql.ResultSet;
import java.util.LinkedList;
import java.util.List;

public class PlayDAO  implements iPlayDAO
{
    @SuppressWarnings("finally")
    @Override
    public int insert(Play play)
    {
        int resultPlay=0;
        try
        {
            String sql="insert into play(play_name, play_kind , play_introduction , play_image, play_length, play_ticket_price )"
                        + " values('" + play.getName() + "', '" + play.getKind()
                        + "', '" + play.getIntro() + "', '" + play.getImg()
                        + "', " + play.getLength() + ", "
                        + play.getTicketPrice() + " )";
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

    @SuppressWarnings("finally")
    @Override
    public int update(Play play)
    {
        int result=0;
        try
        {
            String sql="update play set " + " play_name  ='" + play.getName() + "', " + " play_kind  = "
                    + play.getKind() + ", " + " play_length  = " + play.getLength() + ", "
                    + " play_ticket_price  = '" + play.getTicketPrice() + "' ";
            sql+=" where play_id = " + play.getID();
            DBUtil db=new DBUtil();
            db.openConnection();
            result=db.execCommand(sql);
            db.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            return result;
        }
    }

    @Override
    public int delete(int ID)
    {
        int result=0;
        try
        {
            String sql="delete from play where play_id = " + ID;
            DBUtil db=new DBUtil();
            db.openConnection();
            result=db.execCommand(sql);
            db.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return result;
    }

    @SuppressWarnings("finally")
    public String selectplayid(int condt)
    {
        DBUtil db=null;
        String result="";
        try
        {
            String sql="select play_name from play  where play_id= " + condt;
            db=new DBUtil();
            if(!db.openConnection())
            {
                System.out.print("fail to connect database");
                return null;
            }
            ResultSet rst=db.execQuery(sql);
            if(rst != null)
            {
                while(rst.next())
                {
                    result=rst.getString("play_name");
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
            return result;
        }
    }

    @SuppressWarnings("finally")
    @Override
    public List<Play> select(String playName)
    {
        DBUtil db=null;
        List<Play> playList=null;
        playList=new LinkedList<Play>();
        try
        {
            playName.trim();
            String sql="select * from play where play_name like '%" + playName + "%'";
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
                    Play play=new Play();
                    play.setID(rst.getInt("play_id"));
                    play.setName(rst.getString("play_name"));
                    play.setKind(rst.getString("play_kind"));
                    play.setIntro(rst.getString("play_introduction"));
                    play.setImg(rst.getString("play_image"));
                    play.setImgbg(rst.getString("play_image_bg"));
                    play.setLength(rst.getInt("play_length"));
                    play.setTicketPrice(rst.getInt("play_ticket_price"));
                    playList.add(play);
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
            return playList;
        }
    }

}

