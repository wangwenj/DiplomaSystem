package servlet;

import dao.DepartmentDao;
import dao.DepartmentDeleteDao;
import daoImp.DepartmentDeleteDaoImpl;
import daoImp.DepartmentImp;
import entity.DepartmentDelete;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.util.List;

public class DepartDeleteServlet extends HttpServlet{
    DepartmentDeleteDao departmentDeleteDao=new DepartmentDeleteDaoImpl();
    DepartmentDao departmentDao=new DepartmentImp();

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        //以下为解决乱码
        request.setCharacterEncoding("UTF-8");
        String servletpath = request.getServletPath();
        String MethodName = servletpath.substring(1);
        MethodName = MethodName.substring(0, MethodName.length() - 13);
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

    private void getAll(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException,ParseException {
        List<DepartmentDelete> departmentDeletes=departmentDeleteDao.getAll();
        request.setAttribute("departmentAll",departmentDeletes);
        request.getRequestDispatcher("/department_delete_history.jsp").forward(request, response);
    }

    private void deleteDepart(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, ParseException{
        //前台数据传操作方式和id
        String operation=request.getParameter("operotion");
        int id= Integer.parseInt(request.getParameter("restoreId"));
        if(operation.equals("restore")){
            DepartmentDelete dDelete=departmentDeleteDao.getOne(id);
            departmentDao.addDepart(dDelete.getD_name(), dDelete.getId_department(), dDelete.getIntro(), dDelete.getAddress(), dDelete.getTel());
        }
        departmentDeleteDao.delete_department_delete(id);
        this.getAll(request,response);
    }

}
