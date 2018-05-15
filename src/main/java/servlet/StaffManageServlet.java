package servlet;

import dao.UserDao_1;
import daoImp.DepartmentImp;
import daoImp.PositionImp;
import daoImp.UserDao1Imp;
import entity.Department;
import entity.Position;
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

    static UserDao_1 userDao_1 = new UserDao1Imp();

    DepartmentImp departmentImp = new DepartmentImp();

    PositionImp positionImp = new PositionImp();

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
        MethodName = MethodName.substring(0, MethodName.length() - 6);
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

    private void addStaff(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException, ParseException {

        int user_id = Integer.parseInt(request.getParameter("id_user"));
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
        int id_department = Integer.parseInt(request.getParameter("department"));
        int id_position = Integer.parseInt(request.getParameter("position"));
        String tel = request.getParameter("tel");
        String intro = request.getParameter("intro");
        String remark = request.getParameter("remark");
        String address = request.getParameter("address");
        System.out.println(address);
        userDao_1.add(user_id, password, name, gender, id_department, id_position, tel, intro, remark, address);
        this.getAll(request, response);
        //response.sendRedirect("user_manage.jsp");

    }

    private void getAll(HttpServletRequest request,
                        HttpServletResponse response) throws ServletException, IOException, ParseException {
        List<User> userAll = userDao_1.getAll();
        //   System.out.println("全部用户：" + userAll);
        request.setAttribute("userAll", userAll);
        List<Department> departments = departmentImp.getAllDepartment();
        // System.out.println("部门" + departments);
        List<Position> positions = positionImp.getPosition();
        //  System.out.println("职位" + positions);
        request.setAttribute("positions", positions);
        request.setAttribute("departments", departments);
        request.getRequestDispatcher("/user_manage.jsp").forward(request, response);

    }

    private void modifyStaff(HttpServletRequest request,
                             HttpServletResponse response) throws ServletException, IOException, ParseException {

        int id = Integer.parseInt(request.getParameter("id_user"));
        System.out.println("id为：" + id);
        String name = request.getParameter("name");
        String gender = request.getParameter("gender");
//        System.out.println(gender);
        int id_department = Integer.parseInt(request.getParameter("m_department"));
//        System.out.println("部门id"+id_department);

        int id_position = Integer.parseInt(request.getParameter("m_position"));
        System.out.println("职位id" + id_position);

        String tel = request.getParameter("m_tel");
        String address = request.getParameter("address");
        System.out.println(name + "==" + gender + "==" + id_department + "==" + id_position);
        userDao_1.updateUser(name, gender, id_department, id_position, tel, address, id);
        this.getAll(request, response);
        //request.getRequestDispatcher("/user_manage.jsp").forward(request, response);


    }

    private void deleteUser(HttpServletRequest request,
                            HttpServletResponse response) throws ServletException, IOException, ParseException {
        int id = Integer.parseInt(request.getParameter("deleteUserId"));
        System.out.println(id);
        userDao_1.deleteUser(id);
        this.getAll(request, response);
    }

    private void getOneUser(HttpServletRequest request,
                            HttpServletResponse response) throws ServletException, IOException, ParseException {
        String name = request.getParameter("name");
        System.out.println("获取的名字---" + name);
        User user =(User) userDao_1.countUser(name);
        System.out.println(user);
        if (user==null) {
            System.out.println("成功返回100");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("100");
        } else {
            System.out.println("失败返回200");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("200");
        }
    }



}
