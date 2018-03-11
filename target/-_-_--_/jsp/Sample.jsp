<%@ include file="include.jsp"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>




</head>
<body>
<div style="left: 100px; top: 100px;background-color: #E7ECEE;border-width:medium;border-style:solid;border-color: #DDE4E6; ">
		<table align="center">
		<tr><td>Session From Model:${modelUc.session}</td></tr>
		<tr><td>Session JSP:<%= session.getId() %></td></tr>
		
        <tr><td>

        	<table align="center" width="500">
         		<tr height="50px"><th  bgcolor="#CCCCFF" width="70%" ><label for="sequenceName">Sequence Name</label></th><th  bgcolor="#CCCCFF">Delete</th></tr>
         		
        		<tr style="background-color: #85E0E0; color: black;">
        			<td>Test1</td>
<td><a href="${modelUc.CONTEXT_PATH}/Sample.htm">Delete</a></td>
             
        		</tr>
        	</table>
       </td></tr> 
	</table>
	</div>
</body>
</html>