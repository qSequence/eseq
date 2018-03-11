<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>

<title>Insert title here</title>
<meta name="description" content="Automatically build knowledge base, makes it easy to capture the most relevant and most needed information easily and organise, contribute IT or business solutions"> 
<style>
.navbar-inverse .navbar-nav>li>a {
            color: #767676;
            font-size:14px;
            border:2px solid #e7f4c1;
            padding:10px 5px;
        }
        .navbar-inverse .navbar-nav>li>a:hover{
            color: #6b8f00;
            border:1px solid #98bf21;
            background-color:#f1f1f1;
            transition: all 0.3s ease 0s;
        }
</style>
</head>
<body>
<h1>Logout</h1>
<h3>${modelUc.successMessage}</h3>
        	<table align="center" border=1 bgcolor="#FFFFFF">
        		<tr><td colspan="2"><font><a href="${modelUc.CONTEXT_PATH}/Login.htm">Sign back In</a></font></td></tr>
        		<%   
session.invalidate();  
response.sendRedirect(request.getContextPath() + "/");  
%>  
        	</table>
</body>
</html>