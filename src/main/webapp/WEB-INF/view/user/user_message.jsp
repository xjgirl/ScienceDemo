<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/11
  Time: 18:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%--使用include命令引入公共页面 --%>
<%@include file="/WEB-INF/common/common.jsp"%>
<html>
<head>
    <title>用户个人基本信息</title>
    <link rel="stylesheet" href="../css/layui.css" media="all">
    <link rel="stylesheet" href="../css/modules/laydate/default/laydate.css" media="all">
    <link rel="stylesheet" href="../css/modules/layer/default/layer.css">
    <script type="text/javascript">
        $(document).ready(function(){
            var type = $("#userType").val();
            if(type == 0){
                $("input:radio").eq(0).attr("checked","true");
            }
            if(type == 2){
                $("input:radio").eq(1).attr("checked","true");
            }
            if(type == 3){
                $("input:radio").eq(2).attr("checked","true");
            }
        });
    </script>

    <script type="text/javascript">
        $(function(){
            //验证用户名
            $("#userId").blur(function(){//给用户编号添加失去焦点事件
                var url = "/front/SysJson_checkUserName.action";
                var id = $(this).val();//获取用户编号的输入值
                var inputValue = $(this).attr("userId");//获取原来的用户编号
                id = $.trim(id);
                if(id != inputValue){//如果输入的和原来的不等，校验用户编号
                    if(id != ""){
                        $.post(url,{"checkName":id},function(data){//发送请求验证用户编号
                            if(data == "true"){//如果返回 true,提示已存在
                                $("#gradeInfo").html("<font color=\"red\">您输入的编号已存在！请重新输入！</font>");
                            }else{
                                $("#gradeInfo").html("");
                            }
                        },"json");
                    }
                }
                $("#gradeInfo").html("");
            });


            //验证密码

            $("#oldPwd").blur(function(){//给旧密码添加失去焦点事件
                var url = "/front/SysJson_checkUserPasswd.action";
                var pwd = $(this).val();//获取用户输入的密码
                pwd = $.trim(pwd);
                var rawPwd = $(this).attr("pwdValue");
                if(pwd != ""){
                    $.post(url,{"checkName":pwd,"rawPassword":rawPwd},function(data){//发送请求验证输入旧密码
                        if(data == "false"){//如果返回 false,提示密码输入有误
                            $("#oldPasswd").html("<font color=\"red\">您输入密码有误！请重新输入！</font>");
                            i++;
                        }else{
                            $("#oldPasswd").html("");
                        }
                    },"json");
                }
            });

        });
    </script>
    <script type="text/javascript">
        $(function(){
            //如果是新增成功，会返回1，如果是1，则提示保存成功
            if("1" == "${actionState}"){
                alert('修改成功！');
            }
            $("#commonform").validate({
                errorClass: "errorInfo", //默认为错误的样式类为：error
                focusInvalid: false, //当为false时，验证无效时，没有焦点响应
                onkeyup: false,
                submitHandler: function(form){   //表单提交句柄,为一回调函数，带一个参数：form
                    checkFrom();
                    form.submit();   //提交表单
                },
                rules:{
                    "sysUser.userId":{
                        required:true,
                        rangelength:[1,20]
                    },
                    "sysUser.userName":{
                        required:true,
                        rangelength:[2,20]
                    },
                    "sysUser.userRealName":{
                        required:true,
                        rangelength:[2,20]
                    },
                    "oldPwd":{
                        required:true
                    },
                    "newPassword":{
                        rangelength:[6,16]
                    },
                    "sysUser.userPassword":{
                        equalTo:"#newPassword"
                    }

                },
                messages:{
                    "sysUser.userId":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysUser.userName":{
                        required:"必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysUser.userRealName":{
                        required: "必填",
                        rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "oldPwd":{
                        required:"必填"
                    },
                    "newPassword":{
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysUser.userPassword":{
                        equalTo:"两次输入密码不一致!"
                    }
                }
            });
        });
    </script>
</head>
<body>
<div class="layui-body">
    <div style="padding:15px">
        <div class="layui-show">
            <div class="layui-card">
                <div class="layui-breadcrumb" lay-filter="breadcrumb" style="visibility: visible;">
                    <a lay-href="">主页</a>
                    <a><cite>用户管理</cite></a>
                    <a><cite>个人基本信息</cite></a>
                </div>
            </div>
            <div class="layui-fluid">
                <form action="<%= basePath%>/biz/User_updateUserMessage.action" method="post" id="commonform">
                    <input type="hidden" name="sysUser.userType" value="${sysUser.userType}"  id="userType"/>
                    <input type="hidden" name="sysUser.id" value="${sysUser.id}"/>
                    <input name="sysUser.userAddress" type="hidden"  class="dfinput" value="${sysUser.userAddress}"/>

                    <input name="sysUser.userId" type="hidden" value="${sysUser.userId}"/>
                    <input name="oldPassword" type="hidden" value="${sysUser.userPassword}"/>

                    <div class="layui-form-item forminfo">
                        <label class="layui-form-label">用户编号</label>
                        <div class="layui-input-block">
                            <input type="text" name="sysUser.userId" id="userId" value="${sysUser.userId}" userId="${sysUser.userId}"  class="dfinput">
                        </div>
                    </div>
                    <div class="layui-form-item forminfo">
                        <label class="layui-form-label">用户名</label>
                        <div class="layui-input-block">
                            <input type="text" name="sysUser.userName" id="checkName" value="${sysUser.userName}"  class="dfinput">
                        </div>
                    </div>
                    <div class="layui-form-item forminfo">
                        <label class="layui-form-label">真实姓名</label>
                        <div class="layui-input-block">
                            <input type="text" name="sysUser.userRealName" value="${sysUser.userRealName}" class="dfinput">
                        </div>
                    </div>
                    <div class="layui-form-item forminfo">
                        <label class="layui-form-label">旧密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="oldPwd" id="oldPwd" value="${sysUser.userPassword}" class="dfinput">
                        </div>
                    </div>
                    <div class="layui-form-item forminfo">
                        <label class="layui-form-label">新密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="newPassword" id="newPassword" class="dfinput">
                        </div>
                    </div>
                    <div class="layui-form-item forminfo">
                        <label class="layui-form-label">确认密码</label>
                        <div class="layui-input-block">
                            <input type="password" name="sysUser.userPassword" id="againPassword"><span id="againPasswd"></span>
                        </div>
                    </div>
                    <div class="layui-form-item forminfo">
                        <label class="layui-form-label">性别</label>
                        <div class="layui-input-block">
                            <input type="radio" name="sysUser.userSex" value="1" <c:if test="${sysUser.userSex==1}">checked="checked"</c:if>>男&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input type="radio" name="sysUser.userSex" value="0" <c:if test="${sysUser.userSex==0}">checked="checked"</c:if>>女
                        </div>
                    </div>
                    <div class="layui-form-item forminfo">
                        <label class="layui-form-label">手机号码</label>
                        <div class="layui-input-block">
                            <input type="text" name="sysUser.userTelephone" id="telephone" value="${sysUser.userTelephone}">
                        </div>
                    </div>
                    <div class="layui-form-item forminfo">
                        <label class="layui-form-label">QQ</label>
                        <div class="layui-input-block">
                            <input type="text" name="sysUser.userQq" value="${sysUser.userQq}">
                        </div>
                    </div>
                    <s:iterator value="userRoles">
                        <li><input  name="roleId"  type="hidden" class="userRole" value="${roleId}" /></li>
                    </s:iterator>
                    <div class="layui-form-item forminfo" >
                        <div class="layui-input-block">
                            <button class="layui-btn" lay-submit lay-filter="formDemo">确认保存</button>
                            <button type="reset" class="layui-btn layui-btn-primary" onclick="location.href='javascript:history.go(-1);'">取消</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>
