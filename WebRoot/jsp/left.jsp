<%@page import="com.yhl.ex.bean.Teacher"%>
<%@page import="com.yhl.ex.bean.Student"%>
<%@page import="com.yhl.ex.bean.Manager"%>

<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="../css/common.css" type="text/css" />

<script type="text/javascript">
	//默认显示第一个
	var preClassName = "left_nav_0";
	function list_sub_detail(Id, item) {
		if (preClassName != "") {
			getObject(preClassName).className = "left_back"
		}
		if (getObject(Id).className == "left_back") {
			getObject(Id).className = "left_back_onclick";
			outlookbar.getbyitem(item);
			preClassName = Id
		}
	}
	function getObject(objectId) {
		if (document.getElementById && document.getElementById(objectId)) {
			return document.getElementById(objectId)
		} else if (document.all && document.all(objectId)) {
			return document.all(objectId)
		} else if (document.layers && document.layers[objectId]) {
			return document.layers[objectId]
		} else {
			return false
		}
	}
	function outlook() {
		this.titlelist = new Array();
		this.itemlist = new Array();
		this.addtitle = addtitle;
		this.additem = additem;
		this.getbytitle = getbytitle;
		this.getbyitem = getbyitem;
		this.getdefaultnav = getdefaultnav
	}
	function theitem(intitle, insort, inkey, inisdefault) {
		this.sortname = insort;
		this.key = inkey;
		this.title = intitle;
		this.isdefault = inisdefault
	}
	function addtitle(intitle, sortname, inisdefault) {
		outlookbar.itemlist[outlookbar.titlelist.length] = new Array();
		outlookbar.titlelist[outlookbar.titlelist.length] = new theitem(
				intitle, sortname, 0, inisdefault);
		return (outlookbar.titlelist.length - 1)
	}
	function additem(intitle, parentid, inkey) {
		if (parentid >= 0 && parentid <= outlookbar.titlelist.length) {
			insort = "item_" + parentid;
			outlookbar.itemlist[parentid][outlookbar.itemlist[parentid].length] = new theitem(
					intitle, insort, inkey, 0);
			return (outlookbar.itemlist[parentid].length - 1)
		} else
			additem = -1
	}
	function getdefaultnav(sortname) {
		var output = "";
		var i = 0;
		if (outlookbar.titlelist[i].isdefault == 1
				&& outlookbar.titlelist[i].sortname == sortname) {
			output += "<div class=list_tilte id=sub_sort_" + i
					+ " onclick=\"hideorshow('sub_detail_" + i + "')\">";
			output += "<span>" + outlookbar.titlelist[i].title + "</span>";
			output += "</div>";
			output += "<div class=list_detail id=sub_detail_" + i + "><ul>";
			for (j = 0; j < outlookbar.itemlist[i].length; j++) {
				output += "<li id=" + outlookbar.itemlist[i][j].sortname + j
						+ " onclick=\"changeframe('"
						+ outlookbar.itemlist[i][j].title + "', '"
						+ outlookbar.titlelist[i].title + "', '"
						+ outlookbar.itemlist[i][j].key + "')\"><a href=#>"
						+ outlookbar.itemlist[i][j].title + "</a></li>"
			}
			output += "</ul></div>"
		}
		getObject('right_main_nav').innerHTML = output
	}
	function getbytitle(sortname) {
		var output = "<ul>";
		for (i = 0; i < outlookbar.titlelist.length; i++) {
			if (outlookbar.titlelist[i].sortname == sortname) {
				var classname = "left_back" + (i == 0 ? "_onclick" : "");
				output += "<li id=left_nav_" + i
						+ " onclick=\"list_sub_detail(id, '"
						+ outlookbar.titlelist[i].title + "')\" class="
						+ classname + ">" + outlookbar.titlelist[i].title
						+ "</li>"
			}
		}
		output += "</ul>";
		getObject('left_main_nav').innerHTML = output
	}
	function getbyitem(item) {
		var output = "";
		for (i = 0; i < outlookbar.titlelist.length; i++) {
			if (outlookbar.titlelist[i].title == item) {
				output = "<div class=list_tilte id=sub_sort_" + i
						+ " onclick=\"hideorshow('sub_detail_" + i + "')\">";
				output += "<span>" + outlookbar.titlelist[i].title + "</span>";
				output += "</div>";
				output += "<div class=list_detail id=sub_detail_" + i + " style='display:block;'><ul>";
				for (j = 0; j < outlookbar.itemlist[i].length; j++) {
					output += "<li id=" + outlookbar.itemlist[i][j].sortname
							+ "_" + j + " onclick=\"changeframe('"
							+ outlookbar.itemlist[i][j].title + "', '"
							+ outlookbar.titlelist[i].title + "', '"
							+ outlookbar.itemlist[i][j].key + "')\"><a href=#>"
							+ outlookbar.itemlist[i][j].title + "</a></li>"
				}
				output += "</ul></div>"
			}
		}
		getObject('right_main_nav').innerHTML = output
	}
	function changeframe(item, sortname, src) {
		if (item != "" && sortname != "") {
			window.top.frames['mainFrame'].getObject('show_text').innerHTML = sortname
					+ "  <img src=../images/slide.gif broder=0 />  " + item
		}
		if (src != "") {
			window.top.frames['manFrame'].location = src
		}
	}
	function hideorshow(divid) {
		subsortid = "sub_sort_" + divid.substring(11);
		if (getObject(divid).style.display == "none") {
			getObject(divid).style.display = "block";
			getObject(subsortid).className = "list_tilte"
		} else {
			getObject(divid).style.display = "none";
			getObject(subsortid).className = "list_tilte_onclick"
		}
	}
	function initinav(sortname) {
		outlookbar.getdefaultnav(sortname);
		outlookbar.getbytitle(sortname);
	}
	var outlookbar = new outlook();
	var t;
<%int role = (Integer) session.getAttribute("role");
			System.out.println(role);
			if (role == 1){%>
	t = outlookbar.addtitle('基本功能', '后台管理', 1);
	outlookbar.additem('在线考试', t, '');
	outlookbar.additem('查看成绩', t, '');
	t = outlookbar.addtitle('基本设置', '后台管理', 2);
	outlookbar.additem('个人信息', t, '');
	outlookbar.additem('修改密码', t, '');
<%}else if(role == 2){%>
	t = outlookbar.addtitle('后台功能', '后台管理', 1);
	outlookbar.additem('学生信息管理', t, '');
	outlookbar.additem('题库管理', t, '../questionManage?cmd=questions');
	outlookbar.additem('试卷管理', t, '');
	outlookbar.additem('成绩管理', t, '');
	t = outlookbar.addtitle('基本设置', '信息管理', 2);
	outlookbar.additem('个人信息', t, '');
<%}else{%>
	t = outlookbar.addtitle('后台功能', '后台管理', 1);
	outlookbar.additem('教师信息管理', t, '');
	outlookbar.additem('班级信息管理', t, '');
	outlookbar.additem('学生信息管理', t, '');
	outlookbar.additem('题库管理', t, '../questionManage?cmd=questions');
	outlookbar.additem('试卷管理', t, '');
	outlookbar.additem('成绩管理', t, '');
	t = outlookbar.addtitle('基本设置', '后台管理', 2);
	outlookbar.additem('专业设置', t, '');
	outlookbar.additem('科目管理', t, '');
<%}%>
	
</script>

</head>
<body onload="initinav('后台管理');">
	<div id="left_content">
		<div id="user_info">
		欢迎您，
		<%
			Manager manager = new Manager();
			Teacher teacher = new Teacher();
			Student student = new Student();
			if (role == 1) {
				student = (Student) session.getAttribute("person");
				out.println(student.getsName());
			} else if (role == 2) {
				teacher = (Teacher) session.getAttribute("person");
				out.println(teacher.gettName());
			} else {
				manager = (Manager) session.getAttribute("person");
				out.println(manager.getmName());
			}
		%>
			
		</div>
		<div id="main_nav">
			<div id="left_main_nav"></div>
			<div id="right_main_nav"></div>
		</div>
	</div>
</body>
</html>