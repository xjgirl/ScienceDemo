package com.wzxy.science.action;

import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.wzxy.science.dao.impl.UserDao;
import com.wzxy.science.entity.SysRole;
import com.wzxy.science.entity.SysUser;
import com.wzxy.science.entity.SysUserRole;
import com.wzxy.science.service.ILoginRecordService;
import com.wzxy.science.service.IRoleService;
import com.wzxy.science.service.IUserRoleService;
import com.wzxy.science.service.IUserService;
import com.wzxy.science.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;

@Controller("userAction")
@Scope("prototype")
public class UserAction extends BaseAction implements Preparable, ModelDriven {
    private static final long serialVersionUID = -4543142472432152186L;
    protected static final String LIST_JSP = "/WEB-INF/view/user/user-list.jsp";
    protected static final String ADD_JSP = "/WEB-INF/view/user/user_add.jsp";
    protected static final String EDIT_JSP = "/WEB-INF/view/user/user_edit.jsp";
    protected static final String MESSAGE_JSP = "/WEB-INF/view/user/user_message.jsp";
    protected static final String LOGIN_JSP = "/login.jsp";
    protected static final String APPLICANTLIST_JSP = "/WEB-INF/view/user/SysApplicant_list.jsp";

    @Autowired
    private IUserService userService;

    @Resource
    private ILoginRecordService loginRecordService;

    @Resource
    private IUserRoleService userRoleService;

    @Resource
    private IRoleService roleService;

    @Resource
    private UserDao tUserDao;

    private SysUserRole sysUserRole; //用户角色模型
    private String[] roleId;
    private SysUser sysUser;//用户模型
    private Result<SysUser> pageResult;//分页
    private List<SysRole> roles; //角色
    private List<SysUserRole> userRoles;//接收用户角色列表
    private String oldPassword;//用户原来的密码
    private int userTypee;
    private int actionState;//操作状态。1-操作成功（保存成功）
    private String city;
    private String province;
    private String county;
    private String area=null;

    private String tib;
    private String telephone;
    private String userN;

    @Override
    public Object getModel() {
        return sysUser;
    }

    @Override
    public void prepare() throws Exception {
        if(null == sysUser){
            sysUser = new SysUser();
        }
        if(null == sysUserRole){
            sysUserRole = new SysUserRole();
        }
    }

    @Override
    public String execute() throws Exception {

        return SUCCESS;
    }

    /**
     * 列表
     * @return
     * @throws Exception
     */
    public String list()throws Exception{
        pageResult = userService.find(sysUser, getPage(), getRow());
        setForwardView(LIST_JSP);
        return SUCCESS;
    }

    /**
     * 添加用户
     * @return
     * @throws Exception
     *
     */
    public String add() throws Exception{
         System.out.println("fasfas"+sysUser.getUserType());
         boolean result1 = userService.checkUserName(sysUser.getUserName());
         if(!result1){
         String maxNumber = String.valueOf(tUserDao.findMaxUserId());
            //System.out.println("maxNumber"+maxNumber);
            if("[null]".equals(maxNumber)){
                maxNumber = null;
                int a = 10001;
                String number = String.valueOf(a);
                String newName = number;
                //System.out.println("newName"+newName);
                sysUser.setUserId(newName);
            }

            if(4==sysUser.getUserType()){
                sysUser.setStudentType(1);
            }else{
                sysUser.setStudentType(3);
            }
            userService.add(sysUser);
            sysUser.setUserName(sysUser.getUserName());
            return list();
        }else{
            tib="have1";
            setForwardView(ADD_JSP);
            return SUCCESS;
        }
    }

    /**
     * 保存修改的用户信息
     * @return
     * @throws Exception
     *
     */
    public String update() throws Exception{
        boolean result1=false;

        if(!result1){

            sysUser.setUserName(sysUser.getUserName());
            userService.update(sysUser,roleId, getOldPassword());
            return list();
        }else{
            tib="have1";
            return openEdit();
        }
    }

    /**
     * 保存用户个人修改的信息
     * @param
     * @param
     *
     */
    public String updateUserMessage(){
        userService.updateUserMessage(sysUser, oldPassword);
        actionState = 1;
        return openMessage();
    }

    /**
     * 删除用户
     *
     * @param
     *
     */
    public String delete() throws Exception{
        userService.delete(sysUser.getId(),sysUser.getUserId());
        return list();
    }

    public String register() throws Exception{
        sysUser.setStudentType(0);
        sysUser.setUserType(4);
        String maxNumber = String.valueOf(tUserDao.findMaxUserId());
        //System.out.println("maxNumber"+maxNumber);
        if("[null]".equals(maxNumber)){
            maxNumber = null;
            int a = 10001;
            String number = String.valueOf(a);
            String newName = number;
            //System.out.println("newName"+newName);
            sysUser.setUserId(newName);
        }
        else{
            //截取序号，并将其转换成int类型
            String numberString = maxNumber.substring(1, maxNumber.length()-1);
            //System.out.println("numberString"+numberString);
            int a = Integer.valueOf(numberString)+1;
            //System.out.println("a"+a);
            String number = String.valueOf(a);
            String newName = number;
            //System.out.println("newName"+newName);

            if(5 == newName.length()){
                sysUser.setUserId(newName);
            }
        }
        userService.add(sysUser);
        sysUser=userService.findByUserId(sysUser.getUserId());
        sysUserRole.setRoleId("student");
        sysUserRole.setUserId(sysUser.getUserId());
        userRoleService.addUserRole(sysUserRole);
        setForwardView(LOGIN_JSP);
        return SUCCESS;
    }

    /**
     * 页面跳转
     * @return
     */
    public String openList(){

        return SUCCESS;
    }

    /**
     * 打开添加用户页面
     * @return
     *
     */
    public String openAdd(){
        //查询出所有角色信息
        roles = roleService.getRoleAll();
        //获取所有省（直辖市）
        //comDistricts = comDistrictService.findComDistrictByUpid(0);

        forwardView = ADD_JSP;
        return SUCCESS;
    }

    /**
     * 打开修改信息页面
     * @return
     *
     */
    public String openEdit(){
        //查询角色的所有信息
        roles = roleService.getRoleAll();
        //comDistricts = comDistrictService.findComDistrictByUpid(0);
        //根据用户编号查询用户角色
        userRoles = userRoleService.findByUserId(sysUser.getUserId());

        //根据用户id查询用户信息
        sysUser = userService.findById(sysUser.getId());

        forwardView = EDIT_JSP;
        return SUCCESS;
    }

    /**
     * 打开个人修改信息页面
     * @return
     */
    public String openMessage(){
        //根据用户id查询用户信息
        sysUser = userService.findById(sysUser.getId());
        //sysUser = userService.findByUserId(sysUser.getUserId());
        //根据用户编号查询用户角色
        userRoles = userRoleService.findByUserId(sysUser.getUserId());
        forwardView = MESSAGE_JSP;
        return SUCCESS;

    }

    public String applicantList()throws Exception{
        System.out.println("fdasfasfas"+sysUser.getUserName());
        pageResult = userService.findApplicant(sysUser, getPage(), getRow());
        setForwardView(APPLICANTLIST_JSP);
        return SUCCESS;
    }

    public String agreeApply()throws Exception{
        sysUser=userService.findByUserId(sysUser.getUserId());
        sysUser.setStudentType(1);
        userService.update(sysUser);
        sysUser.setUserName(null);;
        return applicantList();
    }

    public String disagreeApply()throws Exception{
        sysUser=userService.findByUserId(sysUser.getUserId());
        sysUser.setStudentType(2);
        userService.update(sysUser);
        sysUser.setUserName(null);
        return applicantList();
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getUserN() {
        return userN;
    }

    public void setUserN(String userN) {
        this.userN = userN;
    }

    public IUserService getUserService() {
        return userService;
    }

    public void setUserService(IUserService userService) {
        this.userService = userService;
    }

    public ILoginRecordService getLoginRecordService() {
        return loginRecordService;
    }

    public void setLoginRecordService(ILoginRecordService loginRecordService) {
        this.loginRecordService = loginRecordService;
    }

    public IUserRoleService getUserRoleService() {
        return userRoleService;
    }

    public void setUserRoleService(IUserRoleService userRoleService) {
        this.userRoleService = userRoleService;
    }

    public IRoleService getRoleService() {
        return roleService;
    }

    public void setRoleService(IRoleService roleService) {
        this.roleService = roleService;
    }

    public UserDao gettUserDao() {
        return tUserDao;
    }

    public void settUserDao(UserDao tUserDao) {
        this.tUserDao = tUserDao;
    }

    public SysUserRole getSysUserRole() {
        return sysUserRole;
    }

    public void setSysUserRole(SysUserRole sysUserRole) {
        this.sysUserRole = sysUserRole;
    }

    public String[] getRoleId() {
        return roleId;
    }

    public void setRoleId(String[] roleId) {
        this.roleId = roleId;
    }

    public SysUser getSysUser() {
        return sysUser;
    }

    public void setSysUser(SysUser sysUser) {
        this.sysUser = sysUser;
    }

    public Result<SysUser> getPageResult() {
        return pageResult;
    }

    public void setPageResult(Result<SysUser> pageResult) {
        this.pageResult = pageResult;
    }

    public List<SysRole> getRoles() {
        return roles;
    }

    public void setRoles(List<SysRole> roles) {
        this.roles = roles;
    }

    public List<SysUserRole> getUserRoles() {
        return userRoles;
    }

    public void setUserRoles(List<SysUserRole> userRoles) {
        this.userRoles = userRoles;
    }

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public int getUserTypee() {
        return userTypee;
    }

    public void setUserTypee(int userTypee) {
        this.userTypee = userTypee;
    }

    public int getActionState() {
        return actionState;
    }

    public void setActionState(int actionState) {
        this.actionState = actionState;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county;
    }

    public String getArea() {
        return area;
    }

    public void setArea(String area) {
        this.area = area;
    }

    public String getTib() {
        return tib;
    }

    public void setTib(String tib) {
        this.tib = tib;
    }
}
