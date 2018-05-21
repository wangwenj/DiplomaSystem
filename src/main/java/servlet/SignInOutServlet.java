package servlet;


import dao.SignInOutDao;
import dao.UserDao_1;

import daoImp.SignInOutDaoImpl;
import daoImp.UserDao1Imp;
import entity.SignInOut;
import entity.User;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

public class SignInOutServlet extends HttpServlet {

    private final static int OPERATION_SIGN_IN = 1;
    private final static int OPERATION_SIGN_OUT = 0;
    UserDao_1 userDao_1 = new UserDao1Imp();
    SignInOutDao signinOutDao = (SignInOutDao) new SignInOutDaoImpl();

    public enum Status {
        late("迟到"), earlyLeave("早退"), normal("正常"), unnormal("异常");
        private String des;

        private Status(String string)

        {
            des = string;
        }

        public String getStauts() {
            return des;
        }
    }

    public SignInOutServlet() {
        super();
    }


    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //以下为解决乱码
        request.setCharacterEncoding("UTF-8");
        String servletpath = request.getServletPath();
        String MethodName = servletpath.substring(1);
        MethodName = MethodName.substring(0, MethodName.length() - 10);
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

    private void sign(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        User user = (User) request.getSession().getAttribute("user");
        int userId_current = user.getId_user();
        int operation = request.getParameter("operation").equals("1") ? 1 : 0;
        Calendar cal = Calendar.getInstance();
        Date signTime = cal.getTime();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");


        String dayStr = sdf.format(signTime);
        String signTimeStr = sdfDate.format(signTime);//存入数据库的时间

        SignInOut sign = new SignInOut();

        if (operation == 1) {

        }


        sign.setDay_str(dayStr);
        sign.setUser_id(userId_current);
        sign.setSign_time(signTimeStr);
        sign.setOperation(operation);

        SignInOut signinOut = signinOutDao.find(sign);//通过user_id operation day_str查找数据
        if (signinOut != null) {
            if (operation == 0) {//签退
                signinOutDao.update(signinOut.getId(), signTimeStr);
            }
        } else {
            signinOutDao.add(sign);
            if (sign.getOperation() == 0) {
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("0");//签退成功
            } else {
                response.setCharacterEncoding("UTF-8");
                response.getWriter().write("1");//签到成功
            }

        }
    }


    private void getAll(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        Calendar cal = Calendar.getInstance();
        Date signTime = cal.getTime();

        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
        String dayStr = sdf.format(signTime);
        List<SignInOut> signList = signinOutDao.getAll();//获取数据当天所有数据

        SimpleDateFormat sdfDateTemp = new SimpleDateFormat("HHmm");

        for (int i = 0; i < signList.size(); i++) {
            //判断签到时间，设置数据库中的状态
            if (signList.get(i).getSign_time() == null) {
                signList.get(i).setStatus(Status.unnormal.getStauts());
            } else {
                Date signTimeDate = getHMs(signList.get(i).getSign_time());//签到时间的hms
                if (signList.get(i).getOperation() == 1) {//签到
                    signList.get(i).setOperation_name("签到");
                    signList.get(i).setStatus(isLate(signTimeDate).getStauts());
                } else {
                    signList.get(i).setOperation_name("签退");
                    signList.get(i).setStatus(isEarlyLeave(signTimeDate).getStauts());
                }
            }
            String user_name = (userDao_1.getOne(signList.get(i).getId_user())).getName();
            signList.get(i).setUser_name(user_name);
        }

        request.setAttribute("signList", signList);
        request.getRequestDispatcher("/sign_manage.jsp").forward(request, response);

    }

    private void deleteSign(HttpServletRequest request,
                            HttpServletResponse response) throws ServletException, IOException,
            ParseException {
        int signId = Integer.parseInt(request.getParameter("signId"));
        signinOutDao.delete(signId);
        this.getAll(request, response);
    }

    private Date getHMs(String dateTime) throws ParseException {
        DateFormat df = new SimpleDateFormat("HH:mm:ss");
        String arrays[] = dateTime.split(" ");
        return df.parse(arrays[1]);
    }

    private Status isLate(Date time) throws ParseException {//ture-->迟到
        DateFormat df = new SimpleDateFormat("HH:mm:ss");
        if (time.getTime() > df.parse("09:00:00").getTime() && time.getTime() < df.parse("18:00:00").getTime())
            return Status.late;
        if (time.getTime() <= df.parse("09:00:00").getTime() && time.getTime() > df.parse("00:00:00").getTime())
            return Status.normal;
        return Status.unnormal;
    }

    private Status isEarlyLeave(Date time) throws ParseException {//ture-->迟到
        DateFormat df = new SimpleDateFormat("HH:mm:ss");
        if (time.getTime() < df.parse("18:00:00").getTime() && time.getTime() > df.parse("09:00:00").getTime())
            return Status.earlyLeave;
        if (time.getTime() >= df.parse("18:00:00").getTime() && time.getTime() < df.parse("00:00:00").getTime())
            return Status.normal;
        return Status.unnormal;
    }

    //    获取一周的签到信息
    private void getOneWeekSignInfo(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        Calendar cal = Calendar.getInstance();
        Date now = cal.getTime();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
        String dayTo = sdf.format(now);
        int dayOfWeek = cal.get(Calendar.DAY_OF_WEEK);
        String dayFrom = dayTo;

        List<String> dayStrList = new ArrayList<>();
        if (dayOfWeek > 1) {
            cal.add(Calendar.DAY_OF_MONTH, 1 - dayOfWeek);
            dayFrom = sdf.format(cal.getTime());
            dayStrList.add(dayFrom);

            int dayCount = 0;
            while (dayCount < dayOfWeek - 1) {
                dayCount++;
                cal.add(Calendar.DAY_OF_MONTH, dayCount);
                dayStrList.add(sdf.format(cal.getTime()));
            }
        } else {
            dayStrList.add(dayFrom);
        }
        List<SignInOut> signs = signinOutDao.getOneWeekSign(dayFrom, dayTo);

        Map<String, SignInOut> signMap = new HashMap<>();
        if (signs != null && !signs.isEmpty()) {
            for (SignInOut sign : signs) {
                String signKey = getSignKey(sign.getUser_id(), sign.getDay_str(), sign.getOperation());
                signMap.put(signKey, sign);
            }
        }

        SimpleDateFormat sdfDate = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

        List<SignInOut> userSignList = new ArrayList<>();
        List<User> users = userDao_1.getAll();
        if (users != null && !users.isEmpty()) {
            for (String dayStr : dayStrList) {
                for (User user : users) {
                    int userId = user.getId_user();
                    // sign in info
                    SignInOut signIn = new SignInOut();
                    signIn.setUser_id(userId);
                    signIn.setUser_name(user.getName()); // you can add more user attributes here if u need
                    // sign out info
                    SignInOut signOut = new SignInOut();
                    signOut.setUser_id(userId);
                    signOut.setUser_name(user.getName()); // you can add more user attributes here if u need

                    userSignList.add(signIn);
                    userSignList.add(signOut);

                    String signInKey = getSignKey(userId, dayStr, OPERATION_SIGN_IN);
                    String signOutKey = getSignKey(userId, dayStr, OPERATION_SIGN_OUT);

                    // if user has sign out this day
                    if (signMap.containsKey(signInKey)) {
                        SignInOut si = signMap.get(signInKey);
                        signIn.setSign_time(si.getSign_time());
                        // check if late
                        Date signTime = sdfDate.parse(si.getSign_time());
                        if (si.getOperation() == 0) {
                            si.setOperation_name("签退");
                        } else if (si.getOperation() == 1) {
                            si.setOperation_name("签到");
                        }
                        cal.setTime(signTime);
                        int hour = cal.get(Calendar.HOUR_OF_DAY);
                        if (hour < 9) {
                            signIn.setStatus(Status.normal.getStauts());
                        } else {
                            signIn.setStatus(Status.late.getStauts());
                        }
                    } else {
                        signIn.setStatus(Status.unnormal.getStauts());
                    }

                    // if user has sign out this day
                    if (signMap.containsKey(signOutKey)) {
                        SignInOut so = signMap.get(signOutKey);
                        signOut.setSign_time(so.getSign_time());
                        if (so.getOperation() == 0) {
                            so.setOperation_name("签退");
                        } else if (so.getOperation() == 1) {
                            so.setOperation_name("签到");
                        }
                        // check if leave early
                        Date signTime = sdfDate.parse(so.getSign_time());
                        cal.setTime(signTime);
                        int hour = cal.get(Calendar.HOUR_OF_DAY);
                        if (hour < 18) {
                            signIn.setStatus(Status.earlyLeave.getStauts());
                        } else {
                            signIn.setStatus(Status.normal.getStauts());
                        }
                    } else {
                        signOut.setStatus(Status.unnormal.getStauts());
                    }
                }
            }
        }
        /*response.setContentType("text/html; charset=utf-8");
        //调用JSONArray.fromObject方法把array中的对象转化为JSON格式的数组
        JSONArray json = JSONArray.fromObject(userSignList);
        JSONObject jb = new JSONObject();
        jb.put("userSignList", json);
        response.getWriter().write(jb.toString());*/
        request.setAttribute("userSignList", userSignList);
        request.getRequestDispatcher("/sign_manage_week.jsp").forward(request, response);
    }

    private String getSignKey(int userId, String dayStr, int operation) {
        return dayStr + "," + userId + "," + operation;
    }


}
