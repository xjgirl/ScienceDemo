<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/14
  Time: 14:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="/WEB-INF/common/common.jsp"%>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/layui.css" media="all">
    <link rel="stylesheet" href="../css/modules/laydate/default/laydate.css" media="all">
    <link rel="stylesheet" href="../css/modules/layer/default/layer.css">
    <script type="text/javascript" src="<%= basePath%>css/dist/messages/localization/messages_zh.js"></script>
    <script type="text/javascript">
        $(function(){
            var url = "/front/SysJson_checkRoleName.action";
            $("#roleId").blur(function(){//给角色编号添加失去焦点事件
                var id = $("input[name='roleId']").val();//获取角色编号值
                $.post(url,{"checkName":id},function(data){//发送请求验证角色编号
                    if(data == "no"){//如果返回 no,提示已存在
                        $("#gradeInfo").html("<font color=\"red\">您输入的编号存在！请重新输入！</font>");
                    }else{//否则隐藏
                        $("#gradeInfo").hide();
                    }
                },"json");
            });
        });
    </script>
    <script type="text/javascript">
        $(function(){
            //如果是新增成功，会返回1，如果是1，则提示保存成功
            if("1" == "${actionState}"){
                alert('保存成功！');
            }
            //当没有添加权限时使用验证
            jQuery.validator.addMethod("checkRightId", function(value, element) {
                if($("input[name='rightId']").val()==undefined){
                    return false;
                }else{
                    return true;
                }
            }, ""),
                $("#commonform").validate({
                    errorClass: "errorInfo", //默认为错误的样式类为：error
                    focusInvalid: false, //当为false时，验证无效时，没有焦点响应
                    onkeyup: false,
                    submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form
                        checkFrom();
                        form.submit();   //提交表单
                    },
                    rules:{
                        "roleId":{
                            required:true,
                            rangelength:[2,20]
                        },
                        "roleName":{
                            required:true,
                            rangelength:[2,20]
                        },
                        "roleSortOrder":{
                            required:true,
                            digits:true,
                            rangelength:[1,4]
                        },
                        "checkRightId":{
                            checkRightId:true
                        },
                        "rightId":{
                            required:true
                        }
                    },
                    messages:{
                        "roleId":{
                            required:"必填",
                            rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                        },
                        "roleName":{
                            required:"必填",
                            rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                        },
                        "roleSortOrder":{
                            required: "必填",
                            digits:"请输入整数",
                            rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                        },
                        "rightId":{
                            required:""
                        }
                    }
                });
        });
    </script>
</head>
<body>
<div style="padding:15px">
    <div class="layui-show">
        <div class="layui-card">
            <div class="layui-breadcrumb" lay-filter="breadcrumb" style="visibility: visible;">
                <a lay-href="">主页</a>
                <a><cite>系统管理</cite></a>
                <a><cite>新增角色</cite></a>
            </div>
        </div>
        <form action="<%= basePath%>/role/Role_add.action" method="post" id="commonform">
            <div class="layui-form-item">
                <label class="layui-form-label">角色编号</label>
                <div class="layui-input-block">
                    <input type="text" name="roleId" id="roleId" placeholder="请输入角色编号" class="layui-input"><i><font color="#FF0000">*必填</font>英文</i><span id="gradeInfo"></span></li>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">角色名称</label>
                <div class="layui-input-block">
                    <input type="text" name="roleName" id="roleName" placeholder="请输入角色编号" class="layui-input"><i><font color="#FF0000">*必填</font>不能超过20个汉字</i></li>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">排序序号</label>
                <div class="layui-input-block">
                    <input type="text" name="roleSortOrder" id="roleSortOrder" placeholder="请输入排序序号" class="layui-input"><i><font color="#FF0000">*必填</font></i></li>
                </div>
            </div>
            <div class="layui-form-item">
                <label class="layui-form-label">权限名称</label>
                <div class="layui-input-block">
                    <s:iterator value="sysRights">
                        <label for="rightId_${rightId}"><input type="checkbox" name="rightId" id="rightId_${rightId}" value="${rightId}">${rightName}</label>
                    </s:iterator>

                </div>
            </div>
            <div class="layui-form-item">
                <div class="layui-input-block">
                    <button class="layui-btn" lay-submit lay-filter="formDemo">确认保存</button>
                    <button type="reset" class="layui-btn layui-btn-primary" onclick="location.href='javascript:history.go(-1);'">取消</button>
                </div>
            </div>

        </form>
    </div>
</div>
</body>
</html>
