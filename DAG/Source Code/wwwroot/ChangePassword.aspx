<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true"
    CodeBehind="ChangePassword.aspx.cs" Inherits="PwC.ChangePassword1" %>
<%@ Register TagPrefix="cc" TagName="Password" Src="~/Common/Controls/PasswordControl.ascx"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        Change Password</h1>    
    <div id="ActionSummary" runat="server" style="border: 1px solid #E0301E; background-color: #F5F4F0;
        margin: 10px 0px; padding: 4px 10px 4px 5px; font-family: Arial; overflow:hidden;" visible="false">        
        <div style="float: left; background-color: #E0301E; padding: 2.5px;">
            <img src='<%= ResolveUrl("~/img/PwCIcons/15x15/info_icon15.png") %>' alt="Info" />
        </div>        
        <div style="float: left; margin-left: 10px;">
            <asp:Label ID="ActionText" runat="server" Text=""></asp:Label>
        </div>
    </div>
    
    <asp:ValidationSummary ID="vsummary" runat="server" CssClass="errorSummary" Style="margin-top: 20px;"
        HeaderText="<h3>The following errors have occured:</h3>" />
    <div visible="false"  class="SuccessMessage" id="SuccessMessage" runat="server"  >
    <h3>Your password has successfully been changed.</h3></div> 
       
    <div style="clear:both;">
        <p>Please note: Your new password must be a minimum of 7 characters and contain at least one uppercase letter, one lowercase letter and one number.</p>
    </div>    
    <div class="formPanel">
        <div class="formPanelRow" id="div1" runat="server">
            <div class="pItemLbl" style="width:150px;">
                Existing Password</div>
            <div class="pItemCtl_x2">
                <asp:TextBox ID="txtPasswordOld" Width="100" runat="server" MaxLength="50" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfPasswordOld" runat="server" ErrorMessage="The 'Existing Password' is mandatory" ControlToValidate="txtPasswordOld">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvPasswordWrong" runat="server"  ErrorMessage="The existing password you entered does not match the password for your account, please try again." >*</asp:CustomValidator>
                <asp:CustomValidator ID="cvPasswordUsed" runat="server"  ErrorMessage="The new password you entered has already been used recently (either in your last 5 passwords or the last 60 days). Please enter another password." >*</asp:CustomValidator>
            </div>
        </div>
        <div class="formPanelRow" id="divPassword" runat="server" style="padding-top:0px;">
            <div class="pItemLbl" style="width:150px;">
                New Password</div>
            <div class="pItemCtl_x2">
               <%-- <asp:TextBox ID="txtPasswordNew" Width="100" runat="server" MaxLength="50" TextMode="Password"></asp:TextBox>--%>
                <cc:Password ID="txtPasswordNew" Width="100" runat="server"  />
                <asp:RequiredFieldValidator
                    ID="rfPasswordNew" runat="server" ErrorMessage="The 'New Password' is mandatory" ControlToValidate="txtPasswordNew$txtPassword">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cmvPassword" runat="server" ControlToValidate="txtPasswordNew$txtPassword" ControlToCompare="txtPasswordNewR"  ErrorMessage="The two new passwords that you entered do not match, please try again." >*</asp:CompareValidator>
            </div>
        </div>
        <div class="formPanelRow" id="div2" runat="server">
            <div class="pItemLbl" style="width:150px;">
                Repeat New Password</div>
            <div class="pItemCtl_x2">
                <asp:TextBox ID="txtPasswordNewR" Width="100" runat="server" MaxLength="50" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator
                    ID="rfPasswordNewR" runat="server" ErrorMessage="The 'Repeat New Password' is mandatory" ControlToValidate="txtPasswordNewR">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="formPanelRow">
            <div class="pItemCtl_x3">
                <asp:Button ID="btnChange" runat="server" Text="Change" Height="21px" OnClick="btnChange_Click" CausesValidation="true"  />
            </div>
        </div>
    </div>
</asp:Content>
