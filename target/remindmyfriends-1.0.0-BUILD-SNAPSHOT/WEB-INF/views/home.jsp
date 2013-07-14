<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Remind My Friends</title>
</head>
<body>
<h1>
	Homepage
</h1>

<P> Welcome to remind with friends.  Connected to the database and read ${userCount}. </P>
<h2>Operations</h2>
<a href="users/">User Management (${userCount} users)</a>


</body>
</html>
