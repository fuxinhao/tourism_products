<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>${requestScope.type}</title>
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
            <input type="text" name="id" autocomplete="off" class="layui-input" value="${requestScope.userDB.id}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">用户名</label>
        <div class="layui-input-block">
            <input type="text" name="username" value="${requestScope.userDB.username}" placeholder="请输入用户名" required  lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">密码</label>
        <div class="layui-input-block">
            <input type="text" name="password" value="${requestScope.userDB.password}" required  lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">身份</label>
        <div class="layui-input-block">
            <select name="identity" lay-verify="required">
                <option value="">请选择身份</option>
                <option value="0" ${requestScope.userDB.identity == 0 ? 'selected' : ''}>普通用户</option>
                <option value="1" ${requestScope.userDB.identity == 1 ? 'selected' : ''}>管理员</option>
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
