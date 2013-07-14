<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<html>
  <head>
    <title>Users Management</title>
    <script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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

	 <h2>Registered Users</h2>

<table class="myTable" >
    <tr>
        <th>Name</th>
        <th>EmailAddress</th>
        <th>Action</th>
    </tr>
<c:forEach var="user" items="${users}" varStatus="status">
    <tr>
        <c:set var="userFormId" value="user${status.index}"/>
       <c:set var="nameid" value="name${user.id}"/>
       <c:set var="emailid" value="email${user.id}"/>

        <c:url var="deleteUrl" value="/users/${user.id}/delete/"/>
        
        <form id="${userFormId}" action="${deleteUrl}" method="POST">
            <input id="id" name="userId" type="hidden" value="${user.id}"/>
        </form>

    	<td id="${nameid}" >${user.name}</td>
        <td id="${emailid}" >${user.emailAddress}</td> 
      	<td>
            <!--  <a href='<c:out value="${user.id}/"/>'>view-json</a> -->
   			<input type="button" value="View-Json" onclick="window.location=window.location+'${user.id}/';" />
    		<input type="button" value="Edit" onclick="edit(${user.id});" />
    		<input type="button" value="Delete" onclick="javascript:document.forms['${userFormId}'].submit();"/>
         </td>
    </tr>
</c:forEach>
</table>

<BR>
	 <h2>Editor</h2>
    <form id="editPersonForm" method="POST">
      
      <input type="button" value="New" onclick="newUser();"/>
    <br/>
      <label for="idInput">Id: </label>
      <input type="text" name="id" id="idInput"size="5px" />
      <br/>
      
      <label for="nameInput">Name: </label>
      <input type="text" name="name" id="nameInput" size="60px"/>
      <br/>
      
      <label for="email">Email: </label>
      <input type="text" name="emailAddress" id="emailAddressInput" size="60px"/>
      <br/>
      
      <input type="submit" value="Save" /><br/><br/>
      <div id="personFormResponse" class="green"> </div>
    
    </form>

    <script type="text/javascript">
   
    function edit(id){
     	document.getElementById("idInput").value =id; 
     	document.getElementById("nameInput").value =document.getElementById("name"+id).innerText; 
     	document.getElementById("emailAddressInput").value =document.getElementById("email"+id).innerText; 
    }
    function newUser(){
     	document.getElementById("idInput").value =0; 
     	document.getElementById("nameInput").value =""; 
     	document.getElementById("emailAddressInput").value =""; 
    }
    
    $(document).ready(function() {
        
     
        $('#editPersonForm').submit(function(e) {
          // will pass the form date using the jQuery serialize function
         var pathArray = window.location.href.split( '/' );
		 var protocol = pathArray[0];
		 var host = pathArray[2];
		 var baseUrl = protocol + '//' + host;
 
		 var saveUrl = baseUrl + '/remindmyfriends/users/' + document.getElementById("idInput").value + '/';
          var jsonmessage = JSON.stringify($('#editPersonForm').serializeObject());
            $.ajax({
              		type: 'POST',
               		dataType: 'json',
        			contentType: "application/json",
        			data:jsonmessage,
        			url: saveUrl,
        			success: function(sdata){
        			document.getElementById("personFormResponse").innerHTML = "saved";    	
               		}
           		});
            
         	document.getElementById("personFormResponse").innerHTML = "saved";
            e.preventDefault(); // prevent actual form submit and page reload
        });
      });
    
    $.fn.serializeObject = function()
    {
        var o = {};
        var a = this.serializeArray();
        $.each(a, function() {
            if (o[this.name] !== undefined) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };

     
  </script>
 </body>
</html>
    