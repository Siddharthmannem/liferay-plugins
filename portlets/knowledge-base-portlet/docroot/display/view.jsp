<%--
/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>

<%@ include file="/display/init.jsp" %>

<%
KBArticle kbArticle = (KBArticle)request.getAttribute(WebKeys.KNOWLEDGE_BASE_KB_ARTICLE);

KBNavigationDisplayContext kbNavigationDisplayContext = new KBNavigationDisplayContext(renderRequest, portalPreferences, portletPreferences, kbArticle);
%>

<c:choose>
	<c:when test="<%= kbArticle != null %>">
		<div class="row">
			<c:if test="<%= kbNavigationDisplayContext.isShowNavigation() %>">
				<div class="col-md-3">
					<liferay-util:include page="/display/view_navigation.jsp" servletContext="<%= application %>" />
				</div>
			</c:if>

			<div class='<%= kbNavigationDisplayContext.isShowNavigation() ? "col-md-9" : "col-md-12" %>'>
				<liferay-util:include page="/display/view_article.jsp" servletContext="<%= application %>" />
			</div>
		</div>
	</c:when>
	<c:otherwise>

		<%
		renderRequest.setAttribute(WebKeys.PORTLET_CONFIGURATOR_VISIBILITY, Boolean.TRUE);
		%>

		<div class="alert alert-info portlet-configuration">
			<aui:a href="<%= portletDisplay.getURLConfiguration() %>" label="please-configure-this-portlet-to-make-it-visible-to-all-users" onClick="<%= portletDisplay.getURLConfigurationJS() %>" />
		</div>
	</c:otherwise>
</c:choose>