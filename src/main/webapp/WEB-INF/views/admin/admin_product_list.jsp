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
<a href="/tourism_products/product/toAddPage" class="layui-btn layui-btn-normal  layui-btn-sm">添加</a>
<table class="layui-table">
    <colgroup>
        <col width="40">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr>
        <th>id</th>
        <th>产品编号</th>
        <th>产品名称</th>
        <th>出发城市</th>
        <th>出发时间</th>
        <th>产品价格</th>
        <th>产品描述</th>
        <th>状态</th>
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
                        arr.push('<tr><td>'+ item.id +'</td><td>' + item.productnum + '</td><td>'+ item.productname + '</td><td>' + item.cityname + '</td><td>'+ item.departturetime + '</td><td>'+ item.productprice + '</td><td>' + item.productdesc + '</td><td>'+ (item.productstatus == 0 ? "关闭" : "开启") +'</td><td><a href="toUpdatePage/' +item.id + '" class="layui-btn layui-btn-warm layui-btn-sm">编辑</a><a href="remove/'+ item.id+'" class="layui-btn layui-btn-danger layui-btn-sm">删除</a>' + '</td></tr>');
                    });
                    return arr.join('');
                }();
            }
        });

    });
</script>
</body>
</html>
