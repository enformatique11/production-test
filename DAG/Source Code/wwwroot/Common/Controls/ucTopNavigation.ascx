<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucTopNavigation.ascx.cs"
    Inherits="PwC.Common.ucTopNavigation" %>
<div class="topnav" id="topnavMenu">
    <ul>
        <asp:Literal ID="menuItems" runat="server" />
    </ul>
    
    <asp:Literal ID="subMenuItems" runat="server" />
</div>

<script type="text/javascript">

    cssdropdown.startchrome("topnavMenu")


     function openMIPopup(url) {

    url=url.replace("~/",'<%= ResolveUrl("~/") %>')

    window.open(url, 'SummaryPopup', 'height=640, width=1024,top=10, left=10, toolbar=no, menubar=no, scrollbars=no, resizable=yes, location=no, directories=no, status=no');
}



</script>

