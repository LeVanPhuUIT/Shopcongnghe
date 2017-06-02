<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="Model.SANPHAM_MOD"%>
<%@ page import="java.sql.ResultSet"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:include page="header.jsp"></jsp:include>
<style>
	.404{
		text-align: center;
		color: red;
	}
</style>
<!--  slide -->
<!-- <div id='slides-section'>
	<div id='slides' style="height:510px">
	<img src='Images/banner-4.jpg'/>
	<img src='Images/BANNER-POLO-VIET-NAM-1000x350.png'/>
	<img src='Images/banner combo vietnam.jpg'/>
	<img src='Images/s1.png'/>
	<a class='slidesjs-previous slidesjs-navigation' href='#'>PREVIOUS</a>
	<a class='slidesjs-next slidesjs-navigation' href='#'>NEXT</a>
	</div>
	</div> -->
slide
<div id='slides-section'>
	<!-- #region Jssor Slider Begin -->
	<!-- Generator: Jssor Slider Maker -->
	<!-- Source: http://www.jssor.com -->
	<!-- This code works with jquery library. -->
	<script src="/Shopcongnghe/js/jquery-1.11.3.min.js" type="text/javascript"></script>
	<script src="/Shopcongnghe/js/jssor.slider-21.1.6.mini.js" type="text/javascript"></script>
	<script type="text/javascript">
		jQuery(document).ready(function($) {

			var jssor_1_SlideshowTransitions = [ {
				$Duration : 1200,
				$Opacity : 2
			} ];

			var jssor_1_SlideoTransitions = [ [ {
				b : 0,
				d : 1160,
				x : 783,
				y : 3
			} ], [ {
				b : 260,
				d : 780,
				x : -869,
				y : 18
			} ], [ {
				b : 1160,
				d : 840,
				x : 667,
				y : 2
			} ], [ {
				b : 2020,
				d : 760,
				x : -11,
				y : -315
			} ], [ {
				b : 2780,
				d : 520,
				x : -272,
				y : -6
			} ], [ {
				b : 3300,
				d : 640,
				x : -3,
				y : -145
			} ], [ {
				b : 0,
				d : 700,
				x : 307,
				y : -1,
				i : 2
			} ], [ {
				b : 0,
				d : 700,
				x : -851,
				y : -5,
				i : 1
			} ], [ {
				b : 700,
				d : 800,
				x : -827,
				y : -11
			} ], [ {
				b : 1500,
				d : 500,
				x : -10,
				y : -114
			} ], [ {
				b : 2000,
				d : 500,
				x : -9,
				y : 141
			} ], [ {
				b : 2000,
				d : 420,
				x : 14,
				y : -158
			} ], [ {
				b : 2500,
				d : 1100,
				x : -281
			} ], [ {
				b : 0,
				d : 800,
				x : -870,
				y : 3
			} ], [ {
				b : 800,
				d : 500,
				x : 7,
				y : 112
			} ], [ {
				b : 800,
				d : 500,
				x : 103,
				y : -202
			} ], [ {
				b : 1300,
				d : 900,
				x : 12,
				y : -264
			} ], [ {
				b : 2200,
				d : 1000,
				x : -450,
				y : 5
			} ] ];

			var jssor_1_options = {
				$AutoPlay : true,
				$SlideshowOptions : {
					$Class : $JssorSlideshowRunner$,
					$Transitions : jssor_1_SlideshowTransitions,
					$TransitionsOrder : 1
				},
				$CaptionSliderOptions : {
					$Class : $JssorCaptionSlideo$,
					$Transitions : jssor_1_SlideoTransitions
				},
				$ArrowNavigatorOptions : {
					$Class : $JssorArrowNavigator$
				},
				$BulletNavigatorOptions : {
					$Class : $JssorBulletNavigator$
				}
			};

			var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);

			//responsive code begin
			//you can remove responsive code if you don't want the slider scales while window resizing
			function ScaleSlider() {
				var refSize = jssor_1_slider.$Elmt.parentNode.clientWidth;
				if (refSize) {
					refSize = Math.min(refSize, 870);
					jssor_1_slider.$ScaleWidth(refSize);
				} else {
					window.setTimeout(ScaleSlider, 30);
				}
			}
			ScaleSlider();
			$(window).bind("load", ScaleSlider);
			$(window).bind("resize", ScaleSlider);
			$(window).bind("orientationchange", ScaleSlider);
			//responsive code end
		});
	</script>
	<style>
/* jssor slider bullet navigator skin 05 css */
/*
        .jssorb05 div           (normal)
        .jssorb05 div:hover     (normal mouseover)
        .jssorb05 .av           (active)
        .jssorb05 .av:hover     (active mouseover)
        .jssorb05 .dn           (mousedown)
        */
.jssorb05 {
	position: absolute;
}

.jssorb05 div, .jssorb05 div:hover, .jssorb05 .av {
	position: absolute;
	/* size of bullet elment */
	width: 16px;
	height: 16px;
	background: url('/Shopcongnghe/Images/img/b05.png') no-repeat;
	overflow: hidden;
	cursor: pointer;
}

.jssorb05 div {
	background-position: -7px -7px;
}

.jssorb05 div:hover, .jssorb05 .av:hover {
	background-position: -37px -7px;
}

.jssorb05 .av {
	background-position: -67px -7px;
}

.jssorb05 .dn, .jssorb05 .dn:hover {
	background-position: -97px -7px;
}

/* jssor slider arrow navigator skin 12 css */
/*
        .jssora12l                  (normal)
        .jssora12r                  (normal)
        .jssora12l:hover            (normal mouseover)
        .jssora12r:hover            (normal mouseover)
        .jssora12l.jssora12ldn      (mousedown)
        .jssora12r.jssora12rdn      (mousedown)
        */
.jssora12l, .jssora12r {
	display: block;
	position: absolute;
	/* size of arrow element */
	width: 30px;
	height: 46px;
	cursor: pointer;
	background: url('/Shopcongnghe/Images/img/a12.png') no-repeat;
	overflow: hidden;
}

.jssora12l {
	background-position: -16px -37px;
}

.jssora12r {
	background-position: -75px -37px;
}

.jssora12l:hover {
	background-position: -136px -37px;
}

.jssora12r:hover {
	background-position: -195px -37px;
}

.jssora12l.jssora12ldn {
	background-position: -256px -37px;
}

.jssora12r.jssora12rdn {
	background-position: -315px -37px;
}
</style>
	<div id="jssor_1"
		style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 870px; height: 264px; overflow: hidden; visibility: hidden;">
		<!-- Loading Screen -->
		<div data-u="loading" style="position: absolute; top: 0px; left: 0px;">
			<div
				style="filter: alpha(opacity = 70); opacity: 0.7; position: absolute; display: block; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
			<div
				style="position: absolute; display: block; background: url('/Shopcongnghe/Images/img/loading.gif') no-repeat center center; top: 0px; left: 0px; width: 100%; height: 100%;"></div>
		</div>
		<div data-u="slides"
			style="cursor: default; position: relative; top: 0px; left: 0px; width: 870px; height: 264px; overflow: hidden;">

			<div data-p="141.75" style="display: none;">
				<img data-u="image" src="/Shopcongnghe/Images/img/2-bg1.jpg" />
				<div
					style="position: absolute; top: 5px; left: 19px; width: 410px; height: 260px;">
					<img data-u="caption" data-t="6"
						style="position: absolute; top: 3px; left: -304px; width: 220px; height: 243px;"
						src="/Shopcongnghe/Images/img/2-2.png" /> <img data-u="caption" data-t="7"
						style="position: absolute; top: 56px; left: 1084px; width: 145px; height: 190px;"
						src="/Shopcongnghe/Images/img/2-3.png" /> <img data-u="caption" data-t="9"
						style="position: absolute; top: 293px; left: 184px; width: 91px; height: 71px;"
						src="/Shopcongnghe/Images/img/2-4.png" />
				</div>
				<div
					style="position: absolute; top: -5px; left: 422px; width: 440px; height: 280px;">
					<img data-u="caption" data-t="10"
						style="position: absolute; top: -110px; left: 8px; width: 150px; height: 77px;"
						src="/Shopcongnghe/Images/img/2-5.png" /> <img data-u="caption" data-t="11"
						style="position: absolute; top: 285px; left: 38px; width: 130px; height: 32px;"
						src="/Shopcongnghe/Images/img/2-6.png" /> <img data-u="caption" data-t="12"
						style="position: absolute; top: 7px; left: 463px; width: 265px; height: 260px;"
						src="/Shopcongnghe/Images/img/2-1.png" />
				</div>
			</div>
			<a data-u="any" href="#" style="display: none">Simple Fade
				Slideshow</a>
			<div data-p="141.75" style="display: none;">
				<img data-u="image" src="/Shopcongnghe/Images/img/2-bg1.jpg" />
				<div
					style="position: absolute; top: 54px; left: 1px; width: 778px; height: 131px;">
					<img data-u="caption" data-t="0"
						style="position: absolute; top: 0px; left: -783px; width: 778px; height: 131px;"
						src="/Shopcongnghe/Images/img/1-021.png" /> <img data-u="caption" data-t="1"
						style="position: absolute; top: 24px; left: -285px; width: 270px; height: 70px;"
						src="/Shopcongnghe/Images/img/1-031.png" />
				</div>
				<div
					style="position: absolute; top: -50px; left: 2px; width: 350px; height: 380px;">
					<img data-u="caption" data-t="3"
						style="position: absolute; top: 319px; left: 12px; width: 350px; height: 380px;"
						src="/Shopcongnghe/Images/img/1.png" /> <img data-u="caption" data-t="4"
						style="position: absolute; top: 185px; left: 868px; width: 175px; height: 165px;"
						src="/Shopcongnghe/Images/img/1-051.png" /> <img data-u="caption" data-t="5"
						style="position: absolute; top: 404px; left: 393px; width: 151px; height: 41px;"
						src="/Shopcongnghe/Images/img/1-06.png" />
				</div>
			</div>
			<div data-p="141.75" style="display: none;">
				<img data-u="image" src="/Shopcongnghe/Images/img/3-bg1.jpg" />
				<div
					style="position: absolute; top: 2px; left: -2px; width: 310px; height: 260px;">
					<img data-u="caption" data-t="13"
						style="position: absolute; top: -1px; left: 877px; width: 300px; height: 260px;"
						src="/Shopcongnghe/Images/img/3-1.png" />
				</div>
				<div
					style="position: absolute; top: 2px; left: 311px; width: 560px; height: 260px;">
					<img data-u="caption" data-t="14"
						style="position: absolute; top: 290px; left: 6px; width: 171px; height: 36px;"
						src="/Shopcongnghe/Images/img/3-6.png" /> <img data-u="caption" data-t="16"
						style="position: absolute; top: 265px; left: 273px; width: 247px; height: 260px;"
						src="/Shopcongnghe/Images/img/3-2.png" /> <img data-u="caption" data-t="17"
						style="position: absolute; top: 220px; left: 651px; width: 102px; height: 37px;"
						src="/Shopcongnghe/Images/img/3-4.png" />
				</div>
			</div>
		</div>
		<!-- Bullet Navigator -->
		<div data-u="navigator" class="jssorb05"
			style="bottom: 16px; right: 16px;" data-autocenter="1">
			<!-- bullet navigator item prototype -->
			<div data-u="prototype" style="width: 16px; height: 16px;"></div>
		</div>
		<!-- Arrow Navigator -->
		<span data-u="arrowleft" class="jssora12l"
			style="top: 0px; left: 0px; width: 30px; height: 46px;"
			data-autocenter="2"></span> <span data-u="arrowright"
			class="jssora12r"
			style="top: 0px; right: 0px; width: 30px; height: 46px;"
			data-autocenter="2"></span>
	</div>
</div>
<!-- #endregion Jssor Slider End -->

<!--  -->
<!-- <div class='featurehomer section' id='featurehomer1'>
		<div class='widget HTML' id='HTML22'>
			<div class='widget-content'>
				<div class='featureticker-wrap'>
					<div id='featuresticker'>
						<div id='ticker'>
							<ul class='ticker-list'>
								<li>
									<div class='ticker-head1'>
									<marquee onmouseover="this.stop()" onmouseout="this.start()" scrollamount="5" direction="right"  align="center">
											<h4>Chào mừng bạn đến với <strong>Sport Shop</strong>, nơi cung cấp các sản phẩm thể thao chất lượng !</h4>
	  										<h4>Chúc bạn một ngày vui vẻ !</h4></div>
									</marquee>
									
									
								</li>
	
							</ul>
						</div>
	      			</div>
	      		</div>
			</div>
		</div>
	</div> -->
<div id='body-wrapper'>
	<div id='outer-wrapper'>
		<div id='wrap2'>
			<div id='content-wrapper'>
				<div id='main-wrapper' style="margin-top: 25px;">
					
				<div class="404" style="text-align: center; color: red;">
				<h1>Rất tiếc trang bạn vừa truy cập không tồn tại</h1>
					<img alt="404" src="/Shopcongnghe/Images/404.jpg">
				</div>
				

				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="footer.jsp"></jsp:include>