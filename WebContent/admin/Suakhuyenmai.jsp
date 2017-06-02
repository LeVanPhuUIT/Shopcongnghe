<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import="Model.KHUYENMAI_MOD"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Sửa Khuyến mãi</title>



<jsp:include page="AdminIndex.jsp"></jsp:include>
<script src="js/jquery.js"></script>
<script src="js/jquery-1.7.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script src="js/combodate.js"></script>
<script type="text/javascript">
        $(document).ready(function(){
            $("#frmSua").validate(
            {
                rules:
                    {
                        ngaybatdau: {required:true},
                        ngayketthuc: {required:true},
                        giakm:{ required:true},
                    },
                    messages:
                        {
                            ngaybatdau:{required:"Bạn chưa nhập ngày bắt đầu khuyến mãi!"},
                            ngayketthuc:{required:"Bạn chưa nhập ngày kết thúc khuyến mãi!"},
                            giakm:{ required:"Bạn chưa nhập giá khuyến mãi"},
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
	<h2>Sửa Khuyến mãi</h2>
	<form action="../Khuyenmai.do" method="post" id="frmThem">
		<table class="TableUpdate" border="1">
			<tbody>
				<%
        	String makm=request.getParameter("makm");
        	KHUYENMAI_MOD khuyenmai_mod=new KHUYENMAI_MOD();
        	SANPHAM_MOD sanpham_mod=new SANPHAM_MOD();
        	ResultSet dsSp=sanpham_mod.DanhsachSanpham();
        	ResultSet ttKm=khuyenmai_mod.ThongtinKhuyenmaiMakm(makm);
        	String masp="";
        	String ngaybatdau="";
        	String ngayketthuc="";
        	int giakm=0;
        	if(ttKm.next())
        	{
        		masp=ttKm.getString(2);
        		ngaybatdau=ttKm.getString(3);
        		ngayketthuc=ttKm.getString(4);
        		giakm=ttKm.getInt(5);
        	}
        %>
				<tr>
					<td class="Control" colspan="2">
						<ul>
						</ul>
					</td>
				</tr>
				<tr>
					<th>Mã Khuyến mãi:</th>
					<td><input class="text" type="text" id="makm" name="makm"
						value="<%=makm %>" readonly="readonly"></td>
				</tr>
				<tr>
					<th>Tên sản phẩm:</th>
					<td><select id="masp" name="masp">
							<%
                   	if(dsSp!=null)
                   	{
                   		while(dsSp.next())
                   		{
                   			String masp1=dsSp.getString(1);
                   			String tensp=dsSp.getString(3);
                   			if(masp1.equals(masp))
                   			{
                   				%>
							<option selected="selected" value="<%=masp %>"><%=tensp %></option>
							<%
                   			}else
                   			{
			                   	%>
							<option value="<%=masp %>"><%=tensp %></option>
							<%
                   			}
                   		}
                   	}
                   %>
					</select></td>
				</tr>
				<tr>
					<th>Ngày bắt đầu:</th>
					<td><input type=date id="ngaybatdau" name="ngaybatdau"
						value="<%=ngaybatdau%>"></td>
				</tr>
				<tr>

					<th>Ngày kết thúc:</th>
					<td><input type=date id="ngayketthuc" name="ngayketthuc"
						value="<%=ngayketthuc%>"></td>
				</tr>
				<tr>

					<th>Giá Khuyến mãi:</th>
					<td><input class="text" type="text" id="giakm" name="giakm"
						value="<%=giakm%>"></td>
				</tr>
				<td class="Control" colspan="3">
					<ul>
						<li><input type="submit" name="sua" value="Cập nhật"
							class="uupdate"></li>
						<li><input type="reset" name="lamlai" value="Làm lại"
							class="vrefresh"></li>

						<li><a class="uback" href="Quanlykhuyenmai.jsp">Quay lại</a></li>
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