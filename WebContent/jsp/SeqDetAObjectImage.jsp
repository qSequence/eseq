<%@ include file="include.jsp"%>
<!--
<img id="${modelUc.id}" class="mousetoHand"
				title="Properties" alt="Properties"
				src="/images/properties_${modelUc.propertiesFound}.png"
				onclick="showProperties('prop_menu_view_${modelUc.objectType}_SEPERATOR_${modelUc.ucId}_SEPERATOR_${modelUc.seqMstId}_SEPERATOR_${modelUc.seqItemId}_SEPERATOR_${modelUc.systemId}_SEPERATOR_${modelUc.requestId}_SEPERATOR_${modelUc.responseId}_SEPERATOR_${modelUc.rowNo}_SEPERATOR_${modelUc.columnNo}_SEPERATOR_${modelUc.systemName}_SEPERATOR_${modelUc.reqOrResName}', event);updateRwoCol( ${modelUc.seqItemId}, ${modelUc.rowNo}, ${modelUc.columnNo});"
				height="20" width="20">
-->
<img  id="REQ_${modelUc.id}"  class="mousetoHand" title="Information" alt="Information" src="<c:url value="/images/${modelUc.requestPropertiesFound}.png" />" onclick="showProperties('prop_menu_view_request_SEPERATOR_${modelUc.ucId}_SEPERATOR_${modelUc.seqMstId}_SEPERATOR_${modelUc.seqItemId}_SEPERATOR_${modelUc.systemId}_SEPERATOR_${modelUc.requestId}_SEPERATOR_${modelUc.responseId}_SEPERATOR_${modelUc.rowNo}_SEPERATOR_${modelUc.columnNo}_SEPERATOR_${modelUc.systemName}_SEPERATOR_${modelUc.requestName}_SEPERATOR_${modelUc.responseName}_SEPERATOR_${modelUc.systemType}_SEPERATOR_${modelUc.sysSeqId}', event);updateRwoCol( ${modelUc.seqItemId}, ${modelUc.rowNo}, ${modelUc.columnNo});" height="20" width="20">
<img  id="RES_${modelUc.id}"  class="mousetoHand" title="Information" alt="Information" src="<c:url value="/images/${modelUc.responsePropertiesFound}.png" />" onclick="showProperties('prop_menu_view_response_SEPERATOR_${modelUc.ucId}_SEPERATOR_${modelUc.seqMstId}_SEPERATOR_${modelUc.seqItemId}_SEPERATOR_${modelUc.systemId}_SEPERATOR_${modelUc.requestId}_SEPERATOR_${modelUc.responseId}_SEPERATOR_${modelUc.rowNo}_SEPERATOR_${modelUc.columnNo}_SEPERATOR_${modelUc.systemName}_SEPERATOR_${modelUc.requestName}_SEPERATOR_${modelUc.responseName}_SEPERATOR_${modelUc.systemType}_SEPERATOR_${modelUc.sysSeqId}', event);updateRwoCol( ${modelUc.seqItemId}, ${modelUc.rowNo}, ${modelUc.columnNo});" height="20" width="20">
<img id="SYS_${modelUc.id}" class="mousetoHand" title="Information" alt="Information"   src="<c:url value="/images/${modelUc.systemPropertiesFound}.png" />"	onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucId}_SEPERATOR_${modelUc.seqMstId}_SEPERATOR_${modelUc.seqItemId}_SEPERATOR_${modelUc.systemId}_SEPERATOR_${modelUc.requestId}_SEPERATOR_${modelUc.responseId}_SEPERATOR_${modelUc.rowNo}_SEPERATOR_${modelUc.columnNo}_SEPERATOR_${modelUc.systemName}_SEPERATOR_${modelUc.requestName}_SEPERATOR_${modelUc.responseName}_SEPERATOR_${modelUc.systemType}_SEPERATOR_${modelUc.sysSeqId}', event);updateRwoCol( ${modelUc.seqItemId}, ${modelUc.rowNo}, ${modelUc.columnNo}, '${modelUc.asynchSourceDestination}');" height="20" width="20">
<!--
<td class="${modelUc.editclass}" colspan="3" id="request----${modelUc.ucId}----${modelUc.seqMstId}----${modelUc.seqItemId}----${modelUc.rowNo}----${modelUc.columnNo}" style="border-left: 5px solid cyan; word-wrap:break-word;font-family:times;color:black;font-size:12px;" oninput="updateSelectedComboGridForRequest('request----${modelUc.ucId}----${modelUc.seqMstId}----${modelUc.seqItemId}----${modelUc.rowNo}----${modelUc.columnNo}', '${modelUc.systemType}');" onclick="updateSelectedComboGridForRequest('request----${modelUc.ucId}----${modelUc.seqMstId}----${modelUc.seqItemId}----${modelUc.rowNo}----${modelUc.columnNo}', '${modelUc.systemType}');">${modelUc.requestName}</td>

<td class="${modelUc.editclass}" colspan="3" style="border-top: 5px solid cyan;border-left: 5px	solid cyan; word-wrap:break-word; font-family:times;color:black;font-size:12px;" id="response----null----8----46----6----4" oninput="updateSelectedComboGridForResponse('response----null----8----46----6----4', 'sys_seq');" onclick="updateSelectedComboGridForResponse('response----null----8----46----6----4', 'sys_seq');">addressQueryResponse</td>
-->
<input id="TABLE_REPLACE_ID" value="${modelUc.TABLE_REPLACE_ID}" />
<input id="TD_REPLACE_ID" value="${modelUc.TD_REPLACE_ID}" />
<div id="connectorObj">
${modelUc.connectorObj.htmlStr}
</div>

<div id="sysObj">
<table>
<tr>
<td id="td_SYSTEM${modelUc.sysObj.ucSeqDiagram.rowNo}" align=center valign="top"  height="100" width="150" ${modelUc.sysObj.htmlStr} >
								<table id="table_SYSTEM${modelUc.sysObj.ucSeqDiagram.rowNo}" align="center" height="100%" width="100%" cellpadding="0" cellspacing="0">
									<tr>

									<c:if test="${modelUc.sysObj.ucSeqDiagram.expanded!=null}">

<!-- TR 1-->
	<!-- TD 1-->
									  <c:if test="${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination=='SOURCE'}">
									  <td height="15%" width="15%" style="vertical-align: top;text-align: left;border-top: 4px dashed gray;border-left: 4px dashed gray;">
									  </c:if>
									  <c:if test="${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination=='DESTINATION'}">
									  <td height="15%" width="15%" style="vertical-align: top;text-align: left;border-left: 4px dashed gray;">
									  </c:if>
									  <c:if test="${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination==null}">
									  <td height="15%" width="15%" style="vertical-align: top;text-align: left;">
									  </c:if>

												<c:if test="${modelUc.sysObj.ucSeqDiagram.expanded=='true'}">
													<img  class="mousetoHand" onclick="seqUpdateOpenClose( 'close_tree_node', '${modelUc.sequenceVersion}', ${modelUc.sysObj.ucSeqDiagram.seqMstId}, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '<c:url value="/GetSeqUpdate.htm" />', ${modelUc.sysObj.ucSeqDiagram.sysSeqId});"><i class="fas fa-minus-circle"></i></a>
												</c:if>
												<c:if test="${modelUc.sysObj.ucSeqDiagram.expanded!='true'}">
													<a   class="mousetoHand" onclick="seqUpdateOpenClose( 'expand_tree_node', '${modelUc.sequenceVersion}', ${modelUc.sysObj.ucSeqDiagram.seqMstId}, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '<c:url value="/GetSeqUpdate.htm" />', ${modelUc.sysObj.ucSeqDiagram.sysSeqId});"><i class="fas fa-plus-circle"></i></a>

												</c:if>
										</td>
	<!-- TD 2-->
									  <c:if test="${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination=='SOURCE'}">
										<td style="vertical-align: top;text-align: right;border-right: 4px dashed gray;border-top: 4px dashed gray;">
									  </c:if>
									  <c:if test="${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination=='DESTINATION'}">
									  <td style="vertical-align: top;text-align: right;border-right: 4px dashed gray;">
									  </c:if>
									  <c:if test="${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination==null}">
									  <td style="vertical-align: top;text-align: right;">
									  </c:if>
												<c:if test="${modelUc.editclass=='editable'}">
													<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination !=null}">
														<img  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20" src="<c:url value="/images/menui_selection.png" />"
															onclick="showMenu1('${modelUc.sysObj.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(${modelUc.sysObj.ucSeqDiagram.seqItemId}, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination}', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
													</c:if>
													<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination ==null}">
														<img  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20" src="<c:url value="/images/menui_selection.png" />"
															onclick="showMenu1('${modelUc.sysObj.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(${modelUc.sysObj.ucSeqDiagram.seqItemId}, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
													</c:if>
													<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId==null  and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination !=null}">
														<img  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20" src="<c:url value="/images/menui_selection.png" />"
															onclick="showMenu1('${modelUc.sysObj.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(0, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination}', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
													</c:if>
													<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId==null  and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination ==null}">
														<img  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20" src="<c:url value="/images/menui_selection.png" />"
															onclick="showMenu1('${modelUc.sysObj.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(0, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
													</c:if>

												</c:if>

												<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId!=null   and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination !=null}">
													<img id="SYS_${modelUc.sysObj.ucSeqDiagram.rowNo}_${modelUc.sysObj.ucSeqDiagram.colNo}" class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${modelUc.sysObj.ucSeqDiagram.systemPropertiesFound}.png" />"
														onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqMstId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqItemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.requestId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.responseId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.rowNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.colNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemName}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.request}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.response}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemType}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${modelUc.sysObj.ucSeqDiagram.seqItemId}, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination}', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">

												</c:if>
												<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId!=null   and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination ==null}">
  												       <img id="SYS_${modelUc.sysObj.ucSeqDiagram.rowNo}_${modelUc.sysObj.ucSeqDiagram.colNo}" class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${modelUc.sysObj.ucSeqDiagram.systemPropertiesFound}.png" />"
														onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqMstId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqItemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.requestId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.responseId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.rowNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.colNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemName}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.request}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.response}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemType}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${modelUc.sysObj.ucSeqDiagram.seqItemId}, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
												</c:if>

												<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId==null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination !=null}">
														<img id="SYS_${modelUc.sysObj.ucSeqDiagram.rowNo}_${modelUc.sysObj.ucSeqDiagram.colNo}" class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${modelUc.sysObj.ucSeqDiagram.systemPropertiesFound}.png" />"
														onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqMstId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqItemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.requestId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.responseId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.rowNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.colNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemName}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.request}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.response}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemType}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.sysSeqId}', event);updateRwoCol( 0, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination}', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
												</c:if>
												<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId==null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination ==null}">
														<img  id="SYS_${modelUc.sysObj.ucSeqDiagram.rowNo}_${modelUc.sysObj.ucSeqDiagram.colNo}" class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${modelUc.sysObj.ucSeqDiagram.systemPropertiesFound}.png" />"
														onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqMstId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqItemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.requestId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.responseId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.rowNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.colNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemName}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.request}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.response}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemType}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.sysSeqId}', event);updateRwoCol( 0, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
												</c:if>
										</td>
									</c:if>
		<!-- TD 1-->
									<c:if test="${modelUc.sysObj.ucSeqDiagram.expanded==null and modelUc.editclass=='editable'}">
									<c:if test="${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination=='SOURCE'}">
										<td colspan="2" height="15%" width="15%" align="right" style="vertical-align: top;text-align: right;border-right: 4px dashed gray;border-left: 4px dashed gray;border-top: 4px dashed gray;">
									  </c:if>
									  <c:if test="${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination=='DESTINATION'}">
										<td colspan="2" height="15%" width="15%" align="right" style="vertical-align: top;text-align: right;border-right: 4px dashed gray;border-left: 4px dashed gray;">
									  </c:if>
									  <c:if test="${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination==null}">
										<td colspan="2" height="15%" width="15%" align="right" style="vertical-align: top;text-align: right;">
									  </c:if>

											<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination !=null}">
												<img  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20" src="<c:url value="/images/menui_selection.png" />"
													onclick="showMenu1('${modelUc.sysObj.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(${modelUc.sysObj.ucSeqDiagram.seqItemId}, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination}', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
												<img  id="SYS_${modelUc.sysObj.ucSeqDiagram.rowNo}_${modelUc.sysObj.ucSeqDiagram.colNo}" class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${modelUc.sysObj.ucSeqDiagram.systemPropertiesFound}.png" />"
													onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqMstId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqItemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.requestId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.responseId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.rowNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.colNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemName}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.request}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.response}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemType}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${modelUc.sysObj.ucSeqDiagram.seqItemId}, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination}', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
											</c:if>

											<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination !=null}">
												<img  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20" src="<c:url value="/images/menui_selection.png" />"
													onclick="showMenu1('${modelUc.sysObj.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(${modelUc.sysObj.ucSeqDiagram.seqItemId}, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination}', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
												<img  id="SYS_${modelUc.sysObj.ucSeqDiagram.rowNo}_${modelUc.sysObj.ucSeqDiagram.colNo}" class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${modelUc.sysObj.ucSeqDiagram.systemPropertiesFound}.png" />"
													onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqMstId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqItemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.requestId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.responseId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.rowNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.colNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemName}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.request}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.response}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemType}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${modelUc.sysObj.ucSeqDiagram.seqItemId}, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination}', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">

											</c:if>
											<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination ==null}">
												<img  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20" src="<c:url value="/images/menui_selection.png" />"
													onclick="showMenu1('${modelUc.sysObj.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(${modelUc.sysObj.ucSeqDiagram.seqItemId}, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
												<img  id="SYS_${modelUc.sysObj.ucSeqDiagram.rowNo}_${modelUc.sysObj.ucSeqDiagram.colNo}" class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${modelUc.sysObj.ucSeqDiagram.systemPropertiesFound}.png" />"
													onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqMstId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqItemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.requestId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.responseId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.rowNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.colNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemName}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.request}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.response}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemType}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${modelUc.sysObj.ucSeqDiagram.seqItemId}, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
											</c:if>
											<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId==null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination !=null}">
												<img  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20" src="<c:url value="/images/menui_selection.png" />"
													onclick="showMenu1('${modelUc.sysObj.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(0, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination}', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
												<img  id="SYS_${modelUc.sysObj.ucSeqDiagram.rowNo}_${modelUc.sysObj.ucSeqDiagram.colNo}" class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${modelUc.sysObj.ucSeqDiagram.systemPropertiesFound}.png" />"
													onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqMstId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqItemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.requestId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.responseId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.rowNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.colNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemName}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.request}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.response}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemType}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.sysSeqId}', event);updateRwoCol( 0, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination}', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
											</c:if>
											<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId==null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination ==null}">
												<img  class="mousetoHand" title="Menu" alt="Menu" height="20" width="20" src="<c:url value="/images/menui_selection.png" />"
													onclick="showMenu1('${modelUc.sysObj.ucObjectEnum}_prop_menu_edit', event);updateRwoCol(0, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
												<img  id="SYS_${modelUc.sysObj.ucSeqDiagram.rowNo}_${modelUc.sysObj.ucSeqDiagram.colNo}" class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${modelUc.sysObj.ucSeqDiagram.systemPropertiesFound}.png" />"
													onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqMstId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqItemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.requestId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.responseId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.rowNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.colNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemName}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.request}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.response}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemType}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.sysSeqId}', event);updateRwoCol( 0, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
											</c:if>

										</td>

									</c:if>
									<c:if test="${modelUc.sysObj.ucSeqDiagram.expanded==null and modelUc.editclass!='editable'}">
									<c:if test="${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination=='SOURCE'}">
										<td colspan="2" height="15%" width="15%" align="right" style="vertical-align: top;text-align: right;border-left: 4px dashed gray;border-right: 4px dashed gray;border-top: 4px dashed gray;">
									  </c:if>
									  <c:if test="${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination=='DESTINATION'}">
										<td colspan="2" height="15%" width="15%" align="right" style="vertical-align: top;text-align: right;border-left: 4px dashed gray;border-right: 4px dashed gray;">

									  </c:if>
									  <c:if test="${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination==null}">
										<td colspan="2" height="15%" width="15%" align="right" style="vertical-align: top;text-align: right;">
									  </c:if>


										<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination !=null}">
											<img  id="SYS_${modelUc.sysObj.ucSeqDiagram.rowNo}_${modelUc.sysObj.ucSeqDiagram.colNo}" class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${modelUc.sysObj.ucSeqDiagram.systemPropertiesFound}.png" />"
												onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqMstId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqItemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.requestId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.responseId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.rowNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.colNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemName}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.request}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.response}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemType}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${modelUc.sysObj.ucSeqDiagram.seqItemId}, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination}', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
										</c:if>
										<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination ==null}">
											<img  id="SYS_${modelUc.sysObj.ucSeqDiagram.rowNo}_${modelUc.sysObj.ucSeqDiagram.colNo}" class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${modelUc.sysObj.ucSeqDiagram.systemPropertiesFound}.png" />"
												onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqMstId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqItemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.requestId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.responseId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.rowNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.colNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemName}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.request}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.response}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemType}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.sysSeqId}', event);updateRwoCol( ${modelUc.sysObj.ucSeqDiagram.seqItemId}, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
										</c:if>

										<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId==null  and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination !=null}">
											<img  id="SYS_${modelUc.sysObj.ucSeqDiagram.rowNo}_${modelUc.sysObj.ucSeqDiagram.colNo}"  class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${modelUc.sysObj.ucSeqDiagram.systemPropertiesFound}.png" />"
												onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqMstId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqItemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.requestId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.responseId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.rowNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.colNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemName}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.request}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.response}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemType}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.sysSeqId}', event);updateRwoCol( 0, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination}', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
										</c:if>
										<c:if test="${modelUc.sysObj.ucSeqDiagram.seqItemId==null  and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination ==null}">
											<img  id="SYS_${modelUc.sysObj.ucSeqDiagram.rowNo}_${modelUc.sysObj.ucSeqDiagram.colNo}"  class="mousetoHand" title="Information" alt="Information" height="20" width="20" src="<c:url value="/images/${modelUc.sysObj.ucSeqDiagram.systemPropertiesFound}.png" />"
												onclick="showProperties('prop_menu_view_system_SEPERATOR_${modelUc.ucSeqMst.ucId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqMstId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.seqItemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.requestId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.responseId}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.rowNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.colNo}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemName}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.request}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.response}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.systemType}_SEPERATOR_${modelUc.sysObj.ucSeqDiagram.sysSeqId}', event);updateRwoCol( 0, ${modelUc.sysObj.ucSeqDiagram.rowNo}, ${modelUc.sysObj.ucSeqDiagram.colNo}, '', '${modelUc.sysObj.ucSeqDiagram.systemName}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
										</c:if>
										</td>

									</c:if>
									</tr>
<!-- TR 2-->
	<!-- TD 1-->
									<tr>
									<c:if test="${ col.ucObjectEnum=='ifCondition' or col.ucObjectEnum=='sequenceSection'}">
										<td colspan="2" valign="bottom" align="center" class="${modelUc.editclass}" style="word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;border-bottom: 1px dashed gray;" id="${modelUc.sysObj.ucObjectEnum}----${modelUc.ucSeqMst.ucId}----${modelUc.sysObj.ucSeqDiagram.seqMstId}----${modelUc.sysObj.ucSeqDiagram.seqItemId}----${modelUc.sysObj.ucSeqDiagram.rowNo}----${modelUc.sysObj.ucSeqDiagram.colNo}----${modelUc.sysObj.ucSeqDiagram.systemType}----${modelUc.sysObj.ucSeqDiagram.sysSeqId}"  oninput="updateSelectedComboGridForSystem('${modelUc.sysObj.ucObjectEnum}----${modelUc.ucSeqMst.ucId}----${modelUc.sysObj.ucSeqDiagram.seqMstId}----${modelUc.sysObj.ucSeqDiagram.seqItemId}----${modelUc.sysObj.ucSeqDiagram.rowNo}----${modelUc.sysObj.ucSeqDiagram.colNo}----${modelUc.sysObj.ucSeqDiagram.systemType}----${modelUc.sysObj.ucSeqDiagram.sysSeqId}', '${modelUc.sysObj.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${modelUc.sysObj.ucObjectEnum}----${modelUc.ucSeqMst.ucId}----${modelUc.sysObj.ucSeqDiagram.seqMstId}----${modelUc.sysObj.ucSeqDiagram.seqItemId}----${modelUc.sysObj.ucSeqDiagram.rowNo}----${modelUc.sysObj.ucSeqDiagram.colNo}----${modelUc.sysObj.ucSeqDiagram.systemType}----${modelUc.sysObj.ucSeqDiagram.sysSeqId}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">

									</c:if>
									<c:if test="${ col.ucObjectEnum!='ifCondition' and col.ucObjectEnum!='sequenceSection'}">
									<!-- HAVE_A_LOOK -->
									  <c:if test="${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination=='SOURCE'}">
  									    <td colspan="2" valign="bottom" align="center" class="${modelUc.editclass}" style="${modelUc.sysObj.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;border-right: 4px dashed gray;border-left: 4px dashed gray;" id="${modelUc.sysObj.ucObjectEnum}----${modelUc.ucSeqMst.ucId}----${modelUc.sysObj.ucSeqDiagram.seqMstId}----${modelUc.sysObj.ucSeqDiagram.seqItemId}----${modelUc.sysObj.ucSeqDiagram.rowNo}----${modelUc.sysObj.ucSeqDiagram.colNo}----${modelUc.sysObj.ucSeqDiagram.systemType}----${modelUc.sysObj.ucSeqDiagram.sysSeqId}"  oninput="updateSelectedComboGridForSystem('${modelUc.sysObj.ucObjectEnum}----${modelUc.ucSeqMst.ucId}----${modelUc.sysObj.ucSeqDiagram.seqMstId}----${modelUc.sysObj.ucSeqDiagram.seqItemId}----${modelUc.sysObj.ucSeqDiagram.rowNo}----${modelUc.sysObj.ucSeqDiagram.colNo}----${modelUc.sysObj.ucSeqDiagram.systemType}----${modelUc.sysObj.ucSeqDiagram.sysSeqId}', '${modelUc.sysObj.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${modelUc.sysObj.ucObjectEnum}----${modelUc.ucSeqMst.ucId}----${modelUc.sysObj.ucSeqDiagram.seqMstId}----${modelUc.sysObj.ucSeqDiagram.seqItemId}----${modelUc.sysObj.ucSeqDiagram.rowNo}----${modelUc.sysObj.ucSeqDiagram.colNo}----${modelUc.sysObj.ucSeqDiagram.systemType}----${modelUc.sysObj.ucSeqDiagram.sysSeqId}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
									  </c:if>
									  <c:if test="${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination!=null and modelUc.sysObj.ucSeqDiagram.asynchSourceDestination=='DESTINATION'}">
										<td colspan="2" valign="bottom" align="center" class="noteditable" style="${modelUc.sysObj.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;border-right: 4px dashed gray;border-left: 4px dashed gray;border-bottom: 4px dashed gray;" id="${modelUc.sysObj.ucObjectEnum}----${modelUc.ucSeqMst.ucId}----${modelUc.sysObj.ucSeqDiagram.seqMstId}----${modelUc.sysObj.ucSeqDiagram.seqItemId}----${modelUc.sysObj.ucSeqDiagram.rowNo}----${modelUc.sysObj.ucSeqDiagram.colNo}----${modelUc.sysObj.ucSeqDiagram.systemType}----${modelUc.sysObj.ucSeqDiagram.sysSeqId}">
									  </c:if>
									  <c:if test="${modelUc.sysObj.ucSeqDiagram.asynchSourceDestination==null}">
										<td colspan="2" valign="bottom" align="center" class="${modelUc.editclass}" style="${modelUc.sysObj.bottomBorberHtmlStyle}word-wrap:break-word;font-family:times;color:#996633;font-size:14px;vertical-align: bottom;font-weight: bold;" id="${modelUc.sysObj.ucObjectEnum}----${modelUc.ucSeqMst.ucId}----${modelUc.sysObj.ucSeqDiagram.seqMstId}----${modelUc.sysObj.ucSeqDiagram.seqItemId}----${modelUc.sysObj.ucSeqDiagram.rowNo}----${modelUc.sysObj.ucSeqDiagram.colNo}----${modelUc.sysObj.ucSeqDiagram.systemType}----${modelUc.sysObj.ucSeqDiagram.sysSeqId}"  oninput="updateSelectedComboGridForSystem('${modelUc.sysObj.ucObjectEnum}----${modelUc.ucSeqMst.ucId}----${modelUc.sysObj.ucSeqDiagram.seqMstId}----${modelUc.sysObj.ucSeqDiagram.seqItemId}----${modelUc.sysObj.ucSeqDiagram.rowNo}----${modelUc.sysObj.ucSeqDiagram.colNo}----${modelUc.sysObj.ucSeqDiagram.systemType}----${modelUc.sysObj.ucSeqDiagram.sysSeqId}', '${modelUc.sysObj.ucSeqDiagram.systemType}');" onclick="updateSelectedComboGridForSystem('${modelUc.sysObj.ucObjectEnum}----${modelUc.ucSeqMst.ucId}----${modelUc.sysObj.ucSeqDiagram.seqMstId}----${modelUc.sysObj.ucSeqDiagram.seqItemId}----${modelUc.sysObj.ucSeqDiagram.rowNo}----${modelUc.sysObj.ucSeqDiagram.colNo}----${modelUc.sysObj.ucSeqDiagram.systemType}----${modelUc.sysObj.ucSeqDiagram.sysSeqId}', '${modelUc.sysObj.ucSeqDiagram.systemType}');">
									  </c:if>
									</c:if>
											${modelUc.sysObj.displayName} &nbsp;
											<c:if test="${modelUc.sysObj.ucSeqDiagram.selected=='true'}"><A NAME="selectedSeqItem"></A></c:if>
										</td>
									</tr>

								</table>
							</td>
		</tr>
		</table>

</div>








<input id="new_request_element" type="text" value="${modelUc.newRequestId}" />
<input id="new_response_element" type="text" value="${modelUc.newResponseId}" />
