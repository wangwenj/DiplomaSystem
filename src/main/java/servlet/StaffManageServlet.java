package servlet;

import dao.UserDao_1;
import daoImp.UserDao1Imp;
import entity.User;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.util.List;

public class StaffManageServlet extends HttpServlet {

    UserDao_1 userDao_1 = new UserDao1Imp();

    public StaffManageServlet() {
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

    private void staff(HttpServletRequest request,
                       HttpServletResponse response) throws ServletException, IOException, ParseException {

        int user_id = Integer.parseInt(request.getParameter("id_user"));
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        String department = request.getParameter("department");
        String position = request.getParameter("position");
        int tel = Integer.parseInt(request.getParameter("tel"));
        String intro = request.getParameter("intro");
        String remark = request.getParameter("remark");
       // int addId = userDao_1.add(user_id, name, gender, id_department, id_position, tel, intro, remark);
        System.out.println("@@@@@@@@@@" + user_id + name + gender);

       // if (addId != 0) {
          //  response.sendRedirect("/user_manage.jsp");
      //  }


//        if (userDao1.getOne(user_id).getPassword() == password) {
//            response.sendRedirect("/index.jsp");
//        }

    }

    private void getAll(HttpServletRequest request,
                        HttpServletResponse response) throws ServletException, IOException, ParseException {
        List<User> userAll=userDao_1.getAll();
        System.out.println("全部用户："+userAll);
        request.setAttribute("userAll",userAll);
        request.getRequestDispatcher("/user_manage.jsp").forward(request,response);

    }

}
