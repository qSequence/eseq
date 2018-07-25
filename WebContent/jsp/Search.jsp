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
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css"/>
<link href="css/anirban.css" rel="stylesheet">
<title>Sequence List</title>

</head>
<body>
<script type="text/javascript">
$(document).ready(function() {
	$("#tool_tip").hide();

	$("#tool_tip")
	.fadeIn(9000);

	var tooltips = document.querySelectorAll('.tooltip span');

	window.onmousemove = function (e) {
	    var x = (e.clientX + 20) + 'px',
	        y = (e.clientY + 20) + 'px';
	    for (var i = 0; i < tooltips.length; i++) {
	        tooltips[i].style.top = y;
	        tooltips[i].style.left = x;
	    }
	};
	$("#userName").combogrid({
		url: 'SearchUsers.htm?action_param=search_with_properties_only',
		colModel: [
		           {'columnName':'userIdCol','width':'0','label':''},
		           {'columnName':'userNameCol','width':'50','label':'Username'},
		           {'columnName':'nameCol','width':'50','label':'Name'}
		           ],
		select: function( event, ui ) {


		$("#userName").val(ui.item.userNameCol);
		document.getElementById('userId').value="user_"+ui.item.userIdCol;

		return false;
		}
		});
	$("#catName").combogrid({
		url: 'SearchCategories.htm?action_param=search_with_properties_only',
		colModel: [
		           {'columnName':'catIdCol','width':'0','label':''},
		           {'columnName':'catNameCol','width':'50','label':'Category Name'}
		           ],
		select: function( event, ui ) {


		$("#catName").val(ui.item.catNameCol);
		document.getElementById('catId').value=ui.item.catIdCol;

		return false;
		}
		});
    $(".header").click(function () {

        $header = $(this);
        //getting the next element
        $content = $header.next();
        //open up the content needed - toggle the slide- if visible, slide up, if not slidedown.
        $content.slideToggle(500, function () {
            //execute this after slideToggle is done
            //change text of header based on visibility of content div
            if($content.is(":hidden")){
              $header.find(".fa").removeClass('fa-chevron-up');
              $header.find(".fa").addClass('fa-chevron-down');
            } else {
              $header.find(".fa").removeClass('fa-chevron-down');
              $header.find(".fa").addClass('fa-chevron-up');
            }
        });

    });
});

function updateSeqMst( user_request_action_param, social_network_param, seq_mst_id_param,sequenceVersion_param, url) {

$("#img_"+seq_mst_id_param).attr('src',"images/secure-link-image.png");
$("#img_"+seq_mst_id_param).attr('title',"Secure your shared link");
$("#img_"+seq_mst_id_param).attr('alt',"Secure your shared link");

		$.post(url,
				{
					user_request_action_param:user_request_action_param,
					seq_mst_id_param:seq_mst_id_param,
					social_network_param:social_network_param,
					sequenceVersion:sequenceVersion_param
				},
				function(data,status){

				});
	}
</script>

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


<div class="container ViewSequenceList">
   
   <div class="row">
     <div class="col-lg-5 center-all FORMAREA">
                <div class="wrap-table-del">
                  <div class="container_expand">
                      <div class="header">
                        <span>Search</span>
                        <i class="fa fa-chevron-up pull-right"></i>
                      </div>
                      <div class="content">
                        <form action="Search.htm" method="post">
                          <div class="form-group">
                            <div class="col-lg-12">
                              <input id="searchString" name="searchString" type="text" size="50" maxlength="1900"/>
                            </div>
                          </div>
                          <div class="form-group">
                            <div class="col-lg-12">
                              <input type="submit" class="btn btn-success" value="Search Sequences">
                            </div>
                          </div>
                        </form>
                      </div>
                    </div>
                </div>
     </div>
     <div class="container table-section">
      <table align="center" class="col-lg-12">
         <tr>
            <td>
               <c:set var="x" value="0" />
               <table align="center"  class="table-striped table-hover">
                        <tr>
                           <th><label for="sequenceName">Name</label></th>
                           <th><label for="Edit">Type</label></th>
                           <th><label for="createdDate">Search string</label></th>
                        </tr>
                        <c:if test="${modelUc.searchResultsList[0]==null}">
                           <tr>
                              <td><font color=red>No search results!</font>
                              </td>
                           </tr>
                        </c:if>
                  <c:if test="${modelUc.searchResultsList[0]!=null}">
                     <c:forEach items='${modelUc.searchResultsList}' var="searchResults">
                        <c:set var="changed" value="false" />
                        <c:if test="${x=='0' && changed=='false'}">
                           <tr>
                              <td>
                                 <a class="bottom seq-margin yellow-tooltip" href="<c:url value="${searchResults.url}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${searchResults.displayName}">${searchResults.displayName}</a>
                              </td>
                              <td>${searchResults.type}</td>
                              <td>
                                 ${searchResults.searchMatchSnippet}
                              </td>
                              <c:set var="changed" value="true" />
                              <c:set var="x" value="1" />
                           </tr>
                        </c:if>
                        <c:if test="${x=='1' && changed=='false'}">
                           <tr>
                              <td>
                                 <a class="bottom seq-margin yellow-tooltip" href="<c:url value="${searchResults.url}"/>" data-placement="bottom" data-toggle="tooltip" href="#" data-original-title="${searchResults.displayName}">${searchResults.displayName}</a>
                              </td>
                              <td>${searchResults.type}</td>
                              <td>
                                 ${searchResults.searchMatchSnippet}
                              </td>
                              <c:set var="x" value="0" />
                           </tr>
                        </c:if>
                     </c:forEach>
                  </c:if>
               </table>
            </td>
         </tr>
      </table>
      </div>
   </div>
</div>



	<script type= "text/javascript" src="jquery/bootstrap.min.js"></script>
	<script type="text/javascript">
	    $(document).ready(function () {
	        $('a').tooltip();
	    });
	</script>
</body>
</html>
