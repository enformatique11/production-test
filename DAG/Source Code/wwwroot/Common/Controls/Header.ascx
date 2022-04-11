<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Header.ascx.cs" Inherits="PwC.Common.Controls.Header" %>
<div id="header" style="position:relative;overflow:hidden;">
    <%--<div style="position:absolute;left:0px; top:0px; width:960px; ">
    <asp:Image ID="imgTop" style="width:960px" ImageUrl="~/img/Brand/Scene002.jpg" runat="server" />
    </div>--%>
   
    <div id="pwcLogo" style="position:absolute;left:40px; top:40px; height:150px; " >
        <asp:Image ID="pwcLogoImage" runat="server" ImageUrl="~/img/Brand/wwuHeaderMain.png" Width="200px" AlternateText="WWU" />
      <%--  <div id="currentUser" >--%>
       
<%--    </div>--%>
    </div>
    <div  class="cuser" style="position:absolute;right:10px; top:0px;text-align:right" >
     logged in as<br />
     <asp:Label ID="lblCurrentUser" runat="server" Text=""  /></div>

    <div id="headerTitle" class="headerTitle" >
        Wales and West Utilities  
        
    </div>
    <div id="headerSubTitle" runat="server" class="loginHeaderSubTitle"  style="position:absolute;left:10px; top:0px;">
        Data Assurance Guidance (DAG) Repository
    </div>

    <div id="loginHeaderSubTitle"  runat="server" class="loginHeaderSubTitle"   style="position:absolute;left:10px; top:0px;">
        Data Assurance Guidance (DAG) Repository
    </div>


    
   
</div>
