package servlet;

import dao.UserDao_1;
import daoImp.UserDao1Imp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.ParseException;

public class Loginservlet extends HttpServlet {


	public Loginservlet() {
		super();
	}

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request,response);
	}
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	    //以下为解决乱码
		 request.setCharacterEncoding("UTF-8");
		 String servletpath =request.getServletPath();
		 String MethodName=servletpath.substring(1);
		 MethodName=MethodName.substring(0, MethodName.length()-6);
		 String strBackUrl = "http://" + request.getServerName() //服务器地址
                + ":"
                + request.getServerPort()           //端口号
                + request.getContextPath()     //项目名称
                + request.getServletPath()      //请求页面或其他地址
            + "?" + (request.getQueryString()); //参数
		 System.out.println(strBackUrl);
		 System.out.println("request is "+MethodName);
		 //以上为输出请求内容
			Method method;
			try {
				method = getClass().getDeclaredMethod(MethodName,HttpServletRequest.class,HttpServletResponse.class);
				 method.invoke(this, request,response);
			} catch (NoSuchMethodException |SecurityException|IllegalAccessException|IllegalArgumentException|InvocationTargetException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

	}

	private void signin(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException, ParseException  {

		String user_id=request.getParameter("id_user");
        System.out.println(user_id);
		String password=request.getParameter("password");
        UserDao_1 userDao1 =new UserDao1Imp();
        System.out.println("@@@@@@@@@@"+ userDao1);
		if (userDao1.getOne(user_id).getPassword()==password){
            response.sendRedirect("/login1.jsp");
		}
        response.sendRedirect("/login1.jsp");
	}

}
