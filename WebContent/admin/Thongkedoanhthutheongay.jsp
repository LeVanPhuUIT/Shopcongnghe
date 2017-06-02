<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.HOADON_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Thống kê doanh thu theo ngày</title>
<jsp:include page="AdminIndex.jsp"></jsp:include>
<td id="col_right">
	<h2>Thống kê doanh thu theo ngày</h2>
	<form action="Chitietdoanhthutheongay.jsp" method="post" id="thongke" >
		<table class="TableUpdate" border="1">
			<tbody>
				<tr>
					<td class="Control" colspan="2">
						<ul>
						</ul>
					</td>
				</tr>
				<tr>
					<th>Từ ngày:</th>
					<td><select id="tungay" name="tungay">
							<%
                    	HOADON_MOD hoadon=new HOADON_MOD();
                    	ResultSet rs=hoadon.DanhsachNgayHD();
                    	if(rs!=null)
                    	{
                    		while(rs.next())
                    		{
                    			String ngay=rs.getString(1);
                    	
                    %>

							<option value="<%=ngay%>"><%=ngay %></option>
							<%
                    		}
                    	}
                   %>
					</select></td>
				</tr>
				<tr>
					<th>Đến ngày:</th>
					<td><select id="denngay" name="denngay">
							<%
                   		ResultSet rs1=hoadon.DanhsachNgayHD();
                    	if(rs!=null)
                    	{
                    		while(rs1.next())
                    		{
                    			String ngay=rs1.getString(1);
                    	
                    %>

							<option value="<%=ngay%>"><%=ngay %></option>
							<%
                    		}
                    	}
                   %>
					</select></td>
				</tr>
				<tr>
					<td class="Control" colspan="3">
						<ul>
							<li><input type="submit" name="Thongke" value="Xem thống kê"
								class="uupdate" onclick="return Validate()"></li>
							<li><input type="reset" name="lamlai" value="Làm lại"
								class="vrefresh"></li>
						</ul>
					</td>
				</tr>
			</tbody>
		</table>
	</form> 
	<script type="text/javascript">
            function Get(idname) { if (document.getElementById) { return document.getElementById(idname); } else if (document.all) { return document.all[idname]; } else if (document.layers) { return document.layers[idname]; } else { return null; } } function toggleXPMenu(block) { var CloseImage = "imagesAdmin/closed.gif"; var OpenImage = "imagesAdmin/open.gif"; var divid = block; var img = "img" + block; if (Get(divid).style.display == "") { Get(divid).style.display = "none"; Get(img).src = OpenImage; return false; } else { Get(divid).style.display = ""; Get(img).src = CloseImage; return false; } }
</script>
<script type="text/javascript">
    function Validate() {
    	var tuNgay = document.getElementById('tungay');
    	var denNgay = document.getElementById('denngay');
    	
        if (tuNgay.getTime()>denNgay.getTime()){
        	alert("Ngày trước phải nhỏ hơn hoặc bằng ngày sau");
            return false;
            }
        else{
            return true;
        }
    }

    </script>
	</body>
</html>