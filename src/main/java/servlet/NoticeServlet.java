package servlet;

import daoImp.NoticeDaoImpl;
import entity.Notice;
import entity.User;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

public class NoticeServlet extends HttpServlet {
    NoticeDaoImpl noticeDao = new NoticeDaoImpl();

    public NoticeServlet() {
        super();
    }

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
        MethodName = MethodName.substring(0, MethodName.length() - 7);
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

    private void edit_notice(HttpServletRequest request,
                             HttpServletResponse response) throws ServletException, IOException, ParseException {
        request.getRequestDispatcher("/edit_notice.jsp").forward(request, response);
    }

    private void submitNotice(HttpServletRequest request,
                              HttpServletResponse response) throws ServletException, IOException, ParseException {
        String notice_title = request.getParameter("notice_title");
        String notice_content = request.getParameter("notice_content");

        User user = (User) request.getSession().getAttribute("user");
        int id_user_current = user.getId_user();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String write_date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
        noticeDao.submitNotice(id_user_current, notice_content, write_date, notice_title, "未审阅");
        this.edit_notice(request, response);
    }

    private void getAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        List<Notice> notices = noticeDao.getAll();
        request.setAttribute("notices", notices);
        request.getRequestDispatcher("/notice_manage.jsp").forward(request, response);
    }

    private void getDetais(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        int id_announcement = Integer.parseInt(request.getParameter("id"));
        Notice notice = noticeDao.getDetails(id_announcement);
        System.out.println(notice.getContent() + "公告内容");
        request.setAttribute("notice", notice);
        request.getRequestDispatcher("/notice_result.jsp").forward(request, response);
    }

    private void dealNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        int id_announcement = Integer.parseInt(request.getParameter("id"));
        String oper = request.getParameter("oper");
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
        User user = (User) request.getSession().getAttribute("user");
        noticeDao.dealNotice(id_announcement, user.getId_user(), date, oper);
        this.getAll(request, response);
    }

    /*
     *获取主页公告的显示
     * */
    private void indexNotice(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
//        request.getRequestDispatcher("/index_notice.jsp").forward(request, response);

    }
}
