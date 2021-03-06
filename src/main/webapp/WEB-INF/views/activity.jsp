<%--suppress ALL --%>
<%--suppress ALL --%>

<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="net.sf.json.JSONArray" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>


<!DOCTYPE html>
<!--
Template Name: Metronic - Responsive Admin Dashboard Template build with Twitter Bootstrap 3.0.3
Version: 1.5.5
Author: KeenThemes
Website: http://www.keenthemes.com/
Purchase: http://themeforest.net/item/metronic-responsive-admin-dashboard-template/4021469?ref=keenthemes
-->
<!--[if IE 8]> <html lang="en" class="ie8 no-js"> <![endif]-->
<!--[if IE 9]> <html lang="en" class="ie9 no-js"> <![endif]-->
<!--[if !IE]><!-->
<html lang="en" class="no-js">
<!--<![endif]-->
<!-- BEGIN HEAD -->
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8"/>
    <title>活动管理</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="" name="description"/>
    <meta content="" name="author"/>
    <meta name="MobileOptimized" content="320">
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="assets/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
    <link href="assets/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <!-- END GLOBAL MANDATORY STYLES -->
    <!-- BEGIN THEME STYLES -->
    <link href="assets/css/style-metronic.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/style-responsive.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/plugins.css" rel="stylesheet" type="text/css"/>
    <link href="assets/css/themes/default.css" rel="stylesheet" type="text/css" id="style_color"/>
    <link href="assets/css/custom.css" rel="stylesheet" type="text/css"/>
    <!-- END THEME STYLES -->
    <link rel="shortcut icon" href="favicon.ico"/>




    <%-- 表格添加新功能--%>
    <link rel="stylesheet" type="text/css" href="app/Bootstrap_table/bootstrap-table.css">
    <link rel="stylesheet" href="app/Bootstrap_table/bootstrap-editable.css">
    <style>
        #activityele { width: 100%; font-size: 15px;background-color: beige;}
        #activityele li { display: inline-block; width: 150px; margin-left: 0%; padding-top: 1%;margin: 0 5px;}
        #activityele li img { width: 100%;}


        .table-hover   tbody tr:hover {


            color: white;

        }

        .table-hover   tbody tr:hover td{
            background: #b4b4b4;


        }



    </style>


</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body class="page-header-fixed">
<!-- BEGIN HEADER -->
<div class="header navbar navbar-inverse navbar-fixed-top">
    <!-- BEGIN TOP NAVIGATION BAR -->
    <div class="header-inner">
        <!-- BEGIN LOGO -->
        <a class="navbar-brand" href="index.html">
            <img src="assets/img/logo.png" alt="logo" class="img-responsive"/>
        </a>
        <!-- END LOGO -->
        <!-- BEGIN RESPONSIVE MENU TOGGLER -->
        <a href="javascript:;" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <img src="assets/img/menu-toggler.png" alt=""/>
        </a>
        <!-- END RESPONSIVE MENU TOGGLER -->
        <!-- BEGIN TOP NAVIGATION MENU -->
        <ul class="nav navbar-nav pull-right">
            <!-- BEGIN NOTIFICATION DROPDOWN -->

            <!-- END NOTIFICATION DROPDOWN -->
            <!-- BEGIN INBOX DROPDOWN -->

            <!-- END INBOX DROPDOWN -->
            <!-- BEGIN TODO DROPDOWN -->

            <!-- END TODO DROPDOWN -->
            <!-- BEGIN USER LOGIN DROPDOWN -->
            <li class="dropdown user">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
                    <img alt="" src="assets/img/avatar1_small.jpg"/>
                    <span class="username"> ${userInfo.username } </span>
                    <i class="fa fa-angle-down"></i>
                </a>
                <ul class="dropdown-menu">
                    <li>
                        <a href="javascript:;" id="trigger_fullscreen"><i class="fa fa-move"></i> 全屏</a>
                    </li>
                    <li>
                        <a href="rest/user/extra_lock">
                            <i class="fa fa-lock"></i> 锁屏
                        </a>
                    </li>
                    <li>
                        <a href="rest/user/logout">
                            <i class="fa fa-key"></i> 退出
                        </a>
                    </li>
                </ul>
            </li>
            <!-- END USER LOGIN DROPDOWN -->
        </ul>
        <!-- END TOP NAVIGATION MENU -->
    </div>
    <!-- END TOP NAVIGATION BAR -->
</div>
<!-- END HEADER -->
<div class="clearfix">
</div>
<!-- BEGIN CONTAINER -->
<div class="page-container">
    <!-- BEGIN SIDEBAR -->
    <div class="page-sidebar-wrapper">
        <div class="page-sidebar navbar-collapse collapse">
            <!-- BEGIN SIDEBAR MENU -->
            <ul class="page-sidebar-menu">
                <li class="sidebar-toggler-wrapper">
                    <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                    <div class="sidebar-toggler hidden-phone">
                    </div>
                    <!-- BEGIN SIDEBAR TOGGLER BUTTON -->
                </li>


                <li class="">
                    <a href="/" id="btn-dashboard">
                        <i class="fa fa-home"></i><span class="title"> 首页 </span><span
                    > </span>
                    </a>
                </li>

                <li class="">
                    <a href="javascript:;">
                        <i class="fa fa-gears"></i><span class="title"> 系统管理 </span><span
                            class="arrow "> </span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="javascript:;">
                                用户管理
                            </a>
                        </li>
                        <li>
                            <a href="javascript:;">
                                角色管理
                            </a>
                        </li>
                        <li>
                            <a href="javascript:;">
                                权限管理
                            </a>
                        </li>


                        <shiro:hasPermission name="user:create">
                            <li>
                                <a href="javascript:;">user:create 拥有此权限</a>
                            </li>
                        </shiro:hasPermission>

                        <shiro:hasPermission name="user:manage">
                            <li>
                                <a href="javascript:;">user:manage 拥有此权限</a>
                            </li>
                        </shiro:hasPermission>

                        <shiro:hasRole name="edion">
                            <li>
                                <a href="javascript:;">edion 拥有此角色,管理用户</a>
                            </li>
                        </shiro:hasRole>


                    </ul>
                </li>

                <li class="">
                    <a href="javascript:;">
                        <i class="fa fa-user"></i><span class="title"> 个人中心 </span><span
                            class="arrow "> </span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="javascript:;">
                                信息修改
                            </a>
                        </li>
                        <li>
                            <a href="javascript:;">
                                密码修改
                            </a>
                        </li>



                    </ul>
                </li>

                <li class=" ">
                    <a href="javascript:;">
                        <i class="fa fa-gears"></i><span class="title"> 硬件设备 </span><span
                            class="arrow "> </span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="rest/page/controller">
                                设备控制端
                            </a>
                        </li>
                        <li>
                            <a href="rest/page/allinformation">
                                设备状态查询
                            </a>
                        </li>
                        <li>
                            <a class="selected" href="rest/page/resetDevices">
                                设备修改/激活
                            </a>
                        </li>
                    </ul>
                </li>

                <li class=" ">
                    <a href="javascript:;">
                        <i class="fa fa-gears"></i><span class="title"> 约伴</span><span
                            class="arrow "> </span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="rest/manage/yueban/yuebanget">
                                获取约伴发布信息
                            </a>
                        </li>

                    </ul>
                </li>

                <li class="">
                    <a href="javascript:;">
                        <i class="fa fa-gears"></i><span class="title"> 广告管理</span><span
                            class="arrow "> </span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="rest/manage/advertisement/updatenews">
                                广告内容更新
                            </a>
                        </li>

                    </ul>
                </li>

                <li class=" ">
                    <a href="javascript:;">
                        <i class="fa fa-gears"></i><span class="title"> 钱包</span><span
                            class="arrow "> </span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="rest/manage/wallet/getinoutmoney">
                                钱包收支
                            </a>
                        </li>

                    </ul>
                </li>


                <li class="start active">
                    <a href="javascript:;">
                        <i class="fa fa-gears"></i><span class="title"> 活动</span><span
                            class="arrow "> </span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="rest/manage/activity/publishactivity">
                                查看活动信息
                            </a>
                        </li>

                    </ul>
                </li>

                <li class="">
                    <a href="javascript:;">
                        <i class="fa fa-gears"></i><span class="title"> app配置管理</span><span
                            class="arrow "> </span>
                    </a>
                    <ul class="sub-menu">
                        <li>
                            <a href="rest/manage/software/updateapp">
                                app 版本更新
                            </a>
                        </li>

                    </ul>
                </li>




            </ul>
            <!-- END SIDEBAR MENU -->
        </div>
    </div>
    <!-- END SIDEBAR -->
    <!-- BEGIN CONTENT -->
    <div class="page-content-wrapper">
        <div class="page-content">
            <!-- BEGIN SAMPLE PORTLET CONFIGURATION MODAL FORM-->
            <div class="modal fade" id="portlet-config" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true"></button>
                            <h4 class="modal-title">Modal title</h4>
                        </div>
                        <div class="modal-body">
                            Widget settings form goes here
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn blue">Save changes</button>
                            <button type="button" class="btn default" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <!-- /.modal-content -->
                </div>
                <!-- /.modal-dialog -->
            </div>
            <!-- /.modal -->
            <!-- END SAMPLE PORTLET CONFIGURATION MODAL FORM-->
            <!-- BEGIN STYLE CUSTOMIZER -->
            <div class="theme-panel hidden-xs hidden-sm">
                <div class="toggler"></div>
                <div class="toggler-close"></div>
                <div class="theme-options">
                    <div class="theme-option theme-colors clearfix">
                        <span> 主题颜色 </span>
                        <ul>
                            <li class="color-black current color-default" data-style="default"></li>
                            <li class="color-blue" data-style="blue"></li>
                            <li class="color-brown" data-style="brown"></li>
                            <li class="color-purple" data-style="purple"></li>
                            <li class="color-grey" data-style="grey"></li>
                            <li class="color-white color-light" data-style="light"></li>
                        </ul>
                    </div>
                    <div class="theme-option">
                        <span> 布局 </span>
                        <select class="layout-option form-control input-small">
                            <option value="fluid">顺序</option>
                            <option value="boxed">盒状</option>
                        </select>
                    </div>
                    <div class="theme-option">
                        <span> 标题 </span>
                        <select class="header-option form-control input-small">
                            <option value="fixed">固定</option>
                            <option value="default">默认</option>
                        </select>
                    </div>
                    <div class="theme-option">
                        <span> 工具栏 </span>
                        <select class="sidebar-option form-control input-small">
                            <option value="fixed">固定</option>
                            <option value="default">默认</option>
                        </select>
                    </div>
                    <div class="theme-option">
                        <span> 工具栏位置 </span>
                        <select class="sidebar-pos-option form-control input-small">
                            <option value="left">左边</option>
                            <option value="right">右边</option>
                        </select>
                    </div>
                    <div class="theme-option">
                        <span> 页脚 </span>
                        <select class="footer-option form-control input-small">
                            <option value="fixed">固定</option>
                            <option value="default">默认</option>
                        </select>
                    </div>
                </div>
            </div>


            <!-- END STYLE CUSTOMIZER -->
            <!-- BEGIN PAGE HEADER-->
            <div class="row">
                <div class="col-md-12">
                    <!-- BEGIN PAGE TITLE & BREADCRUMB-->
                    <h3 class="page-title">
                        活动信息<small> <a href="rest/page/allinformation"></a></small>
                    </h3>

                </div>
            </div>
            <!-- END PAGE HEADER-->
            <!-- BEGIN PAGE CONTENT-->

            <div class="container" style="width:100%;" >
                <table id="table" class="table-hover"  ></table>
            </div>


            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog modal-wide" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                            <label  id="myModalLabel"  style="font-size: larger;font-weight: bold ;">活动信息详情</label>
                        </div>
                        <div class="modal-body">
                            <img id ="theme" width="100%" height="300px"/>

                            <div class="form-group">
                                <label style="font-size: large;font-weight: bold ;">活动描述</label>
                                <p id="description" ></p>

                            </div>

                            <div class="form-group">
                                <label style="font-size: large;font-weight: bold ;" >活动地址</label>
                                <p id="currentadress" ></p>

                            </div>

                            <div class="form-group">
                                <label style="font-size: large;font-weight: bold ;" >活动发布时间</label>
                                <p id="yuebanpublishtime" ></p>

                            </div>


                            <div class="form-group">
                                <label style="font-size: large;font-weight: bold ;" >活动图片</label>
                                <ul id="activityele">

                                </ul>
                            </div>



                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span>关闭</button>
                        </div>
                    </div>
                </div>
            </div>


            <!-- END PAGE CONTENT-->
        </div>
    </div>
    <!-- END CONTENT -->
</div>
<!-- END CONTAINER -->
<!-- BEGIN FOOTER -->
<div class="footer">
    <div class="footer-inner">
        2016 &copy; 天涯同行智能控制系统 by Edion.
    </div>
    <div class="footer-tools">
		<span class="go-top">
			<i class="fa fa-angle-up"></i>
		</span>
    </div>
</div>
<!-- END FOOTER -->
<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="assets/plugins/respond.min.js"></script>
<script src="assets/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="assets/plugins/bootstrap-hover-dropdown/twitter-bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->
<script src="assets/scripts/app.js"></script>
<script>


    jQuery(document).ready(function() {
        App.init();
    });


</script>


<%--表格功能--%>
<script src="app/Bootstrap_table/bootstrap-table.js" type="text/javascript" charset="utf-8"></script>
<script src="app/Bootstrap_table/bootstrap-table-zh-CN.js"></script>
<script src="app/Bootstrap_table/tableExport.js"></script>
<script src="app/Bootstrap_table/bootstrap-table-export.js"></script>
<script>

    /*    全局变量*/
    var $table = $('#table');
    var  selections = [];
    /*  var serverurl="http://139.224.47.78:9010/user/testController";*/
    //var serverurl="http://192.168.1.100:8080/rest/manage/yueban/yuebangetInfromation";
    var serverurl="<%=basePath%>"+"rest/manage/activity/getdata";
    var serverurl1="<%=basePath%>"+"rest/manage/activity/getdataByid";
    var pagesize=17; //分页总数

    var TableInit= function initTable() {


        var oTableInit =new Object();
        oTableInit.Init=function () {

            $table.bootstrapTable({
                height: getHeight(),
                contentType: "application/x-www-form-urlencoded",//
                dataType: 'json',  //数据跨域
                jsonpCallback:'getyueban',                   //回调函数名
                dataField: "rows",//服务端返回数据键值 就是说记录放的键值是rows，分页时使用总记录数的键值为total
                search:"true",       //查找按钮
                searchText:"搜索",
                searchAlign:'left',
                showRefresh:"true",   //刷新按钮
                pagination:"true",  //设置为 true 会在表格底部显示分页条
                idField:"id",//指定主键列
                pageList:"[17, 50, 100, ALL]",//如果设置了分页，设置可供选择的页面数据条数。设置为All 则显示所有记录。
                showFooter:"false",//是否显示列脚
                sidePagination:"server",//设置在哪里进行分页，可选值为 'client' 或者 'server'。设置 'server'时，必须设置 服务器数据地址（url）或者重写ajax方法
                url:serverurl,//服务器数据的加载地址
                pageSize:pagesize,
                responseHandler:"responseHandler",//加载服务器数据之前的处理程序，可以用来格式化数据。参数：res为从服务器请求到的数据
                queryParams: oTableInit_queryParams,//参数
                buttonsAlign: "left",//按钮对齐方式
                toolbar: "#toolbar",//指定工具栏
                toolbarAlign: "left",//工具栏对齐方式
                showExport: true,//显示导出按钮
                exportDataType: "basic",//导出类型
                //行格式

                columns: [
                    {
                        title: '序号',
                        field: 'id',
                        align: 'center',
                        valign: 'middle',


                    },
                    {
                        field: 'type',
                        title: '类型',
                        align: 'center',
                        valign: 'middle',
                        formatter: typeFormatter

                    },
                    {
                        field: 'userid',
                        title: '用户玩家',
                        align: 'center'
                    },
                    {
                        field: 'name',
                        title: '用户名称',
                        align: 'center'
                    },
                    {
                        field: 'publishtime',
                        title: '发布时间',
                        align: 'center',

                    },
                    {

                        field: 'themedetail',
                        title: '主题描述',
                        align: 'center'

                    },
                    {

                        field: 'activityaddress',
                        title: '活动地点',
                        align: 'center',

                    },
                    {
                        field: 'yuebandetail',
                        title: '信息详情',
                        align: 'center',
                        events: operateEvents,
                        formatter: operateFormatter1,

                    },
                    {
                        field: 'operate',
                        title: '删除',
                        align: 'center',
                        events: operateEvents,
                        formatter: operateFormatter
                    },


                ]
            });

        }

        function addElementImg(obj,imgurl,imagedetail) {
            var ul = document.getElementById(obj);

            //添加 li
            var li = document.createElement("li");

            //添加 div
            var div = document.createElement("div");

            //设置 div 属性，如 id
            div.setAttribute("id", "newDiv");

            div.innerHTML = imagedetail;


            if(imgurl!=""){
                //添加 img
                var img = document.createElement("img");
                //设置 img 属性，如 id
                img.setAttribute("id", "newImg");
                //设置 img 图片地址
                img.src = imgurl;
                li.appendChild(img);
            }

            ul.appendChild(li);
            ul.appendChild(div);



        }


        window.operateEvents = {

            'click .remove': function (e, value, row, index) {


                $.ajax({
                    url:serverurl,       //跨域到http://www.wp.com，另，http://test.com也算跨域
                    dataType:'jsonp',                          //指定为jsonp类型
                    data:{"id":row.id},                //数据参数
                    jsonp:'callback',                          //服务器端获取回调函数名的key，对应后台有$_GET['callback']='getName';callback是默认值
                    jsonpCallback:'deleteyueban',                   //回调函数名

                    success:function(result){                  //成功执行处理，对应后台返回的getName(data)方法。

                        //     alert('执行成功');                 //执行成功
                    },
                    error:function(msg){
                        alert('执行错误');                 //执行成功
                        alert(msg.toSource());                 //执行错误
                    }
                });



                $table.bootstrapTable('remove', {
                    field: 'id',
                    values: [row.id]
                });
            },
            'mouseover .like': function (e, value, row, index) {
                //清除已生成元素
                var uls = document.getElementById("activityele");
                var liss = uls.querySelectorAll("li");
                for(var j=0;j<liss.length;j++)
                {
                    liss[j].remove();
                }


                $.ajax({
                    type: "post",
                    url:serverurl1,       //跨域到http://www.wp.com，另，http://test.com也算跨域
                    dataType:'json',                          //指定为jsonp类型
                    data:{"id":row.id},                //数据参数
                    /*jsonp:'callback',                          //服务器端获取回调函数名的key，对应后台有$_GET['callback']='getName';callback是默认值
                    jsonpCallback:'getimageyueban',                   //回调函数名*/

                    success:function(result){                  //成功执行处理，对应后台返回的getName(data)方法。
                        // alert(result);
                        var strte=JSON.stringify(result);
                       //   alert(strte);                 //执行成功

                        for(var key in result){
                           // alert(key);
                            if(key=="activity"){
                                for(var key in result["activity"]){

                                 //   alert(key);
                                    if(key=="newActivitydetail"){
                                       // alert("dddddddddd")

                                        var list =result["activity"]["newActivitydetail"];

                                        //清除已生成元素
                                        var uls = document.getElementById("activityele");
                                        var liss = uls.querySelectorAll("li");
                                        for(var j=0;j<liss.length;j++)
                                        {
                                            liss[j].remove();
                                        }

                                        var divs = uls.querySelectorAll("div");
                                        for(var j=0;j<divs.length;j++)
                                        {
                                            divs[j].remove();
                                        }


                                      /*  alert("sssdf"+list);
                                        alert("ssdfewrfe"+list.length);*/
                                        for(var k=0;k<list.length;k++){

                                            // alert("图片地址："+list[k].imageurl);
                                            addElementImg("activityele",list[k].imageurl,list[k].imagedetail);


                                        }
                                    }
                                }
                            }

                           // alert(arr[key].status);
                        }

                    },
                    error:function(msg){
                        alert('执行错误');                 //执行成功
                        alert(msg.toSource());                 //执行错误
                    }
                });


                $("#myModalLabel").text("序号："+row.id +" "+"活动信息详情");
                /*document.getElementById('theme').src = "http://woyouzhijia.oss-cn-shenzhen.aliyuncs.com/45_b148461400516537093.png";*/
                document.getElementById('theme').src = row.activitytheme;
              /*  $("#theme").setAttribute("http://woyouzhijia.oss-cn-shenzhen.aliyuncs.com/45_b148461400516537093.png");*/
             /*  $("#theme").src(row.activitytheme);*/
                $("#publishtime").text(row.publishtime);
                $("#currentadress").text(row.activityaddress);
                $("#description").text(row.themedetail);
                $('#myModal').modal();

            },

        };

        function operateFormatter(value, row, index) {
            return [

                '<a class="remove" href="javascript:void(0)" title="删除">',
                '<i class="glyphicon glyphicon-remove"></i>',
                '</a>'
            ].join('');
        }


        function operateFormatter1(value, row, index) {
            return [
                '<a class="like" href="javascript:void(0)" title="信息详情">',
                '<i class="glyphicon glyphicon-heart"></i>',
                '</a>  '
            ].join('');
        }


        //信息加载的时候进行改变
        function typeFormatter(value, row, index) {
            if(value==1)
            {
                return "长途";
            }
            if(value==2)
            {
                return "短途";
            }

            if(value==3)
            {
                return "聚会";
            }

            if(value==4)
            {
                return "俱乐部";
            }
            if(value==5)
            {
                return "补助";
            }

            if(value==6)
            {
                return "免费";
            }


            if(value==7)
            {
                return "精选";
            }

        }

        function oTableInit_queryParams(params) {
            var temp;
            //checkbox 选择
            temp = { //这里的键的名字和控制器的变量名必须一直，这边改动，控制器也需要改成一样的
                limit: params.limit, //页面大小
                offset: params.offset, //页码
                search:params.search,

            };

            return temp;
        };

        $table.on('check.bs.table uncheck.bs.table ' +
                'check-all.bs.table uncheck-all.bs.table', function () {
            $remove.prop('disabled', !$table.bootstrapTable('getSelections').length);

            // save your data, here just save the current page
            selections = getIdSelections();
            // push or splice the selections if you want to save all data selections
        });

        $table.on('all.bs.table', function (e, name, args) {
            //      alert("OOOOOOOOOOOOO");
            console.log(name, args);
        });
        /* $remove.click(function () {
         var ids = getIdSelections();
         $table.bootstrapTable('remove', {
         field: 'id',
         values: ids
         });
         $remove.prop('disabled', true);
         });*/

        //当窗口调整 表格进行刷新
        $(window).resize(function () {
            $table.bootstrapTable('resetView', {
                height: getHeight()
            });
        });

        return oTableInit;
    }


    function getIdSelections() {
        return $.map($table.bootstrapTable('getSelections'), function (row) {
            return row.id
        });
    }

    function responseHandler(res) {
        $.each(res.rows, function (i, row) {
            row.state = $.inArray(row.id, selections) !== -1;

        });
        return res;
    }


    function detailFormatter(index, row) {
        var html = [];
        $.each(row, function (key, value) {
            html.push('<p><b>' + key + ':</b> ' + value + '</p>');
        });
        return html.join('');
    }

    function getHeight() {
        return $(window).height() -100;
        // return $(window).height() - $('h1').outerHeight(true);
    }

    $(function () {
        var OTable=new TableInit();
        OTable.Init();
    });

</script>

<!-- END JAVASCRIPTS -->
</body>
<!-- END BODY -->
</html>



















