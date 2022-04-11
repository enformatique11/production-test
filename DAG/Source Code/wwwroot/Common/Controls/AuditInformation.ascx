<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AuditInformation.ascx.cs" Inherits="PwC.Common.Controls.AuditInformation" %>
<div style="font-size:0.8em; margin:5px 0px;padding:5px;">
    <asp:panel id="pnlCreated" runat="server" style="float:left;">
        <strong>Created</strong> <asp:literal ID="litCreatedWhen" runat="server" /> by <asp:literal ID="litCreatedBy" runat="server" />
    </asp:panel>
    <asp:panel id="pnlUpdated" runat="server" style="float:left;margin-left: 20px;">
        <strong>Updated</strong> <asp:literal ID="litUpdatedWhen" runat="server" /> by <asp:literal ID="litUpdatedBy" runat="server" />
    </asp:panel>
    <div style="clear:both;" />
</div>