<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>JSTL fmt:bundle Tag</title>
</head>
<body>

<fmt:setLocale value="de"/>
<fmt:bundle basename="languageFiles.Pop">
    <fmt:message key="Name"/><br/>
    <fmt:message key="Address"/><br/>
    <fmt:message key="Number"/><br/>
</fmt:bundle>
</body>
</html>