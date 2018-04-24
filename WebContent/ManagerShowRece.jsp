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
    //iframe层
    layer.open({
        type: 2,
        title: '添加前台',
        shadeClose: true,
        shade: 0.8,
        area: ['470px', '600px'],
        content: 'MReceptionistAddRoom.jsp' //iframe的url
    });
}
function func9() {
    //iframe层
    layer.open({
        type: 2,
        title: '添加成功',
        shadeClose: true,
        shade: 0.8,
        area: ['470px', '600px'],
        content: 'AddSuccess.jsp' //iframe的url
    });
}
function func8() {
	layer.alert('删除成功!', {
        icon: 1,
        skin: 'layer-ext-moon' 
    });
}
function func7() {
    //iframe层
    layer.open({
        type: 2,
        title: '修改房间',
        shadeClose: true,
        shade: 0.8,
        area: ['470px', '600px'],
        content: 'ManagerUpdateRece.jsp' //iframe的url
    });

}
function func6() {
    //iframe层
	layer.open({
        type: 2,
        title: '修改房间',
        shadeClose: true,
        shade: 0.8,
        area: ['470px', '600px'],
        content: 'UpdateSuccess.jsp' //iframe的url
    });
}
</script>
<div style="margin-top:30px;text-align:center;"class = "header" >

<form class="layui-form" action=ReceptionistSearchServletManager method = "post">
  
  
  <div class="layui-form-item">
   <div class="layui-inline">
      <label class="layui-form-label">前台编号</label>
      <div class="layui-input-inline">
        <input type="text" name="receptionist_id" lay-verify="required" autocomplete="off" placeholder="请输入前台编号" class="layui-input">
      </div>
    </div>
   
   
    <div class="layui-inline">
     <div class="layui-input-block">
      <button class="layui-btn" type ="submit" lay-filter="demo1"><i class="layui-icon">&#xe615;</i>查找</button>
    </div>
    </div>
    <div class="layui-inline">
    <button class="layui-btn layui-btn-warm" type="button"onclick="func10();"><i class="layui-icon">&#xe654;</i>添加前台</button></td></tr></table> 
  
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
      <th>前台编号</th>
      <th>前台身份证号</th>
      <th>前台姓名</th>
      <th>前台性别</th>
      <th>前台年龄</th>
      <th>房间操作</th>
    </tr> 
  </thead>
  <tbody>
  <form action =HandleReceptionistManager method = "post">
<c:forEach var = "s" items = "${ReceptionistList}">
<tr>
      <td>${s.getReceptionist_id()}</td>
      <td>${s.getIdcard()}</td>
      <td>${s.getName()}</td>
      <td>${s.getGender()}</td>
      <td>${s.getAge()}</td>   
      <td><button class="layui-btn layui-btn-normal layui-btn-mini news_del" name="update"  type="submit"  value="${s.getReceptionist_id()}"><i class="layui-icon">&#xe642;</i> 编辑</button>
       <button class="layui-btn layui-btn-danger layui-btn-mini news_del" name="delete"  type="submit"  value="${s.getReceptionist_id()}"><i class="layui-icon">&#xe640;</i> 删除</button>  
</tr>


</c:forEach>
</form>
  </tbody>
</table>
<% String recepflag = (String)session.getAttribute("recepflag");
if(recepflag!=null&&recepflag.length()>0&&recepflag.equals("1"))
	
	{%>
 <script type="text/javascript">
                window.onload=function(){
                	func9(); }
 </script>
<%  
session.setAttribute("recepflag",null);
	}
%>
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
if(flag1!=null&&flag1.length()>0&&flag1.equals("1"))
	
	{%>
 <script type="text/javascript">
                window.onload=function(){
                	func7(); }
 </script>
<%  
session.setAttribute("flag1",null);
	}
%>
<% String updateflag = (String)session.getAttribute("updateflag");
if(updateflag!=null&&updateflag.length()>0&&updateflag.equals("1"))
{%>
 <script type="text/javascript">
                window.onload=function(){
                	func6(); }
 </script>
<%  
session.setAttribute("updateflag",null);
	}
%>
</body>
</html>