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
            <input disabled type="text" name="productnum" value="${requestScope.productDB.productnum}" placeholder="请输入产品编号" required  lay-verify="required" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">产品名称</label>
        <div class="layui-input-block">
            <input disabled type="text" name="productname" value="${requestScope.productDB.productname}" required  lay-verify="required" placeholder="请输入产品名称" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">出发城市</label>
        <div class="layui-input-block">
            <input disabled type="text" name="cityname" value="${requestScope.productDB.cityname}" required  lay-verify="required" placeholder="请输入出发城市" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">出发时间</label>
        <div class="layui-input-block">
            <input disabled type="text" name="departturetime" value="${requestScope.productDB.departturetime}" required  lay-verify="required" placeholder="请输入出发时间" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">产品价格</label>
        <div class="layui-input-block">
            <input disabled type="text" name="productprice" value="${requestScope.productDB.productprice}" required  lay-verify="required" placeholder="请输入产品价格" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">产品描述</label>
        <div class="layui-input-block">
            <input disabled type="text" name="productdesc" value="${requestScope.productDB.productdesc}" required  lay-verify="required" placeholder="请输入产品描述" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">出行人数</label>
        <div class="layui-input-block">
            <input type="text" name="peoplecount" required  lay-verify="required" placeholder="请输入出行人数" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">订单描述</label>
        <div class="layui-input-block">
            <input type="text" name="orderdesc" required  lay-verify="required" placeholder="请输入订单描述" autocomplete="off" class="layui-input">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">支付方式</label>
        <div class="layui-input-block">
            <select name="paytype" lay-verify="required">
                <option value="">请选择支付方式</option>
                <option value="0" >支付宝</option>
                <option value="1" >微信</option>
                <option value="2" >其他</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">付款时间</label>
        <div class="layui-input-block">
            <select name="orderstatus" lay-verify="required">
                <option value="">请选择付款时间</option>
                <option value="0" >稍后支付</option>
                <option value="1" >立即支付</option>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn" lay-submit lay-filter="formDemo">${requestScope.type}</button>
        </div>
    </div>

</form>
</body>
</html>
