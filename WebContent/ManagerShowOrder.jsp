<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"  %>
<html>
<head>
    <meta charset="utf-8">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
     <script src="layui/layui.all.js"></script>
    <link rel="stylesheet" href="layui/css/layui.css">
<body>
<script src="layui/layui.js" charset="utf-8"></script>
<script>

layui.use(['form', 'layedit', 'laydate'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,layedit = layui.layedit
	  ,laydate = layui.laydate;	  
});	  
function func10() {
	layer.alert('删除成功!', {
        icon: 1,
        skin: 'layer-ext-moon' 
    });
}
function func9() {
    //iframe层
    layer.open({
        type: 2,
        title: '修改房间',
        shadeClose: true,
        shade: 0.8,
        area: ['470px', '700px'],
        content: 'UpdateOrderManager.jsp' //iframe的url
    });

}
function func8() {
    //iframe层
	layer.open({
        type: 2,
        shadeClose: true,
        shade: 0.8,
        area: ['470px', '700px'],
        content: 'UpdateSuccess.jsp' //iframe的url
    });
}
</script>
<div style="margin-top:30px;text-align:center;"class = "header" >

<form class="layui-form" action=OrderSearchServletManager method = "post">
  
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">订单号</label>
      <div class="layui-input-inline">
        <select name="order_id" lay-verify="required" lay-search="">
          <option value="0">订单号</option>
          <c:forEach var = "s" items = "${OrderList}">
          <option value="${s.getOrder_id()}">${s.getOrder_id()}</option>
          </c:forEach>
        </select>
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">顾客姓名</label>
      <div class="layui-input-inline">
        <select name="customer_name" lay-verify="required" lay-search="">
          <option value="0">顾客姓名</option>
          <c:forEach var = "s" items = "${OrderList}">
          <option value="${s.getCustomerName() }">${s.getCustomerName() }</option>
          </c:forEach>
        </select>
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">订房类型</label>
      <div class="layui-input-inline">
       <select name="roomtype" lay-verify="required" lay-search="">
          <option value="0">房间类型</option>
          <option value="大床房">大床房</option>
          <option value="标准间">标准间</option>
          <option value="单人间">单人间</option>
        </select>
      </div>
    </div>
    <div class="layui-inline">
     <div class="layui-input-block">
      <button class="layui-btn" type ="submit" lay-filter="demo1">查找订单</button>
    </div>
    </div>
  </div>
  
</form>
</div>
<div class = "container">
<table class="layui-table">
  <colgroup>
    <col width="150">
    <col width="200">
    <col>
  </colgroup>
  <thead>
    <tr>
      <th>订单号</th>
      <th>身份证号</th>
      <th>顾客姓名</th>
      <th>入住时间</th>
      <th>离店时间</th>
      <th>房间号</th>
      <th>订单状态</th>
      <th>房间类型</th>
      <th>备注</th>
      <th>订单操作</th>
    </tr> 
  </thead>
  <tbody>
  <form action =HandleOrderManager method = "post">
<c:forEach var = "s" items = "${OrderList}">
<tr>
      <td>${s.getOrder_id()}</td>
      <td>${s.getIdcard()}</td>
      <td>${s.getCustomerName()}</td>
      <td>${s.getCheckin()}</td>
      <td>${s.getCheckout()}</td>
      <td>${s.getRoom_id()}</td>
      <c:choose>
      <c:when test ="${s.getProcessed()==0 }">
      <td>未处理</td>
      </c:when>
      <c:when test ="${s.getProcessed()==1 }">
      <td>已处理</td>
      </c:when>
      <c:when test ="${s.getProcessed()==2 }">
      <td>已完成</td>
       </c:when>
      </c:choose>
       <td>${s.getRoomtype()}</td>
       <td>${s.getRequirement()}</td>
      <td><button class="layui-btn layui-btn-normal layui-btn-mini news_del" name="update"  type="submit"  value="${s.getOrder_id()}"><i class="layui-icon">&#xe642;</i> 编辑</button>
       <button class="layui-btn layui-btn-danger layui-btn-mini news_del" name="delete"  type="submit"  value="${s.getOrder_id()}"><i class="layui-icon">&#xe640;</i> 删除</button> </td>  
</tr>
</c:forEach>
</form>
  </tbody>
</table>
<% String deleteflag = (String)session.getAttribute("deleteflag");
if(deleteflag!=null&&deleteflag.length()>0&&deleteflag.equals("1"))
	
	{%>
 <script type="text/javascript">
                window.onload=function(){
                	func10(); }
 </script>
<%  
session.setAttribute("deleteflag",null);
	}
%>
<% String updateflag = (String)session.getAttribute("updateflag");
if(updateflag!=null&&updateflag.length()>0&&updateflag.equals("1"))
	
	{%>
 <script type="text/javascript">
                window.onload=function(){
                	func9(); }
 </script>
<%  
session.setAttribute("updateflag",null);
	}
%>
<% String updatesuccessflag = (String)session.getAttribute("updatesuccessflag");
if(updatesuccessflag!=null&&updatesuccessflag.length()>0&&updatesuccessflag.equals("1"))
	
	{%>
 <script type="text/javascript">
                window.onload=function(){
                	func8(); }
 </script>
<%  
session.setAttribute("updatesuccessflag",null);
	}
%>
</body>
</html>