<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"  %>
<html>
<head>
  <meta charset="utf-8">
  <title>修改房间</title>
  <meta name="renderer" content="webkit">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="layui/css/layui.css"  media="all">
  <!-- 注意：如果你直接复制所有代码到本地，上述css路径需要改成你本地的 -->
</head>
<body>
         
              
<fieldset class="layui-elem-field layui-field-title" style="margin-top: 20px;">
  <legend>修改房间</legend>
</fieldset>
<form class="layui-form" action=UpdateRoomServletManager method = "post">
  <div class="layui-form-item">
   <div class="layui-inline">
      <label class="layui-form-label">房间号</label>
      <div class="layui-input-inline">
        <input type="text" name="room_id" lay-verify="required" autocomplete="off" value="${updateroom.getRoom_id() }" class="layui-input" readonly>
      </div>
    </div>
  </div>
  <div class="layui-form-item">
   <div class="layui-inline">
      <label class="layui-form-label">房间价格</label>
      <div class="layui-input-inline">
        <input type="text" name="price" lay-verify="required" autocomplete="off" value="${updateroom.getPrice()}" class="layui-input">
      </div>
    </div>
  </div>

<div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">房间朝向</label>
      <div class="layui-input-inline">
       <c:choose>
        <c:when test ="${orientation==1 }">
        <select name="orientation" lay-verify="required" lay-search="">
          <option value="">房间朝向</option>
          <option value="1"  selected = "selected">东</option>
          <option value="2">南</option>
          <option value="3">西</option>
          <option value="4">北</option>
        </select>
        </c:when>
        <c:when test ="${orientation==2 }">
        <select name="orientation" lay-verify="required" lay-search="">
          <option value="">房间朝向</option>
          <option value="1"  >东</option>
          <option value="2" selected = "selected">南</option>
          <option value="3">西</option>
          <option value="4">北</option>
        </select>
        </c:when>
         <c:when test ="${orientation==3 }">
        <select name="orientation" lay-verify="required" lay-search="">
          <option value="">房间朝向</option>
          <option value="1"  >东</option>
          <option value="2" >南</option>
          <option value="3" selected = "selected">西</option>
          <option value="4">北</option>
        </select>
        </c:when>
          <c:when test ="${orientation==4 }">
        <select name="orientation" lay-verify="required" lay-search="">
          <option value="">房间朝向</option>
          <option value="1"  >东</option>
          <option value="2" >南</option>
          <option value="3" >西</option>
          <option value="4" selected = "selected">北</option>
        </select>
        </c:when>
        </c:choose>
      </div>
    </div>
     
  </div>
  <div class="layui-form-item">
    <div class="layui-inline">
      <label class="layui-form-label">房间楼层</label>
      <div class="layui-input-inline">
      <c:choose>
      <c:when test ="${floor==1 }">
        <select name="floor" lay-verify="required" lay-search="">
          <option value="">房间楼层</option>
          <option value="1" selected = "selected">1层</option>
          <option value="2">2层</option>
          <option value="3">3层</option>
        </select>
        </c:when>
         <c:when test ="${floor==2 }">
        <select name="floor" lay-verify="required" lay-search="">
          <option value="">房间楼层</option>
          <option value="1" >1层</option>
          <option value="2" selected = "selected">2层</option>
          <option value="3">3层</option>
        </select>
        </c:when>
         <c:when test ="${floor==3 }">
        <select name="floor" lay-verify="required" lay-search="">
          <option value="">房间楼层</option>
          <option value="1" >1层</option>
          <option value="2" >2层</option>
          <option value="3" selected = "selected">3层</option>
        </select>
        </c:when>
        </c:choose>
      </div>
    </div>
  </div>
   <div class="layui-form-item">
    <label class="layui-form-label">房间类型</label>
    <div class="layui-input-block">
    <c:choose>
      <c:when test ="${roomtype==1 }">
      <input type="radio" name="roomtype" value="大床房" title="大床房" checked>
      <input type="radio" name="roomtype" value="标准间" title="标准间">
      <input type="radio" name="roomtype" value="单人间" title="单人间">
      </c:when>
      <c:when test ="${roomtype==2 }">
      <input type="radio" name="roomtype" value="大床房" title="大床房" >
      <input type="radio" name="roomtype" value="标准间" title="标准间" checked>
      <input type="radio" name="roomtype" value="单人间" title="单人间">
      </c:when>
      <c:when test ="${roomtype==3 }">
      <input type="radio" name="roomtype" value="大床房" title="大床房" >
      <input type="radio" name="roomtype" value="标准间" title="标准间">
      <input type="radio" name="roomtype" value="单人间" title="单人间" checked>
      </c:when>
      </c:choose>
    </div>
  </div>

  <div class="layui-form-item">
    <div class="layui-input-block">
      <button class="layui-btn" type ="submit" lay-filter="demo1">确定</button>
      <button type="reset" class="layui-btn layui-btn-primary">重置</button>
    </div>
  </div>
</form>
 

          
<script src="layui/layui.js" charset="utf-8"></script>
<!-- 注意：如果你直接复制所有代码到本地，上述js路径需要改成你本地的 -->
<script>
layui.use(['form', 'layedit', 'laydate'], function(){
  var form = layui.form
  ,layer = layui.layer
  ,layedit = layui.layedit
  ,laydate = layui.laydate;
  
  //日期
  laydate.render({
    elem: '#date'
  });
  laydate.render({
    elem: '#date1'
  });
  
  //创建一个编辑器
  var editIndex = layedit.build('LAY_demo_editor');
 
  //自定义验证规则
  form.verify({
    title: function(value){
      if(value.length < 5){
        return '标题至少得5个字符啊';
      }
    }
    ,pass: [/(.+){6,12}$/, '密码必须6到12位']
    ,content: function(value){
      layedit.sync(editIndex);
    }
  });
  
  //监听指定开关
  form.on('switch(switchTest)', function(data){
    layer.msg('开关checked：'+ (this.checked ? 'true' : 'false'), {
      offset: '6px'
    });
    layer.tips('温馨提示：请注意开关状态的文字可以随意定义，而不仅仅是ON|OFF', data.othis)
  });
  
  //监听提交
  /*form.on('submit(demo1)', function(data){
    /*layer.alert(JSON.stringify(data.field), {
      title: '最终的提交信息'  
    })
    layer.alert('提交成功',function(){window.parent.location.reload();parent.layer.close(index)});
    //layer.alert('提交成功!');
    return false;
  });*/
  
  
});
</script>

</body>
</html>