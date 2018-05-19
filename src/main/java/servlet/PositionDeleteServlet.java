package servlet;

import dao.PositionDao;
import dao.PositionDeleteDao;
import daoImp.PositionImp;
import daoImp.PositonDeleteDaoImpl;
import entity.PositionDelete;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;
import java.util.List;

public class PositionDeleteServlet extends HttpServlet{

    PositionDeleteDao positionDeleteDao=new PositonDeleteDaoImpl();

    PositionDao positionDao=new PositionImp();

    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    public void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
        //以下为解决乱码
        request.setCharacterEncoding("UTF-8");
        String servletpath = request.getServletPath();
        String MethodName = servletpath.substring(1);
        MethodName = MethodName.substring(0, MethodName.length() - 15);
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

    private void getAll(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, ParseException{
        List<PositionDelete> positionAll=positionDeleteDao.getAll();
        request.setAttribute("positionAll",positionAll);
        request.getRequestDispatcher("/position_delete_history.jsp").forward(request, response);
    }

    private void deleteUser(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, ParseException{
        //前台数据传操作方式和id
        String operation=request.getParameter("operotion");
        int id= Integer.parseInt(request.getParameter("restoreId"));
        if(operation.equals("restore")){
            PositionDelete pDelete=positionDeleteDao.getOne(id);
            positionDao.addPosition(pDelete.getP_name(),pDelete.getIntro(), pDelete.getId_position());
        }
        positionDeleteDao.delete_position_delete(id);
        this.getAll(request,response);
    }

}
