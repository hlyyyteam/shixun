<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html>
<head>
	<title>字典管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">

	</script>
</head>
<body>
	<ul class="nav nav-tabs">
		<li class="active"><a href="${ctx}/sys/dict/">字典列表</a></li>
		<li><a href="${ctx}/sys/dict/form?sort=10">字典添加</a></li>
	</ul>
	
	<sys:message content="${message}"/>
	
	
	
	<sys:treeselect id="area" name="parent.id" value="${area.parent.id}" labelName="parent.name" labelValue="${area.parent.name}"
					title="区域" url="/demo/treeData" extId="${area.id}" cssClass="" allowClear="true"/>
	
</body>
</html>