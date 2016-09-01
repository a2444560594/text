<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
<title>用户</title>
</head>
<body class="userMgr" style="width:1024; min-width: 1024px; padding-left: 20px;">
	<div class="add">
		<label class="font-bold">用户新增(user/add)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>username:</td><td><input type="text" class="add-name"/></td></tr>
						<tr><td>password:</td><td><input type="text" class="add-password"/></td></tr>
						<tr><td><input type="button" class="add-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="add-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="edit">
		<label class="font-bold">用户编辑(user/edit)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="edit-userId"/></td></tr>
						<tr><td>username</td><td><input type="text" class="edit-username"/></td></tr>
						<tr><td>password:</td><td><input type="text" class="edit-password"/></td></tr>
						<tr><td><input type="button" class="edit-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="edit-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="delete">
		<label class="font-bold">用户删除(user/delete)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userIds:</td><td><input type="text" class="delete-userIds"/></td></tr>
						<tr><td><input type="button" class="delete-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="delete-textarea" style="width: 400px; height: 150px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<div class="list">
		<label class="font-bold">用户列表(user/list)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td><input type="button" class="list-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="list-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>

	<div class="detail">
		<label class="font-bold">用户详情(user/detail)</label>
		<table>
			<tr>
				<td class="demo-td1">
					<table>
						<tr><td>userId:</td><td><input type="text" class="detail-userId"/></td></tr>
						<tr><td><input type="button" class="detail-btn" value="confirm"/></td></tr>
					</table>
				</td>
				<td>
					<textarea class="detail-textarea" style="width: 400px; height: 300px;"></textarea>
				</td>
			</tr>
		</table>
	</div>
	<div class="divide"></div>
	
	<script type="text/javascript">
		;(function($) {
			var $apply = $(".receiveMgr .apply");
			
			var $add = $(".userMgr .add");
			$add.on("click", ".add-btn", function() {
				$.ajax({
					url: "user/add",
					type: "POST",
					data: {
						name: $add.find(".add-name").val(),
						password: $add.find(".add-password").val(),
					},
					success: function(data) {
						$add.find(".add-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$add.find(".add-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $edit = $(".userMgr .edit");
			$edit.on("click", ".edit-btn", function() {
				$.ajax({
					url: "user/edit",
					type: "POST",
					data: {
						userId: $edit.find(".edit-userId").val(),
						name: $edit.find(".edit-name").val(),
						password: $edit.find(".edit-password").val(),
					},
					success: function(data) {
						$edit.find(".edit-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$edit.find(".edit-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $delete = $(".userMgr .delete");
			$delete.on("click", ".delete-btn", function() {
				$.ajax({
					url: "user/delete",
					type: "POST",
					data: {
						userIds: $delete.find(".delete-userIds").val()
					},
					success: function(data) {
						$delete.find(".delete-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$delete.find(".delete-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $list = $(".userMgr .list");
			$list.on("click", ".list-btn", function() {
				$.ajax({
					url: "user/list",
					type: "POST",
					success: function(data) {
						$list.find(".list-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$list.find(".list-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
			
			var $detail = $(".userMgr .detail");
			$detail.on("click", ".detail-btn", function() {
				$.ajax({
					url: "user/detail",
					type: "POST",
					data: {
						userId: $detail.find(".detail-userId").val()
					},
					success: function(data) {
						$detail.find(".detail-textarea").val(JSON.stringify(data, undefined, 4));
					},
					error: function(err) {
						$detail.find(".detail-textarea").val(JSON.stringify(err.responseJSON, undefined, 4));
					}
				});
			});
		})(jQuery);
	</script>
</body>
</html>
