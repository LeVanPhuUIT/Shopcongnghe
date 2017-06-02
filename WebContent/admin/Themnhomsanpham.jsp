<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.NHOMSANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Model.DONGSANPHAM_MOD"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Thêm mới nhóm sản phẩm</title>
<jsp:include page="AdminIndex.jsp"></jsp:include>
<script src="js/jquery.js"></script>
<script src="js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
        $(document).ready(function(){
            $("#frmThem").validate(
            {
                rules:
                    {
                        tennhomsp: {required:true},
                    },
                    messages:
                        {
                            tennhomsp:{required:"Bạn chưa nhập tên nhóm sản phẩm!"},
                        },
                        submitHandler: function(form){
                            if(confirm("Dữ liệu đã hợp lệ. Bạn có muốn lưu lại không?"))
                                {
                                    form.submit();
                                }
                        }
            });
        });
        </script>
<td id="col_right">
	<h2>Thêm mới nhóm sản phẩm</h2>
	<form action="../Nhomsanpham.do" method="post" id="frmThem">
		<table class="TableUpdate" border="1">
			<tbody>
				<%
        	DONGSANPHAM_MOD dongsanpham_mod=new DONGSANPHAM_MOD();
        	NHOMSANPHAM_MOD nhomsanpham_mod=new NHOMSANPHAM_MOD();
        	ResultSet dsDSP=null;
        	dsDSP=dongsanpham_mod.DanhsachdongSanpham();
        	String manhomsp=request.getParameter("manhomsp");
        %>
				<tr>
					<td class="Control" colspan="2">
						<ul>
						</ul>
					</td>
				</tr>
				<tr>
					<th>Mã nhóm sản phẩm:</th>
					<td><input class="text" type="text" id="manhomsp"
						name="manhomsp" value="<%=nhomsanpham_mod.TaomaNhomSP() %>"
						readonly="readonly"></td>
				</tr>
				<tr>
					<th>Dòng sản phẩm:</th>
					<td><select id="madongsp" name="madongsp">
							<%
                    	
                    	if(dsDSP!=null)
                    	{
                    		while(dsDSP.next())
                    		{
                    			String madongsp=dsDSP.getString("MADONGSP");
                    			String tendongsp=dsDSP.getString("TENDONGSP");
                    	
                    %>

							<option value="<%=madongsp%>"><%=tendongsp %></option>
							<%
                    		}
                    	}
                   %>
					</select></td>
				</tr>
				<tr>
					<th>Tên nhóm sản phẩm:</th>
					<td><input class="text" type="text" id="tennhomsp"
						name="tennhomsp" value=""> </select></td>
				</tr>
				<tr>

					<th>Ghi chú:</th>
					<td><input class="text" type="text" id="ghichunhomsp"
						name="ghichunhomsp" value=""></td>
				</tr>
				<td class="Control" colspan="3">
					<ul>
						<li><input type="submit" name="them" value="Thêm mới"
							class="uupdate"></li>
						<li><input type="reset" name="lamlai" value="Làm lại"
							class="vrefresh"></li>

						<li><a class="uback" href="Quanlynhomsanpham.jsp">Quay
								lại</a></li>
						<input type="hidden" name="key" value="them">
					</ul>
				</td>
				</tr>
			</tbody>
		</table>
	</form> <script type="text/javascript">
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