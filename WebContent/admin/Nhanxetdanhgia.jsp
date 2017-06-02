<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.DANHGIA_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Nhận xét đánh giá khách hàng</title>
<style type="text/css">
.phantrang {
	color: red;
}
</style>
<jsp:include page="AdminIndex.jsp" />

<!-- Dòng viết code ở đây -->
<td id="col_right">
	<h2>Nhận xét đánh giá khách hàng</h2>

	<form action="" method="post" novalidate="novalidate">
		<div class="clearfix"></div>
		<div class="Control">
			<ul>
				<li><a class="vrefresh"
					href="Nhanxetdanhgia
									            .jsp">Refesh</a></li>
			</ul>
		</div>
	</form>

	<table class="TableView" border="1" id="myTable">
		<tbody>
			<tr class="trHeader">
				<th class="CheckBoxsmall">STT</th>
				<th class="Text">Tiêu đề</th>
				<th class="Text">Nội dung</th>
				<th class="Text">Tên sản phẩm</th>
				<th class="Function">Chức năng</th>
			</tr>
		</tbody>
		<tbody>
			<%
            							int p=1;
            							if(request.getParameter("p")!=null)
            							{
            								p=Integer.parseInt(request.getParameter("p"));
            							}
            							ResultSet dsDG=null;
            							DANHGIA_MOD danhgia_mod=new DANHGIA_MOD();
            							dsDG=danhgia_mod.DanhsachDanhgia(p,10);
            							if(dsDG!=null)
            							{
            								while(dsDG.next())
            								{
            									int stt=dsDG.getInt(1);
            									String tieude=dsDG.getString(2);
            									String noidung=dsDG.getString(3);
            									String tensp=dsDG.getString(4);
            						%>
			<tr class="trOdd">

				<td class="CheckBoxsmall"><%=stt %></td>
				<td class="Text"><%=tieude %></td>
				<td class="Text"><%=noidung %></td>
				<td class="Text"><%=tensp %></td>

				<td class="Function"><strong> <input type="hidden"
						value="xoa" name="key"> <a class="vdelete"
						href="../Danhgia.do?madg=<%=dsDG.getString(5) %>" title="Xóa"
						onclick="DeleteConfirm()"></a>
				<a href="../Danhgia.do?madg=<%=dsDG.getString(5) %>" style="color:red;" onclick="DeleteConfirm()">Xóa</a>
				</strong></td>
			</tr>
			<%
		            								}
		            							}
						                    %>
		</tbody>
		</td>
		</tr>
	</table> <!--Code phân trang-->
	
	<div class="pagingContainer">
		<b color="white">Trang : </b>
		<%
                String phantrang="";
                int pageCurent=0;
                if(request.getParameter("page")==null){
                	pageCurent=1;
                }
                else{
                	pageCurent=Integer.parseInt(request.getParameter("page"));
                }
                int n=danhgia_mod.tinhSotrang(10);
                for(int i=1;i<=n;i++)
                { 
                	if(i==pageCurent)
                	{
                
                	%>
		<a href="../Nhanxetdanhgia?p=<%=i %>"><b class="phantrang"><%=i %></b></a>
		<%
                	}
                	else{
                		
                		%>
		<a href="../Nhanxetdanhgia?page=<%=i %>"><b class=">"><%=i %></b></a>
		<%
                	}
                }
                %>
	</div> <!-- cod phân trang -->
	</div>
	</div> <script type="text/javascript">
            function Get(idname) { if (document.getElementById) { return document.getElementById(idname); } else if (document.all) { return document.all[idname]; } else if (document.layers) { return document.layers[idname]; } else { return null; } } function toggleXPMenu(block) { var CloseImage = "imagesAdmin/closed.gif"; var OpenImage = "imagesAdmin/open.gif"; var divid = block; var img = "img" + block; if (Get(divid).style.display == "") { Get(divid).style.display = "none"; Get(img).src = OpenImage; return false; } else { Get(divid).style.display = ""; Get(img).src = CloseImage; return false; } }
</script> <script type="text/javascript">
    function DeleteConfirm() {

        if (confirm("Bạn có chắc chắn muốn xóa bản ghi này?"))
            return true;
        else
            return false;
    }

    </script>
	</body>
</html>

</body>
</html>