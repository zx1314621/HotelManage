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
        title: '添加房间',
        shadeClose: true,
        shade: 0.8,
        area: ['470px', '600px'],
        content: 'ManagerAddRoom.jsp' //iframe的url
    });
}
function func9() {
    //iframe层
    layer.open({
        type: 2,
        title: '修改房间',
        shadeClose: true,
        shade: 0.8,
        area: ['470px', '600px'],
        content: 'ManagerUpdateRoom.jsp' //iframe的url
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
        title: '添加成功!',
        shadeClose: true,
        shade: 0.8,
        area: ['470px', '600px'],
        content: 'AddSuccess.jsp' //iframe的url
    });
}
function func6() {
    //iframe层
	layer.open({
        type: 2,
        title: '修改成功!',
        shadeClose: true,
        shade: 0.8,
        area: ['470px', '600px'],
        content: 'UpdateSuccess.jsp' //iframe的url
    });
}
function func5() {
	layer.alert('保留成功!', {
        icon: 1,
        skin: 'layer-ext-moon' 
    });
}
function func4() {
	layer.alert('保留失败，房间正中入住中!', {
        icon: 2,
        skin: 'layer-ext-moon' 
    });
}
function func3() {
	layer.alert('恢复成功!', {
        icon: 1,
        skin: 'layer-ext-moon' 
    });
}
</script>
<div style="margin-top:30px;text-align:center;"class = "header" >

<form class="layui-form" action=RoomSearchServletManager method = "post">
  
  
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">房间朝向</label>
      <div class="layui-input-inline">
        <select name="orientation" lay-verify="required" lay-search="">
          <option value="0">房间朝向</option>
          <option value="1">东</option>
          <option value="2">南</option>
          <option value="3">西</option>
          <option value="4">北</option>
        </select>
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">房间朝向</label>
      <div class="layui-input-inline">
       <select name="floor" lay-verify="required" lay-search="">
          <option value="0">房间楼层</option>
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
        </select>
      </div>
    </div>
    <div class="layui-inline">
      <label class="layui-form-label">房间朝向</label>
      <div class="layui-input-inline">
        <select name="roomtyle" lay-verify="required" lay-search="">
          <option value="0">房间类型</option>
          <option value="1">大床房</option>
          <option value="2">标准间</option>
          <option value="3">单人间</option>
        </select>
      </div>
    </div>
    <div class="layui-inline">
     <div class="layui-input-block">
      <button class="layui-btn" type ="submit" lay-filter="demo1"><i class="layui-icon">&#xe615;</i>查找房间</button>
    </div>
    </div>
    <div class="layui-inline">
    <button class="layui-btn layui-btn-warm" type="button"onclick="func10();"><i class="layui-icon">&#xe654;</i>添加房间</button></td></tr></table> 
  
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
      <th>房间号</th>
      <th>房间类型</th>
      <th>朝向</th>
      <th>楼层</th>
      <th>价格</th>
      <th>订单数</th>
      <th>房间状态</th>
      <th>房间操作</th>
    </tr> 
  </thead>
  <tbody>
  <form action =HandleRoomManager method = "post">
<c:forEach var = "s" items = "${RoomList}">
<tr>
      <td>${s.getRoom_id()}</td>
      <td>${s.getRoomtype()}</td>
      <td>${s.getOrientation()}</td>
      <td>${s.getFloor()}</td>
      <td>${s.getPrice()}</td>
      <td>${s.getOrderNum()}</td>
      <c:choose>
      <c:when test ="${s.getEngaged()==0 }">
      <td>空闲中</td>
      </c:when>
      <c:when test ="${s.getEngaged()==1 }">
      <td>使用中</td>
      </c:when>
      <c:when test ="${s.getEngaged()==2 }">
      <td>保留中</td>
      </c:when>
      </c:choose>
      <td><button class="layui-btn layui-btn-normal layui-btn-mini news_del" name="update"  type="submit"  value="${s.getRoom_id()}"><i class="layui-icon">&#xe642;</i> 编辑</button>
      <c:choose>
      <c:when test="${s.getEngaged()==2 }">
      <button class="layui-btn layui-btn-warm layui-btn-mini news_del" name="recover"  type="submit"  value="${s.getRoom_id()}"><i class="layui-icon">&#xe643;</i>保留</button>
      </c:when>
      <c:otherwise>
      <button class="layui-btn layui-btn-warm layui-btn-mini news_del" name="keep"  type="submit"  value="${s.getRoom_id()}"><i class="layui-icon">&#xe63f;</i>保留</button>
      </c:otherwise>
      </c:choose>
       <button class="layui-btn layui-btn-danger layui-btn-mini news_del" name="delete"  type="submit"  value="${s.getRoom_id()}"><i class="layui-icon">&#xe640;</i> 删除</button> </td>  
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
<% String keepflag = (String)session.getAttribute("keepflag");
if(keepflag!=null&&keepflag.length()>0&&keepflag.equals("1"))
	{%>
 <script type="text/javascript">
                window.onload=function(){
                	func5(); }
 </script>
<%  
session.setAttribute("keepflag",null);
}
else if(keepflag!=null&&keepflag.length()>0&&keepflag.equals("0"))
{
%>
<script type="text/javascript">
                window.onload=function(){
                	func4(); }
 </script>
 <% session.setAttribute("keepflag",null);
 }%>
<% String add = (String)session.getAttribute("add");
if(add!=null&&add.length()>0&&add.equals("1"))
	
	{%>
 <script type="text/javascript">
                window.onload=function(){
                	func7(); }
 </script>
<%  
session.setAttribute("add",null);
	}
%>
<% String flag1 = (String)session.getAttribute("flag1");
if(flag1!=null&&flag1.length()>0&&flag1.equals("1"))
	
	{%>
 <script type="text/javascript">
                window.onload=function(){
                	func9(); }
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
<% String recoverflag = (String)session.getAttribute("recoverflag");
if(recoverflag!=null&&recoverflag.length()>0&&recoverflag.equals("1"))
	
	{%>
 <script type="text/javascript">
                window.onload=function(){
                	func3(); }
 </script>
<%  
session.setAttribute("recoverflag",null);
	}
%>
</body>
</html>