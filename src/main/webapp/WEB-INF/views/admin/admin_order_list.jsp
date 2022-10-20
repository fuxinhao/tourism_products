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
<a href="#" class="layui-btn layui-btn-normal  layui-btn-sm">添加</a>
<table class="layui-table">
  <colgroup>
    <col width="40">
    <col width="200">
    <col>
  </colgroup>
  <thead>
  <tr>
    <th>id</th>
    <th>订单编号</th>
    <th>下单时间</th>
    <th>出行人数</th>
    <th>订单描述</th>
    <th>支付方式</th>
    <th>订单状态</th>
    <th>产品id</th>
    <th>会员id</th>
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
            arr.push('<tr><td>'+ item.id +'</td><td>'+ item.ordernum +'</td><td>' + item.ordertime + '</td><td>'+ item.peoplecount + '</td><td>' + item.orderdesc + '</td><td>'+ (item.paytype > 1 ? "其他": (item.paytype == 0 ? "支付宝" : "微信")) + '</td><td>'+ (item.orderstatus == 0 ? "未支付":"已支付") + '</td><td>' + item.productid + '</td><td>'+ item.memberid +'</td><td><a href="#' +item.id + '" class="layui-btn layui-btn-warm layui-btn-sm">编辑</a><a href="remove/'+ item.id+'" class="layui-btn layui-btn-danger layui-btn-sm">删除</a>' + '</td></tr>');
          });
          return arr.join('');
        }();
      }
    });

  });
</script>
</body>
</html>
