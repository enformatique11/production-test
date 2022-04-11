<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="Login.aspx.cs"
    Inherits="PwC.Login" %>

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
    <link href="css/Red_Brand.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function disableFields() {
            $('#<%= txtUsername.ClientID %>')[0].disabled = 'disabled';
            $('#<%= txtPassword.ClientID %>')[0].disabled = 'disabled';
        }
    </script>


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
             <div style="clear: both; ">
                    <div style="background-color:#E9EAEA !important; height:50px">
                    <div class="LoginHeaderLeft" >
                        About
                    </div>
                    <div class="LoginHeaderMiddle">
                        User Log In
                    </div>
                    <div class="LoginHeaderRight">
                    </div>
                    </div>
                </div>
            <pwc:LoginSecurity ID="lsSecure" runat="server" />
            <asp:CustomValidator ID="cvValidateLogin" runat="server" OnServerValidate="cvValidateLogin_Validate"
                EnableClientScript="false" />
            <asp:ScriptManager ID="smLogin" runat="server">
                <Scripts>
                    <asp:ScriptReference Path="~/javascript/jquery-1.11.0.min.js" />
                    <%--<asp:ScriptReference Path="~/javascript/jquery.tools.min.js" />--%>
                    <asp:ScriptReference Path="~/javascript/jquery.pngFix.js" />
                    <asp:ScriptReference Path="~/javascript/application.js" />
                </Scripts>
            </asp:ScriptManager>
            <div class="mainContent">
                <script type="text/javascript">
                    fixWatermarkControl();             
                </script>
               
                <asp:UpdatePanel ID="upLogin" runat="server">
                    <ContentTemplate>
                        <div style="clear: both; height: 150px;">
                            <div class="LoginPanelLeft" style="width: 180px">
                                <p>
                                    Welcome to the Data Assurance Guideline (DAG) Repository.
                                </p>
                                <p>
                                    Please enter your username and password to gain entry into this site.
                                </p>
                            </div>
                            <div class="LoginPanelMiddle">
                                <div style="clear: both; margin-top: 10px; height: 28px;">
                                    <div style="width: 80px; float: left; margin-right: 10px;">
                                        <p style="margin-top: 2px;">
                                            Username</p>
                                    </div>
                                    <div style="width: 220px; float: left">
                                        <pwc:PwcTextBox ID="txtUsername" Text="" runat="server" MaxLength="50" Required="false"
                                            WatermarkText="enter username..." Width="200px" />
                                    </div>
                                </div>
                                <div style="clear: both; margin-top: 10px; height: 28px;">
                                    <div style="width: 80px; float: left; margin-right: 10px;">
                                        <p style="margin-top: 2px;">
                                            Password</p>
                                    </div>
                                    <div style="width: 220px; float: left">
                                        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" MaxLength="50" Width="200px" />
                                    </div>
                                    <div style="width: 160px; float: left; margin-top: 6px;">
                                        <a style="font-family: Arial;" href="mailto:Carys.Hudd@wwutilities.co.uk?cc=uk_apphubsupport@pwc.com">Forgot your password?</a>
                                    </div>
                                </div>
                                <div style="clear: both; margin-top: 10px;">
                                    <div style="width: 80px; float: left; margin-right: 10px; height: 30px;">
                                    </div>
                                    <div style="width: 220px; float: left">
                                        <asp:Button ID="btnLogin" runat="server" Style="" Width="70px" Height="30px" OnClick="Login_Click"
                                            OnClientClick="disableFields();" Text="Login" />
                                    </div>
                                </div>
                            </div>
                            <div class="LoginPanelRight">
                                <div id="loginFail" runat="server" visible="false" style="width: 215px; font-family: Arial;
                                    font-size: 9pt;">
                                    <p style="color: #e0301e">
                                        Your login attempt was unsuccessful</p>
                                    <h4>
                                        Possible causes:</h4>
                                    <ul>
                                        <li><span>Invalid login details entered</span></li>
                                        <li><span>Account marked as In-Active</span></li>
                                        <li><span>Failed login attempt limit exceeded</span></li>
                                        <li><span>Problem sending authorisatio code, please retry</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
        <pwc:Footer ID="pageFooter" FooterType="login" runat="server" />
    </div>
    </div>
    </form>
</body>
</html>
