package com.wzxy.science.action.front;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.wzxy.science.action.BaseAction;
import com.wzxy.science.entity.SysLoginRecord;
import com.wzxy.science.entity.SysUser;
import com.wzxy.science.service.ILoginRecordService;
import com.wzxy.science.service.IUserService;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller("loginAction")
@Scope("prototype")
public class LoginAction extends BaseAction implements Preparable, ModelDriven {
    private static final long serialVersionUID = -4104125263890869018L;
    protected static final String LOGIN_JSP = "/login.jsp";
    protected static final String MAIN_JSP = "/WEB-INF/view/out/main.jsp";
    protected static final String TOP_JSP = "/WEB-INF/view/out/top.jsp";
    protected static final String LEFT_JSP = "/WEB-INF/view/out/left.jsp";
    protected static final String INDEX_JSP = "/WEB-INF/view/out/index.jsp";
    protected static final String REGISTER_JSP = "/WEB-INF/view/studentRegister.jsp";

    @Autowired
    private IUserService userService;

    @Autowired
    private ILoginRecordService loginRecordService;

    private SysUser sysUser;
    private SysLoginRecord sysLoginRecord;
    private List<String> listRight;
    private String inputPassword;
    private String inputUserName;

    @Override
    public Object getModel() {
        return sysUser;
    }

    @Override
    public void prepare() throws Exception {
        if(null == sysUser){
            sysUser = new SysUser();
        }
        if(null == sysLoginRecord){
            sysLoginRecord = new SysLoginRecord();
        }
    }

    /**
     * PC系统管理=登录验证
     * @return
     */
    @SuppressWarnings("unused")
    public String webLogin(){
        HttpServletRequest request = ServletActionContext.getRequest();
        //获取用户传过来的验证码
        String passCode = (String)getRequest().getParameter("passCode");
        //获取系统生成的验证码
        String securityCode = (String)(getRequest().getSession().getAttribute("securityCode"));
        //验证码校验，不正确直接返回
        //passCode.equals(securityCode)
        if(true){//这里先暂时去掉验证码，代码在上一行
            //isLogin初始为false,还有打开isLogin方法
            boolean isLogin = false;
            int isUserType = 0;
            isLogin = userService.isLogin(sysUser);
            String ip = ServletActionContext.getRequest().getRemoteAddr(); //获取用户登录IP
            //获取当前系统时间
            Date date=new Date();
            DateFormat format=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            String time = format.format(date);
            Timestamp loginTime = Timestamp.valueOf(time);//把String 类型转换成 Timestamp 类型

            //根据用户编号或者用户名，读取用户对象
            sysUser = userService.findByName(sysUser.getUserName());
            //System.out.println(sysUser.getUserType());
            //判断用户类型
            if(null != sysUser){
                if(2 == sysUser.getUserType() || sysUser.getUserType() == 3 || sysUser.getUserType() == 4){
                    isUserType = 1;
                }}
            if(1 == isUserType && isLogin){//登录成功

                //获取用户名，并把用户名存入session
                String userName = sysUser.getUserName();
                int userId = sysUser.getId();
                getRequest().getSession().setAttribute("userName",userName );
                getRequest().getSession().setAttribute("userId",userId );
                getRequest().getSession().setAttribute("user",sysUser );
                //将用户登录信息放到用户登录记录对象中
                sysLoginRecord.setOperateContent("登录成功");
                //operateType表示日志类型：1表示登录，2表示导出二维码
                sysLoginRecord.setOperateType(1);
                sysLoginRecord.setLoginIp(ip);
                sysLoginRecord.setUserId(sysUser.getUserId());
                sysLoginRecord.setUserName(sysUser.getUserName());
                sysLoginRecord.setLoginTime(loginTime);
                //将用户登录记录存放到用户登录记录表中
                loginRecordService.add(sysLoginRecord);
                //查询用户对应的权限（用户->角色->权限）
                listRight=userService.findUserPermissions(sysUser.getUserId());
                //把用户权限放到session当中
                ActionContext.getContext().getSession().put("listRight", listRight);
                //把用户对象放到session当中
                ActionContext.getContext().getSession().put("sysUser", sysUser);
                forwardView = MAIN_JSP;
            }else {
                if(null != sysUser){   //如果用户对象不为空，为密码错误，否则用户名称不存在
                    //将用户登录信息放到用户登录记录对象中
                    sysLoginRecord.setOperateContent("密码错误，登录失败");
                    request.setAttribute("fail","fail1");
                    //operateType表示日志类型：1表示登录，2表示导出二维码
                    sysLoginRecord.setOperateType(1);
                    sysLoginRecord.setLoginIp(ip);
                    sysLoginRecord.setUserId(sysUser.getUserId());
                    sysLoginRecord.setUserName(sysUser.getUserName());
                    sysLoginRecord.setLoginTime(loginTime);
                    //将用户登录记录存放到用户登录记录表中
                    loginRecordService.add(sysLoginRecord);
                    setForwardView (LOGIN_JSP);
                    return SUCCESS;
                }else{
                    request.setAttribute("fail","fail1");
                    setForwardView (LOGIN_JSP);
                    return SUCCESS;
                }
            }}else {
            //如果验证码错误,返回用户名和密码，用户不用再次输入
            setInputPassword(sysUser.getUserPassword());
            setInputUserName(sysUser.getUserName());
            forwardView = LOGIN_JSP;
        }
        return SUCCESS;
    }

    public String openRegister(){
        forwardView = REGISTER_JSP;
        return SUCCESS;
    }

    /**
     * 登录-顶部跳转
     * @return
     */
    public String openTop(){
        forwardView = TOP_JSP;
        return SUCCESS;
    }

    /**
     * 登录-顶部跳转
     * @return
     */
    public String openLeft(){
        forwardView = LEFT_JSP;
        return SUCCESS;
    }

    /**
     * 登录-顶部跳转
     * @return
     */
    public String openIndex(){
        forwardView = INDEX_JSP;
        return SUCCESS;
    }

    public SysUser getSysUser() {
        return sysUser;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    public SysLoginRecord getSysLoginRecord() {
        return sysLoginRecord;
    }

    public void setSysLoginRecord(SysLoginRecord sysLoginRecord) {
        this.sysLoginRecord = sysLoginRecord;
    }

    public List<String> getListRight() {
        return listRight;
    }

    public void setListRight(List<String> listRight) {
        this.listRight = listRight;
    }

    public String getInputPassword() {
        return inputPassword;
    }

    public void setInputPassword(String inputPassword) {
        this.inputPassword = inputPassword;
    }

    public String getInputUserName() {
        return inputUserName;
    }

    public void setInputUserName(String inputUserName) {
        this.inputUserName = inputUserName;
    }
}
