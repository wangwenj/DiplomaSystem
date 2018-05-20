package servlet;

import dao.MessageDao;
import daoImp.MessageDaoImpl;
import entity.Message;
import entity.User;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.security.interfaces.RSAKey;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class MessageServlet extends HttpServlet{

    MessageDao messageDao= new MessageDaoImpl();

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //以下为解决乱码
        request.setCharacterEncoding("UTF-8");
        String servletpath = request.getServletPath();
        String MethodName = servletpath.substring(1);
        MethodName = MethodName.substring(0, MethodName.length() - 8);
        String strBackUrl = "http://" + request.getServerName() //服务器地址
                + ":"
                + request.getServerPort()           //端口号
                + request.getContextPath()     //项目名称
                + request.getServletPath()      //请求页面或其他地址
                + "?" + (request.getQueryString()); //参数
        System.out.println(strBackUrl);
        System.out.println("request is " + MethodName);
        //以上为输出请求内容
        Method method;
        try {
            method = getClass().getDeclaredMethod(MethodName, HttpServletRequest.class, HttpServletResponse.class);
            method.invoke(this, request, response);
        } catch (NoSuchMethodException | SecurityException | IllegalAccessException | IllegalArgumentException | InvocationTargetException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    private void getAllToStaff(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, ParseException{
        User user= (User) request.getSession().getAttribute("user");
        String currentUserName=user.getName();
        List<Message> messageList=messageDao.getAll(currentUserName);
        request.setAttribute("messageList",messageList);
        request.getRequestDispatcher("/message_staff.jsp").forward(request,response);
    }

    private void writeButton(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException{

        request.getRequestDispatcher("/message_edit.jsp").forward(request,response);
    }

    private void writeMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException{
        String content=request.getParameter("message_content");
        User user= (User) request.getSession().getAttribute("user");
        String currentUserName=user.getName();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
        String status="未回复";
        messageDao.addMessage( content,currentUserName,date,status);
        this.getAllToStaff(request, response);
    }

    private void deleteMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException{
        int id_message= Integer.parseInt(request.getParameter("id"));
        messageDao.deleteMessage(id_message);
        this.getAllToStaff(request,response);
    }

    private void getAllToManage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException{
        String status="未回复";
        List<Message> messageList=messageDao.manageGetAll(status);
        request.setAttribute("manageMessageList",messageList);
        request.getRequestDispatcher("/message_manage.jsp").forward(request,response);
    }

    private void replyButton(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException{
        int id= Integer.parseInt(request.getParameter("id"));
        request.setAttribute("id_message",id);
        request.getRequestDispatcher("/message_reply.jsp").forward(request,response);
    }

    private void replyMessage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException{
        int id= Integer.parseInt(request.getParameter("id_message_reply"));
        String cotent=request.getParameter("reply_content");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
        User userReply= (User) request.getSession().getAttribute("user");
        String nameReply=userReply.getName();
        String currentUserName=userReply.getName();
        String status="已回复";
        messageDao.replyMessage(id,nameReply,date,cotent,status);
        this.getAllToManage(request,response);
    }
}
