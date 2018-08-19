<%@ include file="header_for_seqdet.jsp"%>
<script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery/jquery-ui.js"></script>
<link rel="stylesheet" type="text/css" href="jquery/jquery-ui.css">
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">

<link href="css/qSequence-otherPages.css" rel="stylesheet">
<link rel="stylesheet" href="<c:url value="/a.css" />"  type="text/css">
<%--  12 Oct added combogrid jquery libraries--%>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery-ui-1.10.1.custom.css" />">
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="jquery/jquery-ui-1.10.1.custom.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery.ui.combogrid.css" />">
<script type="text/javascript" src="jquery/jquery.ui.combogrid-1.6.3.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css" />
<link href="css/anirban.css" rel="stylesheet">
<%-- END 12 Oct added combogrid jquery libraries--%>
<title>Dashboard</title>
<style type="text/css">
.container_expand div {
    text-align: center;
    padding: 00px 60px 20px 60px;
}
.container_expand .header {
    background-color:#d3d3d3;
    padding: 2px;
    cursor: pointer;
    font-weight: bold;
}
</style>
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
          <a class="navbar-brand" href="#"><img src="images/logo2.png" alt="" /></a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
          <ul class="nav navbar-nav navbar-right">
            <c:if test="${modelUc.loginSuccessful!='SUCCESSFUL'}">
              <li><a href="<c:url value="/Dashboard.htm" />">Home</a></li>
              <li><a href="<c:url value="/Login.htm" />">Login</a></li>
            </c:if>
            <c:if test="${modelUc.loginSuccessful=='SUCCESSFUL'}">
              <li><a href="<c:url value="/Dashboard.htm" />">Home</a></li>
              <li><a href="<c:url value="/Profile.htm" />">Profile</a></li>
              <c:if test="${modelUc.role=='ADMIN' or modelUc.role=='ENTERPRISE_ARCHITECT' }">
                <li><a href="<c:url value="/Admin.htm" />">Admin</a></li>
              </c:if>
              <li><a href="<c:url value="/Logout.htm" />">Logout</a></li>
            </c:if>
          </ul>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container-fluid -->
    </nav>
  </div>
</div>
<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <h1>Dashboard</h1>
           <c:if test="${modelUc.demoDB=='derby'}">
            <div class="bs-component">
              <div class="well text-success">
                Note : You are using evaluation and demonstration purpose derrby database. Change to your own <a href="<c:url value=" Install.htm "/>">database</a>
              </div>
            </div>
            </c:if>
        </div>
		    <div class="row">
            <div class="col-lg-12">
                <div class="search-holder-d">
                    <%-- <div class="form-group">
                      <h4>SEARCH</h4>
                      <div class="col-lg-12">
                          <input class="form-control" id="searchString" name="searchString" type="text" size="50" maxlength="1900"  />
                          <input type="submit" class="btn btn-primary" value="Search" />
                      </div>
                    </div> --%>
                    <form action="Search.htm" method="post" >
                      <input id="searchString" name="searchString" type="text" size="50" maxlength="1900" />
                      <input type="submit" src="/images/login.png" value="Search">
                    </form>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6">
                <div class="card">
                  <i class="mdi-action-settings A1"></i>
                  <div class="card-block">
                    <a href="<c:url value=" ViewSequenceList.htm "/>">
                      <h4 class="card-title">${modelUc.sequencesCreated}</h4>
                      <p class="card-text">Sequences created</p>
                    </a>
                  </div>
                  <div class="card-footer">
                    <p>
                      <a class="bottom seq-margin yellow-tooltip" href="<c:url value=" SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${modelUc.seqId1}&sequenceVersion=${modelUc.seqVer1} "/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${modelUc.seqDesc1}"> ${modelUc.seqName1}</a>          ${modelUc.seqElapsedTime1}
                    </p>
                    <p>
                      <a class="bottom seq-margin yellow-tooltip" href="<c:url value=" SeqDetA.htm?user_request_action_param=default_action&seq_mst_id_param=${modelUc.seqId2}&sequenceVersion=${modelUc.seqVer2} "/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${modelUc.seqDesc2}">${modelUc.seqName2}</a>          ${modelUc.seqElapsedTime2}
                    </p>
                  </div>
                </div>
            </div>
            <div class="col-md-6">
                <div class="card">
                  <i class="mdi-action-settings A2"></i>
                  <div class="card-block">
                    <a href="<c:url value=" LearnedCapabilities.htm?user_request_action_param=LearnedCapabilities "/>">
                      <h4 class="card-title">${modelUc.capabilitiesLearnt}</h4>
                      <p class="card-text">Learned Capabilities</p>
                    </a>
                  </div>
                  <div class="card-footer">
                    <p> <a class="bottom seq-margin yellow-tooltip" href="<c:url value=" SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${modelUc.sysSeqId1}&sequenceVersion=${modelUc.sysSeqVer1} "/>" data-placement="bottom" data-toggle="tooltip" href="#"
                        data-original-title="${modelUc.sysSeqDesc1}"> ${modelUc.sysSeqName1}</a> ${modelUc.sysSeqElapsedTime1}
                    </p>
                    <p>
                      <a class="bottom seq-margin yellow-tooltip" href="<c:url value=" SeqDetA.htm?user_request_action_param=default_action&sys_seq_id=${modelUc.sysSeqId2}&sequenceVersion=${modelUc.sysSeqVer2} "/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${modelUc.sysSeqDesc2}">${modelUc.sysSeqName2}</a>          ${modelUc.sysSeqElapsedTime2}
                    </p>
                  </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
