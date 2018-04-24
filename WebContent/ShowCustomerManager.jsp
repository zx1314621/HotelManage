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
function func9() {
    //iframe层
    layer.open({
        type: 2,
        title: '修改房间',
        shadeClose: true,
        shade: 0.8,
        area: ['537px', '600px'],
        content: 'CheckCustomerManager.jsp' //iframe的url
    });

}
function func8() {
	layer.alert('删除成功!', {
        icon: 1,
        skin: 'layer-ext-moon' 
    });
}
</script>
<div style="margin-top:30px;text-align:center;"class = "header" >
<form class="layui-form" action=CustomerSearchManager method = "post">
  
  
  <div class="layui-form-item">   
    <div class="layui-form-item">
   <div class="layui-inline">
      <label class="layui-form-label">顾客编号</label>
      <div class="layui-input-inline">
        <input type="text" name="customer_id" lay-verify="required" autocomplete="off" placeholder="请输入顾客编号" class="layui-input">
      </div>
    </div>
  
   
   <div class="layui-inline">
      <label class="layui-form-label">顾客姓名</label>
      <div class="layui-input-inline">
        <input type="text" name="name" lay-verify="required" autocomplete="off" placeholder="请输入顾客姓名" class="layui-input">
      </div>
    </div>
  
    <div class="layui-inline">
     <div class="layui-input-block">
      <button class="layui-btn" type ="submit" lay-filter="demo1"><i class="layui-icon">&#xe615;</i>查找</button>
    </div>
    </div>
    <div class="layui-inline">
    <c:choose>
    <c:when test="${change==1 }">
    <button class="layui-btn layui-btn-warm"  name="whole" type="submit" value="2">全部旅客</button></td></tr></table>
    </c:when> 
    <c:otherwise>
     <button class="layui-btn layui-btn-warm"  name="living" type="submit" value="1">在店旅客</button></td></tr></table>
    </c:otherwise>
  </c:choose>
    </div>
  </div>
    <c:choose>
    <c:when test="${change==1 }">
  <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>在店旅客</legend>
</fieldset>
</c:when>
 <c:otherwise>
 <fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>全部旅客</legend>
</fieldset>
 </c:otherwise>
</c:choose>
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
      <th>顾客编号</th>
      <th>顾客姓名</th>
      <th>性别</th>
      <th>年龄</th>
      <th>身份证号</th>
      <th>操作</th>
    </tr> 
  </thead>
  <tbody>
  <form action =HandleCustomerManager method = "post">
<c:forEach var = "s" items = "${CustomerList}">
<tr>
      <td>${s.getCustomer_id()}</td>
      <td>${s.getName()}</td>
      <td>${s.getGender()}</td>
      <td>${s.getAge()}</td>
      <td>${s.getIdcard()}</td>
      <td><button class="layui-btn layui-btn-normal layui-btn-mini news_del" name="check"  type="submit"  value="${s.getCustomer_id()}"><i class="layui-icon">&#xe615;</i> 查看</button>
       <button class="layui-btn layui-btn-danger layui-btn-mini news_del" name="delete"  type="submit"  value="${s.getCustomer_id()}"><i class="layui-icon">&#xe640;</i> 删除</button> </td>  
</tr>
</c:forEach>
</form>
  </tbody>
</table>
<% String flag = (String)session.getAttribute("flag");
if(flag!=null&&flag.length()>0&&flag.equals("1"))
	
	{%>
 <script type="text/javascript">
                window.onload=function(){
                	func8(); }
 </script>
<%  
session.setAttribute("flag",null);
	}
%>
<% String flag1 = (String)session.getAttribute("flag1");
if(flag1!=null&&flag1.length()>0&&(flag1.equals("2")))
	{%>
 <script type="text/javascript">
                window.onload=function(){
                	func9(); }
 </script>
<%  
session.setAttribute("flag1",null);
	}
%>
</body>
</html>