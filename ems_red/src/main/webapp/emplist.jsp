<%@page isELIgnored="false" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="app" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns:th="http://www.thymeleaf.org">
	<head>
		<title>emplist</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="${app}/css/style.css" />
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
							<a href="#">main</a>
						</h1>
					</div>
					<div id="navigation">
					</div>
				</div>
				<div id="content">
					<p id="whereami">
					</p>
					<h1>
						Welcome  !
					</h1>
					<table class="table">
						<tr class="table_header">
							<td>
								ID
							</td>
							<td>
								Name
							</td>
							<td>
								Salary
							</td>
							<td>
								Age
							</td>
							<td>
								Bir
							</td>

							<td>
								Operation
							</td>
						</tr>

						<c:forEach var="emp" items="${emps}">
							<tr class="row1">
								<td>
									${emp.id}
								</td>
								<td>
										${emp.name}
								</td>
								<td>
										${emp.salary}
								</td>
								<td>
										${emp.age}
								</td>
								<td>
										<fmt:formatDate value="${emp.birthday}" />

								</td>
								<td>
								<%--	<a href="emplist.jsp">delete emp</a>&nbsp;<a href="updateEmp.jsp">update emp</a>--%>
									<a href="${app}/emps/deleteById?id=${emp.id}">delete emp</a>&nbsp;<a href="${app}/emps/findById?id=${emp.id}">update emp</a>
								</td>
							</tr>
						</c:forEach>
					<%--	<tr th:class="${empState.odd ? 'row2':'row1'}" th:each="emp,empState:${emps}">
							<td th:text="${emp.id}"/>
							<td th:text="${emp.name}"/>
							<td th:text="${emp.salary}"/>
							<td th:text="${emp.age}"/>
							<td th:text="${#calendars.format(emp.bir,'yyyy-MM-dd')}"/>
							<td th:text="${emp.sex ? '男':'女' }"/>
							<td>
								<a th:href="@{/emp/delete(id=${emp.id})}">delete emp</a>&nbsp;
								<a th:href="@{/emp/findOne(id=${emp.id})}">update emp</a>
							</td>
						</tr>--%>

					</table>
					<p>
						<%--<a th:href="@{/emp/addEmp}">添加员工信息</a>--%>
						<a href="${app}/addEmp.jsp">添加员工信息</a>
					</p>
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
