<%@ page import="java.util.Date" %>
<%@page contentType="text/html; utf-8" isELIgnored="false" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="app" value="${pageContext.request.contextPath}"/>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>managerlist</title>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<link rel="stylesheet" href="${app}/statics/boot/css/bootstrap.min.css">
		<%--引入jqgrid中主题css--%>
		<link rel="stylesheet" href="${app}/statics/jqgrid/css/trirand/ui.jqgrid-bootstrap.css">
		<script  src="${app}/statics/boot/js/jquery-3.3.1.min.js"></script>
		<script  src="${app}/statics/boot/js/bootstrap.min.js"></script>
		<%--引入js文件--%>
		<script src="${app}/statics/jqgrid/js/trirand/i18n/grid.locale-cn.js"></script>
		<script src="${app}/statics/jqgrid/js/trirand/jquery.jqGrid.min.js"></script>
		<script type="text/javascript">
			$(function(){
				init();
				//add
				$("#add").click(function(){
                    $("#editForm")[0].reset();
                    $("#mmid").attr("hidden",true);
                    $("#albumInfo").modal('show');
				});

				//edit
				$("#editInfo").click(function(){
				    var serialize = $("#editForm").serialize();
                    var id=$("#id").val();
                    console.log(id+"    "+serialize);
                    $.post("${app}/manager/edit",serialize+"&id="+id,function(){
                        $("#albumInfo").modal('hide');
                        $("#list").trigger("reloadGrid");
					});
				});



			});

			//初始化表格
			function init(){
			    $("#list").jqGrid({
					url:"${app}/manager/findByPage",
                    styleUI:'Bootstrap',
                    viewrecords:true,
                    datatype:"json",
                    autowidth:true,
                    rowNum:3,
                    pager:"#pager",
                    cache:false,
                    colNames:["ID","Name","age","bir","sex","Option"],
                    colModel:[
                        {name:"id"},
                        {name:"name"},
                        {name:"age"},
                        {name:"birthday"},
                        {name:"sex"},
                        {
                            name:"options",search:false,
                            formatter:function(value,option,row){
                                var content = "<a href='#'><span onclick='update(this)' id="+row.id+" class='glyphicon glyphicon-pencil'></span></a>" +"&nbsp;&nbsp;&nbsp;"+
                                    "<a href='#'><span onclick='del(this)' id="+row.id+" class='glyphicon glyphicon-remove'></span></a>";
                                return content;
                            }
                        }
                    ]
                }).jqGrid("navGrid","#pager",{refresh:false,search:false,edit:false,add:false,del:false});
            }
            function del(e){
				var attr = $(e).attr("id");
				$.post("${app}/manager/del","id="+attr,function(){
                    $("#list").trigger("reloadGrid");
				});
			}

			function update(e){
                var id = $(e).attr("id");
			    $.post("${app}/manager/findById","id="+id,function(result){
                    $("#id").val(result.id).attr("disabled",true);
			        $("#name").val(result.name);
			        $("#age").val(result.age);
			        $("#birthday").val(result.birthday);

						if(result.sex=="男"){
						    $("#boy").attr("selected","selected");
						}
                    if(result.sex=="女"){
                        $("#girl").attr("selected","selected");
                    }
				});
                $("#mmid").attr("hidden",false);
                $("#albumInfo").modal('show');
			}
		</script>
	</head>
	<body>
	<!--表格-->
	<table id="list" style="text-justify: distribute-all-lines"></table>
	<!--分页-->
	<div id="pager"></div>
	</body>
	<input type="button" value="添加用户" id="add">
	<!--模态框-->
	<div class="modal fade" id="albumInfo" tabindex="-1" role="dialog">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">用户信息</h4>
				</div>
				<div class="modal-body">
					<form  method="post" enctype="multipart/form-data" id="editForm" class="form-horizontal">

						<div id="mmid" class="form-group">
							<label class="control-label col-xs-2">编号</label>
							<div id="mid" class="col-xs-8">
								<input type="text" name="id" id="id" class="form-control">
							</div>
						</div>


						<div  class="form-group">
							<label class="control-label col-xs-2">名称</label>
							<div id="a_name" class="col-xs-8">
								<input type="text" placeholder="请输入用户名" name="name" id="name" class="form-control">
							</div>
						</div>

						<!--id-->
						<div class="form-group">
							<label class="control-label col-xs-2">年龄</label>
							<div class="col-xs-8">
								<input type="text" value="" name="age" id="age" class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-xs-2">生日</label>
							<div class="col-xs-8">
								<input type="text" value="" name="birthday" id="birthday" class="form-control">
							</div>
						</div>

						<div class="form-group">
							<label class="control-label col-xs-2">性别</label>
							<div class="col-xs-8">
								<select name="sex" id="status" class="form-control">
									<option id="boy" value="1">男</option>
									<option value="2" id="girl">女</option>
								</select>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-primary" id="editInfo">保存</button>
							<button type="button" class="btn btn-danger" data-dismiss="modal">取消</button>
						</div>
					</form>
				</div>

			</div>
		</div>
	</div>

</html>
