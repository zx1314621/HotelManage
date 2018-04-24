<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>月季报表</title>
<script src="layui/layui.all.js"></script>
  <link rel="stylesheet" href="layui/css/layui.css">
<script type="text/javascript" src="jQuery.js"></script>
<script type="text/javascript" src="jqplot.js"></script>


</head>
<body>

<div id="chart1"></div>

<div style="text-align:center;clear:both;">
<script src="/gg_bd_ad_720x90.js" type="text/javascript"></script>
<script src="/follow.js" type="text/javascript"></script>
</div>
<%@ page import="usst.model.*"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.*"%>


<%
Format f = new SimpleDateFormat("yyyyMMdd");								 
Date today1 = new Date();		 					 
String datetime=f.format(today1);
ArrayList<Order> OrderList = (ArrayList<Order>) application.getAttribute("OrderList");
ArrayList<Room> RoomList = (ArrayList<Room>)application.getAttribute("RoomList");
Room BigRoom = new Room();
Room DuRoom = new Room();
Room StRoom = new Room();
BigRoom.setPrice(999);
DuRoom.setPrice(999);
StRoom.setPrice(999);
for(int i =0;i<RoomList.size();i++)
{
	if(RoomList.get(i).getRoomtype().equals("大床房")&&(RoomList.get(i).getPrice()<BigRoom.getPrice()))
	{
		BigRoom=RoomList.get(i);
	}
	if(RoomList.get(i).getRoomtype().equals("标准间")&&(RoomList.get(i).getPrice()<DuRoom.getPrice()))
	{
		DuRoom=RoomList.get(i);
	}
	if(RoomList.get(i).getRoomtype().equals("单人间")&&(RoomList.get(i).getPrice()<StRoom.getPrice()))
	{
		StRoom=RoomList.get(i);
	}
}
int proday=Integer.valueOf(datetime.substring(0,6))*100;
pageContext.setAttribute("BigRoom",BigRoom);
pageContext.setAttribute("DuRoom",DuRoom);
pageContext.setAttribute("StRoom",StRoom);
ArrayList<Integer> big = new ArrayList<Integer>(); 
ArrayList<Integer> dRoom = new ArrayList<Integer>(); 
ArrayList<Integer> standard = new ArrayList<Integer>(); 
int BigEarning=0;
int DroomEarning=0;
int StandardEarning=0;
for(int i=1;i<=31;i++)
{
	int temp=proday+i;
	int tempBig = 0;
	int tempDroom = 0;
	int tempStandard = 0;	
	for(int j=0;j<OrderList.size();j++)
	{
		if(temp<OrderList.get(j).getCheckout()&&temp>=OrderList.get(j).getCheckin())
		{
			
			if(OrderList.get(j).getRoomtype().equals("大床房"))
			{
				for(int m=0;m<RoomList.size();m++)
				{
					if(RoomList.get(m).getRoom_id().equals(OrderList.get(j).getRoom_id()))
					{
						BigEarning=BigEarning+RoomList.get(m).getPrice();
					}
				}
				tempBig++;
			}
			else if(OrderList.get(j).getRoomtype().equals("标准间"))
			{	
				//System.out.print(OrderList.get(j).getRoomtype()+OrderList.get(j).getRoom_id());
				for(int m=0;m<RoomList.size();m++)
				{
					if(RoomList.get(m).getRoom_id().equals(OrderList.get(j).getRoom_id()))
					{
						//System.out.print(RoomList.get(m).getPrice());
						DroomEarning=DroomEarning+RoomList.get(m).getPrice();
					}
				}
				tempDroom++;
			}
			else if(OrderList.get(j).getRoomtype().equals("单人间"))
			{
				for(int m=0;m<RoomList.size();m++)
				{
					if(RoomList.get(m).getRoom_id().equals(OrderList.get(j).getRoom_id()))
					{
						StandardEarning=StandardEarning+RoomList.get(m).getPrice();
					}
				}
				tempStandard++;
			}
		}
    }
	//System.out.print(DroomEarning+StandardEarning);
	big.add(tempBig);
	dRoom.add(tempDroom);
	standard.add(tempStandard);
}
int AllBig=0;
int AllDroom=0;
int Allstandard=0;
for(int i=0;i<31;i++)
{
	AllBig=big.get(i)+AllBig;;
	AllDroom=AllDroom+dRoom.get(i);
	Allstandard=Allstandard+standard.get(i);	
}
pageContext.setAttribute("AllBig",AllBig);
pageContext.setAttribute("AllDroom",AllDroom);
pageContext.setAttribute("Allstandard",Allstandard);
pageContext.setAttribute("big",big);
pageContext.setAttribute("dRoom",dRoom);
pageContext.setAttribute("standard",standard);
pageContext.setAttribute("BigEarning",BigEarning);
pageContext.setAttribute("DroomEarning",DroomEarning);
pageContext.setAttribute("StandardEarning",StandardEarning);
%>
	<div id="chart2"></div>

	<script type="text/javascript">
   
	var data=[
		[${big.get(0)},${big.get(1)},${big.get(2)},${big.get(3)},${big.get(4)},${big.get(5)},${big.get(6)},${big.get(7)},${big.get(8)},${big.get(9)},${big.get(10)},${big.get(11)},${big.get(12)},${big.get(13)},${big.get(14)},${big.get(15)},${big.get(16)},${big.get(17)},${big.get(18)},${big.get(19)},${big.get(20)},${big.get(21)},${big.get(22)},${big.get(23)},${big.get(24)},${big.get(25)},${big.get(26)},${big.get(27)},${big.get(28)},${big.get(29)},${big.get(30)}],
		[${dRoom.get(0)},${dRoom.get(1)},${dRoom.get(2)},${dRoom.get(3)},${dRoom.get(4)},${dRoom.get(5)},${dRoom.get(6)},${dRoom.get(7)},${dRoom.get(8)},${dRoom.get(9)},${dRoom.get(10)},${dRoom.get(11)},${dRoom.get(12)},${dRoom.get(13)},${dRoom.get(14)},${dRoom.get(15)},${dRoom.get(16)},${dRoom.get(17)},${dRoom.get(18)},${dRoom.get(19)},${dRoom.get(20)},${dRoom.get(21)},${dRoom.get(22)},${dRoom.get(23)},${dRoom.get(24)},${dRoom.get(25)},${dRoom.get(26)},${dRoom.get(27)},${dRoom.get(28)},${dRoom.get(29)},${dRoom.get(30)}],
		[${standard.get(0)},${standard.get(1)},${standard.get(2)},${standard.get(3)},${standard.get(4)},${standard.get(5)},${standard.get(6)},${standard.get(7)},${standard.get(8)},${standard.get(9)},${standard.get(10)},${standard.get(11)},${standard.get(12)},${standard.get(13)},${standard.get(14)},${standard.get(15)},${standard.get(16)},${standard.get(17)},${standard.get(18)},${standard.get(19)},${standard.get(20)},${standard.get(21)},${standard.get(22)},${standard.get(23)},${standard.get(24)},${standard.get(25)},${standard.get(26)},${standard.get(27)},${standard.get(28)},${standard.get(29)},${standard.get(30)}]
	];

	/*Var data=[
		[${AllBig}],
		[${AllDroom}],
		[${Allstandard}]
		];*/
	
	var data_max = 5; //Y轴最大刻度
	var line_title = ["大床房","双人房","标准间"]; //曲线名称
	var y_label = "销售数量"; //Y轴标题
	var x_label = "日期"; //X轴标题
	var x = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31];
	var x1 = [1,2,3];//定义X轴刻度值
	var title = "这是标题"; //统计图标标题
	j.jqplot.diagram.base("chart1", data, line_title, "月季房型销售数量报表", x, x_label, y_label, data_max, 1);
	//j.jqplot.diagram.base("chart2", data, line_title, "这是统计标题", x1, x_label, y_label, data_max, 2);
</script>
<table class="layui-table">
  <colgroup>
    <col>
    <col>
    <col>
  </colgroup>
  <thead>
    <tr>
      <th>大床房</th>
      <th>标准间</th>
      <th>双人房</th>
    </tr> 
  </thead>
  <tbody>
    <tr>
      <td>价格${BigRoom.getPrice()}</td>
      <td>价格${DuRoom.getPrice()}</td>
      <td>价格${StRoom.getPrice()}</td>
    </tr>
    <tr>
      <td>月销售数量:${AllBig}</td>
      <td>月销售数量:${AllDroom}</td>
      <td>月销售数量:${Allstandard}</td>
    </tr>
    <tr>
      <td>月收益:${BigEarning}</td>
      <td>月收益:${DroomEarning}</td>
      <td>月收益:${StandardEarning}</td>
    </tr>
  </tbody>
</table>
<font size=50 color = "grey">月总收益${BigEarning+DroomEarning+StandardEarning}元</font>

</body>
</html>