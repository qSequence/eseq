<%@ include file="header_for_seqdet.jsp"%>
<%@ page import="net.tanesha.recaptcha.ReCaptcha" %>
<%@ page import="net.tanesha.recaptcha.ReCaptchaFactory" %>
<title>Setup My Menu</title>
<script type="text/javascript" src="jquery/jquery-1.10.2.js"></script>
<script type="text/javascript" src="jquery/jquery-ui.js"></script>
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script src="jquery/jquery-latest.js"></script>
<%-- 21Dec 2016 added for the header and navigation --%>
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link href="css/qSequence-otherPages.css" rel="stylesheet">
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css"/>
<link href="css/anirban.css" rel="stylesheet">

</head>
<body>
<script type="text/javascript">
$(document).ready(function() {


 $("#form_submit_button").click(function(){
  //alert("The button was clicked.");
        var taVal=$("textarea#descriptionTA").val();
		//alert("Before"+taVal);
$("input#description_param").val(taVal);
		//alert("Changed"+$("input#description_param").val());

		document.getElementById("subscription_order_form").submit();
});


});


</script>
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
  <div id="container" class="container mymenu">
  <c:if test="${modelUc.status=='SAVED'}">
     <c:redirect url="/MyMenu.htm?seq_mst_id_param=${modelUc.seq_mst_id_param}&message=${modelUc.message}&error=${modelUc.error}"/>
  </c:if>
  <table align="center" width=500>
     <tr>
        <td>
           <form id="subscription_order_form" action="FileUpload.htm" method="post" enctype="multipart/form-data" >
              <table align="center" width=500>
                 <tr>
                    <td>
                      <div class="table-header" style="text-align:center;">
                        <h1>My Menu</h1>
                        <input type="hidden" name="seq_mst_id_param" value="${modelUc.seq_mst_id_param}" />
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-12">Menu name</label>
                        <input class="col-lg-12" type="input" name="menu_item_name_param" maxlength="20"/>
                      </div>
                      <div class="form-group">
                        <label class="control-label col-lg-12">Upload menu image</label>
                        <input class="col-lg-12" type="file" name="fileUploaded" />
                        <input type="hidden" name="system_type_param" value="custom" maxlength="20"/>
                        <font size=1px>( *** Upload images with dimensions : width 150px, height 100px, and size less than 50kb check) <a href="<c:url value="faq.htm#MenuImageSpecs"/>">FAQ</</a></font>
                      </div>
                      <div class="form-group">
                        <input class="col-lg-12 btn btn-success btn-raised" value="Upload" type="submit" />
                      </div>
                      <div id="sometext" align="center" ><strong><font color="red">${modelUc.error}</font></strong></div>
                      <div id="sometext" align="center" ><strong>${modelUc.message}</strong></div>
                    </td>
                 </tr>
              </table>
           </form>
        </td>
     </tr>
     <tr>
        <td>
           <form id="menu_save_form" action="MyMenu.htm" method="post" >
              <input type="hidden" name="seq_mst_id_param" value="${modelUc.seq_mst_id_param}" />
              <input type="hidden" name="user_request_action_param" value="save_menu_action_param" />
              <c:set var="x" value="0" />
              <table border="0" align="center" width="600">
                 <tr>
                    <td align="center" >
                       <hr>
                    </td>
                 </tr>
                 <tr>
                    <td align="center" ><label>Select from the below menu items for sequence and click save</label><button id="save" type="button" onclick="document.getElementById('menu_save_form').submit();">Save</button></td>
                 </tr>
                 <tr>
                    <td align="center" ></td>
                 </tr>
                 <tr>
                    <th><label for="menuItem">Menu</label></th>
                    <th><label for="sequenceName">Selected</label></th>
                 </tr>
                 <c:forEach items='${modelUc.ucSeqMenuImagesList}' var="menuImage">
                    <c:set var="changed" value="false" />
                    <c:if test="${x=='0' && changed=='false'}">
                       <tr>
                          <td>${menuImage.menuItemName}</td>
                          <td>
                             <img style="vertical-align:middle;" title="Menu" alt="Menu" height="100" width="150" src="${menuImage.imageUrl}" >
                          </td>
                          <td>

                             <c:if test="${menuImage.selected=='Y'}">
                                <input type="checkbox" name="custom_menu_item_id_${menuImage.menuItemId}" checked value="${menuImage.menuItemId}">
                             </c:if>
                             <c:if test="${menuImage.selected!='Y'}">
                                <input type="checkbox" name="custom_menu_item_id_${menuImage.menuItemId}" value="${menuImage.menuItemId}">
                             </c:if>
                          </td>
                          <c:set var="changed" value="true" />
                          <c:set var="x" value="1" />
                       </tr>
                    </c:if>
                    <c:if test="${x=='1' && changed=='false'}">
                       <tr>
                          <td>${menuImage.menuItemName}</td>
                          <td>
                             <img style="vertical-align:middle;" title="Menu" alt="Menu" height="100" width="150" src="${menuImage.imageUrl}" >
                          </td>
                          <td>

                             <c:if test="${menuImage.selected=='Y'}">
                                <input type="checkbox" name="custom_menu_item_id_${menuImage.menuItemId}" checked value="${menuImage.menuItemId}">
                             </c:if>
                             <c:if test="${menuImage.selected!='Y'}">
                                <input type="checkbox" name="custom_menu_item_id_${menuImage.menuItemId}" value="${menuImage.menuItemId}">
                             </c:if>
                          </td>
                          <c:set var="x" value="0" />
                       </tr>
                    </c:if>
                 </c:forEach>
                 <tr>
                    <td align="center" >
                       <hr>
                    </td>
                 </tr>
                 <tr>
                    <td align="center" >
                       <h3>Default Menu</h3>
                    </td>
                 </tr>
                 <tr>
                    <td align="center" >
                       <hr>
                    </td>
                 </tr>
                 <c:forEach items='${modelUc.defaultMenuImagesList}' var="menuImage">
                    <c:set var="changed" value="false" />
                    <c:if test="${x=='0' && changed=='false'}">
                       <tr>
                          <td>${menuImage.menuItemName}</td>
                          <td>
                             <img style="vertical-align:middle;" title="Menu" alt="Menu" height="100" width="150" src="${menuImage.imageUrl}" >
                          </td>
                          <td>

                             <c:if test="${menuImage.selected=='true'}">
                                <input type="checkbox" name="default_menu_item_id_${menuImage.menuItemId}" checked value="${menuImage.menuItemId}">
                             </c:if>
                             <c:if test="${menuImage.selected=='false'}">
                                <input type="checkbox" name="default_menu_item_id_${menuImage.menuItemId}" value="${menuImage.menuItemId}">
                             </c:if>
                          </td>
                          <c:set var="changed" value="true" />
                          <c:set var="x" value="1" />
                       </tr>
                    </c:if>
                    <c:if test="${x=='1' && changed=='false'}">
                       <tr>
                          <td>${menuImage.menuItemName}</td>
                          <td>
                             <img style="vertical-align:middle;" title="Menu" alt="Menu" height="100" width="150" src="${menuImage.imageUrl}" >
                          </td>
                          <td>

                             <c:if test="${menuImage.selected=='true'}">
                                <input type="checkbox" name="default_menu_item_id_${menuImage.menuItemId}" checked value="${menuImage.menuItemId}">
                             </c:if>
                             <c:if test="${menuImage.selected=='false'}">
                                <input type="checkbox" name="default_menu_item_id_${menuImage.menuItemId}" value="${menuImage.menuItemId}">
                             </c:if>
                          </td>
                          <c:set var="x" value="0" />
                       </tr>
                    </c:if>
                 </c:forEach>
              </table>
           </form>
        </td>
     </tr>
  </table>
<%@ include file="footer.jsp"%>
