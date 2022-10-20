<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户列表</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">

    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>
</head>
<body>
<a href="/tourism_products/user/toAddPage" class="layui-btn layui-btn-normal  layui-btn-sm">添加</a>
<table class="layui-table">
    <colgroup>
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>id</th>
        <th>用户名</th>
        <th>密码</th>
        <th>身份</th>
        <th>操作</th>
    </tr>
    </thead>
    <tbody id="userTbody">
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
                document.getElementById('userTbody').innerHTML = function(){
                    var arr = []
                        ,thisData = data.concat().splice(obj.curr*obj.limit - obj.limit , obj.limit);
                    layui.each(thisData, function(index, item){
                        arr.push('<tr><td>'+ item.id +'</td><td>' + item.username + '</td><td>'+ item.password + '</td><td>' + (item.identity == 0 ? '普通用户' : '管理员') +'</td><td>' + '<a href="toUpdatePage/' +item.id + '" class="layui-btn layui-btn-warm layui-btn-sm">编辑</a><a href="remove/'+ item.id+'" class="layui-btn layui-btn-danger layui-btn-sm">删除</a>' + '</td></tr>');
                    });
                    return arr.join('');
                }();
            }
        });

    });
</script>
</body>
</html>
