package servlet;

import dao.UserDao_1;
import dao.UserDeleteDa0;
import daoImp.UserDao1Imp;
import daoImp.UserDeleteDaoImpl;
import entity.UserDelete;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.util.List;

public class UserDeleteServlet extends HttpServlet{

    UserDeleteDa0 userDeleteDa0=new UserDeleteDaoImpl();
    UserDao_1 userDao_1=new UserDao1Imp();
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
        MethodName = MethodName.substring(0, MethodName.length() - 11);
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

    private void getAll(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, ParseException {
        List<UserDelete> userAll = userDeleteDa0.getAll();
        //   System.out.println("全部用户：" + userAll);
        request.setAttribute("userAll", userAll);

        request.getRequestDispatcher("/staff_delete_history.jsp").forward(request, response);
    }

    private void deleteUser(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, ParseException{
        //前台数据传操作方式和id
        String operation=request.getParameter("operotion");
        int id= Integer.parseInt(request.getParameter("restoreId"));
        if(operation.equals("restore")){
            UserDelete userDelete=userDeleteDa0.getOne(id);
            userDao_1.add(userDelete.getId_user(), userDelete.getPassword(), userDelete.getName(), userDelete.getGender(), userDelete.getId_department(),userDelete.getId_position(), userDelete.getTel(), userDelete.getAddress(),userDelete.getRole());
        }
        userDeleteDa0.delete_user_delete(id);
        this.getAll(request,response);
    }


}
