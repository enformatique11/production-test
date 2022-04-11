<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QuickLinks.ascx.cs"
    Inherits="PwC.Common.Controls.QuickLinks" %>
<div class="QuickLinks">
    <h3>Quick Links</h3>
    <asp:Repeater ID="rptQuickLinks" runat="server">
        <ItemTemplate>
            <div class="QuickLink" style="display: none" onclick="window.location = '<%# ResolveUrl((string)Eval("URL")) %>';">
                <h1><%# Eval("QuickLinkTitle") %></h1>
                <%# Eval("QuickLinkDescription") %>
            </div>
        </ItemTemplate>
    </asp:Repeater>
</div>
