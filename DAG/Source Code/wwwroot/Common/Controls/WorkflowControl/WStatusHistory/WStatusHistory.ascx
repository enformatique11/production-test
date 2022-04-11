<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WStatusHistory.ascx.cs" Inherits="PwC.Common.Controls.WorkflowControl.WStatusHistory.WStatusHistory" %>

<style type="text/css">

    th
    {
        color: #ffffff;
        background-color: #395963;
        padding: 2px;
    }

    td
    {
        padding: 2px;
    }

</style>


<div id="divWStatusHistory" runat="server">
    <asp:GridView ID="gvWStatusHistory" runat="server" AutoGenerateColumns="false" OnRowDataBound="gvWStatusHistory_RowDataBound"
        EmptyDataText="No history for this data source">
        <Columns>
			<asp:BoundField DataField="ToValue" HeaderText="Status" />
			<asp:BoundField DataField="Role" HeaderText="Role" />
			<asp:BoundField DataField="Comments" HeaderText="Comments" />
			<asp:BoundField DataField="LastUpdatedByFullName" HeaderText="Updated By" />
			<asp:BoundField DataField="LastUpdatedWhen" HeaderText="Updated When" />
        </Columns>
    </asp:GridView>
</div>