
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">

    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>
    <style>
        thead>tr>last-child{
            width: 200px;
        !important;
        }
    </style>
</head>
<body>
<a href="/tourism_products/passenger/toAddPage" class="layui-btn layui-btn-normal  layui-btn-sm">添加</a>
<table class="layui-table">
    <colgroup>
        <col width="40">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>id</th>
        <th>姓名</th>
        <th>性别</th>
        <th>电话号码</th>
        <th>证件类型</th>
        <th>证件号码</th>
        <th>旅客类型</th>
        <th style="width: 110px;!important;">操作</th>
    </tr>
    </thead>
    <tbody id="productTbody">
    </tbody>
</table>
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 30px;">
</fieldset>

<div id="demo7" style="text-align: center"></div>
<script>
    layui.use(['laypage', 'layer'], function(){
        var laypage = layui.laypage
            ,layer = layui.layer;

        //真实数据
        var data = ${requestScope.data};

        //完整功能
        laypage.render({
            elem: 'demo7'
            ,count: data.length,
            limit:5
            ,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
            ,jump: function(obj){
                document.getElementById('productTbody').innerHTML = function(){
                    var arr = []
                        ,thisData = data.concat().splice(obj.curr*obj.limit - obj.limit , obj.limit);
                    layui.each(thisData, function(index, item){
                        arr.push('<tr><td>'+ item.id +'</td><td>'+ item.name +'</td><td>' + item.sex + '</td><td>'+ item.phonenum + '</td><td>' + (item.credentialstype > 1 ? "军官证": (item.credentialstype == 0 ? "身份证" : "护照")) + '</td><td>'+ item.credentialsnum + '</td><td>'+ (item.travellertype == 0 ? "成人" : "儿童") + '</td><td><a href="toUpdatePage/' +item.id + '" class="layui-btn layui-btn-warm layui-btn-sm">编辑</a><a href="remove/'+ item.id+'" class="layui-btn layui-btn-danger layui-btn-sm">删除</a>' + '</td></tr>');
                    });
                    return arr.join('');
                }();
            }
        });

    });
</script>
</body>
</html>
