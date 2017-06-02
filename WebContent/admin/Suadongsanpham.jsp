<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.DONGSANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Sửa dòng sản phẩm</title>


<jsp:include page="AdminIndex.jsp"></jsp:include>
<script src="js/jquery.js"></script>
<script src="js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
        $(document).ready(function(){
            $("#frmSua").validate(
            {
                rules:
                    {
                        tendongsp: {required:true},
                    },
                    messages:
                        {
                            tendongsp:{required:"Bạn chưa nhập tên dòng sản phẩm!"},
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
	<h2>Sửa dòng sản phẩm</h2>
	<form action="../Dongsanpham.do" method="post" id="frmSua">
		<table class="TableUpdate" border="1">
			<tbody>
				<tr>
					<td class="Control" colspan="2">
						<ul>
						</ul>
					</td>
				</tr>
				<tr>
					<th>Mã dòng sản phẩm:</th>
					<td>
						<%
                	String madongsp=request.getParameter("madongsp");
                	String tendongsp="";
                	String ghichu="";
                	ResultSet rs=null;
                	DONGSANPHAM_MOD dongsanpham_mod=new DONGSANPHAM_MOD();
                	rs=dongsanpham_mod.ThongtinDongsanphamMadongsp(madongsp);
                	if(rs.next())
                	{
                		tendongsp=rs.getString("TENDONGSP");
                		ghichu=rs.getString("GHICHU");
                	}
                %> <input class="text" type="text" id="madongsp"
						name="madongsp" value="<%=madongsp %>" readonly="readonly">
					</td>
				</tr>
				<tr>
					<th>Tên dòng sản phẩm:</th>
					<td><input class="text" type="text" id="tendongsp"
						name="tendongsp" value="<%=tendongsp%>"></td>
				</tr>
				<tr>
					<th>Ghi chú:</th>
					<td><input class="text" type="text" id="ghichudongsp"
						name="ghichudongsp"
						value="<% if(ghichu!=null){ out.print(ghichu);}%>"></td>
				</tr>
				<td class="Control" colspan="3">
					<ul>
						<li><input type="submit" name="sua" value="Lưu lại"
							class="uupdate"></li>
						<li><input type="reset" name="lamlai" value="Làm lại"
							class="vrefresh"></li>

						<li><a class="uback" href="Quanlydongsanpham.jsp">Quay
								lại</a></li>
						<input type="hidden" name="key" value="sua">
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