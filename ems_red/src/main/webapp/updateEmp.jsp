<%@page isELIgnored="false" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
	<head>
		<title>update Emp</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${app}/css/style.css" />
		<script type="text/javascript" src="${app}/js/jquery-3.3.1.min.js"></script>
		<script type="text/javascript">
		/*	$(function(){
			   $("#btn").click(function(){
			       var serialize = $("form").serialize();
			       $.post("${app}/emps/update",serialize,function(){
			          window.location.href="${app}/emps/findAllEmps"
				   });
				});
			});*/
		</script>
	</head>

	<body>
		<div id="wrap">
			<div id="top_content">
					<div id="header">
						<div id="rightheader">
							<p>
								2009/11/20
								<br />
							</p>
						</div>
						<div id="topheader">
							<h1 id="title">
								<a href="#">Main</a>
							</h1>
						</div>
						<div id="navigation">
						</div>
					</div>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
						update Emp info:
					</h1>
					<form action="${app}/emps/update" method="post">
						<table cellpadding="0" cellspacing="0" border="0"
							class="form_table">
							<tr>
								<td valign="middle" align="right">
									id:
								</td>
								<td valign="middle" align="left" >
									<%--<input th:value="${emps.id}" name="id" readonly />--%>
									<input value="${emps.id}" name="id" readonly />
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									name:
								</td>
								<td valign="middle" align="left">
									<%--<input type="text" class="inputgri" name="name" th:value="${emps.name}"/>--%>
									<input type="text" class="inputgri" name="name" value="${emps.name}"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									salary:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="salary" value="${emps.salary}"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									age:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="age" value="${emps.age}"/>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="right">
									bir:
								</td>
								<td valign="middle" align="left">
									<input type="text" class="inputgri" name="birthday" value="<fmt:formatDate value='${emps.birthday}'/>"/>
									<%--<input type="text" class="inputgri" name="bir" th:value="${#calendars.format(emps.bir,'yyyy/MM/dd')}"/>--%>
								</td>
							</tr>
						<%--	<tr>
								<td valign="middle" align="right">
									sex:
								</td>
								<td valign="middle" align="left">
									<select name="sex">
										<option th:value="true" th:selected="${emp.sex ? true : false}">男</option>
										<option th:value="false" th:selected="${!emp.sex ? true : false}" >女</option>
									</select>
								</td>
							</tr>--%>
						</table>
						<p>
							<input id="btn" type="submit" class="button" value="Confirm" />
						</p>
					</form>
				</div>
			</div>
			<div id="footer">
				<div id="footer_bg">
					ABC@126.com
				</div>
			</div>
		</div>
	</body>
</html>
