<%@page import="com.liferay.portal.kernel.util.ParamUtil"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />
<%
String detail = ParamUtil.get(renderRequest, "input", "NoValue");
%>
<portlet:actionURL name ="processInput" var="actionVar"></portlet:actionURL>
My NAME is :<b>Stephan Nathanael Mgaya</b> .
<br >
<p>
field was input:<%=detail%>
</p>
<form action="<%= actionVar%>" method="post">


USERNAME:<input type="text" name='<portlet:namespace/>author'>


<input type="submit" name ='<portlet:namespace/>detail' value="submit">
</form>