<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%-- <%@ taglib tagdir="/WEB-INF/tags" prefix="ct"%> --%>
<%-- <%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%> --%>
<!-- <sec:authentication var="webUser" property="principal" /> -->
<%-- <c:set var="USER_INFO" value="${webUser.user}" scope="request" /> --%>
<c:set var="ctx" value="${pageContext.request.contextPath}" scope="request" />
