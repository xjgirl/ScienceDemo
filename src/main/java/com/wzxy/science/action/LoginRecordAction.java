package com.wzxy.science.action;

import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.wzxy.science.entity.SysLoginRecord;
import com.wzxy.science.service.ILoginRecordService;
import com.wzxy.science.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

@Controller("loginRecordAction")
@Scope("prototype")
public class LoginRecordAction extends BaseAction implements Preparable, ModelDriven {
    private static final long serialVersionUID = -2025587568675799563L;

    private String LIST_JSP="/WEB-INF/view/user/loginRecord_list.jsp";

    @Autowired
    private ILoginRecordService loginRecordService;

    private Result<SysLoginRecord> pageResult;
    private SysLoginRecord sysLoginRecord;

    public Result<SysLoginRecord> getPageResult() {
        return pageResult;
    }

    public void setPageResult(Result<SysLoginRecord> pageResult) {
        this.pageResult = pageResult;
    }

    public SysLoginRecord getSysLoginRecord() {
        return sysLoginRecord;
    }

    public void setSysLoginRecord(SysLoginRecord sysLoginRecord) {
        this.sysLoginRecord = sysLoginRecord;
    }

    @Override
    public Object getModel() {
        return sysLoginRecord;
    }

    @Override
    public void prepare() throws Exception {
        if(null == sysLoginRecord){
            sysLoginRecord = new SysLoginRecord();
        }
    }

    /**
     * 获取用户登录记录列表
     * @return
     *
     */
    public String list(){
        //日志类型
       String logtype = getRequest().getParameter("logtype");
        getRequest().getSession().setAttribute("logtype", logtype);
        pageResult=loginRecordService.findAll(getPage(), getRow(),logtype);
        forwardView = LIST_JSP;
        return SUCCESS;
    }

    /**
     * 删除某条用户登录记录
     * @param
     *
     */
    public String delete(){
        loginRecordService.delete(sysLoginRecord.getId());
        return list();
    }

    /**
     * 页面跳转
     * @return
     */
    public String openList(){

        return SUCCESS;
    }
}
