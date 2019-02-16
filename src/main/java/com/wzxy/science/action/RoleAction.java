package com.wzxy.science.action;

import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.wzxy.science.entity.SysRight;
import com.wzxy.science.entity.SysRole;
import com.wzxy.science.entity.SysRoleRight;
import com.wzxy.science.service.IRightService;
import com.wzxy.science.service.IRoleRightService;
import com.wzxy.science.service.IRoleService;
import com.wzxy.science.util.Result;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;
import java.util.List;

@Controller("roleAction")
@Scope("prototype")
public class RoleAction extends BaseAction implements Preparable, ModelDriven {


    private static final long serialVersionUID = -4104125263890869018L;
    protected static final String LIST_JSP = "/WEB-INF/view/role/role_list.jsp";
    protected static final String ADD_JSP = "/WEB-INF/view/role/role_add.jsp";
    protected static final String EDIT_JSP = "/WEB-INF/view/role/role_edit.jsp";

    protected final Log logger= LogFactory.getLog(getClass());

    @Resource
    private IRoleService roleService;

    @Resource
    private IRoleRightService roleRightService;

    @Resource
    private IRightService rightService;

    private String[] rightId;

    private SysRoleRight sysRoleRight;
    private SysRole sysRole;
    private Result<SysRole> pageResult; //分页
    private List<SysRight> sysRights;//权限
    private List<SysRoleRight> roleRights;//角色权限


    @Override
    public Object getModel() {
        return sysRole;
    }

    @Override
    public void prepare() throws Exception {
        if(null == sysRole){
            sysRole = new SysRole();
        }
        if(null == sysRoleRight){
            sysRoleRight = new SysRoleRight();
        }
    }

    /**
     * 添加角色
     * @return
     * @throws Exception
     */
    public String add() throws Exception{
        //System.out.println(sysRole.getRoleName());
        //System.out.println("rightId.length="+rightId.length);
        roleService.add(sysRole,rightId);
        sysRole.setRoleName(sysRole.getRoleName());
        return list();
    }

    /**
     * 列表
     * @return
     * @throws Exception
     */
    public String list()throws Exception{
        logger.info("##sysRole列表读取...");
        pageResult = roleService.find(sysRole, getPage(),getRow());
        setForwardView(LIST_JSP);
        return SUCCESS;
    }

    /**
     * 保存修改信息
     * @return
     * @throws Exception
     *
     */
    public String update() throws Exception{
        roleService.update(sysRole, rightId);
        sysRole.setRoleName(sysRole.getRoleName());
        return list();
    }

    /**
     * 删除角色
     * @return
     * @throws Exception
     */
    public String delete() throws Exception{
        roleService.delete(sysRole.getRoleId());
        return list();
    }

    /**
     * 跳转到add页面
     * @return
     */
    public String openAdd(){
        sysRights = rightService.getRightAll();
        setForwardView(ADD_JSP);
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
     * 跳转到修改页面
     * @return
     * @author 卢善坚，汪嘉惠
     * @date 2015.8.10
     */
    public String openEdit(){

        sysRoleRight.setRoleId(sysRole.getRoleId());
        //查询角色的权限
        roleRights = roleRightService.findByRole(sysRoleRight.getRoleId());
        //查询权限表
        sysRights = rightService.getRightAll();
        //根据角色编号查询角色信息
        sysRole = roleService.findById(sysRole.getRoleId());
        forwardView = EDIT_JSP;
        return SUCCESS;
    }

    public String[] getRightId() {
        return rightId;
    }

    public void setRightId(String[] rightId) {
        this.rightId = rightId;
    }

    public SysRoleRight getSysRoleRight() {
        return sysRoleRight;
    }

    public void setSysRoleRight(SysRoleRight sysRoleRight) {
        this.sysRoleRight = sysRoleRight;
    }

    public SysRole getSysRole() {
        return sysRole;
    }

    public void setSysRole(SysRole sysRole) {
        this.sysRole = sysRole;
    }

    public Result<SysRole> getPageResult() {
        return pageResult;
    }

    public void setPageResult(Result<SysRole> pageResult) {
        this.pageResult = pageResult;
    }

    public List<SysRight> getSysRights() {
        return sysRights;
    }

    public void setSysRights(List<SysRight> sysRights) {
        this.sysRights = sysRights;
    }

    public List<SysRoleRight> getRoleRights() {
        return roleRights;
    }

    public void setRoleRights(List<SysRoleRight> roleRights) {
        this.roleRights = roleRights;
    }
}
