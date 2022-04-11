<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true"
    CodeBehind="UserEdit.aspx.cs" Inherits="PwC.Pages.Super.UserEdit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        User Edit</h1>
    <asp:ValidationSummary ID="vsummary" runat="server" CssClass="errorSummary" Style="margin-top: 20px;"
        HeaderText="<h3>The following errors have occured:</h3>" />
    <div class="formPanel">
        <div class="formPanelRow">
            <div class="pItemLbl" style="width:100px;">
                Username</div>
            <div class="pItemCtl_x2">
                <asp:TextBox ID="txtRecordUsername" Width="100" runat="server" MaxLength="30"></asp:TextBox><asp:CustomValidator
                    ID="cvUsernameDuplicate" runat="server" Display="Dynamic" ValidateEmptyText="false"
                    ErrorMessage="The username you selected already exists">*</asp:CustomValidator>
                <asp:RequiredFieldValidator ID="rfUsername" runat="server" ErrorMessage="The username is mandatory"
                    ControlToValidate="txtRecordUsername">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="formPanelRow" id="divPassword" runat="server">
            <div class="pItemLbl" style="width:100px;">
                Password</div>
            <div class="pItemCtl_x2">
                <div id="divPasswordText"  visible="false" runat="server" style="padding-top: 5px; float: left;">
                    Change Password? (Y/N)</div>
                <asp:CheckBox ID="chkPassword" Visible="false" runat="server" />
                <asp:TextBox ID="txtPassword" Width="100" runat="server" MaxLength="50" TextMode="Password"></asp:TextBox><asp:RequiredFieldValidator
                    ID="rfPassword" runat="server" ErrorMessage="The password is mandatory" ControlToValidate="txtPassword">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="formPanelRow_x2">
            <div class="pItemLbl" style="width:100px;">
                Change P'word on Login
            </div>
            <div class="pItemCtl_x2">                
                <asp:CheckBox ID="chkUserChangePassword" runat="server" Text="Yes" TextAlign="Right" />
            </div>
        </div>
        
        <div class="formPanelRow">
        
            <div class="pItemLbl" style="width:100px;">
                First Name</div>
            <div class="pItemCtl_x2">
                <asp:TextBox ID="txtFirstname" Width="300" runat="server" MaxLength="100"></asp:TextBox></div>
        </div>
        <div class="formPanelRow">
            <div class="pItemLbl" style="width:100px;">
                Surname</div>
            <div class="pItemCtl_x2">
                <asp:TextBox ID="txtSurname" Width="300" runat="server" MaxLength="100"></asp:TextBox></div>
        </div>
        <div class="formPanelRow">
            <div class="pItemLbl" style="width:100px;">
                Email Address</div>
            <div class="pItemCtl_x2">
                <asp:TextBox ID="txtEmailAddress" Width="300" runat="server" MaxLength="100"></asp:TextBox></div>
        </div>
        <div class="formPanelRow">
            <div class="pItemLbl" style="width:100px;">
                Phone Number</div>
            <div class="pItemCtl_x2">
                <asp:TextBox ID="txtPhoneNumber" Width="300" runat="server" MaxLength="100"></asp:TextBox></div>
        </div>
        <div class="formPanelRow">
            <div class="pItemLbl" style="width:100px;">
                Active</div>
            <div class="pItemCtl_x2">
                <asp:CheckBox ID="chkActive" runat="server" /></div>
        </div>
        <div class="formPanelRow">
            <div class="pItemLbl" style="width:100px;">
                Access Valid</div>
            <div class="pItemCtl" style="width: 170px">
                <asp:TextBox ID="txtValidFrom" Width="100" runat="server"></asp:TextBox>
                <ajaxToolKit:CalendarExtender ID="txtValidFrom_CalendarExtender" runat="server" PopupPosition="TopLeft"
                    Enabled="True" PopupButtonID="btnValidFromDate" TargetControlID="txtValidFrom"
                    Format="dd/MM/yyyy" />
                <asp:ImageButton ID="btnValidFromDate" CausesValidation="false" ImageUrl="~/img/PwcIcons/20x20/calendar_icon20.png"
                    CssClass="iconCalendar PwCOrange" Width="20px" Height="20px" runat="server" />
                <asp:RangeValidator ID="rngValidFrom" runat="server" ControlToValidate="txtValidFrom"
                    Type="Date" MinimumValue="01/01/1999" MaximumValue="01/01/9999" ErrorMessage="Please enter a valid from date"
                    Display="None" />
                <asp:RequiredFieldValidator ID="rfValidFrom" runat="server" ErrorMessage="The Valid From date is mandatory"
                    ControlToValidate="txtValidFrom">*</asp:RequiredFieldValidator>
            </div>
            <div class="pItemLbl" style="width: 30px">
                to</div>
            <div class="pItemCtl" style="width: 170px">
                <asp:TextBox ID="txtValidTo" Width="100" runat="server"></asp:TextBox>
                <ajaxToolKit:CalendarExtender ID="txtValidTo_CalendarExtender" runat="server" PopupPosition="TopLeft"
                    Enabled="True" PopupButtonID="btnValidToDate" TargetControlID="txtValidTo" Format="dd/MM/yyyy" />
                <asp:ImageButton ID="btnValidToDate" CausesValidation="false" ImageUrl="~/img/PwcIcons/20x20/calendar_icon20.png"
                    CssClass="iconCalendar PwCOrange" Width="20px" Height="20px" runat="server" />
                <asp:RangeValidator ID="rngValidTo" runat="server" ControlToValidate="txtValidTo"
                    Type="Date" MinimumValue="01/01/1999" MaximumValue="01/01/9999" ErrorMessage="Please enter a valid to date"
                    Display="None" />
                <asp:RequiredFieldValidator ID="rfValidTo" runat="server" ErrorMessage="The Valid To date is mandatory"
                    ControlToValidate="txtValidTo">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="formPanelRow">
            <div class="pItemLbl" style="width:100px;">
                Role</div>
            <div class="pItemCtl_x2">
                <asp:DropDownList ID="dpRole" runat="server">
                    <asp:ListItem Text="ADMIN" Value="ADMIN"></asp:ListItem>
                    <asp:ListItem Text="SUPER" Value="SUPER"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>

        <div class="formPanelRow" style="height:auto">
            <div class="pItemLbl" style="width:100px;">
                Additional Role Type</div>
            <div class="pItemCtl_x2">
                <asp:CheckBoxList RepeatDirection="Vertical" ID="cbxOtherRoles" runat="server" >

                </asp:CheckBoxList>
            </div>
        </div>


        <div class="formPanelRow">
            <div class="pItemLbl" style="width:100px;">
                Organisation</div>
            <div class="pItemCtl_x2">
                <asp:DropDownList ID="dpOrganisation" runat="server">
                    <asp:ListItem Text="Wales & West Utilities" Value="WW"></asp:ListItem>
                    
                </asp:DropDownList>
            </div>
        </div>
        <div class="formPanelRow">
            <div class="pItemCtl_x3">
                <asp:Button ID="Button1" runat="server" Text="Back" CssClass="iconButton Exit"
                 Height="24px" CausesValidation="false" OnClientClick="window.location='UserList.aspx';return false;" />
                     <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="iconButton Save"
                OnClick="btnSave_Click" Height="24px" CausesValidation="true"/>

            </div>
        </div>
    </div>
</asp:Content>
