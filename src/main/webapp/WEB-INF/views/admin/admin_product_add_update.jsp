<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <!-- 引入 layui.css -->
    <link rel="stylesheet" href="//unpkg.com/layui@2.6.8/dist/css/layui.css">

    <!-- 引入 layui.js -->
    <script src="//unpkg.com/layui@2.6.8/dist/layui.js"></script>

    <style>
        body{
            padding-top: 50px;
        }
    </style>
</head>
<body>
<form class="layui-form" action="${requestScope.action}" method="post">

    <div class="layui-form-item">
        <label class="layui-form-label">id</label>
        <div class="layui-input-block">
            <input type="text" name="id" autocomplete="off" class="layui-input" value="${requestScope.productDB.id}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">产品编号</label>
        <div class="layui-input-block">
            <input type="text" name="productnum" value="${requestScope.productDB.productnum}" placeholder="请输入产品编号" required  lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">产品名称</label>
        <div class="layui-input-block">
            <input type="text" name="productname" value="${requestScope.productDB.productname}" required  lay-verify="required" placeholder="请输入产品名称" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">出发城市</label>
        <div class="layui-input-block">
            <input type="text" name="cityname" value="${requestScope.productDB.cityname}" required  lay-verify="required" placeholder="请输入出发城市" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">出发时间</label>
        <div class="layui-input-block">
            <input type="text" name="departturetime" value="${requestScope.productDB.departturetime}" required  lay-verify="required" placeholder="请输入出发时间" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">产品价格</label>
        <div class="layui-input-block">
            <input type="text" name="productprice" value="${requestScope.productDB.productprice}" required  lay-verify="required" placeholder="请输入产品价格" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">产品描述</label>
        <div class="layui-input-block">
            <input type="text" name="productdesc" value="${requestScope.productDB.productdesc}" required  lay-verify="required" placeholder="请输入产品描述" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">状态</label>
        <div class="layui-input-block">
            <select name="productstatus" lay-verify="required">
                <option value="">请选择状态</option>
                <option value="0" ${requestScope.productDB.productstatus == 0 ? 'selected' : ''}>关闭</option>
                <option value="1" ${requestScope.productDB.productstatus == 1 ? 'selected' : ''}>开启</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">${requestScope.type}</button>
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>

</form>
</body>
</html>
