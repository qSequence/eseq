<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css"/>
<link href="css/anirban.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media
queries -->

<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
<script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<title>Configure database</title>
<meta name="description" content="Install qSequence">
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="jquery/jquery-ui-1.10.1.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="/eseq-100/css/jquery-ui.css">
<script type="text/javascript">
$(document).ready(function() {

	if( $('#dbList').val()==="Oracle"){
		$('li.service').show();
        $('li.schema').hide();
        $('li.database').hide();
    }

    if( $('#dbList').val()==="MySQL"){
        $('li.database').show();
        $('li.service').hide();
        $('li.schema').hide();
    }

    if( $('#dbList').val()==="PostgreSQL"){
    	$('li.database').show();
    	$('li.schema').show();
        $('li.service').hide();
    }
    if( $('#dbList').val()==="MicrosoftSQLServer"){
    	$('li.database').show();
    	$('li.schema').show();
        $('li.service').hide();
    }

$('#dbList').on('change',function(){

	if( $('#dbList').val()==="Oracle"){
		$('li.service').show();
        $('li.schema').hide();
        $('li.database').hide();
    }

    if( $('#dbList').val()==="MySQL"){
        $('li.database').show();
        $('li.service').hide();
        $('li.schema').hide();
    }

    if( $('#dbList').val()==="PostgreSQL"){
    	$('li.database').show();
    	$('li.schema').show();
        $('li.service').hide();
    }
    if( $('#dbList').val()==="MicrosoftSQLServer"){
    	$('li.database').show();
    	$('li.schema').show();
        $('li.service').hide();
    }
});

});

</script>
</head>
<body>
  <!-- Navigation -->
  <div class="wrap-navbar">
    <div class="topHeader">
      <nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header navbar-left">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#"><img src="images/logo2.png" alt=""/></a>
          </div>

          <!-- Collect the nav links, forms, and other content for toggling -->
          <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-right">
              <c:if test="${modelUc.loginSuccessful!='SUCCESSFUL'}">
                <li>
                  <a href="<c:url value="/Dashboard.htm" />">Home</a>
                </li>
                <li>
                  <a href="<c:url value="/Login.htm" />">Login</a>
                </li>
              </c:if>
              <c:if test="${modelUc.loginSuccessful=='SUCCESSFUL'}">
                <li>
                  <a href="<c:url value="/Dashboard.htm" />">Home</a>
                </li>
                <li>
                  <a href="<c:url value="/Profile.htm" />">Profile</a>
                </li>
                <c:if test="${modelUc.role=='ADMIN' or modelUc.role=='ENTERPRISE_ARCHITECT' }">
                  <li>
                    <a href="<c:url value="/Admin.htm" />">Admin</a>
                  </li>
                </c:if>
                <li>
                  <a href="<c:url value="/Logout.htm" />">Logout</a>
                </li>
              </c:if>
            </ul>
          </div>
          <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
      </nav>
    </div>
  </div>
<div id="container" class="container admin">

<c:if test="${modelUc.status=='SAVED'}">
<c:redirect url="/InstallCompleted.htm?param=installcompleted"/>
</c:if>

<form action="Install.htm" method="post" onsubmit="return checkCheckBox(this)">
   <table align="center" width="600px">
      <tbody>
        <tr>
           <td>
              <div class="table-header">
                <h1>Configure database</h1>
              </div>
           </td>
        </tr>
        <tr>
           <td>
             <div class="bs-component">
                <div class="well">
                  <div class="col-lg-12">
                    <c:if test="${modelUc.radioDBValue=='bundledDB'}">
                       Default Bundled database (Suitable for evaluation and demonstration purposes only)
                    </c:if>
                    <c:if test="${modelUc.radioDBValue!='bundledDB'}">
                       Default Bundled database (Suitable for evaluation and demonstration purposes only)
                    </c:if>
                  </div>
                </div>
              </div>

             <div class="wrap-form">
                 <div class="form-group">
                   <div class="col-lg-12">
                       <h4>
                           <c:if test="${modelUc.radioDBValue=='customDB'}">
                              Your own database (Production use)
                           </c:if>
                           <c:if test="${modelUc.radioDBValue!='customDB'}">
                              Your own database (Production use)
                           </c:if>
                       </h4>
                       <c:if test="${modelUc.dbListValue==null}">
                          <select name="dbList" id="dbList">
                       </c:if>
                       <c:if test="${modelUc.dbListValue!=null}">
                       <select name="dbList" id="dbList">
                       </c:if>
                       <option value="SelectDB">Select database</option>
                       <c:if test="${modelUc.dbListValue=='Oracle'}">
                       <option title="Tooltip" selected="selected" value="Oracle">Oracle</option>
                       </c:if>
                       <c:if test="${modelUc.dbListValue!='Oracle'}">
                       <option title="Oracle Tooltip" value="Oracle">Oracle</option>
                       </c:if>
                       <c:if test="${modelUc.dbListValue=='MySQL'}">
                       <option title="Tooltip" selected="selected" value="MySQL">MySQL</option>
                       </c:if>
                       <c:if test="${modelUc.dbListValue!='MySQL'}">
                       <option title="Tooltip" value="MySQL">MySQL</option>
                       </c:if>
                       <c:if test="${modelUc.dbListValue=='PostgreSQL'}">
                       <option  title="Tooltip" selected="selected" value="PostgreSQL">PostgreSQL</option>
                       </c:if>
                       <c:if test="${modelUc.dbListValue!='PostgreSQL'}">
                       <option title="Tooltip" value="PostgreSQL">PostgreSQL</option>
                       </c:if>
                       </select>
                   </div>
                 </div>

                 <div class="form-group">
                   <div class="col-lg-12">
                         <ul>
                            <li>
                               <label for="hostname">hostname</label>
                               <input type="text" name="hostname" value="${modelUc.hostname}"/>*
                            </li>
                            <li>
                               <label for="hostname">port</label>
                               <input type="text" name="port" value="${modelUc.port}"/>*
                            </li>
                            <li class="database">
                               <label for="hostname">database</label>
                               <input type="text" name="database" value="${modelUc.database}"/>*
                            </li>
                            <li class="service">
                               <label for="hostname">service</label>
                               <input type="text" name="service" value="${modelUc.service}"/>*
                            </li>
                            <li class="schema">
                               <label for="hostname">schema</label>
                               <input type="text" name="schema"  value="${modelUc.schema}"/>*
                            </li>
                            <li>
                               <label for="hostname">username</label>
                               <input type="text" name="username" value="${modelUc.username}"/>*
                            </li>
                            <li>
                               <label for="hostname">password</label>
                               <input type="password" name="password" value="${modelUc.password}"/>*
                            </li>
                         </ul>
                   </div>
                 </div>
                 <div class="form-group">
                    <div class="col-lg-12">
                      <input id="user_request_action_param" name="user_request_action_param" type="hidden" value="install_qsequence" />
                      <input type="submit" value="Configure and continue"><strong><font color="red">${modelUc.error}</font></strong>
                    </div>
                 </div>
             </div>

           </td>
        </tr>
      </tbody>
   </table>
</form>

<%@ include file="footer.jsp"%>
