<%@ include file="header_for_seqdet.jsp"%>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/jquery-ui.css" />">
<link rel="stylesheet" href="<c:url value="/a.css" />"	type="text/css">
<%--  12 Oct added combogrid jquery libraries--%>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery-ui-1.10.1.custom.css" />">
<script type="text/javascript" src="jquery/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="jquery/jquery-ui-1.10.1.custom.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="<c:url value="/css/jquery.ui.combogrid.css" />">
<script type="text/javascript" src="jquery/jquery.ui.combogrid-1.6.3.js"></script>
<%-- END 12 Oct added combogrid jquery libraries--%>
<link href="css/bootstrap.min-otherPages.css" rel="stylesheet">
<link href="css/qSequence-otherPages.css" rel="stylesheet">
  <link href="https://use.fontawesome.com/releases/v5.4.2/css/all.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-material-design/0.3.0/css/material.css"/>
  <link href="css/anirban.css" rel="stylesheet">
<title>${modelUc.seqName}</title>
<meta name="description" content="${modelUc.seqDescription}">
<style type="text/css">
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
.ui-state-hover {
	background-color: #ffC
}

.inlineEdit-placeholder {
	font-style: italic;
	color: #555;
}
.mousetoHand
 {
 color:#5B3C1D;
 font-family:Arial;
 font-size:12pt;
 cursor:pointer;
 text-decoration:none;
}
table{ table-layout:fixed; overflow:hidden }
td{  padding:0 }
	#rubrik {
		width:100%;
		text-align:center;

	}
	.minfield {
            max-width: 10px;
            border: 0px solid red;
            overflow: hidden;
        }

td.objectname{ color: blue;font-size: 10px; }

dl {
    width: 200px;
}
dl dt {
    width: 180px;
    float: left;
    padding: 0;
    margin: 0;
}
dl dd {
    width: 20px;
    float: left;
    padding: 0;
    margin: 0;
}

.bubble{
    background-color: green;
    border-radius: 5px;
    box-shadow: 0px 0px 6px #B2B2B2;
    height: 20px;
    margin: 20px;
	font: 16px/25px sans-serif;
	color : yellow;
	text-align: center;
}

.tooltip {
    text-decoration:none;
    position:relative;
}
.tooltip span {
    display:none;
}
.tooltip:hover span {
    display:block;
    position:fixed;
    overflow:hidden;
    background-color:yellow;
    font-family:Arial;
 font-size:8pt;
}
</style>

<%-- <script type="text/javascript" 	src="<c:url value="/jquery/jquery.min.js"/>"></script>  --%>
<%-- Commented on 12 Oct Clashes with combogrid jquery libraries
<script type="text/javascript" src="jquery/jquery-1.7.1.js"></script>
<script type="text/javascript" src="jquery/jquery-ui.js"></script>
--%>
<script type="text/javascript" src="<c:url value="/jquery/inlineEdit.js"/>"></script>
<script type="text/javascript">
$(document).ready(function() {
	$("#tool_tip").hide();

	$("#tool_tip")
	.fadeIn(9000);
	//.animate({ opacity: 0 }, 6000);

	//alert("height");
//	var numberOfRows=document.getElementById('numberOfRows').value;
	//alert("numberOfRows="+numberOfRows);
//	for (var i=1; i<=numberOfRows; i++)
// 	{
//		alert("height table_SYSTEM="+$("#table_SYSTEM"+i).height());
//		alert("height table_SYSTEM_LAST_CONNECTOR="+$("#table_SYSTEM_LAST_CONNECTOR"+i).height());
//		alert("height table_CROSS_OVER_LINE="+$("#table_CROSS_OVER_LINE"+i).height());
//		alert("height table_CONNECTOR="+$("#table_CONNECTOR"+i).height());
//		alert("height table_SYSTEM_CONNECTOR="+$("#table_SYSTEM_CONNECTOR"+i).height());
// 		var maxHeight=0;
// 		if($("#table_SYSTEM"+i).height()>maxHeight){
// 			maxHeight=$("#table_SYSTEM"+i).height();
// 		}
// 		if($("#table_SYSTEM_LAST_CONNECTOR"+i).height()>maxHeight){
// 			maxHeight=$("#table_SYSTEM_LAST_CONNECTOR"+i).height();
// 		}
// 		if($("#table_CROSS_OVER_LINE"+i).height()>maxHeight){
// 			maxHeight=$("#table_CROSS_OVER_LINE"+i).height();
// 		}
// 		if($("#table_CONNECTOR"+i).height()>maxHeight){
// 			maxHeight=$("#table_CONNECTOR"+i).height();
// 		}
// 		if($("#table_SYSTEM_CONNECTOR"+i).height()>maxHeight){
// 			maxHeight=$("#table_SYSTEM_CONNECTOR"+i).height();
// 		}
// 		$("#table_SYSTEM_CONNECTOR"+i).height(maxHeight);
// 		$("#table_CONNECTOR"+i).height(maxHeight);
// 		$("#table_CROSS_OVER_LINE"+i).height(maxHeight);
// 		$("#table_SYSTEM_LAST_CONNECTOR"+i).height(maxHeight);
// 		$("#table_SYSTEM"+i).height(maxHeight);
// 		$("#table_IF_BORDER"+i).height(maxHeight);
		//alert("maxHeight="+maxHeight);
		//alert("table_CROSS_OVER_LINE="+$("#table_CROSS_OVER_LINE"+i).height());
// 		var td_width=$("#td_SYSTEM"+i).width();
// 		$("#table_SYSTEM"+i).width(td_width);
		//if(i==2){
	//	alert("row="+i);
		//alert("system width="+$("#table_SYSTEM"+i).width());
		//alert("td width="+$("#td_SYSTEM"+i).width());

		//alert("AFTER system width="+$("#table_SYSTEM"+i).width());
		//}
// 	}

	 $("#form_print_button").click(function(){
		//alert("The PRINT button was clicked.");
		document.getElementById("print_form").submit();
	});
	 $("#form_download_button").click(function(){
		//alert("The DOWNLOAD button was clicked.");
		document.getElementById("download_form").submit();
	});
	 // 12 Oct added for combogrid
		$( "#project").combogrid({
// 			url: '/eseq-100/SearchRequests.htm',
			url: 'SearchRequests.htm',
			colModel: [
			           {'columnName':'requestName','width':'50','label':'requestName'}
			           ],
			select: function( event, ui ) {

			$( "#project" ).val( ui.item.requestName );
			return false;
			}
			});
	// END 12 Oct added for combogrid

	linkFields();
});

function linkFields()
{
	// call inlineEdit
	$('.editable').inlineEdit({
		save : function(event, data) {
		var res = this.id.split("----");
		var reqId = 'request----'+res[1]+'----'+res[2]+'----'+res[3]+'----'+res[4]+'----'+res[5]+'----'+res[6]+'----'+res[7];
		var resId = 'response----'+res[1]+'----'+res[2]+'----'+res[3]+'----'+res[4]+'----'+res[5]+'----'+res[6]+'----'+res[7];
		var emptyId = 'empty----'+res[1]+'----'+res[2]+'----'+res[3]+'----'+res[4]+'----'+res[5]+'----'+res[6]+'----'+res[7];
		if (res[1]=='null'){//ucId
			res[1]="";
		}
		if (res[2]=='null'){//seqMstId
			res[2]="";
		}
		if (res[3]=='null'){//seqItemId
			res[3]="";
		}
		if (res[4]=='null'){//row
			res[4]="";
		}
		if (res[5]=='null'){//col
			res[5]="";
		}
		if (res[6]=='null'){//systemType
			res[6]="";
		}
		if (res[7]=='null'){//sysSeqId
			res[7]="";
		}
		var sequenceVersion= "";
		if(document.getElementById('sequenceVersion')!=null){
			sequenceVersion= document.getElementById('sequenceVersion').value;
		}
		if(document.getElementById(this.id+'_systemType') != null){
			var sysId = 'system----'+res[1]+'----'+res[2]+'----'+res[3]+'----'+res[4]+'----'+res[5]+'----'+document.getElementById(this.id+'_systemType').value+'----'+res[7];
		}
		if(document.getElementById(this.id+'_element')!=null && document.getElementById(this.id+'_element').value=='request'){
			var requestId= document.getElementById(this.id+'_requestId').value;
			var requestName= document.getElementById(this.id+'_requestName').value;
			var responseId= document.getElementById(this.id+'_responseId').value;
			var responseName= document.getElementById(this.id+'_responseName').value;
			var systemId= document.getElementById(this.id+'_systemId').value;
			var systemName= document.getElementById(this.id+'_systemName').value;
			$("#"+resId).empty().append(responseName);
			$("#"+sysId).empty().append(systemName);
			$("#"+this.id+'_element').remove();
			$("#"+emptyId).remove();
		}else if(document.getElementById(this.id+'_element')!=null && document.getElementById(this.id+'_element').value=='response'){
			var requestId= document.getElementById(this.id+'_requestId').value;
			var requestName= document.getElementById(this.id+'_requestName').value;
			var responseId= document.getElementById(this.id+'_responseId').value;
			var responseName= document.getElementById(this.id+'_responseName').value;
			var systemId= document.getElementById(this.id+'_systemId').value;
			var systemName= document.getElementById(this.id+'_systemName').value;
			$("#"+reqId).empty().append(requestName);
			$("#"+sysId).empty().append(systemName);
			$("#"+this.id+'_element').remove();
			$("#"+emptyId).remove();
		}else{
			
			var systemId=null;
			if( document.getElementById(this.id+'_systemId')!=null){
			   systemId= document.getElementById(this.id+'_systemId').value;
			}
			if(this.id==reqId){//Means the request has been changed without using the combogrid
				//reset Id's and value
				var reqEle = document.getElementById(reqId);
				var resEle = document.getElementById(resId);
				var emptyEle = document.getElementById(emptyId);

				if(reqEle!=null && resEle!=null && emptyEle==null){
                	$("#"+resEle.id).empty().append("EditMe_"+res[3]);
                	$("#temp_input_container").append("<input type=\"hidden\" id=\""+emptyId+"\" value=\"empty\">");
                }
			}else if(this.id==resId){//Means the response has been changed without using the combogrid
				//reset Id's and value
				var reqEle = document.getElementById(reqId);
				var resEle = document.getElementById(resId);
				var emptyEle = document.getElementById(emptyId);

                if(reqEle!=null && resEle!=null && emptyEle==null){
                	$("#"+reqEle.id).empty().append("EditMe_"+res[3]);
                	$("#temp_input_container").append("<input type=\"hidden\" id=\""+emptyId+"\" value=\"empty\">");
                }
			}
		}

						//db table restriction
		if((this.id.indexOf('ifCondition') !== -1 && data.value.length<2000) || ((this.id.indexOf('ifCondition') == -1) && data.value.length<50)){
		//if(( data.value.length<2000)){

				$.post('GetSeqUpdate.htm',
				{
					user_request_action_param : 'save_obj_name_action',
					obj_name_param : data.value,
					obj_id_param : this.id,
					request_id_param : requestId,
					sequenceVersion : sequenceVersion,
					request_name_param : requestName,
					response_id_param : responseId,
					response_name_param : responseName,
					system_id_param : systemId,
					system_name_param : systemName
					},
			function(data,status){

				//var content=$("#prop_menu_place_holder").html();
				var $response=$(data);
//					if(res[0]=='request'){
//						var imgReqObj='REQ_'+res[4]+'_'+res[5];
//						var seqDet = $response.filter("#"+imgReqObj);
//						$("#"+imgReqObj).replaceWith( seqDet );
//					}else if(res[0]=='response'){
//						var imgResObj='RES_'+res[4]+'_'+res[5];
//						var seqDet = $response.filter("#"+imgResObj);
//						$("#"+imgResObj).replaceWith( seqDet );
//					}else if(res[0]=='system'){
// 					var imgSysObj='SYS_'+res[4]+'_'+res[5];
// 					var seqDet = $response.filter("#"+imgSysObj);
// 					$("#"+imgSysObj).replaceWith( seqDet );

// 					var imgReqObj='REQ_'+res[4]+'_'+res[5];
// 					var seqDet = $response.filter("#"+imgReqObj);
// 					$("#"+imgReqObj).replaceWith( seqDet );

// 					var imgResObj='RES_'+res[4]+'_'+res[5];
// 					var seqDet = $response.filter("#"+imgResObj);
// 					$("#"+imgResObj).replaceWith( seqDet );

//                     var seqDet = $response.filter("#sysObj");
//                     var tdId = $response.filter("#TD_REPLACE_ID");
//                     $("#"+tdId.val()).replaceWith( seqDet );

//                     var seqDet = $response.filter("#connectorObj");
//                     var tableId = $response.filter("#TABLE_REPLACE_ID");
//                     $("#"+tableId.val()).replaceWith( seqDet );
					var $response=$(data);
					var seqDet = $response.filter("#response_seqdet").html();
					var error = $response.filter("#error").html();
					if(error!=null){
						$("#error").empty().append( error );
					}
					$("#seq_det_holder").empty().append( seqDet );

					linkFields();

//					}
			});

			//alert("id: " + this.id);

			//return html === 'OK' ? true : false;
			}else{
				if(this.id.indexOf('ifCondition') !== -1){
					alert('Error: please limit text to less than 2000 characters, current lenght is '+data.value.length);
				}else{
					alert('Error: please limit text to less than 50 characters, current lenght is '+data.value.length);
				};

			};
		}
	});
}



	$(function() {
		// setup common ajax setting
		$.ajaxSetup({
			url : 'SeqDetA.htm',
			type : 'POST',
			async : false,
			dataType: "html",
			cache: false,
			timeout : 500
		});


	});



</script>
      <script language="JavaScript" type="text/javascript">

		function updateRwoCol(seqItemId, row, col, sourceDestination, asynchSourceDestinationName, systemType) {
			document.getElementById('selectedRow').value=row;
			document.getElementById('selectedCol').value=col;
		    document.getElementById('selectedSourceDestination').value=sourceDestination;
		    document.getElementById('selectedAsynchSourceDestinationName').value=asynchSourceDestinationName;
			document.getElementById('selectedSeqItemId').value=seqItemId;
			document.getElementById('selectedSystemType').value=systemType;
			//alert(col);

		}



        function updateSelectedComboGridForSystem(row, systemType) {


                document.getElementById('selectedComboGrid').value=row;
                var e = document.getElementById("inlineEdit");
                if(e!=null){
                	e.id = "inlineEdit"+row;
                }
                $( "#inlineEdit"+row ).combogrid({
//             		url: '/eseq-100/SearchSystems.htm?system_type_param='+systemType,
            		url: 'SearchSystems.htm?system_type_param='+systemType,
            		colModel: [
            		           {'columnName':'systemName','width':'50','label':'systemName'}
            		           ],
            		select: function( event, ui ) {

            		//$( "#"+document.getElementById('selectedComboGrid').value ).val( ui.item.requestName );
            		//$("#"+document.getElementById('selectedComboGrid').value).empty().append(ui.item.systemName);
            		$("#inlineEdit"+row).val(ui.item.systemName);
            		if(document.getElementById(row+'_systemId')==null){
            			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_systemId\" value=\""+ui.item.systemId+"\">");
            		}else{
            			$("#"+row+"_systemId").val(ui.item.systemId);
            		}
            		if(document.getElementById(row+'_systemType')==null){
            			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_systemType\" value=\""+systemType+"\">");
            		}else{
            			$("#"+row+"_systemType").val(systemType);
            		}
            		//This is for what is the element is it request/response/system, s .inlinedit would not know what it is
            		if(document.getElementById(row+'_element')==null){
            			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_element\" value=\"system\">");
            		}else{
            			$("#"+row+"_element").val("system");
            		}
            		linkFields();
            		return false;
            		}
            		});
	}

        function updateSelectedComboGridForRequest(row, systemType) {


            document.getElementById('selectedComboGrid').value=row;
            var e = document.getElementById("inlineEdit");
            if(e!=null){
            	e.id = "inlineEdit"+row;
            }
            $( "#inlineEdit"+row ).combogrid({
//         		url: '/eseq-100/SearchRequests.htm?system_type_param='+systemType,
        		url: 'SearchRequests.htm?system_type_param='+systemType,
        		colModel: [
						   {'columnName':'requestId','width':'0','label':''},
        		           {'columnName':'requestName','width':'50','label':'Request'},
        		           {'columnName':'requestDescription','width':'0','label':''},
        		           {'columnName':'systemId','width':'0','label':''},
        		           {'columnName':'systemName','width':'50','label':'System'},
        		           {'columnName':'systemDescription','width':'0','label':''},
        		           {'columnName':'responseId','width':'0','label':''},
        		           {'columnName':'responseName','width':'0','label':''},
        		           {'columnName':'responseDescription','width':'0','label':''}
        		           ],
        		select: function( event, ui ) {

        		//$( "#"+document.getElementById('selectedComboGrid').value ).val( ui.item.requestName );
        		//$("#"+document.getElementById('selectedComboGrid').value).empty().append(ui.item.systemName);
        		$("#inlineEdit"+row).val(ui.item.requestName);
        		if(document.getElementById(row+'_systemId')==null){
        			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_systemId\" value=\""+ui.item.systemId+"\">");
        		}else{
        			$("#"+row+"_systemId").val(ui.item.systemId);
        		}
        		if(document.getElementById(row+'_systemName')==null){
        			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_systemName\" value=\""+ui.item.systemName+"\">");
        		}else{
        			$("#"+row+"_systemName").val(ui.item.systemName);
        		}
        		if(document.getElementById(row+'_requestId')==null){
        			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_requestId\" value=\""+ui.item.requestId+"\">");
        		}else{
        			$("#"+row+"_requestId").val(ui.item.requestId);
        		}
        		if(document.getElementById(row+'_requestName')==null){
        			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_requestName\" value=\""+ui.item.requestName+"\">");
        		}else{
        			$("#"+row+"_requestName").val(ui.item.requestName);
        		}
        		if(document.getElementById(row+'_responseId')==null){
        			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_responseId\" value=\""+ui.item.responseId+"\">");
        		}else{
        			$("#"+row+"_responseId").val(ui.item.responseId);
        		}
        		if(document.getElementById(row+'_responseName')==null){
        			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_responseName\" value=\""+ui.item.responseName+"\">");
        		}else{
        			$("#"+row+"_responseName").val(ui.item.responseName);
        		}
        		if(document.getElementById(row+'_systemType')==null){
        			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_systemType\" value=\""+systemType+"\">");
        		}else{
        			$("#"+row+"_systemType").val(systemType);
        		}
        		//This is for what is the element is it request/response/system, s .inlinedit would not know what it is
        		if(document.getElementById(row+'_element')==null){
        			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_element\" value=\"request\">");
        		}else{
        			$("#"+row+"_element").val("request");
        		}
        		linkFields();
        		return false;
        		}
        		});
		}

        function updateSelectedComboGridForResponse(row, systemType) {


            document.getElementById('selectedComboGrid').value=row;
            var e = document.getElementById("inlineEdit");
            if(e!=null){
            	e.id = "inlineEdit"+row;
            }
            $( "#inlineEdit"+row ).combogrid({
//         		url: '/eseq-100/SearchResponses.htm?system_type_param='+systemType,
        		url: 'SearchResponses.htm?system_type_param='+systemType,
        		colModel: [
        		           {'columnName':'responseId','width':'0','label':''},
        		           {'columnName':'responseName','width':'50','label':'Response'},
        		           {'columnName':'responseDescription','width':'0','label':''},
        		           {'columnName':'systemId','width':'0','label':''},
        		           {'columnName':'systemName','width':'50','label':'System'},
        		           {'columnName':'systemDescription','width':'0','label':''},
        		           {'columnName':'requestId','width':'0','label':''},
        		           {'columnName':'requestName','width':'0','label':''},
        		           {'columnName':'requestDescription','width':'0','label':''}
        		           ],
        		select: function( event, ui ) {

        		//$( "#"+document.getElementById('selectedComboGrid').value ).val( ui.item.requestName );
        		//$("#"+document.getElementById('selectedComboGrid').value).empty().append(ui.item.systemName);
        		$("#inlineEdit"+row).val(ui.item.responseName);
        		if(document.getElementById(row+'_systemId')==null){
        			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_systemId\" value=\""+ui.item.systemId+"\">");
        		}else{
        			$("#"+row+"_systemId").val(ui.item.systemId);
        		}
        		if(document.getElementById(row+'_systemName')==null){
        			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_systemName\" value=\""+ui.item.systemName+"\">");
        		}else{
        			$("#"+row+"_systemName").val(ui.item.systemName);
        		}
        		if(document.getElementById(row+'_requestId')==null){
        			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_requestId\" value=\""+ui.item.requestId+"\">");
        		}else{
        			$("#"+row+"_requestId").val(ui.item.requestId);
        		}
        		if(document.getElementById(row+'_requestName')==null){
        			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_requestName\" value=\""+ui.item.requestName+"\">");
        		}else{
        			$("#"+row+"_requestName").val(ui.item.requestName);
        		}
        		if(document.getElementById(row+'_responseId')==null){
        			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_responseId\" value=\""+ui.item.responseId+"\">");
        		}else{
        			$("#"+row+"_responseId").val(ui.item.responseId);
        		}
        		if(document.getElementById(row+'_responseName')==null){
        			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_responseName\" value=\""+ui.item.responseName+"\">");
        		}else{
        			$("#"+row+"_responseName").val(ui.item.responseName);
        		}
        		if(document.getElementById(row+'_systemType')==null){
        			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_systemType\" value=\""+systemType+"\">");
        		}else{
        			$("#"+row+"_systemType").val(systemType);
        		}
        		//This is for what is the element is it request/response/system, s .inlinedit would not know what it is
        		if(document.getElementById(row+'_element')==null){
        			$("#temp_input_container").append("<input type=\"hidden\" id=\""+row+"_element\" value=\"response\">");
        		}else{
        			$("#"+row+"_element").val("response");
        		}
        		linkFields();
        		return false;
        		}
        		});
		}
	function editProperties( user_request_action_param, seqMstId, seqItemId, systemId, requestId, responseId, row_no_param, col_no_param,  propertyFor,requestName,responseName, systemName, url, systemType, sequenceVersion, sysSeqId) {

// 		var sequenceVersion= "";
// 		if(document.getElementById('sequenceVersion')!=null){
// 			sequenceVersion= document.getElementById('sequenceVersion').value;
// 		}
			url = addUrlParameter( url, "user_request_action_param", user_request_action_param);
			url = addUrlParameter( url, "seq_mst_id_param", seqMstId);
			url = addUrlParameter( url, "row_no_param", row_no_param);
			url = addUrlParameter( url, "col_no_param", col_no_param);
			url = addUrlParameter( url, "sequenceVersion", sequenceVersion);
			url = addUrlParameter( url, "seq_item_id_param", seqItemId);
			url = addUrlParameter( url, "system_id_param", systemId);
			url = addUrlParameter( url, "request_id_param", requestId);
			url = addUrlParameter( url, "response_id_param", responseId);
// 			url = addUrlParameter( url, "requestName_param", requestName);
// 			url = addUrlParameter( url, "responseName_param", responseName);
// 			url = addUrlParameter( url, "systemName_param", systemName);
			url = addUrlParameter( url, "property_for_param", propertyFor);
			url = addUrlParameter( url, "sys_seq_id", sysSeqId);
			url = addUrlParameter( url, "system_type_param", systemType);

			url = addScrollPositionsToUrl(encodeURI(url));
			FireUrlHrefEvent(url);

	}

		function showProperties( id, event) {
			var sequenceVersion= "";
			if(document.getElementById('sequenceVersion')!=null){
				sequenceVersion= document.getElementById('sequenceVersion').value;
			}
			//alert('--------------------------<adddd'+id);
			if(id.indexOf("SEQ_IF")>-1 || id.indexOf("SEQ_SECTION")>-1){
				$.post("ViewSeqSecDesc.htm",
						{
							properties_id_param:id,
							sequenceVersion : sequenceVersion
						},
						function(data,status){

							//var content=$("#prop_menu_place_holder").html();
							var $response=$(data);

							var propertyMenu = $response.filter("#response_prop_menu").html();


							$("#prop_menu_place_holder").empty().append( propertyMenu );
							//alert("ID_HTML after: " + $( "#prop_menu_place_holder" ).html());

							showMenu1('prop_menu_place_holder', event)

						});
			}else{
				$.post("ViewProperties.htm",
				{
					properties_id_param:id,
					sequenceVersion : sequenceVersion
				},
				function(data,status){

					//var content=$("#prop_menu_place_holder").html();
					var $response=$(data);

					var propertyMenu = $response.filter("#response_prop_menu").html();


					$("#prop_menu_place_holder").empty().append( propertyMenu );
					//alert("ID_HTML after: " + $( "#prop_menu_place_holder" ).html());

					showMenu1('prop_menu_place_holder', event)

				});
			}
	}

	function askForAdditionalInput( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, asynchSourceRow, asynchSourceCol, sysSeqId){
 	    if(user_request_action_param=='add_and_display_action' && document.getElementById('selectedSourceDestination').value=='SOURCE'){
 	    	var dialog = $('<p>Options</p>').dialog({
	            buttons: {
	           	 "Add":  function() {
	                    dialog.dialog('close');
	                    url = addUrlParameter( url, "add_position_enum_param", "SAME_LEVEL");
	                    seqUpdate( user_request_action_param,  sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

	                },
	                "Add As Parent": function() {
		               	 dialog.dialog('close');
		               	 url = addUrlParameter( url, "add_position_enum_param", "ADD_AS_PARENT");
		               	 seqUpdate( user_request_action_param,  sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

		                }
	            }
	        });
 	    }else if(user_request_action_param=='add_and_display_action' && document.getElementById('selectedSourceDestination').value=='DESTINATION' && document.getElementById('selectedSystemType').value.indexOf('sys_seq') <0){
 	    	var dialog = $('<p>Options</p>').dialog({
	            buttons: {
	           	   "Add Child": function() {
	               	 dialog.dialog('close');
	               	 url = addUrlParameter( url, "add_position_enum_param", "NEXT_LEVEL");
	               	 seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

	                }
	            }
	        });
	    }else if(user_request_action_param=='add_and_display_action' && document.getElementById('selectedCol').value>1 && document.getElementById('selectedSystemType').value.indexOf('sys_seq') <0){
	        var dialog = $('<p>Options</p>').dialog({
	            buttons: {
	           	 "Add":  function() {
	                    dialog.dialog('close');
	                    url = addUrlParameter( url, "add_position_enum_param", "SAME_LEVEL");
	                    seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

	                },
	                "Add Child": function() {
	               	 dialog.dialog('close');
	               	 url = addUrlParameter( url, "add_position_enum_param", "NEXT_LEVEL");
	               	 seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

	                },
	                "Add As Parent": function() {
		               	 dialog.dialog('close');
		               	 url = addUrlParameter( url, "add_position_enum_param", "ADD_AS_PARENT");
		               	 seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

		                },
	                "Replace":  function() {
	               	 dialog.dialog('close');
	               	 url = addUrlParameter( url, "add_position_enum_param", "REPLACE_LEVEL");
	               	 seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

	                }

	            }
	        });
		}else if(user_request_action_param=='add_and_display_action' && document.getElementById('selectedCol').value==1 && document.getElementById('selectedSystemType').value.indexOf('sys_seq') <0){
	        var dialog = $('<p>Options</p>').dialog({
	            buttons: {
	           	 "Add Child":  function() {
	                    dialog.dialog('close');
	                    url = addUrlParameter( url, "add_position_enum_param", "NEXT_LEVEL");
	                    seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

	                },
		             "Replace":  function() {
		               	 dialog.dialog('close');
		               	 url = addUrlParameter( url, "add_position_enum_param", "REPLACE_LEVEL");
		               	 seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

		           }

	            }
	        });
		}else if(user_request_action_param=='add_and_display_action' ){
			var dialog = $('<p>Options</p>').dialog({
	            buttons: {
	           	 "Add":  function() {
						dialog.dialog('close');
	                    url = addUrlParameter( url, "add_position_enum_param", "SAME_LEVEL");
	                    seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

	                },
	                "Add As Parent": function() {
		               	dialog.dialog('close');
		               	 url = addUrlParameter( url, "add_position_enum_param", "ADD_AS_PARENT");
		               	 seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

		                },
	             "Replace":  function() {
	               	 dialog.dialog('close');
	               	 url = addUrlParameter( url, "add_position_enum_param", "REPLACE_LEVEL");
	               	 seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

	                }

	            }
	        });

		}else if (user_request_action_param=='delete_and_display_action'){
			if(document.getElementById('selectedCol').value==3){
				var dialog = $('<p>Are you sure you want to delete the parent and all child interactions ?<br/><font size=2>Hint : Try replacing if you just want to change the parent.</font></p>').dialog({
		            buttons: {
		           	 "Yes":  function() {
						dialog.dialog('close');
						seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

		                },
			             "No":  function() {
			            	 dialog.dialog('close');
			            }

		            }
		        });
			}else{
				var dialog = $('<p>Do you want to delete all child interactions ?</p>').dialog({
		            buttons: {
		           	 "Yes":  function() {
							dialog.dialog('close');
		           		    seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);
		                },
		             "No":  function() {
						 dialog.dialog('close');
		            	 seqUpdate( 'delete_parent_only_and_display_action', sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

		                }

		            }
		        });

			}//end if
		}else if (user_request_action_param=='copy_and_display_action' || user_request_action_param=='cut_and_display_action'){
       	 	seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

		}else if (user_request_action_param=='paste_and_display_action' && document.getElementById('selectedSourceDestination').value=='SOURCE'){
			var dialog = $('<p>Options</p>').dialog({
	            buttons: {
	           	 "Paste Same Level":  function() {
	                    dialog.dialog('close');
	                    url = addUrlParameter( url, "add_position_enum_param", "SAME_LEVEL");
	                    seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

	                }

	            }
	        });
		}else if (user_request_action_param=='paste_and_display_action' && (document.getElementById('selectedSourceDestination').value=='DESTINATION'
				    || document.getElementById('selectedRow').value==1)){
			var dialog = $('<p>Options</p>').dialog({
	            buttons: {
	                "Paste As Child": function() {
	               	 dialog.dialog('close');
	               	 url = addUrlParameter( url, "add_position_enum_param", "NEXT_LEVEL");
	               	 seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

	                }

	            }
	        });
		}else if (user_request_action_param=='paste_and_display_action'){
			var dialog = $('<p>Options</p>').dialog({
	            buttons: {
	           	 "Paste Same Level":  function() {
	                    dialog.dialog('close');
	                    url = addUrlParameter( url, "add_position_enum_param", "SAME_LEVEL");
	                    seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

	                },
	                "Paste As Child": function() {
	               	 dialog.dialog('close');
	               	 url = addUrlParameter( url, "add_position_enum_param", "NEXT_LEVEL");
	               	 seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId);

	                }

	            }
	        });
		}else if (user_request_action_param=='asynch_paste_action'){
			seqAsynchUpdate(user_request_action_param, seq_mst_id_param, output_type_param, url, asynchSourceRow, asynchSourceCol, sysSeqId);
		}
	}


	function seqUpdateOpenClose( user_request_action_param, sequenceVersion, seq_mst_id_param, row_no_param, col_no_param, url, sysSeqId) {

		$.post(url,
				{
					user_request_action_param:user_request_action_param,
					seq_mst_id_param:seq_mst_id_param,
					sequenceVersion:sequenceVersion,
					sys_seq_id:sysSeqId,
					row_no_param:row_no_param,
					col_no_param:col_no_param
				},
				function(data,status){

					//var content=$("#prop_menu_place_holder").html();
					var $response=$(data);
					var seqDet = $response.filter("#response_seqdet").html();

					var error = $response.filter("#error").html();
					if(error!=null){
						$("#error").empty().append( error );
					}
					$("#seq_det_holder").empty().append( seqDet );
					linkFields();
				});
	}
	function seqUpdate( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sysSeqId) {

		$.post(url,
				{
					user_request_action_param:user_request_action_param,
					seq_mst_id_param:seq_mst_id_param,
					sequenceVersion:sequenceVersion,
					output_type_param:output_type_param,
					sys_seq_id:sysSeqId,
					seq_item_id_param:document.getElementById('selectedSeqItemId').value,
					row_no_param:document.getElementById('selectedRow').value,
					col_no_param:document.getElementById('selectedCol').value
				},
				function(data,status){

					//var content=$("#prop_menu_place_holder").html();
					var $response=$(data);
					var seqDet = $response.filter("#response_seqdet").html();
					var error = $response.filter("#error").html();
					if(error!=null){
						$("#error").empty().append( error );
					}
					if(seqDet!=null){
					$("#seq_det_holder").empty().append( seqDet );
					linkFields();
					}
					bodyOnClick();

					//Add Asynch Destination Paste to Menu
					if (user_request_action_param=='update_to_asynch_display_action'){
                        var asynchSystemMenu= "<tr id=systemToBeRemoved_"+document.getElementById('selectedRow').value+"_"+document.getElementById('selectedCol').value+" onclick=\"JavaScript:askForAdditionalInput('asynch_paste_action', '"+sequenceVersion+"','"+seq_mst_id_param+"' , '"+output_type_param+"', '"+url+"',"+document.getElementById('selectedRow').value+","+document.getElementById('selectedCol').value+" ,"+sysSeqId +")\" onmouseout=\"this.bgColor='#F6F6F6'; \" > <td width=\"150\" nowrap=\"nowrap\" height=\"20\" align=\"left\"><strong>Paste Asynch "+document.getElementById('selectedAsynchSourceDestinationName').value+"<strong></td> </tr>";
                        var asynchCustomerMenu= "<tr id=customerToBeRemoved_"+document.getElementById('selectedRow').value+"_"+document.getElementById('selectedCol').value+" onclick=\"JavaScript:askForAdditionalInput('asynch_paste_action', '"+sequenceVersion+"','"+seq_mst_id_param+"' , '"+output_type_param+"', '"+url+"',"+document.getElementById('selectedRow').value+","+document.getElementById('selectedCol').value+" ,"+sysSeqId +")\" onmouseout=\"this.bgColor='#F6F6F6'; \" > <td width=\"150\" nowrap=\"nowrap\" height=\"20\" align=\"left\"><strong>Paste Asynch "+document.getElementById('selectedAsynchSourceDestinationName').value+"<strong></td> </tr>";
                        var asynchIfMenu= "<tr id=ifToBeRemoved_"+document.getElementById('selectedRow').value+"_"+document.getElementById('selectedCol').value+" onclick=\"JavaScript:askForAdditionalInput('asynch_paste_action', '"+sequenceVersion+"','"+seq_mst_id_param+"' , '"+output_type_param+"', '"+url+"',"+document.getElementById('selectedRow').value+","+document.getElementById('selectedCol').value+" ,"+sysSeqId +")\" onmouseout=\"this.bgColor='#F6F6F6'; \" > <td width=\"150\" nowrap=\"nowrap\" height=\"20\" align=\"left\"><strong>Paste Asynch "+document.getElementById('selectedAsynchSourceDestinationName').value+"<strong></td> </tr>";
                        var asynchSectionMenu= "<tr id=sectionToBeRemoved_"+document.getElementById('selectedRow').value+"_"+document.getElementById('selectedCol').value+" onclick=\"JavaScript:askForAdditionalInput('asynch_paste_action', '"+sequenceVersion+"','"+seq_mst_id_param+"' , '"+output_type_param+"', '"+url+"',"+document.getElementById('selectedRow').value+","+document.getElementById('selectedCol').value+" ,"+sysSeqId +")\" onmouseout=\"this.bgColor='#F6F6F6'; \" > <td width=\"150\" nowrap=\"nowrap\" height=\"20\" align=\"left\"><strong>Paste Asynch "+document.getElementById('selectedAsynchSourceDestinationName').value+"<strong></td> </tr>";
                        var asynchSourceMenu= "<tr id=sourceToBeRemoved_"+document.getElementById('selectedRow').value+"_"+document.getElementById('selectedCol').value+" onclick=\"JavaScript:askForAdditionalInput('asynch_paste_action', '"+sequenceVersion+"','"+seq_mst_id_param+"' , '"+output_type_param+"', '"+url+"',"+document.getElementById('selectedRow').value+","+document.getElementById('selectedCol').value+" ,"+sysSeqId +")\" onmouseout=\"this.bgColor='#F6F6F6'; \" > <td width=\"150\" nowrap=\"nowrap\" height=\"20\" align=\"left\"><strong>Paste Asynch "+document.getElementById('selectedAsynchSourceDestinationName').value+"<strong></td> </tr>";
                        var asynchDestinationMenu= "<tr id=destinationToBeRemoved_"+document.getElementById('selectedRow').value+"_"+document.getElementById('selectedCol').value+" onclick=\"JavaScript:askForAdditionalInput('asynch_paste_action', '"+sequenceVersion+"','"+seq_mst_id_param+"' , '"+output_type_param+"', '"+url+"',"+document.getElementById('selectedRow').value+","+document.getElementById('selectedCol').value+" ,"+sysSeqId +")\" onmouseout=\"this.bgColor='#F6F6F6'; \" > <td width=\"150\" nowrap=\"nowrap\" height=\"20\" align=\"left\"><strong>Paste Asynch "+document.getElementById('selectedAsynchSourceDestinationName').value+"<strong></td> </tr>";
                        $("#system_menu_append").append( asynchSystemMenu );
                        $("#customer_menu_append").append( asynchCustomerMenu );
                        $("#ifCondition_menu_append").append( asynchIfMenu );
                        $("#sequenceSection_menu_append").append( asynchSectionMenu );
                        $("#asynchSource_menu_append").append( asynchSourceMenu );
                        $("#asynchDestination_menu_append").append( asynchDestinationMenu );
	                }else if (user_request_action_param=='update_to_synch_display_action'){

						var asynchId=document.getElementById('selectedRow').value+'_'+document.getElementById('selectedCol').value;

	                    $('#systemToBeRemoved_'+asynchId).remove();
	                    $('#customerToBeRemoved_'+asynchId).remove();
	                    $('#ifToBeRemoved_'+asynchId).remove();
	                    $('#sectionToBeRemoved_'+asynchId).remove();
	                    $('#sourceToBeRemoved_'+asynchId).remove();
	                    $('#destinationToBeRemoved_'+asynchId).remove();
	                }//end if

				});
	var numberOfRows=document.getElementById('numberOfRows').value;
	//alert("numberOfRows="+numberOfRows);
// 	for (var i=1; i<=numberOfRows; i++)
// 	{
//		alert("height table_SYSTEM="+$("#table_SYSTEM"+i).height());
//		alert("height table_SYSTEM_LAST_CONNECTOR="+$("#table_SYSTEM_LAST_CONNECTOR"+i).height());
//		alert("height table_CROSS_OVER_LINE="+$("#table_CROSS_OVER_LINE"+i).height());
//		alert("height table_CONNECTOR="+$("#table_CONNECTOR"+i).height());
//		alert("height table_SYSTEM_CONNECTOR="+$("#table_SYSTEM_CONNECTOR"+i).height());
// 		var maxHeight=0;
// 		if($("#table_SYSTEM"+i).height()>maxHeight){
// 			maxHeight=$("#table_SYSTEM"+i).height();
// 		}
// 		if($("#table_SYSTEM_LAST_CONNECTOR"+i).height()>maxHeight){
// 			maxHeight=$("#table_SYSTEM_LAST_CONNECTOR"+i).height();
// 		}
// 		if($("#table_CROSS_OVER_LINE"+i).height()>maxHeight){
// 			maxHeight=$("#table_CROSS_OVER_LINE"+i).height();
// 		}
// 		if($("#table_CONNECTOR"+i).height()>maxHeight){
// 			maxHeight=$("#table_CONNECTOR"+i).height();
// 		}
// 		if($("#table_SYSTEM_CONNECTOR"+i).height()>maxHeight){
// 			maxHeight=$("#table_SYSTEM_CONNECTOR"+i).height();
// 		}
// 		$("#table_SYSTEM_CONNECTOR"+i).height(maxHeight);
// 		$("#table_CONNECTOR"+i).height(maxHeight);
// 		$("#table_CROSS_OVER_LINE"+i).height(maxHeight);
// 		$("#table_SYSTEM_LAST_CONNECTOR"+i).height(maxHeight);
// 		$("#table_SYSTEM"+i).height(maxHeight);
// 		$("#table_IF_BORDER"+i).height(maxHeight);
		//alert("maxHeight="+maxHeight);
		//alert("table_CROSS_OVER_LINE="+$("#table_CROSS_OVER_LINE"+i).height());
// 		var td_width=$("#td_SYSTEM"+i).width();
// 		$("#table_SYSTEM"+i).width(td_width);
		//if(i==2){
	//	alert("row="+i);
		//alert("system width="+$("#table_SYSTEM"+i).width());
		//alert("td width="+$("#td_SYSTEM"+i).width());

		//alert("AFTER system width="+$("#table_SYSTEM"+i).width());
		//}
// 	}//end for
}

	function seqAsynchUpdate( user_request_action_param, seq_mst_id_param, output_type_param, url, asynchSourceRow, asynchSourceCol, sysSeqId) {
		var sequenceVersion= "";
		if(document.getElementById('sequenceVersion')!=null){
			sequenceVersion= document.getElementById('sequenceVersion').value;
		}
	if(document.getElementById('selectedRow').value >=asynchSourceRow){
		$.post(url,
				{
					user_request_action_param:user_request_action_param,
					seq_mst_id_param:seq_mst_id_param,
					output_type_param:output_type_param,
					sequenceVersion:sequenceVersion,
					seq_item_id_param:document.getElementById('selectedSeqItemId').value,
					row_no_param:document.getElementById('selectedRow').value,
					col_no_param:document.getElementById('selectedCol').value,
					asynch_source_row_param:asynchSourceRow,
					asynch_source_col_param:asynchSourceCol
				},
				function(data,status){

					//var content=$("#prop_menu_place_holder").html();
					var $response=$(data);
					var seqDet = $response.filter("#response_seqdet").html();
					var error = $response.filter("#error").html();
					if(error!=null){
						$("#error").empty().append( error );
					}
					if(seqDet!=null){
					$("#seq_det_holder").empty().append( seqDet );
					linkFields();
					var asynchId=asynchSourceRow+'_'+asynchSourceCol;

                    $('#systemToBeRemoved_'+asynchId).remove();
                    $('#customerToBeRemoved_'+asynchId).remove();
                    $('#ifToBeRemoved_'+asynchId).remove();
                    $('#sectionToBeRemoved_'+asynchId).remove();
                    $('#sourceToBeRemoved_'+asynchId).remove();
                    $('#destinationToBeRemoved_'+asynchId).remove();

					}

					bodyOnClick();
				});
			var numberOfRows=document.getElementById('numberOfRows').value;
		}else{
			alert("Asynchronouse response cannot be before request. Please read FAQ - How can I make a interaction asynchronous?");
		}
	//alert("numberOfRows="+numberOfRows);

}


	function proceed( user_request_action_param, sequenceVersion, seq_mst_id_param, output_type_param, url, sys_seq_id) {
		url = addUrlParameter( url, "row_no_param", document.getElementById('selectedRow').value);
		url = addUrlParameter( url, "col_no_param", document.getElementById('selectedCol').value);
		url = addUrlParameter( url, "sequenceVersion", sequenceVersion);
		url = addUrlParameter( url, "user_request_action_param", user_request_action_param);
		url = addUrlParameter( url, "seq_mst_id_param", seq_mst_id_param);
		url = addUrlParameter( url, "sys_seq_id", sys_seq_id);
		url = addUrlParameter( url, "output_type_param", output_type_param);

		url = addScrollPositionsToUrl(encodeURI(url));
		FireUrlHrefEvent(url);
	}

      </script>
</head>
<body onunload="javascript:closeWaitWindow()" onclick="javascript:bodyOnClick()" onkeypress="javascript:bodyOnKeyPress(event)" onload="initSkin();">
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


<div id="temp_input_container">
</div>
<div class="container">
 <%
    // HttpSession session = httpServlet.getSession();

    // 		NavItem selectedUc = (NavItem) session.getAttribute("selectedUc");

    // 		pageContext.setAttribute("selectedUc", selectedUc);
    %>
 <script type="text/javascript"
 src="
 <c:url value="/javascript/utils.js"/>
 ">
 </script>
 <c:if test="${modelUc.isEdited!='Y'}">
    <!--<div align="center"  style="width: 1360px;left: 100px; top: 100px;background-color: #E7ECEE;border-width:medium;border-style:solid;border-color: #DDE4E6;float: right;width:100%;">
       -->
    <c:if test="${modelUc.status=='EDITED'}">
       <c:redirect url="${modelUc.redirectUri}"/>
    </c:if>
    <table align="center" border="0" width=70%>
       <tr>
          <td>
             <table   border="0" align="left">
                <tr>
                   <td colspan="2" class="${modelUc.editclassSeqName}" id="seqMstName----${modelUc.ucId}----${modelUc.seqMstId}" style="word-wrap:break-word;font-family:times;color:#98bf21;font-size:24px;vertical-align: bottom;font-weight: bold;text-align: center;" >${modelUc.seqName} </td>
                   <td style="word-wrap:break-word;font-family:times;color:black;font-size:20px;vertical-align: bottom;font-weight: bold;text-align: center;">
                      <div >(${modelUc.sequeneVersionTitle}) <span>${modelUc.ucSeqMst.changeTitle}  ${modelUc.ucSeqMst.changeNote}</span></div>
                   </td>
                </tr>
                <c:if test="${modelUc.showSaveSequence=='true'}">
                   <tr>
                      <td>
                         <input width="150" type="submit" value="Edit Sequence" onclick="proceed('edit_sequence_action', '${modelUc.sequenceVersion}', '${modelUc.seqMstId}', 'output_type_param', '${modelUc.CONTEXT_PATH}/SeqDetA.htm', '${modelUc.sysSeqId}');"/>
                      </td>
                   </tr>
                </c:if>
             </table>
          </td>
          <c:if test="${modelUc.toolTip!='null' and  modelUc.toolTip!='NO_TIP'}">
             <td>
                <table align="right">
                   <tr>
                      <td>
                         <c:if test="${modelUc.toolTip=='MENU_TIP'}">
                            <div id="tool_tip" class="bubble" style="width:500px;height:60px;">
                               Tip : Click on menu <a title="Menu" alt="Menu" height="20" width="20"><i class="fas fa-bars"></i></a>
                               " > below and select interaction action, check <a href="<c:url value="www.qsequence.com/faq.htm#new_sequence"/>"><strong>FAQ - Creating Your First Sequence</strong></a>
                            </div>
                         </c:if>
                         <c:if test="${modelUc.toolTip=='SEQUENCE_NAME_EDIT_TIP'}">
                            <div id="tool_tip" class="bubble" style="width:500px;height:30px;">Tip : Click on the sequence name to edit. </div>
                         </c:if>
                         <c:if test="${modelUc.toolTip=='PROPERTIES_TIP'}">
                            <div id="tool_tip" class="bubble" style="width:500px;height:60px;">
                               Tip : Click on <img title="Information" alt="Information" height="20" width="20" src="
                               <c:url value="/images/information_injection.png" />
                               " > to edit or view existing properties, check <a href="<c:url value="www.qsequence.com/faq.htm#properties"/>"><strong>FAQ - properties</strong></a>
                            </div>
                         </c:if>
                         <c:if test="${modelUc.toolTip=='ASYNCH_MENU_SAVE_ERROR'}">
                            <div id="tool_tip" class="bubble" style="width:500px;height:60px;">
                               Error : Save error, you have <strong>Paste Asynch</strong> in the menu <a title="Menu" alt="Menu" height="20" width="20" ><i class="fas fa-bars"></i></a>
                               " > before you save you need to paste, or discard changes, please have a look at  <a href="<c:url value="www.qsequence.com/faq.htm#asynch"/>"><strong>FAQ - how to create asynchronous interactions</strong></a>
                            </div>
                         </c:if>
                         <c:if test="${modelUc.toolTip=='SYS_SEQ_SAVE_ERROR'}">
                            <div id="tool_tip" class="bubble" style="width:500px;height:60px;">Error : Save error, ${modelUc.error}  </div>
                         </c:if>
                      </td>
                   </tr>
                </table>
             </td>
          </c:if>
       </tr>
    </table>
    <!--</div>
       -->
 </c:if>
 <c:if test="${modelUc.isEdited=='Y'}">
    <table align="center" border="0" width=70%>
       <tr>
          <td>
             <table border="0" align="left">
                <tr>
                   <td colspan="2" class="${modelUc.editclass}" id="seqMstName----${modelUc.ucId}----${modelUc.seqMstId}" style="word-wrap:break-word;font-family:times;color:#98bf21;font-size:24px;vertical-align: bottom;font-weight: bold;text-align: center;">${modelUc.seqName}</td>
                   <td style="word-wrap:break-word;font-family:times;color:black;font-size:20px;vertical-align: bottom;font-weight: bold;text-align: center;">
                      <div >(${modelUc.sequeneVersionTitle}) <span>${modelUc.ucSeqMst.changeTitle}  ${modelUc.ucSeqMst.changeNote}</span></div>
                   </td>
                </tr>
                <c:if test="${modelUc.showSaveSequence=='true'}">
                   <tr>
                      <td>
                         <input type="submit" value="Save Sequence" onclick="proceed('save_sequence_action', '${modelUc.sequenceVersion}', '${modelUc.seqMstId}','output_type_param', '${modelUc.CONTEXT_PATH}/SeqDetA.htm', '${modelUc.sysSeqId}');" />
                      </td>
                      <td>
                         <input type="submit" value="Discard changes" onclick="proceed('discard_and_display_action', '${modelUc.sequenceVersion}', '${modelUc.seqMstId}','output_type_param', '${modelUc.CONTEXT_PATH}/SeqDetA.htm', '${modelUc.sysSeqId}');"/>
                      </td>
                   </tr>
                </c:if>
             </table>
          </td>
          <c:if test="${modelUc.toolTip!='NO_TIP' and modelUc.toolTip!='null'}">
             <td>
                <table border="0" align="right">
                   <tr>
                      <td>
                         <c:if test="${modelUc.toolTip=='MENU_TIP'}">
                            <div id="tool_tip" class="bubble" style="width:500px;height:60px;">
                               Tip : Click on menu <a title="Menu" alt="Menu" height="20" width="20" ><i class="fas fa-bars"></i></a>
                               " > below and select interaction, for more details on what you can create click <a href="<c:url value="www.qsequence.com/faq.htm#CreatingFirstSequence"/>">FAQ - Creating Your First Sequence</a>
                            </div>
                         </c:if>
                         <c:if test="${modelUc.toolTip=='SEQUENCE_NAME_EDIT_TIP'}">
                            <div id="tool_tip" class="bubble" style="width:500px;height:30px;">Tip : Click on the sequence name to edit. </div>
                         </c:if>
                         <c:if test="${modelUc.toolTip=='PROPERTIES_TIP'}">
                            <div id="tool_tip" class="bubble" style="width:500px;height:60px;">
                               Tip : Click on <img title="Information" alt="Information" height="20" width="20" src="
                               <c:url value="/images/information_injection.png" />
                               " > to edit or view existing details, check <a href="<c:url value="www.qsequence.com/faq.htm#properties"/>"><strong>FAQ - properties</strong></a>
                            </div>
                         </c:if>
                         <c:if test="${modelUc.toolTip=='ASYNCH_MENU_SAVE_ERROR'}">
                            <div id="tool_tip" class="bubble" style="width:500px;height:60px;">
                               Error : Save error, you have <strong>Paste Asynch</strong> in the menu <a title="Menu" alt="Menu" height="20" width="20" ><i class="fas fa-bars"></i></a>
                               " > before you save you need to paste, or discard changes, please have a look at  <a href="<c:url value="www.qsequence.com/faq.htm#asynch"/>"><strong>FAQ - how to create asynchronous interactions</strong></a>
                            </div>
                         </c:if>
                         <c:if test="${modelUc.toolTip==null or modelUc.toolTip=='NO_TIP'}">
                            &nbsp;
                         </c:if>
                      </td>
                   </tr>
                </table>
             </td>
          </c:if>
       </tr>
    </table>
    <!--</div>
       -->
 </c:if>
 <div>
    <div id="error" align="center" style="width: 1360px;left: 100px; top: 100px;float: right;width:100%;">
       <font size="5" color="red">
       ${modelUc.error}
       </font>
    </div>
    <input id="sequenceVersion" name="sequenceVersion" type="hidden" value="${modelUc.sequenceVersion}" />
    <input type="hidden" id="selectedComboGrid">
    <input type="hidden" id="selectedSeqItemId">
    <input type="hidden" id="selectedRow">
    <input type="hidden" id="selectedCol">
    <input type="hidden" id="selectedSourceDestination">
    <input type="hidden" id="selectedAsynchSourceDestinationName">
    <input type="hidden" id="selectedSystemType">
    <input type="hidden" id="selectedUc" value="${modelUc.ucId}">
    <input type="hidden" id="selectedSystem">
    <input type="hidden" id="selectedUcEdited" value="${modelUc.isEdited}">
    <input type="hidden" id="numberOfRows" value="${modelUc.numberOfRows}">
 </div>
 <%-- 	<c:if test="${modelUc.userRequestAction!='default_action'}"> --%>
 <div  id="seq_det_holder">
    <table border="0" cellpadding="0" cellspacing="0" width="100%">
       <c:forEach items="${modelUc.ucDisplayDataRowList}" var="row" >
          <tr>
             <c:forEach items="${row}" var="col" >
                <c:if test="${col.ucObjectEnum=='customer'  or col.ucObjectEnum=='system' or col.ucObjectEnum=='system11' or col.ucObjectEnum=='system13' or col.ucObjectEnum=='asynchSource' or col.ucObjectEnum=='asynchDestination' or col.ucObjectEnum=='ifCondition' or col.ucObjectEnum=='sequenceSection'}">
                   <td id="td_SYSTEM${col.ucSeqDiagram.rowNo}" align=center valign="top"  height="100" width="150" ${col.htmlStr} >
                   <table id="table_SYSTEM${col.ucSeqDiagram.rowNo}" align="center" height="100%" width="100%" cellpadding="0" cellspacing="0">
                      <tr>
                         <c:if test="${col.ucSeqDiagram.expanded!=null}">
                            <!-- TR 1-->
                            <!-- TD 1-->
                            <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='SOURCE'}">
                               <td height="15%" width="15%" style="vertical-align: top;text-align: left;border-top: 4px dashed gray;border-left: 4px dashed gray;">
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='DESTINATION'}">
                            <td height="15%" width="15%" style="vertical-align: top;text-align: left;border-left: 4px dashed gray;">
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.asynchSourceDestination==null}">
                            <td height="15%" width="15%" style="vertical-align: top;text-align: left;">
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.expanded=='true'}">
                            <a class="mousetoHand" onclick="seqUpdateOpenClose( 'close_tree_node', '${modelUc.sequenceVersion}', '${col.ucSeqDiagram.seqMstId}', ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '<c:url value="/GetSeqUpdate.htm" />', '${col.ucSeqDiagram.sysSeqId}');" ><i class="fas fa-minus-circle"></i></a>
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.expanded!='true'}">
                            <a class="mousetoHand" onclick="seqUpdateOpenClose( 'expand_tree_node', '${modelUc.sequenceVersion}', '${col.ucSeqDiagram.seqMstId}', ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '<c:url value="/GetSeqUpdate.htm" />', '${col.ucSeqDiagram.sysSeqId}');"><i class="fas fa-plus-circle"></i></a>
                            </c:if>
                            </td>
                            <!-- TD 2-->
                            <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='SOURCE'}">
                               <td style="vertical-align: top;text-align: right;border-right: 4px dashed gray;border-top: 4px dashed gray;">
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='DESTINATION'}">
                            <td style="vertical-align: top;text-align: right;border-right: 4px dashed gray;">
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.asynchSourceDestination==null}">
                            <td style="vertical-align: top;text-align: right;">
                            </c:if>
                            <c:if test="${modelUc.editclass=='editable'}">
                            <c:if test="${col.ucSeqDiagram.seqItemId!=null and col.ucSeqDiagram.asynchSourceDestination !=null}">
                            <a  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20"
                            onclick="showMenu1('${col.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(${col.ucSeqDiagram.seqItemId}, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '${col.ucSeqDiagram.asynchSourceDestination}', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');"><i class="fas fa-bars"></i></a>
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.seqItemId!=null and col.ucSeqDiagram.asynchSourceDestination ==null}">
                            <a  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20"
                            onclick="showMenu1('${col.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(${col.ucSeqDiagram.seqItemId}, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');"><i class="fas fa-bars"></i></a>
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.seqItemId==null  and col.ucSeqDiagram.asynchSourceDestination !=null}">
                            <c:if test="${ col.ucSeqDiagram.asynchSourceDestination=='SOURCE' or (col.ucSeqDiagram.asynchSourceDestination=='DESTINATION' and not(fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq')))}">
                            <a  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20"
                            onclick="showMenu1('${col.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(0, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '${col.ucSeqDiagram.asynchSourceDestination}', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');"><i class="fas fa-bars"></i></a>
                            </c:if>
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.seqItemId==null  and col.ucSeqDiagram.asynchSourceDestination ==null}">
                            <a  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20"
                            onclick="showMenu1('${col.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(0, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');"><i class="fas fa-bars"></i></a>
                            </c:if>
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.seqItemId!=null   and col.ucSeqDiagram.asynchSourceDestination !=null}">
                            <a id="SYS_${col.ucSeqDiagram.rowNo}_${col.ucSeqDiagram.colNo}" class="${col.ucSeqDiagram.systemAccess}" title="Information" alt="Information" height="20" width="20"
                            onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${col.ucSeqDiagram.seqItemId}, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '${col.ucSeqDiagram.asynchSourceDestination}', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');"><i class="fas fa-info-circle"></i></a>
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.seqItemId!=null   and col.ucSeqDiagram.asynchSourceDestination ==null}">
                            <a id="SYS_${col.ucSeqDiagram.rowNo}_${col.ucSeqDiagram.colNo}" class="${col.ucSeqDiagram.systemAccess}" title="Information" alt="Information" height="20" width="20"
                            onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${col.ucSeqDiagram.seqItemId}, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');"><i class="fas fa-info-circle"></i></a>
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.seqItemId==null and col.ucSeqDiagram.asynchSourceDestination !=null}">
                            <a id="SYS_${col.ucSeqDiagram.rowNo}_${col.ucSeqDiagram.colNo}" class="${col.ucSeqDiagram.systemAccess}" title="Information" alt="Information" height="20" width="20"
                            onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( 0, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '${col.ucSeqDiagram.asynchSourceDestination}', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');"><i class="fas fa-info-circle"></i></a>
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.seqItemId==null and col.ucSeqDiagram.asynchSourceDestination ==null}">
                            <a  id="SYS_${col.ucSeqDiagram.rowNo}_${col.ucSeqDiagram.colNo}" class="${col.ucSeqDiagram.systemAccess}" title="Information" alt="Information" height="20" width="20"
                            onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( 0, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');"><i class="fas fa-info-circle"></i></a>
                            </c:if>
                            </td>
                         </c:if>
                         <!-- TD 1-->
                         <c:if test="${col.ucSeqDiagram.expanded==null and modelUc.editclass=='editable'}">
                            <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='SOURCE'}">
                               <td colspan="2" height="15%" width="15%" align="right" style="vertical-align: top;text-align: right;border-right: 4px dashed gray;border-left: 4px dashed gray;border-top: 4px dashed gray;">
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='DESTINATION'}">
                            <td colspan="2" height="15%" width="15%" align="right" style="vertical-align: top;text-align: right;border-right: 4px dashed gray;border-left: 4px dashed gray;">
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.asynchSourceDestination==null}">
                            <td colspan="2" height="15%" width="15%" align="right" style="vertical-align: top;text-align: right;">
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.seqItemId!=null and col.ucSeqDiagram.asynchSourceDestination !=null}">
                            <c:if test="${ col.ucSeqDiagram.asynchSourceDestination=='SOURCE' or (col.ucSeqDiagram.asynchSourceDestination=='DESTINATION' and not(fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq')))}">
                            <a  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20"
                            onclick="showMenu1('${col.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(${col.ucSeqDiagram.seqItemId}, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '${col.ucSeqDiagram.asynchSourceDestination}', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');"><i class="fas fa-bars"></i></a>
                            </c:if>
                            <a  id="SYS_${col.ucSeqDiagram.rowNo}_${col.ucSeqDiagram.colNo}" class="${col.ucSeqDiagram.systemAccess}" title="Information" alt="Information" height="20" width="20"
                            onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${col.ucSeqDiagram.seqItemId}, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '${col.ucSeqDiagram.asynchSourceDestination}', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');">
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.seqItemId!=null and col.ucSeqDiagram.asynchSourceDestination !=null}">
                            <c:if test="${ col.ucSeqDiagram.asynchSourceDestination=='SOURCE' or (col.ucSeqDiagram.asynchSourceDestination=='DESTINATION' and not(fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq')))}">
                            <a  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20"
                            onclick="showMenu1('${col.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(${col.ucSeqDiagram.seqItemId}, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '${col.ucSeqDiagram.asynchSourceDestination}', '${col.ucSeqDiagram.systemName}');"><i class="fas fa-bars"></i></a>
                            </c:if>
                            <a  id="SYS_${col.ucSeqDiagram.rowNo}_${col.ucSeqDiagram.colNo}" class="${col.ucSeqDiagram.systemAccess}" title="Information" alt="Information" height="20" width="20"
                            onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${col.ucSeqDiagram.seqItemId}, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '${col.ucSeqDiagram.asynchSourceDestination}', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');">
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.seqItemId!=null and col.ucSeqDiagram.asynchSourceDestination ==null}">
                            <a  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20"
                            onclick="showMenu1('${col.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(${col.ucSeqDiagram.seqItemId}, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '', '${col.ucSeqDiagram.systemName}');"><i class="fas fa-bars"></i></a>
                            <a  id="SYS_${col.ucSeqDiagram.rowNo}_${col.ucSeqDiagram.colNo}" class="${col.ucSeqDiagram.systemAccess}" title="Information" alt="Information" height="20" width="20"
                            onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${col.ucSeqDiagram.seqItemId}, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');">
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.seqItemId==null and col.ucSeqDiagram.asynchSourceDestination !=null}">
                            <c:if test="${ col.ucSeqDiagram.asynchSourceDestination=='SOURCE' or (col.ucSeqDiagram.asynchSourceDestination=='DESTINATION' and not(fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq')))}">
                            <a  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20"
                            onclick="showMenu1('${col.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(0, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '${col.ucSeqDiagram.asynchSourceDestination}', '${col.ucSeqDiagram.systemName}');"><i class="fas fa-bars"></i></a>
                            </c:if>
                            <a  id="SYS_${col.ucSeqDiagram.rowNo}_${col.ucSeqDiagram.colNo}" class="${col.ucSeqDiagram.systemAccess}" title="Information" alt="Information" height="20" width="20"
                            onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( 0, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '${col.ucSeqDiagram.asynchSourceDestination}', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');">
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.seqItemId==null and col.ucSeqDiagram.asynchSourceDestination ==null}">
                            <a  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20"
                            onclick="showMenu1('${col.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(0, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '', '${col.ucSeqDiagram.systemName}');"><i class="fas fa-bars"></i></a>
                            <a  id="SYS_${col.ucSeqDiagram.rowNo}_${col.ucSeqDiagram.colNo}" class="${col.ucSeqDiagram.systemAccess}" title="Information" alt="Information" height="20" width="20"
                            onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( 0, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');"><i class="fas fa-info-circle"></i></a>
                            </c:if>
                            </td>
                         </c:if>
                         <c:if test="${col.ucSeqDiagram.expanded==null and modelUc.editclass!='editable'}">
                            <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='SOURCE'}">
                               <td colspan="2" height="15%" width="15%" align="right" style="vertical-align: top;text-align: right;border-left: 4px dashed gray;border-right: 4px dashed gray;border-top: 4px dashed gray;">
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='DESTINATION'}">
                            <td colspan="2" height="15%" width="15%" align="right" style="vertical-align: top;text-align: right;border-left: 4px dashed gray;border-right: 4px dashed gray;">
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.asynchSourceDestination==null}">
                            <td colspan="2" height="15%" width="15%" align="right" style="vertical-align: top;text-align: right;">
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.seqItemId!=null and col.ucSeqDiagram.asynchSourceDestination !=null}">
                            <a  id="SYS_${col.ucSeqDiagram.rowNo}_${col.ucSeqDiagram.colNo}" class="${col.ucSeqDiagram.systemAccess}" title="Information" alt="Information" height="20" width="20"
                            onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${col.ucSeqDiagram.seqItemId}, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '${col.ucSeqDiagram.asynchSourceDestination}', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');"><i class="fas fa-info-circle"></i></a>
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.seqItemId!=null and col.ucSeqDiagram.asynchSourceDestination ==null}">
                            <a  id="SYS_${col.ucSeqDiagram.rowNo}_${col.ucSeqDiagram.colNo}" class="${col.ucSeqDiagram.systemAccess}" title="Information" alt="Information" height="20" width="20"
                            onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${col.ucSeqDiagram.seqItemId}, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');"><i class="fas fa-info-circle"></i></a>
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.seqItemId==null  and col.ucSeqDiagram.asynchSourceDestination !=null}">
                            <a  id="SYS_${col.ucSeqDiagram.rowNo}_${col.ucSeqDiagram.colNo}"  class="${col.ucSeqDiagram.systemAccess}" title="Information" alt="Information" height="20" width="20"
                            onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( 0, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '${col.ucSeqDiagram.asynchSourceDestination}', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');"><i class="fas fa-info-circle"></i></a>
                            </c:if>
                            <c:if test="${col.ucSeqDiagram.seqItemId==null  and col.ucSeqDiagram.asynchSourceDestination ==null}">
                            <a  id="SYS_${col.ucSeqDiagram.rowNo}_${col.ucSeqDiagram.colNo}"  class="${col.ucSeqDiagram.systemAccess}" title="Information" alt="Information" height="20" width="20"
                            onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucId}_SEPERATOR_${col.ucSeqDiagram.seqMstId}_SEPERATOR_${col.ucSeqDiagram.seqItemId}_SEPERATOR_${col.ucSeqDiagram.systemId}_SEPERATOR_${col.ucSeqDiagram.requestId}_SEPERATOR_${col.ucSeqDiagram.responseId}_SEPERATOR_${col.ucSeqDiagram.rowNo}_SEPERATOR_${col.ucSeqDiagram.colNo}_SEPERATOR_${col.ucSeqDiagram.systemName}_SEPERATOR_${col.ucSeqDiagram.request}_SEPERATOR_${col.ucSeqDiagram.response}_SEPERATOR_${col.ucSeqDiagram.systemType}_SEPERATOR_${col.ucSeqDiagram.sysSeqId}', event);updateRwoCol( 0, ${col.ucSeqDiagram.rowNo}, ${col.ucSeqDiagram.colNo}, '', '${col.ucSeqDiagram.systemName}', '${col.ucSeqDiagram.systemType}');"><i class="fas fa-info-circle"></i></a>
                            </c:if>
                            </td>
                         </c:if>
                      </tr>
                      <!-- TR 2-->
                      <!-- TD 1-->
                      <tr>
                         <c:if test="${ col.ucObjectEnum=='ifCondition' or col.ucObjectEnum=='sequenceSection'}">
                            <td colspan="2" valign="bottom" align="center" class="${modelUc.editclass}" style="word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;border-bottom: 1px dashed gray;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}"  oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         <c:if test="${ col.ucObjectEnum!='ifCondition' and col.ucObjectEnum!='sequenceSection'}">
                         <!-- HAVE_A_LOOK -->
                         <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='SOURCE'}">
                         <c:if test="${ fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq') and modelUc.sequenceVersion=='sys_seq_draft' and col.ucSeqDiagram.rowNo ==1}">
                         <td colspan="2" valign="bottom" align="center" class="noteditable" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;border-right: 4px dashed gray;border-left: 4px dashed gray;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}" oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         <c:if test="${ not(fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq')) and modelUc.sequenceVersion=='sys_seq_draft' and col.ucSeqDiagram.rowNo ==1}">
                         <td colspan="2" valign="bottom" align="center" class="noteditable" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;border-right: 4px dashed gray;border-left: 4px dashed gray;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}" oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         <c:if test="${ not(fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq')) and modelUc.sequenceVersion!='sys_seq_draft' and col.ucSeqDiagram.rowNo ==1}">
                         <td colspan="2" valign="bottom" align="center" class="${modelUc.editclass}" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;border-right: 4px dashed gray;border-left: 4px dashed gray;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}" oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         <c:if test="${ fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq') and modelUc.sequenceVersion!='sys_seq_draft' and col.ucSeqDiagram.rowNo ==1}">
                         <td colspan="2" valign="bottom" align="center" class="noteditable" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;border-right: 4px dashed gray;border-left: 4px dashed gray;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}" oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         <c:if test="${ fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq') and modelUc.sequenceVersion=='sys_seq_draft' and col.ucSeqDiagram.rowNo !=1}">
                         <td colspan="2" valign="bottom" align="center" class="noteditable" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;border-right: 4px dashed gray;border-left: 4px dashed gray;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}" oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         <c:if test="${ not(fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq')) and modelUc.sequenceVersion=='sys_seq_draft' and col.ucSeqDiagram.rowNo !=1}">
                         <td colspan="2" valign="bottom" align="center" class="${modelUc.editclass}" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;border-right: 4px dashed gray;border-left: 4px dashed gray;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}" oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         <c:if test="${ not(fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq')) and modelUc.sequenceVersion!='sys_seq_draft' and col.ucSeqDiagram.rowNo !=1}">
                         <td colspan="2" valign="bottom" align="center" class="${modelUc.editclass}" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;border-right: 4px dashed gray;border-left: 4px dashed gray;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}" oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         <c:if test="${ fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq') and modelUc.sequenceVersion!='sys_seq_draft' and col.ucSeqDiagram.rowNo !=1}">
                         <td colspan="2" valign="bottom" align="center" class="noteditable" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;border-right: 4px dashed gray;border-left: 4px dashed gray;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}" oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         </c:if>
                         <c:if test="${col.ucSeqDiagram.asynchSourceDestination!=null and col.ucSeqDiagram.asynchSourceDestination=='DESTINATION'}">
                         <td colspan="2" valign="bottom" align="center" class="noteditable" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;border-right: 4px dashed gray;border-left: 4px dashed gray;border-bottom: 4px dashed gray;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}">
                         </c:if>
                         <c:if test="${col.ucSeqDiagram.asynchSourceDestination==null}">
                         <c:if test="${ fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq') and modelUc.sequenceVersion=='sys_seq_draft' and col.ucSeqDiagram.rowNo ==1}">
                         <td colspan="2" valign="bottom" align="center" class="noteditable" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}"  oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         <c:if test="${ not(fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq')) and modelUc.sequenceVersion=='sys_seq_draft' and col.ucSeqDiagram.rowNo ==1}">
                         <td colspan="2" valign="bottom" align="center" class="noteditable" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}"  oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         <c:if test="${ not(fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq')) and modelUc.sequenceVersion!='sys_seq_draft' and col.ucSeqDiagram.rowNo ==1}">
                         <td colspan="2" valign="bottom" align="center" class="${modelUc.editclass}" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}"  oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         <c:if test="${ fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq') and modelUc.sequenceVersion!='sys_seq_draft' and col.ucSeqDiagram.rowNo ==1}">
                         <td colspan="2" valign="bottom" align="center" class="noteditable" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}"  oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         <c:if test="${ fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq') and modelUc.sequenceVersion=='sys_seq_draft' and col.ucSeqDiagram.rowNo !=1}">
                         <td colspan="2" valign="bottom" align="center" class="noteditable" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}"  oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         <c:if test="${ not(fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq')) and modelUc.sequenceVersion=='sys_seq_draft' and col.ucSeqDiagram.rowNo !=1}">
                         <td colspan="2" valign="bottom" align="center" class="${modelUc.editclass}" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}"  oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         <c:if test="${ not(fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq')) and modelUc.sequenceVersion!='sys_seq_draft' and col.ucSeqDiagram.rowNo !=1}">
                         <td colspan="2" valign="bottom" align="center" class="${modelUc.editclass}" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}"  oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         <c:if test="${ fn:containsIgnoreCase(col.ucSeqDiagram.systemType, 'sys_seq') and modelUc.sequenceVersion!='sys_seq_draft' and col.ucSeqDiagram.rowNo !=1}">
                         <td colspan="2" valign="bottom" align="center" class="noteditable" style="${col.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;" id="${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}"  oninput="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${col.ucObjectEnum}----${modelUc.ucId}----${col.ucSeqDiagram.seqMstId}----${col.ucSeqDiagram.seqItemId}----${col.ucSeqDiagram.rowNo}----${col.ucSeqDiagram.colNo}----${col.ucSeqDiagram.systemType}----${col.ucSeqDiagram.sysSeqId}', '${col.ucSeqDiagram.systemType}');">
                         </c:if>
                         </c:if>
                         </c:if>
                         ${col.displayName} &nbsp;
                         <c:if test="${col.ucSeqDiagram.selected=='true'}"><A NAME="selectedSeqItem"></A></c:if>
                         </td>
                      </tr>
                   </table>
                   </td>
                </c:if>
                <c:if test="${col.ucObjectEnum!='customer' and col.ucObjectEnum!='ifCondition' and col.ucObjectEnum!='system11' and col.ucObjectEnum!='system13' and col.ucObjectEnum!='sequenceSection' and col.ucObjectEnum!='system' and col.ucObjectEnum!='asynchSource' and col.ucObjectEnum!='asynchDestination'}">
                   ${col.htmlStr}
                </c:if>
             </c:forEach>
          </tr>
       </c:forEach>
    </table>
 </div>
 <!-- end of div seq_det_holder -->
 <table border="0" cellpadding="0" cellspacing="0" width="100%">
    <!-- 		************* -->
    <!-- 		TR for Menues -->
    <!-- 		************* -->
    <tr>
       <td>
          <table>
             <tr>
                <c:forEach items="${modelUc.menuList}" var="ucDisplayObject" >
                   <td>
                      <!-- CHECK  multiLevelPopupMenus , minfield-->
                      <div id="${ucDisplayObject.ucObjectEnum}_prop_menu_edit" class="multiLevelPopupMenus"
                         onclick="event.cancelBubble=true">
                         <table border="0" cellpadding="0" cellspacing="0">
                            <tbody id="${ucDisplayObject.ucObjectEnum}_menu_append">
                               <c:forEach items="${ucDisplayObject.menuItemList}" var="menuItem" >
                                  <c:if test="${menuItem.menuEnabled=='true'}">
                                     <c:if test="${menuItem.itemAction=='asynch_paste_action'}">
                                        <c:if test="${menuItem.itemType=='custom'}">
                                           <tr id="sourceToBeRemoved_${menuItem.asynchSourceRow}_${menuItem.asynchSourceCol}"
                                              onMouseOut="this.bgColor='#F6F6F6'; "
                                              onClick="JavaScript:askForAdditionalInput('${menuItem.itemAction}','${modelUc.sequenceVersion}','${modelUc.seqMstId}','${menuItem.itemType}_${menuItem.itemId}', '${modelUc.CONTEXT_PATH}${menuItem.itemUrl}',${menuItem.asynchSourceRow},${menuItem.asynchSourceCol}, '${modelUc.sysSeqId}')">
                                        </c:if>
                                        <c:if test="${menuItem.itemType!='custom'}">
                                        <tr id="sourceToBeRemoved_${menuItem.asynchSourceRow}_${menuItem.asynchSourceCol}"
                                           onMouseOut="this.bgColor='#F6F6F6'; "
                                           onClick="JavaScript:askForAdditionalInput('${menuItem.itemAction}','${modelUc.sequenceVersion}','${modelUc.seqMstId}','${menuItem.itemType}', '${modelUc.CONTEXT_PATH}${menuItem.itemUrl}',${menuItem.asynchSourceRow},${menuItem.asynchSourceCol}, '${modelUc.sysSeqId}')">
                                        </c:if>
                                     </c:if>
                                     <c:if test="${menuItem.itemAction!='asynch_paste_action'}">
                                     <c:if test="${menuItem.itemType=='custom'}">
                                     <tr
                                        onMouseOut="this.bgColor='#F6F6F6'; "
                                        onClick="JavaScript:askForAdditionalInput('${menuItem.itemAction}','${modelUc.sequenceVersion}','${modelUc.seqMstId}','${menuItem.itemType}_${menuItem.itemId}', '${modelUc.CONTEXT_PATH}${menuItem.itemUrl}',0,0, '${modelUc.sysSeqId}')">
                                     </c:if>
                                     <c:if test="${menuItem.itemType!='custom'}">
                                     <tr
                                        onMouseOut="this.bgColor='#F6F6F6'; "
                                        onClick="JavaScript:askForAdditionalInput('${menuItem.itemAction}','${modelUc.sequenceVersion}','${modelUc.seqMstId}','${menuItem.itemType}', '${modelUc.CONTEXT_PATH}${menuItem.itemUrl}',0,0, '${modelUc.sysSeqId}')">
                                     </c:if>
                                     </c:if>
                                     <c:if test="${menuItem.itemImage!=''}  and menuItem.itemImage!=null">
                                     <td align="left" height="20" width="20">
                                       <a  style="margin-bottom:.25em; vertical-align:middle;" alt="${menuItem.itemName}"><i class="fas fa-bars"></i></a>
                                     </td>
                                     </c:if>
                                     <c:if test="${menuItem.itemType=='synch_asynch'}">
                                     <td align="left" height="20" width="150" nowrap="nowrap"><strong>${menuItem.itemName}</strong></td>
                                     </c:if>
                                     <c:if test="${menuItem.itemType!='synch_asynch'}">
                                     <td align="left" height="20" width="150" nowrap="nowrap">${menuItem.itemName}</td>
                                     </c:if>
                                     </tr>
                                  </c:if>
                                  <c:if test="${menuItem.menuEnabled=='false'}">
                                     <tr>
                                        <c:if test="${menuItem.itemImage!=''}  and menuItem.itemImage!=null">
                                          <td align="left" height="20" width="20">
                                            <a  style="margin-bottom:.25em; vertical-align:middle;" alt="${menuItem.itemName}"><i class="fas fa-bars"></i></a>
                                          </td>
                                        </c:if>
                                        <c:if test="${menuItem.itemType=='synch_asynch'}">
                                           <td align="left" height="20" width="150" nowrap="nowrap"><font color="#D3D3D3"><strong>${menuItem.itemName}</strong></font></td>
                                        </c:if>
                                        <c:if test="${menuItem.itemType!='synch_asynch'}">
                                           <td align="left" height="20" width="150" nowrap="nowrap"><font color="#D3D3D3">${menuItem.itemName}</font></td>
                                        </c:if>
                                     </tr>
                                  </c:if>
                               </c:forEach>
                            </tbody>
                         </table>
                      </div>
                   </td>
                </c:forEach>
             </tr>
          </table>
       </td>
    </tr>
    <!-- 		************* -->
    <!-- 		TR for properties -->
    <!-- 		************* -->
    <tr>
       <td>
          <table>
             <tr>
                <td>
                   <div  id="prop_menu_place_holder" class="propertiesMenus"
                      onclick="event.cancelBubble=true">
                   </div>
                </td>
             </tr>
          </table>
       </td>
    </tr>
    <%-- 			</c:if> --%>
 </table>
 <%-- 	</c:if> --%>
</div>


</body>
</html>
