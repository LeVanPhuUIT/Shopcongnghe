<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="Model.NHOMSANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="content-type" content="text/html;charset=UTF-8" />
<title>Thêm mới sản phẩm</title>

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
                        masp: {required:true},
                        tensp: {required:true},
                        giasp: {required:true, digits:true, minlength:4},
                        hinhanh: {required:true},
                        xuatxusp: {required:true},
                        soluong: {required:true, digits:true},
                        motasp: {required: true},
                        donvitinhsp: {required:true},
                    },
                    messages:
                        {
                            tensp:{required:"Bạn chưa nhập tên sản phẩm!"},
                            giasp:{required:"Bạn chưa nhập giá tiền!", digits:"Vui lòng nhập đúng giá sản phẩm", minlength:"Giá tiền tối thiểu là 1000"},
                            hinhanh:{required:"Bạn chưa chọn hình sản phẩm!"},
                            macts:{required:"Bạn chưa nhập mã chi tiết sản phẩm!"},
                            xuatxusp:{required:"Bạn chưa nhập xuất xứ sản phẩm!"},
                            soluong:{required:"Bạn chưa nhập số lượng!", digits:"Số lượng phải là kiểu số"},
                            motasp:{required:"Bạn chưa nhập mô tả sản phẩm!"},
                            donvitinhsp:{required:"Bạn chưa nhập đơn vị tính!"},
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
<%
	SANPHAM_MOD sanpham_mod=new SANPHAM_MOD();
	NHOMSANPHAM_MOD nhomsanpham_mod=new NHOMSANPHAM_MOD();
%>
<td id="col_right">
	<h2>Thêm mới sản phẩm</h2>
	<form action="../Sanpham.do" method="post" id="frmThem"
		enctype="multipart/form-data">
		<table class="TableUpdate" border="1">
			<tbody>
				<tr>
					<td class="Control" colspan="2">
						<ul>
						</ul>
					</td>
				</tr>
				<tr>
					<th>Mã sản phẩm:</th>
					<td><input class="text" type="text" id="masp" name="masp"
						value="<% out.print(sanpham_mod.TaomaSanpham()); %>"
						readonly="readonly"></td>
				</tr>
				<tr>
					<th>Nhóm sản phẩm:</th>
					<td><select id="nhomsp" name="nhomsp">
							<% 
                    	ResultSet rs=nhomsanpham_mod.DanhsachNhomSanPham();
                    	while(rs.next())
                    		{
                    			String tennhomsp=rs.getString(3);
                    			String manhomsp=rs.getString(1);
                    			%>
							<option value="<%=manhomsp %>"><%=tennhomsp%></option>
							<%
                    		}
                    %>
					</select></td>
				</tr>
				<tr>
					<th>Tên sản phẩm:</th>
					<td><input class="text" type="text" id="tensp" name="tensp"
						value=""></td>
				</tr>
				<tr>
					<th>Giá:</th>
					<td><input class="text" type="text" id="giasp" name="giasp"
						value=""></td>
				</tr>
				<tr>
					<th>Mô tả:</th>
					<td><textarea type="text" id="motasp" rows="10" cols="50"
							name="motasp" value="" width="256" height="240"></textarea></td>
				</tr>
				<tr>
					<th>Xuất xứ:</th>
					<td><input class="text" type="text" id="xuatxusp"
						name="xuatxusp" value=""></td>
				</tr>
				<tr>
					<th>Đơn vị tính:</th>
					<td><input class="text" type="text" id="donvitinhsp"
						name="donvitinhsp" value=""></td>
				</tr>
				<tr>
					<th>Số lượng:</th>
					<td><input class="text" type="text" id="soluong"
						name="soluong" value=""></td>
				</tr>
				<tr>
					<th>Ảnh:</th>
					<td>
						<!-- chỉnh ảnh  bằng ckpicker--> <input id="SelectImages"
						type="file" name="hinhanh" value="Chọn ảnh" class="bottom">
					</td>
				</tr>
				<tr>
					<td class="Control" colspan="3">
						<ul>
							<li><input type="submit" name="them" value="Thêm mới"
								class="uupdate"></li>
							<li><input type="reset" name="lamlai" value="Làm lại"
								class="vrefresh"></li>

							<li><a class="uback" href="Quanlysanpham.jsp">Quay lại</a></li>
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