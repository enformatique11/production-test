<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DetailsPanel.ascx.cs" Inherits="PwC.Common.Controls.DetailsPanel" %>

<div id="divDetails" class="detailsPanel">
            <div class="detailRow">
            <span class="detailLabel">License Condition:</span>
            <asp:Label ID="lblLicCond" runat="server" CssClass="detailInfo"></asp:Label>
            </div>
            <div class="detailRow">
            <span class="detailLabel">Condition Title / Table Number:</span>
            <asp:Label ID="lblCondTitle" runat="server" CssClass="detailInfo"></asp:Label>
            </div>
            <div class="detailRow">
            <span class="detailLabel" >Required Information:</span>
            <asp:Label ID="lblReqdInfo" runat="server" CssClass="detailInfo"></asp:Label>
            </div>
</div>