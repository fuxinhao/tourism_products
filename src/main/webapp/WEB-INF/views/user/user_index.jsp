<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1.0" />
    <script src="https://unpkg.com/vue@next"></script>
    <!-- import CSS -->
    <link rel="stylesheet" href="https://unpkg.com/element-plus/dist/index.css">
    <!-- import JavaScript -->
    <script src="https://unpkg.com/element-plus"></script>

    <title>首页</title>

    <style>
        #app{
            height: 100%;
        }
        .common-layout{
            height: 100%;
        }
        body{
            margin: 0px 0px;
            padding: 0px 0px;
        }
    </style>
</head>
<body>
<div id="app">
    <div class="common-layout">
        <el-container style="height: 100%">
            <el-header style="background-color: #1890ff">
                <h3 style="float: left;color: white;margin-top: 20px">旅游商品前台系统</h3>
                <h4 style="float: right;margin-top: 20px"><a href="/tourism_products/user/logout" style="color: white;text-decoration: none;font-weight: 600">退出登录</a></h4>
            </el-header>
            <!-- 身体部分 -->
            <el-container height="100%">
                <el-aside width="200px">
                    <el-col :span="24" style="width: 100%">
                        <el-menu
                                default-active="${navNum}"
                                class="el-menu-vertical-demo"
                                @open="handleOpen"
                                @close="handleClose"
                        >

                            <el-menu-item index="1" onclick="productClick()">
                                <el-icon><icon-menu /></el-icon>
                                <span>所有产品</span>
                            </el-menu-item>

                            <el-menu-item index="2" onclick="orderClick()">
                                <el-icon><document /></el-icon>
                                <span>我的订单</span>
                            </el-menu-item>

<%--                            <el-menu-item index="3" onclick="passengerClick()">--%>
<%--                                <el-icon><setting /></el-icon>--%>
<%--                                <span>旅客管理</span>--%>
<%--                            </el-menu-item>--%>

                            <el-menu-item>
                                <el-icon><setting /></el-icon>
                                <span></span>
                            </el-menu-item>

                            <el-menu-item>
                                <el-icon><setting /></el-icon>
                                <span></span>
                            </el-menu-item>

                            <el-menu-item >
                                <el-icon><setting /></el-icon>
                                <span></span>
                            </el-menu-item>

                            <el-menu-item>
                                <el-icon><setting /></el-icon>
                                <span></span>
                            </el-menu-item>

                            <el-menu-item>
                                <el-icon><setting /></el-icon>
                                <span></span>
                            </el-menu-item>

                        </el-menu>
                    </el-col>
                </el-aside>

                <el-container>
                    <el-main>

                        <!-- 产品管理界面 -->
                        <c:if test="${flag == 'productList'}">
                            <%@include file="/WEB-INF/views/user/user_product_list.jsp"%>
                        </c:if>

                        <!-- 订单管理 -->
                        <c:if test="${flag == 'orderList'}">
                            <%@include file="/WEB-INF/views/user/user_order_list.jsp"%>
                        </c:if>

                    </el-main>

                    <el-footer style="background-color: #f0f2f5">
                        <h3 style="color: #848587;text-align: center;margin-top: 20px">Copyright  2022 江西工业工程职业技术学院</h3>
                    </el-footer>
                </el-container>
            </el-container>
        </el-container>
    </div>
</div>
<script>
    const App = {
        data() {
            return {
                message: "Hello Element Plus",
            };
        },
    };
    const app = Vue.createApp(App);
    app.use(ElementPlus);
    app.mount("#app");
</script>
<script>

    //产品管理点击事件
    function productClick(){
        window.location.href = "/tourism_products/product/toProductListPage"
    }

    //订单管理点击事件
    function orderClick(){
        window.location.href = "/tourism_products/order/toMyOrderPage"
    }

</script>
</body>
</html>
