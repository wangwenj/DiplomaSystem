package servlet;

import dao.DepartmentDao;
import dao.PositionDao;
import dao.PositionDeleteDao;
import daoImp.DepartmentImp;
import daoImp.PositionImp;
import daoImp.PositonDeleteDaoImpl;
import entity.Department;
import entity.Position;

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

public class PosiManageServlet extends HttpServlet {
    PositionDao positionDao = new PositionImp();
    DepartmentDao departmentDao = new DepartmentImp();
    PositionDeleteDao positionDeleteDao=new PositonDeleteDaoImpl();

    public PosiManageServlet() {
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
        MethodName = MethodName.substring(0, MethodName.length() - 5);
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
     * 获取全部职位信息（进入页面就调用该方法）
     * @wwj
     * */
    private void getAll(HttpServletRequest request,
                        HttpServletResponse response) throws ServletException, IOException, ParseException {
        List<Position> positions = positionDao.getAllPosition();
        List<Department> departments = departmentDao.getAllDepartment();
        request.setAttribute("positions", positions);
        request.setAttribute("departments", departments);
        request.getRequestDispatcher("/position_manage.jsp").forward(request, response);
    }

    /*
     * 更新职位信息
     * @wwj
     * */
    private void updatePosition(HttpServletRequest request,
                                HttpServletResponse response) throws ServletException, IOException, ParseException {
        String name = request.getParameter("m_name");
        int id = Integer.parseInt(request.getParameter("m_id"));
        String intro = request.getParameter("m_intro");
        positionDao.updatePosition(name, intro, id);
        this.getAll(request, response);
    }

    /*
     *增加职位信息
     * @wwj
     * */
    private void addPosition(HttpServletRequest request,
                             HttpServletResponse response) throws ServletException, IOException, ParseException {
        System.out.println("进入增加职位的函数");
        String name = request.getParameter("d_name");
        int id = Integer.parseInt(request.getParameter("d_id"));
        String intro = request.getParameter("d_intro");
        System.out.println("加入部门信息" + name + id + intro);
        positionDao.addPosition(name, intro, id);
        this.getAll(request, response);


    }

    /*
     * 删除职位信息
     * @wwj
     * */
    private void deletePosition(HttpServletRequest request,
                                HttpServletResponse response) throws ServletException, IOException, ParseException {
        int id = Integer.parseInt(request.getParameter("deleteId"));
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
        Position position=positionDao.getOne(id);
        positionDeleteDao.add_position_delete(position.getId_position(),position.getP_name(),position.getIntro(),date);
        positionDao.deletePosition(id);
        this.getAll(request, response);
    }

    /*
    * 职位名称查重  ajax--->js验证
    * @wwj
    * */
    private void judgeRepeat_P_name(HttpServletRequest request,
                                    HttpServletResponse response) throws ServletException, IOException, ParseException {
        String name = request.getParameter("parameter");
        System.out.println("获取的名字---" + name);
        Position position = positionDao.checkRepeatP_Name(name);
        System.out.println(position);
        if (position == null) {
            System.out.println("成功获取该position_name的数量,数量为空，返回100");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("100");
        } else {
            System.out.println("数据库中已经存在该position的name，返回200");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("200");
        }

    }

    /*
     * 职位代码id查重  ajax--->js验证
     * @wwj
     * */
    private void judgeRepeat_P_id(HttpServletRequest request,
                                  HttpServletResponse response) throws ServletException, IOException, ParseException {
        int id = Integer.parseInt(request.getParameter("parameter"));
        System.out.println("获取的id---" + id);
        Position position = positionDao.checkRepeatP_Id(id);
        System.out.println(position);
        if (position == null) {
            System.out.println("成功获取该position_id的数量,数量为空，返回100");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("100");
        } else {
            System.out.println("数据库中已经存在该position的id，返回200");
            response.setCharacterEncoding("UTF-8");
            response.getWriter().write("200");
        }

    }
}
