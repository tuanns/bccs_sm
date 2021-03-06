<%-- 
    Document   : expToPartner
    Created on : Sep 2, 2010, 9:03:20 AM
    Author     : Doan Thanh 8
    Desc       : xuat kho cho doi tac
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="s" uri="/struts-tags" %>
<%@taglib prefix="sx" uri="/struts-dojo-tags" %>
<%@taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@taglib prefix="display" uri="VTdisplaytaglib" %>
<%@taglib prefix="imDef" uri="imDef" %>
<%@page import="com.guhesan.querycrypt.QueryCrypt" %>

<tags:imPanel title="MSG.info.import.note">

    <!-- phan tim kiem lenh xuat de tao phieu xuat -->
    <div class="divHasBorder">
        <s:form action="anypayPartnerAction" theme="simple" enctype="multipart/form-data"  method="POST" id="searchStockForm">
            <s:hidden name="searchStockForm.actionType" />
            <s:hidden name="searchStockForm.transType" />
            <s:hidden name="searchStockForm.fromOwnerType" id="fromOwnerType"/>
            <s:hidden name="searchStockForm.fromOwnerId" id="fromOwnerId"/>
            <s:hidden name="searchStockForm.toOwnerType" id="toOwnerType"/>
            <s:hidden name="searchStockForm.shopExpType" value="1"/>

            <table class="inputTbl6Col" >
                <tr>
                    <!-- ma phieu -->
                    <td><tags:label key="MSG.noteId"/></td>
                    <td class="oddColumn">
                        <s:textfield name="searchStockForm.actionCode" id="searchStockForm.actionCode" cssClass="txtInputFull"/>
                    </td>
                    <!-- trang thai giao dich -->
                    <td><tags:label key="MSG.GOD.013"/></td>
                    <td class="oddColumn">
                        <tags:imSelect name="searchStockForm.transStatus"
                                       id="transStatus"
                                       cssClass="txtInputFull"
                                       headerKey="" headerValue="MSG.GOD.189"
                                       list="1:status.created.cmd, 2:status.created.make,3:status.created.imported,5:status.destroyed"/>
                    </td>
                    <td></td>
                    <td></td>
                    <s:hidden name="searchStockForm.toOwnerCode"/>
                    <s:hidden name="searchStockForm.toOwnerName"/>
                    <!-- kho xuat -->
                </tr>
                <tr>
                    <!-- doi tac xuat hang -->
                    <td><tags:label key="MSG.partner"/></td>
                    <td class="oddColumn">
                        <tags:imSearch codeVariable="searchStockForm.fromOwnerCode" nameVariable="searchStockForm.fromOwnerName"
                                       codeLabel="MSG.partner.code" nameLabel="MSG.partner.name"
                                       searchClassName="com.viettel.im.database.DAO.CommonDAO"
                                       searchMethodName="getListPartner"
                                       getNameMethod="getPartnerName"/>
                    </td>
                    <!-- tu ngay -->
                    <td><tags:label key="MSG.GOD.117"/></td>
                    <td class="oddColumn">
                        <tags:dateChooser property="searchStockForm.fromDate" id="searchStockForm.fromDate" styleClass="txtInputFull"/>
                    </td>
                    <td><tags:label key="MSG.GOD.118"/></td>
                    <td>
                        <tags:dateChooser property="searchStockForm.toDate" id="searchStockForm.toDate" styleClass="txtInputFull"/>
                    </td>
                </tr>
            </table>

            <div style="width:100%; margin-top: 5px; margin-bottom: 5px;" align="center">
                <tags:submit formId="searchStockForm"
                             showLoadingText="true"
                             targets="divImpNoteFromPartner"
                             cssStyle="width: 80px;"
                             value="MSG.GOD.009"
                             preAction="anypayPartnerAction!searchNoteAnypayPartner.do"/>
            </div>
        </s:form>
    </div>

    <!-- phan hien thi ket qua tim kiem + lap phieu xuat kho cho doi tac -->
    <sx:div id="divImpNoteFromPartner">
        <jsp:include page="listNoteAnypayPartner.jsp"/>
    </sx:div>

</tags:imPanel>
