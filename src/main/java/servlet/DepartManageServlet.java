package servlet;

import com.sun.scenario.effect.impl.sw.sse.SSEBlend_SRC_OUTPeer;
import dao.DepartmentDao;
import daoImp.DepartmentImp;
import entity.Department;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sound.midi.Soundbank;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.util.List;

public class DepartManageServlet extends HttpServlet {

    DepartmentDao departmentDao = new DepartmentImp();

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

    /*
    * 获取全部部门信息（进入页面就调用该方法）
    * */
    private void getAll(HttpServletRequest request,
                        HttpServletResponse response) throws ServletException, IOException, ParseException {
        List<Department> departments = departmentDao.getAllDepartment();
        request.setAttribute("departments", departments);
        request.getRequestDispatcher("/department_manage.jsp").forward(request, response);

    }

    /*
    * 更新部门信息
    * */
    private void updateDepartment(HttpServletRequest request,
                                  HttpServletResponse response) throws ServletException, IOException, ParseException {
        String name = request.getParameter("m_name");
        int id= Integer.parseInt(request.getParameter("m_id"));
        String intro = request.getParameter("m_intro");
        String address = request.getParameter("m_address");
        String tel = request.getParameter("m_tel");
        departmentDao.updateDepart(name, intro, address, tel,id);
        this.getAll(request, response);
    }


    private void addDepart(HttpServletRequest request,
                           HttpServletResponse response) throws ServletException, IOException, ParseException {
        System.out.println("进入加入部门的函数");
        String name = request.getParameter("d_name");
        int id = Integer.parseInt(request.getParameter("d_id"));
        String intro = request.getParameter("d_intro");
        String address = request.getParameter("d_address");
        String tel = request.getParameter("d_tel");
        System.out.println("加入部门信息"+name+id+intro+address+tel);
        departmentDao.addDepart(name, id, intro, address, tel);
        this.getAll(request, response);


    }

    /*
    * 删除部门信息
    * */
    private void deleteDepart(HttpServletRequest request,
                              HttpServletResponse response) throws ServletException, IOException, ParseException {
        int id = Integer.parseInt(request.getParameter("deleteDepartId"));
        departmentDao.deleteDepart(id);
        this.getAll(request, response);
    }

    /*
    * 判断部门名字是否重复，ajax-->js验证
    * */
    private void judgeRepeat_D_name(HttpServletRequest request,
                                    HttpServletResponse response) throws ServletException, IOException, ParseException {
        String name = request.getParameter("parameter");
        System.out.println("获取的名字---" + name);
        Department department = departmentDao.checkRepeatD_Name(name);
        System.out.println(department);
        if (department == null) {
            System.out.println("成功获取该depart的数量,数量为空，返回100");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("100");
        } else {
            System.out.println("数据库中已经存在该depart的name，返回200");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("200");
        }

    }

    /*
    * 验证部门代码id是否重复，ajax-->js验证
    * */
    private void judgeRepeat_D_id(HttpServletRequest request,
                                  HttpServletResponse response) throws ServletException, IOException, ParseException {
        int id = Integer.parseInt(request.getParameter("parameter"));
        System.out.println("获取的id---" + id);
        Department department = departmentDao.checkRepeatD_Id(id);
        System.out.println(department);
        if (department == null) {
            System.out.println("成功获取该depart_id的数量,数量为空，返回100");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("100");
        } else {
            System.out.println("数据库中已经存在该depart的id，返回200");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("200");
        }

    }

}
