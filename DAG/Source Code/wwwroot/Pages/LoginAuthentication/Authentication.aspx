<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Authentication.aspx.cs" Inherits="PwCTemplate.Pages.LoginAuthentication.Authentication" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="act" %>
<%@ Register TagPrefix="pwc" TagName="header" Src="~/Common/Controls/Header.ascx" %>
<%@ Register TagPrefix="pwc" TagName="footer" Src="~/Common/Controls/Footer.ascx" %>
<%@ Register TagPrefix="pwc" TagName="LoginSecurity" Src="~/Common/Controls/LoginSecurityControl.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <!-- Links to icon for browser bar, and tabs. Both links are needed so that the icon works in ie and ff -->
    <link id="Link1" runat="server" rel="shortcut icon" href="favicon.ico" type="image/x-icon" />
    <link id="Link2" runat="server" rel="icon" href="favicon.ico" type="image/ico" />
    <title>Data Assurance Guideline (DAG) Repository</title>
    <link href="../../css/Red_Brand.css" rel="stylesheet" type="text/css" />



    <style type="text/css" >
    
    .cuser{display:none;}
    </style>

</head>
<body>
    <script type="text/javascript">    
    </script>
    <form id="form1" runat="server" defaultfocus="Username">
    <div class="headerWrapper">
    <pwc:Header ID="Header1" runat="server" VisibleX="False" HeaderType="login" />
    </div>
    
    <div id="loginWrapper" >
        <div id="loginPage">

          
            <asp:ScriptManager ID="smLogin" runat="server">
                <Scripts>
                    <asp:ScriptReference Path="~/javascript/jquery-1.11.0.min.js" />
                    <%--<asp:ScriptReference Path="~/javascript/jquery.tools.min.js" />--%>
                    <asp:ScriptReference Path="~/javascript/jquery.pngFix.js" />
                    <asp:ScriptReference Path="~/javascript/application.js" />
                </Scripts>
            </asp:ScriptManager>
            <div class="mainContent">
   
               <div class="MessageContainer" >
           <div style ="padding-top:10px">
            You have now been sent an email containing a verification code. Please enter it below to confirm your identity. The code can take up to ten minutes to arrive, please do not log out during this time. If you do not receive the code then you can use the "Resend code" button below.</br> <br />
            You will be provided a new verfication code each time you log into the system and it is only the newest verification token that can be used to access the system.
       </div>
               </div>
                   

        <div style="color: green; padding: 5px; clear: both; padding-left: 0px;">
            <asp:Label runat="server" ID="lblResentConfirmed" Visible="false"></asp:Label>
        </div>

        <asp:ValidationSummary runat="server" CssClass="errorSummary" ValidationGroup="Authentication" />
        
        <div style="padding-top: 20px; padding-bottom: 20px;">
            <div>
                <div style="float: left">
                    Authentication Code
                </div>
                <div style="float: left; margin-left: 20px;">
                    <asp:TextBox ID="EnteredAuthenticationCode" runat="server" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="EnteredAuthenticationCode" ErrorMessage="Authentication Code is Required" Display="None" ValidationGroup="Authentication" SetFocusOnError="true" />
                    <asp:CustomValidator ID="InvalidCode" runat="server" Display="None" ErrorMessage="The provided authentication code is incorrect" ValidationGroup="Authentication" ControlToValidate="EnteredAuthenticationCode" ValidateEmptyText="false" OnServerValidate="InvalidCode_ServerValidate" />
                </div>
                <div style="float: left; margin-left: 20px;">
                    <asp:CheckBox ID="RememberMe" Text ="Remember Me" runat="server" />
                </div>
            </div>
        </div>

        <div class="ControlAreaSave" style="clear: left; padding-top: 20px;">
            <asp:Button runat="server" Text="Submit" ValidationGroup="Authentication" OnClick="Submit_Click" CssClass="iconButton Tick CompleteButton" />
            <asp:Button runat="server" Text="Resend code" style="margin-left:10px" OnClick="Resend_Click"  CssClass="iconButton Refresh" />
        </div>

            </div>
        </div>
        <pwc:Footer ID="pageFooter" FooterType="login" runat="server" />
    </div>
    </div>
    </form>
</body>
</html>
