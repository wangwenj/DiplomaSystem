package servlet;

import dao.DepartmentDao;
import dao.PositionDao;
import dao.UserDao_1;
import dao.VacateDao;
import daoImp.DepartmentImp;
import daoImp.PositionImp;
import daoImp.UserDao1Imp;
import daoImp.VacateDaoImp;
import entity.Department;
import entity.Position;
import entity.User;
import entity.Vacate;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.util.List;

public class VacateServlet extends HttpServlet {
    UserDao_1 userDao_1 = new UserDao1Imp();
    DepartmentDao departmentDao = new DepartmentImp();
    PositionDao positionDao = new PositionImp();
    VacateDao vacateDao = new VacateDaoImp();

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

    /*
     * 获取请假单信息，点击导航栏链接调用,主要用于显示管理员下拉框
     * @wwj
     * */
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

    /*
     * 判断输入的名字是否存在，输入框应该输入存在名字，ajax请求
     * @wwj
     * */
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


        }


    }

    /*
     * 获取请假申请人相关信息，ajax请求
     * 返回json数据
     * @wwj
     * */
    private void getUserApplyInfo(HttpServletRequest request,
                                  HttpServletResponse response) throws ServletException, IOException, ParseException {
        String name = request.getParameter("name_apply");

        Vacate apply_info = vacateDao.getApplyInfo(name);
        response.setContentType("text/html; charset=utf-8");
        //调用JSONArray.fromObject方法把array中的对象转化为JSON格式的数组
        JSONArray json = JSONArray.fromObject(apply_info);
        JSONObject jb = new JSONObject();
        jb.put("apply_info", json);
        response.getWriter().write(jb.toString());
        //System.out.println(json.toString());
        //返回给前段页面
    }


    /*
     * 获取请假管理员（审批人）的相关信息，ajax请求
     * 返回json数据
     * @wwj
     * */
    private void getUserAdminInfo(HttpServletRequest request,
                                  HttpServletResponse response) throws ServletException, IOException, ParseException {

        String admin_user_name = request.getParameter("admin_user_id");
        Vacate admin_user_info = vacateDao.getAdminInfo(admin_user_name);
        response.setContentType("text/html; charset=utf-8");
        //调用JSONArray.fromObject方法把array中的对象转化为JSON格式的数组
        JSONArray json = JSONArray.fromObject(admin_user_info);
        JSONObject jb = new JSONObject();
        jb.put("admin_user_info", json);
        response.getWriter().write(jb.toString());
    }

    /*
     * 增加请假的信息进入数据库
     * @wwj
     * */
    private void addVacateForm(HttpServletRequest request,
                               HttpServletResponse response) throws ServletException, IOException, ParseException {
        String apply_name = request.getParameter("name_apply_input");
        int apply_name_id = userDao_1.countUser(apply_name).getId_user();
        String time_apply = request.getParameter("time_apply");
        String time_start = request.getParameter("time_start");
        String time_end = request.getParameter("time_end");
        String admin_user = request.getParameter("admin_user");
        int admin_user_id = userDao_1.countUser(admin_user).getId_user();
        String total_time = request.getParameter("total_time");
        String reason_input = request.getParameter("reason_input");
        String status = "待审批";
        vacateDao.add(apply_name_id, time_apply, time_start, time_end, admin_user_id, total_time, reason_input, status);
        this.getAll(request, response);
    }

    /*
     * 根据未审核和登录用户的id获取所有请假单的信息，在请假管理页面显示数据,最后跳转到请假管理页面
     * */
    private void getAllVacate(HttpServletRequest request,
                              HttpServletResponse response) throws ServletException, IOException, ParseException {
        User currentUser= (User) request.getSession().getAttribute("user");
        int userId_current =currentUser.getId_user();
        List<Vacate> vacates = vacateDao.getAllVacate(userId_current);
        request.setAttribute("allVacates", vacates);
        request.getRequestDispatcher("/note_for_leave_manage.jsp").forward(request, response);
    }

    /*
     * 管理员获取未审批的请假单详情
     * */
    private void getVacateForm(HttpServletRequest request,
                               HttpServletResponse response) throws ServletException, IOException, ParseException {
        int id = Integer.parseInt(request.getParameter("id"));
        Vacate vacate = vacateDao.getVacateForm(id);
        vacate.setApply_depart_name(departmentDao.findD_name(vacate.getApply_depart_id()));
        vacate.setApply_posi_name(positionDao.findP_name(vacate.getApply_posi_id()));
        vacate.setAdmin_posi_name(positionDao.findP_name(vacate.getAdmin_posi_id()));
        request.setAttribute("oneVacate", vacate);
        request.getRequestDispatcher("/note_for_leave_handle.jsp").forward(request, response);
    }


    /*
     * 管理员是否同意请假，选择之后改变状态栏
     * */
    private void isOrNotPermit(HttpServletRequest request,
                               HttpServletResponse response) throws ServletException, IOException, ParseException {
        String isOrNotPermit = request.getParameter("isOrNotPermit");
        int id_vacate = Integer.parseInt(request.getParameter("id_vacate"));
        if (isOrNotPermit.equals("permit")) {
            vacateDao.updateToPermit(id_vacate);
            this.getAllVacate(request,response);

        } else {
            vacateDao.updateToNotPermit(id_vacate);
            this.getAllVacate(request,response);
        }

    }

    /*
     * 获取所有登录用户的申请单
     * */
    private void getAllApply(HttpServletRequest request,
                             HttpServletResponse response) throws ServletException, IOException, ParseException {
        User user= (User) request.getSession().getAttribute("user");

        int userId_current = user.getId_user();
        List<Vacate> vacates = vacateDao.getAllApply(userId_current);
        request.setAttribute("allApply", vacates);
        request.getRequestDispatcher("/note_for_leave_result.jsp").forward(request, response);
    }


}
