<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Remind My Friends</title>
	   <style>
      body { background-color: #eee; font: helvetica; }
      #container { width: 500px; background-color: #fff; margin: 30px auto; padding: 30px; border-radius: 5px; box-shadow: 5px; }
      .green { font-weight: bold; color: green; }
      .message { margin-bottom: 10px; }
      label { width:70px; display:inline-block;}
      .hide { display: none; }
      .error { color: red; font-size: 0.8em; }
table.myTable { border-collapse:collapse; }
table.myTable td, table.myTable th { border:1px solid black;padding:5px; }
    </style>
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
