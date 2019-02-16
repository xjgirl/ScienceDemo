package com.wzxy.science.action;

import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.wzxy.science.entity.SysUserRole;
import com.wzxy.science.util.Result;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("userRoleAction")
@Scope("prototype")
public class UserRoleAction  extends BaseAction implements Preparable, ModelDriven {
    protected static final String LIST_JSP = "/WEB-INF/view/user/userRole_list.jsp";
    private SysUserRole sysUserRole;
    private Result<SysUserRole> pageResult;//分页

    @Override
    public Object getModel() {
        return sysUserRole;
    }

    @Override
    public void prepare() throws Exception {
        if(null == sysUserRole){
            sysUserRole = new SysUserRole();
        }
    }

    /**
     * 列表
     * @return
     * @throws Exception
     */
    public String list()throws Exception{
        //pageResult = sysUserRoleService.find(sysUserRole, getPage(), getRow());
        forwardView = LIST_JSP;
        return SUCCESS;
    }

    public SysUserRole getSysUserRole() {
        return sysUserRole;
    }

    public void setSysUserRole(SysUserRole sysUserRole) {
        this.sysUserRole = sysUserRole;
    }

    public Result<SysUserRole> getPageResult() {
        return pageResult;
    }

    public void setPageResult(Result<SysUserRole> pageResult) {
        this.pageResult = pageResult;
    }
}
