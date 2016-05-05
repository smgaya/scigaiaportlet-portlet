<%@page import="com.liferay.portal.kernel.util.WebKeys"%>
<%@page import="com.liferay.portal.kernel.dao.search.ResultRow" %>
<%@taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@taglib uri="http://java.sun.com/portlet" prefix="portlet" %>


<portlet:defineObjects /> 
<%
ResulRow row = (ResultRow)request.getAttribute(WebKeys.SEARCH_CONTAINER_RESULT_ROW);
Job job = (Job)row.getObject();
int jobid =Job.getid();
%>
<portlet:actionURL name="deleteJob" var="deleteJobURL">
	<portlet:param name="jobid" value="3"/>
</portlet:actionURL>

<liferay-ui:icon-menu>
	<liferay-ui:icon image="edit" message="edit"></liferay-ui:icon>
	<liferay-ui:icon-delete action="<%=deleteJobURL.toString()%>">
	</liferay-ui:icon-delete>
</liferay-ui:icon-menu>

