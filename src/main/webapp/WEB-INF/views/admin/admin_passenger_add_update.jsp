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
            <input type="text" name="id" autocomplete="off" class="layui-input" value="${requestScope.passengerDB.id}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="layui-input-block">
            <input type="text" name="name" value="${requestScope.passengerDB.name}" placeholder="请输入姓名" required  lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">性别</label>
        <div class="layui-input-block">
            <input type="text" name="sex" value="${requestScope.passengerDB.sex}" required  lay-verify="required" placeholder="请输入性别" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">电话号码</label>
        <div class="layui-input-block">
            <input type="text" name="phonenum" value="${requestScope.passengerDB.phonenum}" required  lay-verify="required" placeholder="请输入电话号码" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">证件类型</label>
        <div class="layui-input-block">
            <select name="credentialstype" lay-verify="required">
                <option value="">请选择证件类型</option>
                <option value="0" ${requestScope.passengerDB.credentialstype == 0 ? 'selected' : ''}>身份证</option>
                <option value="1" ${requestScope.passengerDB.credentialstype == 1 ? 'selected' : ''}>护照</option>
                <option value="2" ${requestScope.passengerDB.credentialstype == 2 ? 'selected' : ''}>军官证</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">证件号码</label>
        <div class="layui-input-block">
            <input type="text" name="credentialsnum" value="${requestScope.passengerDB.credentialsnum}" required  lay-verify="required" placeholder="请输入证件号码" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">旅客类型</label>
        <div class="layui-input-block">
            <select name="travellertype" lay-verify="required">
                <option value="">请选择旅客类型</option>
                <option value="0" ${requestScope.passengerDB.travellertype == 0 ? 'selected' : ''}>成人</option>
                <option value="1" ${requestScope.passengerDB.travellertype == 1 ? 'selected' : ''}>儿童</option>
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
