<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ page import="java.util.ArrayList"  %>
<%@ page import="com.scigaia.test.Job" %>
<portlet:defineObjects />
<h3>Add a new Job</h3>
<portlet:actionURL name="processInput" var="addJobURL"></portlet:actionURL>
<aui:form action="<%=addJobURL%>" method="POST">
	<aui:fieldset label="Job Details">
		<aui:input label="Title" name="title" size="80">
		<aui:validator  name="required"/>  
		</aui:input>
		<aui:input label="Description" name="description" type="textarea" col="80" row="10"></aui:input>
		<aui:select label="type" name="type">
			<aui:option label="Regular" value="regular"></aui:option>
			<aui:option label="Workflow" value="workflow"></aui:option>
			<aui:option label="Parametric" value="parametric"></aui:option>
		</aui:select>
		<aui:field-wrapper label="Scheduled at">
			<liferay-ui:input-date dayParam="scheduledAtDay" dayValue="3" monthParam="scheduledAtMonth" monthValue="5" yearParam="scheduledAtYear" yearRangeEnd="2020" yearRangeStart="2016" yearValue="2016"></liferay-ui:input-date>	
		
		</aui:field-wrapper>
		<aui:input label="Execution" name="executable" size="80">
		<aui:validator  name="required"/>  
		</aui:input>
		<aui:button type="Submit" value="add"></aui:button>
	</aui:fieldset>

</aui:form>
<br />

<%
ArrayList<Job> joblist = (ArrayList<Job>)portletSession.getAttribute("job-list");
if (joblist == null || joblist.isEmpty()){
 joblist = new ArrayList<Job>();
 
}
%>
<liferay-ui:search-container>
 <liferay-ui:search-container-results
		results="<%= joblist %>"
		total="<%= joblist.size() %>"
	/>

	<liferay-ui:search-container-row
		className="com.scigaia.test.Job"
		modelVar="Job"
	>
	 
		<liferay-ui:search-container-column-text property="type" />

		<liferay-ui:search-container-column-text property="title" />

		<liferay-ui:search-container-column-text property="scheduledAtAsString" />

		<liferay-ui:search-container-column-text property="description" />

		<liferay-ui:search-container-column-text property="executable" />
		
        <liferay-ui:search-container-column-jsp name="actions" path="/html/mymvc/job_actions.jsp" />
		
	</liferay-ui:search-container-row>

	<liferay-ui:search-iterator />
</liferay-ui:search-container>
<br />
