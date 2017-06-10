<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="../css/common.css" type="text/css" />
<title>后台管理系统</title>

<script language="javascript">
        function showtime() {
            var ary = new Array(
						"星期日",
						"星期一",
						"星期二",
						"星期三",
						"星期四",
						"星期五",
						"星期六");
            time = new Date();
            syear = time.getYear();
            var years=parseInt(syear);
            if(years<200){
               years+=1900;
            }
            smonth = time.getMonth() + 1;
            sday = time.getDate();
            sweek = time.getDay();
            h = time.getHours();
            m = time.getMinutes();
            s = time.getSeconds();
            var sminute;
            if (m < 10)
                sminute = "0" + m;
            else
                sminute = m;
            
            document.getElementById("tip").innerHTML = " " + years + "年" + smonth + "月" + sday + "日 " + ary[sweek] + " " + h + ":" + sminute;
            setTimeout("showtime()", 1000);
        }
        
        function  logout(){
          window.parent.location="../login.jsp";
        }
    </script>

</head>
<body onload="showtime()">
	<form id="form1">
		<div class="header_content">
			<div class="logo"></div>
			<div class="right_nav">
				<div class="text_left">
					<ul class="nav_list">
						<li><img src="../images/direct.gif" width="8" height="21" /> <span
							style="font-size: 18px">在线考试管理系统</span></li>
					</ul>
				</div>
				<div class="text_right">
					<ul class="nav_return">
						<li><span id="tip"></span></li>
						<li>[ <a href="javascript:logout();">注销</a>]
						</li>
						<li>[ <a href="javascript:logout();">退出系统</a>]
						</li>
					</ul>
				</div>
			</div>
		</div>
	</form>
</body>
</html>
