<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="OwnerAssigner.ascx.cs"
    Inherits="PwC.Common.Controls.OwnerAssigner" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<div style="font-family: Arial">
    <div class="fullWidthBlock" style="margin-bottom: 2px; height:26px;">
        <div style="float: left;">
            <h2>
                Owners</h2>
        </div>
        <div class="alignRight">
            <asp:Button ID="btnAddOwner" runat="server" Text="Assign Owner" Width="130px" CssClass="plusIcon" />
        </div>
    </div> 
    <div style="border: 1px solid #dc6900; width:893px; padding:0px 0px 5px 5px; clear:both; overflow:hidden;">
        <asp:Repeater ID="rptOwners" runat="server">
            <ItemTemplate>
                <asp:LinkButton ID="btnItem" CssClass='<%# Eval("OwnerType").ToString() == "Owner" ? "ListEntityOwner" : "ListEntityDataAdmin" %>' runat="server" 
                    ToolTip='<%# Eval("FirstName") + " " + Eval("Surname") + " (" + Eval("OwnerType") + ")" %>'>
                    <%# Eval("FirstName") + " " + Eval("Surname") + " (" + Eval("OwnerTypeShort").ToString() + ")" %> &nbsp;
                    <asp:ImageButton ID="imgDelete" runat="server" ImageUrl="~/img/PwCIcons/20x20/delete_icon20.png" CssClass='<%# Eval("OwnerType").ToString() == "Owner" ? "icon20x20 PwCOrange" : "icon20x20 PwCRed" %>' 
                        CommandName="ID" CommandArgument='<%# Eval("ID") %>' ImageAlign="AbsMiddle" OnClick="btnItem_Click"
                        Visible='<%# Eval("AutoAssignedBy").ToString() == "0" ? true : false %>' />
                </asp:LinkButton>
            </ItemTemplate>
        </asp:Repeater>
        <div id="divNoOwners" runat="server" visible="false" style="margin: 4px 10px 0 1px; color: #000">
            There are no owners currently assigned.</div>
    </div>
    <cc1:ModalPopupExtender ID="modOwners" runat="server" TargetControlID="btnAddOwner"
        PopupControlID="pnlOwners" BackgroundCssClass="modalBackground" PopupDragHandleControlID="phead">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pnlOwners" runat="server" CssClass="modalPopup" Style="display: none;
        width: 700px;">
        <div id="pHead" runat="server" class="popupHeader">
            Assign Contact
        </div>
        <div id="pContent" class="popupContent">
            <asp:UpdatePanel ID="updPanelModal" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <asp:TextBox ID="txtModalSearch" runat="server" />
                    <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click"
                        CssClass="iconButton Search" Width="78px" />
                    <div style="margin: 10px 0 10px 0;">
                        <asp:GridView ID="gvOwnersSearch" runat="server" CssClass="gridview" DataSourceID="sdsModalSearch"
                            AutoGenerateColumns="false" GridLines="None" AllowSorting="true" OnSorted="gvOwnersSearch_Sorted" OnPageIndexChanged="ShowModalPopup"
                            AllowPaging="true" PageSize="8">
                            <RowStyle CssClass="row1" />
                            <AlternatingRowStyle CssClass="row0" />
                            <PagerStyle CssClass="pager" />
                            <EmptyDataTemplate>
                                There are no results for the search criteria
                            </EmptyDataTemplate>
                            <Columns>
                                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                                <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                                <asp:TemplateField HeaderText="Owner" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnModalAssignOwner" runat="server" ImageUrl="~/img/PwCIcons/20x20/plus_icon20.png" CssClass="icon20x20 PwCOrange" CommandName="ID"
                                            CommandArgument='<%# Eval("ID") %>' OnClick="btnModalAssignAsOwner_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Data Administrator" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:ImageButton ID="btnModalAssignDataAdmin" runat="server" ImageUrl="~/img/PwCIcons/20x20/plus_icon20.png" CssClass="icon20x20 PwCRed" CommandName="ID"
                                            CommandArgument='<%# Eval("ID") %>' OnClick="btnModalAssignAsDataAdmin_Click" />
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </div>
                    <asp:SqlDataSource ID="sdsModalSearch" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
                        SelectCommand="uspOwnersSearch" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="txtModalSearch" PropertyName="Text" ConvertEmptyStringToNull="false"
                                DbType="String" Name="SearchText" DefaultValue="" />
                            <asp:SessionParameter Name="Username" DbType="String" ConvertEmptyStringToNull="false"
                                SessionField="Username" />
                            <asp:SessionParameter Name="Role" DbType="String" ConvertEmptyStringToNull="false"
                                SessionField="UserRole" />
                            <asp:Parameter Name="ReferenceID" DbType="Int32" ConvertEmptyStringToNull="false" />
                            <asp:Parameter Name="Type" DbType="String" ConvertEmptyStringToNull="false" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <div id="divAddNewContact" runat="server">
                        <asp:ValidationSummary ID="vsOwner" runat="server" class="validationsummary" HeaderText="<h3>Please provide the following information:</h3>" ValidationGroup="OwnerValidation" CssClass="errorSummary" Visible="true" />        
                        <div id="mainDiv" class="formPanel" runat="server" style="width:665px; margin-bottom:10px" >
                            <div class="formPanelRow" runat="server" style="height:30px;">                            
                                <h2 style="float:left;">New Contact</h2>
                                <div style="float:right; padding-right:40px;">
                                    <asp:Button ID="btnSaveOwner" runat="server" Text="Save New Contact" CssClass="iconButton Save" Width="150px" Height="22px" OnClick="btnSaveOwner_Click" CausesValidation="true" ValidationGroup="OwnerValidation" />
                                </div>                                                      
                            </div>
                            <div class="formPanelRow" runat="server">
                                <div class="pItemLbl">
                                    First Name
                                </div>
                                <div class="pItemCtl" style="width:200px;">
                                    <asp:TextBox ID="txtFirstName" runat="server" MaxLength="200" Width="190px" Text='' />
                                    <asp:RequiredFieldValidator ID="rfvtxtFirstName" runat="server" ValidationGroup="OwnerValidation" ControlToValidate="txtFirstName" ErrorMessage="Please enter a first name" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                </div>
                                <div class="pItemLbl">
                                    Surname
                                </div>
                                <div class="pItemCtl" style="width:200px;">
                                    <asp:TextBox ID="txtSurname" runat="server" MaxLength="200" Width="190px" Text='' />
                                    <asp:RequiredFieldValidator ID="rfvtxtSurname" runat="server" ValidationGroup="OwnerValidation" ControlToValidate="txtSurName" ErrorMessage="Please enter a surname" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <asp:Button ID="btnClose" runat="server" Text="Back" CssClass="iconButton Exit" Width="65px" OnClick="btnClose_Click" CausesValidation="false" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
    
    <asp:Button ID="btnDummy" runat="server" style="display:none;" />
    
    <cc1:ModalPopupExtender ID="mpUnAssignConfirmation" runat="server" TargetControlID="btnDummy"
        PopupControlID="pnlUnAssignConfirmation" BackgroundCssClass="modalBackground" PopupDragHandleControlID="phead2">
    </cc1:ModalPopupExtender>
    <asp:Panel ID="pnlUnAssignConfirmation" runat="server" CssClass="modalPopup" Style="display: none;width: 700px;">
        <div id="phead2" runat="server" class="popupHeader">
            Remove Owner Confirmation
        </div>
        <div id="Div2" class="popupContent">
            <asp:UpdatePanel ID="upUnAssignConfirmation" runat="server" UpdateMode="Always">
                <ContentTemplate>
                    <p id="pDeleteConfirmation" runat="server" style="padding-bottom:10px;">
                        
                    </p>    
                    
                    <asp:Button ID="btnUnAssignCascade" runat="server" Text="Remove From Definition and Data Items" Width="290px" CssClass="iconButton Cancel" Style="background-color:#e0301e" Visible="false" OnClick="btnUnAssignCasade_Click" CausesValidation="false" />                
                    <asp:Button ID="btnUnAssignNoCascade" runat="server" Text="Remove From Definition Only" Width="220px" CssClass="iconButton Cancel" OnClick="btnUnAssignNoCasade_Click" CausesValidation="false" />
                    <asp:Button ID="btnCloseConfirmation" runat="server" Text="Cancel" CssClass="iconButton Exit" Width="75px" OnClick="btnCloseConfirmation_Click" CausesValidation="false" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </asp:Panel>
</div>
