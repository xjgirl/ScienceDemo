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
    <title>Title</title>
    <link rel="stylesheet" href="../css/layui.css" media="all">
    <link rel="stylesheet" href="../css/modules/laydate/default/laydate.css" media="all">
    <link rel="stylesheet" href="../css/modules/layer/default/layer.css">
    <script type="text/javascript" src="<%= basePath%>css/dist/messages/localization/messages_zh.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            var type = $("#userType").val();
            if(type == 3){
                $("input:radio").eq(0).attr("checked","true");
            }
            if(type == 2){
                $("input:radio").eq(1).attr("checked","true");
            }
            if(type == 0){
                $("input:radio").eq(2).attr("checked","true");
            }
        });
    </script>

    <script type="text/javascript">
        //默认选中显示之前用户有的角色名称
        $(function(){
            if("have" == "${tib}"){
                $(".tip").fadeIn(100);
                $(".tiptop a").click(function(){
                    $(".tip").fadeOut(200);
                });

                $(".sure").click(function(){
                    $(".tip").fadeOut(100);
                });

                $(".cancel").click(function(){
                    $(".tip").fadeOut(100);
                });
            }
            if("have1" == "${tib}"){
                $(".tip1").fadeIn(100);
                $(".tiptop a").click(function(){
                    $(".tip1").fadeOut(200);
                });

                $(".sure1").click(function(){
                    $(".tip1").fadeOut(100);
                });

                $(".cancel1").click(function(){
                    $(".tip1").fadeOut(100);
                });
            }
            $(".dfinput1").each(function(){//循环获取所有角色编号
                roleId = $(this).attr("value");
                $(".userRole").each(function(){//循环获取该用户拥有的角色编号
                    //判断角色表中的角色编号是否与用户拥有的权限编号是否相同
                    if(roleId == $(this).attr("value")){
                        //若相同,则选中
                        $("#"+roleId).attr("checked",true);
                    }
                });
            });

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

            $("#oldPassword").blur(function(){//给旧密码添加失去焦点事件
                var url = "/front/SysJson_checkUserPasswd.action";
                var pwd = $(this).val();//获取用户输入的密码
                pwd = $.trim(pwd);
                var rawPwd = $(this).attr("pwdValue");
                if(pwd != ""){
                    $.post(url,{"checkName":pwd,"rawPassword":rawPwd},function(data){//发送请求验证输入旧密码
                        if(data == "true"){//如果返回 true,提示密码输入有误
                            $("#oldPasswd").html("<font color=\"red\">您输入密码有误！请重新输入！</font>");
                            i++;
                        }else{
                            $("#oldPasswd").html("");
                        }
                    },"json");
                }
                $("#oldPasswd").html("");
            });

        });
    </script>
    <script type="text/javascript">
        $(function(){
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
                    "newPassword":{
                        rangelength:[6,16]
                    },
                    "sysUser.userPassword":{
                        equalTo:"#newPassword"
                    },
                    "sysUser.userTelephone":{
                        required:true,
                        number:true,
                        rangelength:[10,12]
                    },
                    "sysUser.userQq":{
                        number:true,
                        rangelength:[4,20]
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
                    "newPassword":{
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysUser.userPassword":{
                        equalTo:"两次输入密码不一致!"
                    },
                    "sysUser.userTelephone":{
                        required:"必填",
                        number:"请输入正确的手机号码！",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    },
                    "sysUser.userQq":{
                        number:"请输入正确的QQ号！",
                        rangelength:$.validator.format("最小长度:{0}, 最大长度:{1}。")
                    }
                }
            });
        });
    </script>
    <script type="text/javascript">
        $(function(){
            //省--市二级联动
            var url = "<%= basePath%>/biz/ComDistrict_queryCity.action";
            var cityVal = $("#cityVal").val();
            var id = $("#provinceId").find("option:selected").attr("id");
            queryCity(id);
            $("#provinceId").change(function(){
                $("#shijiId option:not(:first)").remove();//清空市级选项
                id = $("#provinceId").find("option:selected").attr("id");
                queryCity(id);
            });
            function queryCity(id){
                $.post(url,{"id":id},function(data){
                    for(var i = 0; i < data.length; i++){
                        if(cityVal == data[i].name){
                            $("#shijiId").append("<option  value='"+data[i].name+"' selected='selected'>"+data[i].name+"</option>");
                        }else{
                            $("#shijiId").append("<option  value='"+data[i].name+"'>"+data[i].name+"</option>");
                        }
                    }
                },"json");
            };
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function(e){
            $(".select2").uedSelect({
                width:155
            });
        });
    </script>

    <script type="text/javascript">
        $(function(){
            //验证学号
            $("#checkName").blur(function(){//给用户编号添加失去焦点事件
                var url = "${pageContext.request.contextPath}/front/SysJson_checkUser.action";
                var id = $(this).val();//获取用户编号的输入值
                var inputValue = $(this).attr("checkName");//获取原来的用户编号
                id = $.trim(id);
                if(id != inputValue){//如果输入的和原来的不等，校验用户编号
                    if(id != ""){
                        $.post(url,{"checkName":id},function(data){//发送请求验证用户编号
                            if(data == "true"){//如果返回 true,提示已存在
                                $("#gradeInfo1").html("<font color=\"red\">您输入的登录名已被使用！</font>");
                            }else{
                                $("#gradeInfo1").html("");
                            }
                        },"json");
                    }
                }
                $("#gradeInfo1").html("");
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
                <a><cite>用户管理</cite></a>
                <a><cite>基本信息</cite></a>
            </div>
        </div>
        <div class="layui-fluid">
            <form action="<%= basePath%>/biz/User_update.action" method="post" id="commonform">
                <input type="hidden" value="${sysUser.id}" id="sysUser.id" name="sysUser.id"/>
                <div class="layui-form-item forminfo">
                    <label class="layui-form-label">用户编号</label>
                    <div class="layui-input-block">
                        <input type="text" name="sysUser.userId" id="userId" value="${sysUser.userId}" userId="${sysUser.userId}"  class="dfinput"><i><font color="#FF0000">*用户编号不可更改</font></i>
                    </div>
                </div>
                <div class="layui-form-item forminfo">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="sysUser.userName" id="checkName" value="${sysUser.userName}"  class="dfinput"><i><font color="#FF0000">*必填</font>不能超过20个字符</i><span id="gradeInfo1"></span>
                    </div>
                </div>
                <div class="layui-form-item forminfo">
                    <label class="layui-form-label">真实姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="sysUser.userRealName" value="${sysUser.userRealName}" class="dfinput"><i><font color="#FF0000">*必填</font>不能超过20个字符</i>
                    </div>
                </div>
                <div class="layui-form-item forminfo">
                    <label class="layui-form-label">新密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="newPassword" class="dfinput" id="newPassword" class="dfinput"><i><font color="#FF0000">(若不修改可不填)</font>6-16位字母、数字或下滑线组成</i>
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
                        <input type="text" name="sysUser.userTelephone" id="telephone" value="${sysUser.userTelephone}"><i><font color="#FF0000">*必填</font></i><span id="gradeInfo"></span>
                    </div>
                </div>
                <div class="layui-form-item forminfo">
                    <label class="layui-form-label">QQ</label>
                    <div class="layui-input-block">
                        <input type="text" name="sysUser.userQq" value="${sysUser.userQq}">
                    </div>
                </div>
                <div class="layui-form-item forminfo" >
                    <label class="layui-form-label">类别</label>
                    <div class="layui-input-block">
                        <select name="sysUser.userType" lay-verify="required">
                            <option value=""></option>
                            <option value="0"<c:if test="${sysUser.userType==0}">checked="checked"</c:if>>超级管理员</option>
                            <option value="1"<c:if test="${sysUser.userType==1}">checked="checked"</c:if>>学生</option>
                            <option value="2"<c:if test="${sysUser.userType==2}">checked="checked"</c:if>>导师</option>

                        </select>
                    </div>
                </div>
                <div class="layui-form-item forminfo">
                    <label class="layui-form-label">角色名称</label>
                    <div class="layui-input-block">
                        <s:iterator value="roles">
                            <input type="checkbox" name="roleId" id="${roleId}" value="${roleId}">${roleName}
                        </s:iterator>
                    </div>
                </div>
                <div class="layui-form-item forminfo" >
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">确认保存</button>
                        <button type="reset" class="layui-btn layui-btn-primary" onclick="location.href='javascript:history.go(-1);'">取消</button>
                    </div>
                </div>

            </form>
            <s:iterator value="userRoles">
                <li><input name="roleId" type="hidden" value="${roleId}"></li>
            </s:iterator>
        </div>
    </div>
</div>
</body>
</html>
