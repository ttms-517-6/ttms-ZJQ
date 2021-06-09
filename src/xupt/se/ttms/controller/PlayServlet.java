package xupt.se.ttms.controller;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import xupt.se.ttms.model.Play;
import xupt.se.ttms.service.PlaySrv;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/PlayServlet")
public class PlayServlet extends HttpServlet
{
    private static final long serialVersionUID=1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String type=request.getParameter("type");

        // 根据请求操作类型，执行相应的增、删、该、查
        if(type.equalsIgnoreCase("add"))
            add(request, response);
        else if(type.equalsIgnoreCase("delete"))
            delete(request, response);
        else if(type.equalsIgnoreCase("update"))
            update(request, response);
        else if(type.equalsIgnoreCase("search"))
            search(request, response);
    }

    private void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Play play=null;
        int id=0;
        try
        {
            String name=request.getParameter("playname");
            String kind=request.getParameter("kind");
            String intro=request.getParameter("intro");
            String img=request.getParameter("img");
            String imgbg=request.getParameter("imgbg");
            int length=Integer.valueOf(request.getParameter("length"));
            int ticketprice=Integer.valueOf(request.getParameter("ticketprice"));
            play=new Play(id, name, kind,intro,img,imgbg, length, ticketprice);
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=response.getWriter();

            if(new PlaySrv().add(play) == 1)
                out.write("数据添加成功");
            else
                out.write("数据添加失败，请重试");

            out.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("操作错误，请重试");
        }
    }

    private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            int id=Integer.valueOf(request.getParameter("id"));
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=response.getWriter();
            out.write("" + new PlaySrv().delete(id));
            out.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("操作错误，请重试");
        }
    }

    private void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        Play play=null;
        int id=0;
        try
        {
            String name=request.getParameter("playname");
            String kind=request.getParameter("kind");
            String intro=request.getParameter("intro");
            String img=request.getParameter("img");
            String imgbg=request.getParameter("imgbg");
            int length=Integer.valueOf(request.getParameter("length"));
            int ticketprice=Integer.valueOf(request.getParameter("ticketprice"));
            play=new Play(id, name, kind,intro,img,imgbg, length, ticketprice);
            response.setContentType("text/html;charset=utf-8");
            PrintWriter out=response.getWriter();

            if(new PlaySrv().modify(play) == 1)
                out.write("数据修改成功");
            else
                out.write("数据修改失败，请重试");

            out.close();
        }
        catch(Exception e)
        {
            e.printStackTrace();
            response.setContentType("text/html;charset=utf-8");
            response.getWriter().write("操作错误，请重试");
        }
    }

    private void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        response.setCharacterEncoding("UTF-8");
        PrintWriter out=response.getWriter();
        String name=request.getParameter("name");
        List<Play> result=null;
        if(name != null && name.length() > 0)
            result=new PlaySrv().Fetch(name);
        else
            result=new PlaySrv().FetchAll();
        String jsonStr="";
        try
        {
            JSONArray array=new JSONArray();
            JSONObject json;
            for(Play s : result)
            {
                json=new JSONObject();
                json.put("id", s.getID());
                json.put("name", s.getName());
                json.put("kind", s.getKind());
                json.put("intro", s.getIntro());
                json.put("img", s.getImg());
                json.put("imgbg", s.getImgbg());
                json.put("length", s.getLength());
                json.put("ticketprice", s.getTicketPrice());
                array.put(json);
            }
            jsonStr=array.toString();
        }
        catch(JSONException e)
        {
            e.printStackTrace();
        }
        finally
        {
            out.println(jsonStr);
            out.flush();
            out.close();
        }
        // System.out.print(jsonStr);
    }

}

