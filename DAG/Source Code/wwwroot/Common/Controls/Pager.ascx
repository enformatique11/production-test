<%@ Control Language="C#" AutoEventWireup="True" CodeBehind="Pager.ascx.cs" Inherits="PwC.Common.Controls.Pager" %>

<div class="pager">
    <asp:Label ID="lblPageSize" runat="server" Text="Page Size" AssociatedControlID="ddlPageSize" />
    <asp:DropDownList ID="ddlPageSize" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlPageSize_OnSelectedIndexChanged"/>
</div>