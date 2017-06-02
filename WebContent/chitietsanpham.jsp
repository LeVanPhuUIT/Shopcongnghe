<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<%@ page import='Model.KHUYENMAI_MOD'%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<jsp:include page="header.jsp"></jsp:include>
<!-- <script src="js/jquery-3.1.1.min.js" type="text/javascript"></script>
<script src="js/jquery.validate.js" type="text/javascript"></script>
<script type="text/javascript">
        $(document).ready(function(){
            $("#frthemvaogiohang").validate(
            {
                rules:
                    {
                		Soluong: {
                        	required:true,
                        },
                    },
                    messages:
                        {
                    		Soluong:{required:"Bạn chưa nhập tên!"},
                    		
                        },
                        submitHandler: function(form){
                        	form.submit();
                            /* if(confirm("Dữ liệu đã hợp lệ. Bạn có muốn lưu lại không?"))
                                {
                                	form.submit();
                               	} */
                        }
            });
        });
</script> -->
<div id="breadcrumb_background"></div>
<div id="body-wrapper">
	<div id="outer-wrapper">
		<div id="wrap2">
			<div id="content-wrapper">
				<!-- Main wapper [start] -->
				<div id="main-wrapper">
					<div class="main section" id="main">
						<div class="widget Blog" id="Blog1">
							<div class="blog-posts hfeed">
								<div class="date-outer">
									<div class="date-posts">
										<div class="post-outer">
											<div class="wrapfullpost">
												<div class="post hentry">
													<ul id="breadcrumbs-mbl">
														<%
															String masp=request.getParameter("masp");
															SANPHAM_MOD sanpham_mod=new SANPHAM_MOD();
									               			ResultSet ttSp=sanpham_mod.ThongtinSanpham(masp);

													    	String tensp="";
													    	int giasp=0;
													    	String motasp="";
													    	String xuatxu="";
													    	String donvitinh="";
													    	int soluong=0;
													    	String hinhanh="";
										               		if(ttSp.next())
										               		{
										            	        	tensp=ttSp.getString("TENSP");
										            	        	giasp=ttSp.getInt("GIASP");
										            	        	motasp=ttSp.getString("MOTASP");
										            	        	xuatxu=ttSp.getString("XUATXU");
										            	        	donvitinh=ttSp.getString("DONVITINH");
										            	        	soluong=ttSp.getInt("SOLUONG");
										            	        	hinhanh=ttSp.getString("HINHANH");
										               		}
														%>
														<li><a href="index.jsp"><img
																src="Images/icon-home.png" style="vertical-align: -1px;"></a></li>
														<div class="seperator">
															<img src="Images/icon-arrow.png"
																style="vertical-align: 1px;">
														</div>
														<li><a href="chitietsanpham.jsp?masp=<%=masp%>"
															class="current"><%=tensp %></a></li>
													</ul>
													<div style="clear: both;"></div>
													<div class="proc-rela">
														<div class="new_products">
															<div class="post-body entry-content"
																style="width: 394px; height: 500px; overflow: visible;">
																<div class="separator"
																	style="clear: both; text-align: center;">

																	<img class="cloudzoom" src="hinhanh/<%=hinhanh %>"
																		data-cloudzoom="zoomImage: 'hinhanh/<%=hinhanh %>'" />


																</div>
																<br>
																<div style="clear: both;"></div>
															</div>

															<div class="product-info">
																<h1 class="product-title"
																	style="font-size: 20px; color: #00aaf1"><%=tensp %></h1>

																<p><%=motasp %></p>
																<hr
																	style="border: 0.5px solid #20C8EC; margin: 20px 0px;"></hr>
																<div class="list-price">
																	Giá gốc: <fmt:formatNumber value="<%=giasp %>" minFractionDigits="0"/>
																	<sup>vnđ</sup>
																</div>
																<%
																KHUYENMAI_MOD khuyenmai=new KHUYENMAI_MOD();
																int giakm=khuyenmai.LaygiaKhuyenmai(masp);
																if(giakm!=0)
																{
															%>
																<div class="sell-price">
																	Khuyến mãi :<fmt:formatNumber value="<%=giakm %>" minFractionDigits="0"/>
																	<sup>vnđ</sup>
																</div>
																<%
																}
															%>
																<hr
																	style="border: 0.5px solid #20C8EC; margin: 20px 0px;"></hr>
																<h1 class="product-title"
																	style="font-size: 20px; color: #00aaf1; margin-top: 35px;">Chọn
																	số lượng</h1>
																<form action="Giohang.do" method="post" id="frthemvaogiohang">
																	<input type="number" name="Soluong" id="Soluong" value="1" min="1"
																		required="required" max="<%= soluong%>" class="input-review" style="width: 130px; align: center;">

																	<input type="hidden" name="masp" value="<%=masp %>">
																	<input type="hidden" name="tensp" value="<%=tensp %>">
																	<input type="hidden" name="giasp"
																		value="<% if(giakm!=0){out.print(giakm);}else{out.print(giasp);} %>">
																	<%if(soluong<=0)
															{
																%>
																	<input type="button" class="hethang" value="">
																	<% 
															}
															else{
																%>
																	<input type="submit" class="muangay" value="">
																	<% 
															}
																
																%>

																</form>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div style="clear: both;"></div>

				<h1 class="product-title"
					style="font-size: 20px; color: #00aaf1; margin-top: 35px;">Sản Phẩm Cùng Loại</h1>
				<div class="proc-rela">
					<div class="new_products">
						<%
			               		SANPHAM_MOD sanphamcungnhom=new SANPHAM_MOD();
			               		ResultSet dsSpcungloai=sanphamcungnhom.DanhsachSanphamcungNhom(masp);
			               		if(dsSpcungloai!=null)
			               		{
			               			while(dsSpcungloai.next())
			               			{
			               				String masp1=dsSpcungloai.getString("MASP");
			               				String tensp1=dsSpcungloai.getString("TENSP");
			               				String hinhanh1=dsSpcungloai.getString("HINHANH");
			               				int giasp1=dsSpcungloai.getInt("GIASP");
			               %>

						<div class="new_prod_box" style="padding: 10px 6px 35px;">
							<div class="related_prod_bg">
								<div class="related_prod_img">
									<a href="chitietsanpham.jsp?masp=<%=masp1%>"><img
										src="hinhanh/<%=hinhanh1 %>" width="190" class="thumb"></a>
									<a href="chitietsanpham.jsp?masp=<%=masp1%>"
										style="font-size: 14px; padding: 5px 0px 2px;"><%=tensp1 %></a>
									<a style="color: red; font-size: 14px; padding: 0px"
										href="chitietsanpham.jsp?masp=<%=masp1%>"><fmt:formatNumber value="<%=giasp1 %>" minFractionDigits="0"/>đ</a>
								</div>


							</div>

						</div>

						<%
		               			}
		               		}
		                %>
					</div>
				</div>
				<div style="clear: both;"></div>
				<h1 class="product-title"
					style="font-size: 20px; color: #00aaf1; margin-top: 35px;">Chi tiết sản phẩm</h1>
				<div class="proc-rela">
					<div class="feat_prod_box_details">
						<table class="detail_table">
							<tr>
								<td class="left"><strong>Mã sản phẩm</strong></td>
								<td class="right"><%=masp %></td>

							</tr>
							<tr>
								<td class="left"><strong>Tên sản phẩm</strong></td>
								<td class="right"><%=tensp %></td>
							</tr>
							<tr>
								<td class="left"><strong>Giá Sản phẩm</strong></td>
								<td class="right"><fmt:formatNumber value="<%=giasp %>" minFractionDigits="0"/>đ</td>
							</tr>

							<tr>
								<td class="left"><strong>Xuất xứ</strong></td>
								<td class="right"><%=xuatxu %></td>
							</tr>

							<tr>
								<td class="left1"><strong>Số lượng còn lại </strong></td>
								<td class="right1" style="color: red"><%=soluong %></td>
							</tr>
						</table>

					</div>

				</div>
				<div style="clear: both;"></div>
				<h1 class="product-title"
					style="font-size: 20px; color: #00aaf1; margin-top: 35px;">Gửi nhận xét của bạn</h1>
				<div class="proc-rela">
					<form action="Danhgia.do" onsubmit="return Kiemtra()" method="post">
						<ul>
							<li><label> <span style="font-size: 15px;color="red"><strong>
											<% if(request.getAttribute("msg")!=null){ out.print(request.getAttribute("msg"));} %>
									</strong></span></label> <br> <input type="hidden" name="masp" value="<%=masp %>">
							</li>
							<li><label> <span style="font-size: 15px;"><strong>1.Tiêu
											đề nhận xét:</strong></span></label> <br> <input tabindex="1" name="tieude"
								id="tieude" class="input-review" value="" type="text"></input></li>

							<li><label> <span style="font-size: 15px;"><strong>2.Viết
											nhận xét của bạn vào bên dưới:</strong></span></label> <br> <textarea
									tabindex="2" class="text-area-review" name="noidung"
									id="noidung"
									placeholder="Nhập nội dung nhận xét tại đây. Tối thiểu 100 từ, tối đa 2000 từ"></textarea>
								<div
									style="text-align: right; margin: 10px 0; font-weight: bold;">
									<div style="float: right; padding-right: 412px">
										<button tabindex="3" type="submit" class="button-review">
											<span>Gửi nhận xét</span>
										</button>
									</div>
								</div></li>
						</ul>
					</form>
				</div>
				<div style="clear: both;"></div>
				<h1 class="product-title"
					style="font-size: 20px; color: #00aaf1; margin-top: 35px;">Thảo luận</h1>
				<div class="proc-rela" style="padding-bottom: 35px;">

					<div class="fb-comments"
						data-href="chitietsanpham.jsp?masp=<%=masp%>" data-width="960"
						data-numposts="5" data-colorscheme="light"></div>

				</div>

			</div>
		</div>
	</div>

	<jsp:include page="footer.jsp"></jsp:include>
	<script>(function (d, s, id) {
                                var js, fjs = d.getElementsByTagName(s)[0];
                                if (d.getElementById(id)) return;
                                js = d.createElement(s); js.id = id;
                                js.src = "//connect.facebook.net/vi_VN/all.js#xfbml=1";
                                fjs.parentNode.insertBefore(js, fjs);
                                }(document, 'script', 'facebook-jssdk'));

    </script>
	<script type="text/javascript">
	function Kiemtra()
	{
		var tieude=document.getElementById("tieude").value;
		var noidung=document.getElementById("noidung").value
		if(tieude=="")
		{
			alert("Lỗi ! Chưa nhập tiêu đề");
			document.getElementById("tieude").focus();
			return false;
		}
		if(noidung=="")
		{
			alert("Lỗi ! Chưa nhập nội dung");
			document.getElementById("tieude").focus();
			return false;
		}
		return true;
	}
</script>