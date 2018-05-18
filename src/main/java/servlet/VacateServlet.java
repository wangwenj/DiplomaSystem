package servlet;

import dao.DepartmentDao;
import dao.PositionDao;
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

public class VacateServlet extends HttpServlet {
    UserDao_1 userDao_1 = new UserDao1Imp();
    DepartmentDao departmentDao = new DepartmentImp();
    PositionDao positionDao = new PositionImp();

    public VacateServlet() {
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

    private void getAll(HttpServletRequest request,
                        HttpServletResponse response) throws ServletException, IOException, ParseException {
        List<User> userAll = userDao_1.getAll();
        //   System.out.println("全部用户：" + userAll);
        List<Department> departments = departmentDao.getAllDepartment();
        // System.out.println("部门" + departments);
        List<Position> positions = positionDao.getAllPosition();
        List<User> managers = userDao_1.getAllManager();
        //  System.out.println("职位" + positions);

        request.setAttribute("userAll", userAll);
        request.setAttribute("positions", positions);
        request.setAttribute("departments", departments);
        request.setAttribute("managers", managers);
        request.getRequestDispatcher("/note_for_leave.jsp").forward(request, response);

    }

    //返回100，输出成功提示；返回200，输出失败提示；
    private void checkUserExist(HttpServletRequest request,
                                HttpServletResponse response) throws ServletException, IOException, ParseException {
        String name = request.getParameter("parameter");
        System.out.println("获取的名字---" + name);
        User user = (User) userDao_1.checkUserExist(name);
        System.out.println(user);
        if (user == null) {
            System.out.println("没有这个名字，失败");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("200");
        } else {
            System.out.println("存在这个名字，成功");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("100");
            request.setAttribute("user_apply", user);
            getAll(request,response);

        }


    }

//    private void addVacateForm(HttpServletRequest request,
//                               HttpServletResponse response) throws ServletException, IOException, ParseException {
//
//
//    }
}
