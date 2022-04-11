<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true" CodeBehind="WorkflowControl_TestPage.aspx.cs" Inherits="PwC.Common.Controls.WorkflowControl.WorkflowControl_TestPage" %>
<%@ Register Src="~/Common/Controls/WorkflowControl/WStatusDiagram/WStatusDiagram.ascx" TagPrefix="uc" TagName="WorkflowDiagram" %>
<%@ Register Src="~/Common/Controls/WorkflowControl/WStatusUpdate/WStatusUpdate.ascx" TagPrefix="uc" TagName="WStatusUpdate" %>
<%@ Register Src="~/Common/Controls/WorkflowControl/WStatusHistory/WStatusCurrent.ascx" TagPrefix="uc" TagName="WStatusCurrent" %>
<%@ Register Src="~/Common/Controls/WorkflowControl/WStatusHistory/WStatusHistory.ascx" TagPrefix="uc" TagName="WStatusHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="width: 1250px; overflow-x: scroll; height: 540px;">
        <uc:WorkflowDiagram id="wdWorkflowControl" runat="server"></uc:WorkflowDiagram>
    </div>

    <div style="margin-top: 40px;">
        <uc:WStatusCurrent id="ucWStatusCurrent" runat="server"></uc:WStatusCurrent>
    </div>

    <div style="margin-top: 40px;">
        <uc:WStatusHistory id="ucWStatusHistory" runat="server"></uc:WStatusHistory>
    </div>

    <div style="margin-top: 40px;">
        <uc:WStatusUpdate id="ucWStatusUpdate" runat="server"></uc:WStatusUpdate>
    </div>

</asp:Content>
