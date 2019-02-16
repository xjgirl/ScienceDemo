<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/2/11
  Time: 18:37
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
            //如果是新增成功，会返回1，如果是1，则提示保存成功
            if("1" == "${actionState}"){
                alert('保存成功！');
            }
            //当没有添加角色时使用验证
            jQuery.validator.addMethod("checkRole", function(value, element) {
                if($("#roleId").attr("value")==undefined){
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
                        "sysUser.userPassword":{
                            required:true,
                            rangelength:[6,16]
                        },
                        "sysUser.userTelephone":{
                            required:true,
                            number:true,
                            rangelength:[10,12]
                        },
                        "sysUser.userAddress":{
                            required:true,
                            rangelength:[2,150]
                        },
                        "sysUser.userEmail":{
                            email:true
                        },
                        "sysUser.userWeixin":{
                            rangelength:[2,30]
                        },
                        "sysUser.userWeibo":{
                            rangelength:[2,30]
                        },
                        "sysUser.userQq":{
                            digits:true,
                            rangelength:[4,20]
                        },
                        "sysUser.userAge":{
                            digits:true,
                            rangelength:[1,3]
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
                        "sysUser.userPassword":{
                            required: "必填",
                            rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                        },
                        "sysUser.userTelephone":{
                            required:"必填",
                            number:"请输入正确的手机号!",
                            rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                        },
                        "sysUser.userAddress":{
                            required:"必填",
                            rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")

                        },
                        "sysUser.userEmail":{
                            rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                        },
                        "sysUser.userWeixin":{
                            rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                        },
                        "sysUser.userWeibo":{
                            rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                        },
                        "sysUser.userQq":{
                            number: "请输入正确的qq号",
                            rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                        },
                        "sysUser.userAge":{
                            number: "请输入正确的年龄",
                            rangelength: $.validator.format("最小长度:{0}, 最大长度:{1}。")
                        }
                    }
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
    <script type="text/javascript">
        $(function(){
            //验证手机号
            $("#mobilePhone").blur(function(){//给用户编号添加失去焦点事件
                var url = "/front/SysJson_checkMobilePhone.action";
                var id = $(this).val();//获取用户编号的输入值
                var inputValue = $(this).attr("mobilePhone");//获取原来的用户编号
                id = $.trim(id);
                if(id != inputValue){//如果输入的和原来的不等，校验用户编号
                    if(id != ""){
                        $.post(url,{"mobilePhone":id},function(data){//发送请求验证用户编号
                            if(data == "true"){//如果返回 true,提示已存在
                                $("#gradeInfo").html("<font color=\"red\">您输入的手机号已有会员或导师使用！</font>");
                            }else{
                                $("#gradeInfo").html("");
                            }
                        },"json");
                    }
                }
                $("#gradeInfo").html("");
            });
        });

    </script>

    <script type="text/javascript">
        $(document).ready(function(e){
            $(".select2").uedSelect({
                width:155
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
                <a><cite>基本信息</cite></a>
            </div>
        </div>
        <div class="layui-fluid">
            <form action="<%= basePath%>/biz/User_add.action" method="post" id="commonform">

                <div class="layui-form-item">
                    <label class="layui-form-label">用户编号</label>
                    <div class="layui-input-block">
                        <input type="text" name="sysUser.userId" required  lay-verify="required" placeholder="请输入用户编号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">用户名</label>
                    <div class="layui-input-block">
                        <input type="text" name="sysUser.userName" required  lay-verify="required" placeholder="请输入用户名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">真实姓名</label>
                    <div class="layui-input-block">
                        <input type="text" name="sysUser.userRealName" required  lay-verify="required" placeholder="请输入真实姓名" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">密码</label>
                    <div class="layui-input-block">
                        <input type="password" name="sysUser.userPassword" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">手机号</label>
                    <div class="layui-input-block">
                        <input type="text" name="sysUser.userTelephone" required  lay-verify="required" placeholder="请输入手机号" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">性别</label>
                    <div class="layui-input-block">
                        <input type="radio" name="sysUser.userSex" value="1" title="男"><span>男</span>
                        <input type="radio" name="sysUser.userSex" value="0" title="女" checked><span>女</span>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">年龄</label>
                    <div class="layui-input-block">
                        <input type="text" name="sysUser.userAge" required  lay-verify="required" placeholder="请输入年龄" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">QQ</label>
                    <div class="layui-input-block">
                        <input type="text" name="sysUser.userQq" required  lay-verify="required" placeholder="请输入QQ" autocomplete="off" class="layui-input">
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">类别</label>
                    <div class="layui-input-block">
                        <select name="sysUser.userType" lay-verify="required">
                            <option value=""></option>
                            <option value="0">超级管理员</option>
                            <option value="1">学生</option>
                            <option value="2">导师</option>

                        </select>
                    </div>
                </div>
                <div class="layui-form-item">
                    <label class="layui-form-label">角色名称</label>
                    <div class="layui-input-block">
                        <s:iterator value="roles">
                            <span><input type="radio" name="roleId" value="${roleId}">${roleName}</span>
                        </s:iterator>

                    </div>
                </div>
                <div class="layui-form-item">
                    <div class="layui-input-block">
                        <button class="layui-btn" lay-submit lay-filter="formDemo">立即提交</button>
                        <button type="reset" class="layui-btn layui-btn-primary" onclick="location.href='javascript:history.go(-1);'">重置</button>
                    </div>
                </div>

            </form>
            <s:iterator value="userRoles">
                <li><input name="roleId" type="hidden" value="${roleId}"></li>
            </s:iterator>
        </div>
    </div>
</div>
</div>
<script type="text/javascript">

    function find(){
        var strMerchantName = $("#merchant").val();             //获取搜索条件
        if(strMerchantName.trim() !="" || strMerchantName != null){
            $.ajax({
                type: "POST",
                url: "<%= basePath%>/biz/SysMerchantUnit_findByMerchantName.action",
                data: {"strMerchantName":strMerchantName},
                dataType: "json",
                success: function(msg){
                    var content = "<select id='tour_items' onclick=\"selectItem()\">";              //根据返回的json来生成景点列表下拉框
                    for(var i=0; i< msg.length; i++){
                        content  = content + "<option value='"+msg[i].merchantId+"'>"+msg[i].merchantName+"</option>";
                    }
                    content  = content + "</select>";
                    $("#items").html(content);
                    itemsLength(msg.length);                          //根据json数组的长度来定义下拉框的长度
                }
            });
        }
    }
    function itemsLength(len){                                  //根据json数组的长度来定义下拉框的长度
        if(len <=5 && len > 1){
            $("#tour_items").attr("size", len);
        }else if(len == 1){
            $("#tour_items").attr("size", 2);
        }else if(len == 0){
            $("#items").html("");
            $("#merchant").val("-----该商家不存在-----");
            setTimeout(function(){ $(' #merchant').val(''); }, 2000);
        }else{
            $("#tour_items").attr("size",5);
        }
    }
    function selectItem(){                           //当选择景点后赋值到文本框，并清除下拉框
        var strMerchantName= $("#tour_items").find("option:selected").text();                                   //获取被选中的option的文本
        var merchantId = $("#tour_items").find("option:selected").val();                                           //获取被选中的option的值
        $(" #merchant").val(strMerchantName);
        $(" #merchantId").val(merchantId);
        $("#items").html("");
    }

    function hideItems(){                        //当鼠标离开文本框时触发该函数清除下拉框
        $("#items").html("");
    }
</script>
</body>
</html>
