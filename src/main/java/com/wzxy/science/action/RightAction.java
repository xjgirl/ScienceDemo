package com.wzxy.science.action;

import com.opensymphony.xwork2.ModelDriven;
import com.opensymphony.xwork2.Preparable;
import com.wzxy.science.entity.SysRight;
import com.wzxy.science.service.IRightService;
import com.wzxy.science.util.Result;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import javax.annotation.Resource;

@Controller("rightAction")
@Scope("prototype")
public class RightAction extends BaseAction implements Preparable, ModelDriven {

    protected static final String LIST_JSP = "/WEB-INF/view/right/right_list.jsp";
    protected static final String ADD_JSP = "/WEB-INF/view/right/right_add.jsp";
    protected static final String EDIT_JSP = "/WEB-INF/view/right/right_edit.jsp";

    protected final Log logger= LogFactory.getLog(getClass());

    private Result<SysRight> pageResult; //分页
    private SysRight sysRight;

    public Result<SysRight> getPageResult() {
        return pageResult;
    }

    public void setPageResult(Result<SysRight> pageResult) {
        this.pageResult = pageResult;
    }

    public SysRight getSysRight() {
        return sysRight;
    }

    public void setSysRight(SysRight sysRight) {
        this.sysRight = sysRight;
    }

    @Resource
    private IRightService rightService;

    @Override
    public Object getModel() {
        return sysRight;
    }

    @Override
    public void prepare() throws Exception {
        if(null == sysRight){
            sysRight = new SysRight();
        }
    }

    /**
     * 列表
     * @return
     * @throws Exception
     *
     */
    public String list()throws Exception{
        logger.info("##ysRole列表读取...");
        pageResult = rightService.find(sysRight, getPage(), getRow());
        setForwardView(LIST_JSP);
        return SUCCESS;
    }

    /**
     * 添加权限
     * @return
     * @throws Exception
     *
     */
    public String add() throws Exception{
        rightService.add(sysRight);
        sysRight.setRightName(sysRight.getRightName());
        return list();
    }

    /**
     * 保存修改信息
     * @return
     * @throws Exception
     *
     */
    public String update() throws Exception{
        rightService.update(sysRight);
        sysRight.setRightName(sysRight.getRightName());
        return list();
    }

    /**
     * 删除权限
     * @return
     * @throws Exception
     */
    public String delete() throws Exception{
        rightService.delete(sysRight.getRightId());
        return list();
    }

    /**
     * 页面跳转
     * @return
     *
     */
    public String openList(){

        return SUCCESS;
    }

    /**
     * 跳转到添加页面
     * @return
     */
    public String openAdd(){
        forwardView = ADD_JSP;
        return SUCCESS;
    }
    /**
     * 跳转到修改页面
     * @return
     *
     */
    public String openEdit(){
        //System.out.println(sysRight.getRightId());
        sysRight = rightService.findById(sysRight.getRightId());
        //System.out.println("9999999999999999");
        forwardView = EDIT_JSP;
        return SUCCESS;
    }

}
