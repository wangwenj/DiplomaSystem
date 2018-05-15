package servlet;

import dao.DepartmentDao;
import daoImp.DepartmentImp;
import entity.Department;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.util.List;

public class DepartManageServlet extends HttpServlet {

    DepartmentImp departmentDao = new DepartmentImp();

    public DepartManageServlet() {
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
        List<Department> departments = departmentDao.getAllDepartment();
        request.setAttribute("departments", departments);
        request.getRequestDispatcher("/department_manage.jsp").forward(request, response);

    }

    private void updateDepartment(HttpServletRequest request,
                                  HttpServletResponse response) throws ServletException, IOException, ParseException {
        String name=request.getParameter("d_ name");
        String code=request.getParameter("d_code");
        String intro=request.getParameter("d_intro");
        String address=request.getParameter("d_address");
        int tel= Integer.parseInt(request.getParameter("d_tel"));

    }

}
