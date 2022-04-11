<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAttachmentViewer3.ascx.cs"
    Inherits="PwC.ucAttachmentViewer3" %>
<%@ Register Assembly="PwC" Namespace="PwC" TagPrefix="cc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="UploaderV4" Namespace="UploaderV4" TagPrefix="cc" %>
<!-- attachments -->
<div class="fullWidthBlock" style="margin-bottom: 2px; height: 26px;">
    <div style="float: left;">
        <h2>
            <asp:Label ID="lblTitle" runat="server">Attachments</asp:Label></h2>
    </div>
    <div id="divAddAttachment" runat="server" class="alignRight">
        <asp:Button ID="btnAddAttachment" runat="server" Text="Add Attachment" CssClass="plusIcon"
            Width="140px" OnClick="btnAddAttachment_Click" />
    </div>
</div>
<asp:GridView ID="gvAttachments" runat="server" AutoGenerateColumns="False" DataSourceID="sdsAttachments"
    GridLines="None" AllowSorting="True" CssClass="gridview" OnDataBound="GridView1_DataBound"
    OnPreRender="GridView1_PreRender">
    <EmptyDataTemplate>
        There are no attachments currently assigned
    </EmptyDataTemplate>
    <RowStyle CssClass="row1" />
    <AlternatingRowStyle CssClass="row0" />
    <Columns>
        <asp:TemplateField HeaderText="" SortExpression="FileType">
            <ItemTemplate>
                <cc:exImageButton OnDataBinding="Image1RowDataBinding" CausesValidation="false" ID="eimgbtnGetFile"
                    runat="server" OnClick="eimgbtnGetFile_Click" intValue1='<%# Eval("FileAttachmentID") %>'
                    ImageUrl='<%# Eval("Imageurl") %>' />
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Center" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="File Name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
            SortExpression="FileName">
            <ItemTemplate>
                <cc:exLinkButton OnDataBinding="Image1RowDataBindingLinkButton" CausesValidation="false"
                    ID="elnkbtnGetFile" runat="server" OnClick="eimgbtnGetFile_Click" intValue1='<%# Eval("FileAttachmentID") %>'
                    Text='<%# Eval("FileName") %>' />
            </ItemTemplate>
            <ItemStyle HorizontalAlign="Left" />
        </asp:TemplateField>
        <asp:BoundField DataField="FileTitle" HeaderText="File Title" SortExpression="FileTitle"
            ReadOnly="True" />
        <asp:BoundField DataField="FileDescription" HeaderText="Description" SortExpression="FileDescription"
            ReadOnly="True" />
        <asp:BoundField DataField="FileUploadDate" HeaderStyle-Width="100px" HeaderText="Upload Date"
            SortExpression="FileUploadDate" ReadOnly="True" />
        <asp:BoundField DataField="LastUpdatedBy" HeaderStyle-Width="100px" HeaderText="Uploaded By"
            SortExpression="LastUpdatedBy" ReadOnly="True" />
        <asp:BoundField DataField="CustomVersion" HeaderText="Version" SortExpression="CustomVersion" />
        <asp:TemplateField HeaderText="Edit" SortExpression="FileID" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <cc:exImageButton ID="imgBtnEditAttachment" runat="server" OnClick="elnkbtnGoEditMode_Click"
                    CausesValidation="false" intValue1='<%# Eval("FileAttachmentID") %>' stringValue1='<%# Eval("ReferenceType") %>'
                    CssClass="icon20x20 PwCOrange" ImageUrl='~/img/PwCIcons/20x20/edit_icon20.png' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Delete" SortExpression="FileID" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <cc:exImageButton ID="imgBtnDeleteAttachment" runat="server" OnClick="DeleteAttachment"
                    CausesValidation="false" intValue1='<%# Eval("FileAttachmentID") %>' ImageUrl='~/img/PwCIcons/20x20/bin_icon_small.png'
                    CssClass="icon20x20 PwCRed" OnClientClick="return confirm('Are you sure you want to delete this document?');" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<%--DataSource to get list of attachments for the current audit--%>
<asp:SqlDataSource ID="sdsAttachments" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
    SelectCommand="uspAttachmentGenericGetList" SelectCommandType="StoredProcedure"
    OnDataBinding="sdsAttachments_DataBinding">
    <SelectParameters>
        <asp:Parameter Name="ReferenceID" DbType="Int32" />
        <asp:Parameter Name="ReferenceType" DbType="String" ConvertEmptyStringToNull="false" />
        <asp:Parameter Name="SearchText" DbType="String" ConvertEmptyStringToNull="false" />
    </SelectParameters>
</asp:SqlDataSource>
<div style="clear: both;">
    <!-- clear -->
</div>
<asp:Button ID="btnDummy" CausesValidation="false" runat="server" Text="" Style="display: none;" />
<cc1:ModalPopupExtender ID="mpAttachmentDetail" runat="server" TargetControlID="btnDummy"
    PopupControlID="pnlAttachmentDetail" BackgroundCssClass="modalBackground" PopupDragHandleControlID="phead">
</cc1:ModalPopupExtender>
<asp:Panel ID="pnlAttachmentDetail" runat="server" CssClass="modalPopup" Style="display: none;">
    <div id="phead" runat="server" class="popupHeader">
        Attachments
    </div>
    <div style="padding: 7px; overflow: auto; font-family: Arial;">
        <asp:SqlDataSource ID="sdsAttachmentHistory" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
            SelectCommand="uspAttachmentGenericGetVersionList" SelectCommandType="StoredProcedure"
            UpdateCommandType="StoredProcedure">
            <SelectParameters>
                <asp:Parameter Name="FileAttachmentID" Type="Int32" />
                <asp:Parameter Name="ReferenceType" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:ValidationSummary ID="vsAttachments" runat="server" class="validationsummary"
            HeaderText="<h3>Please provide the following information:</h3>" ForeColor=""
            BorderColor="Red" ValidationGroup="AttachmentViewer" BorderStyle="Solid" BorderWidth="1px"
            CssClass="errorSummary" Visible="false" />
        <div runat="server" visible="false" id="divReferenceTypeSelection">
            <div>
                <div style="float: left; width: 110px">
                    Reference Type:<span class="star"> </span>
                </div>
                <div style="float: left; width: 400px">
                    <asp:DropDownList ID="drdReferenceTypes" runat="server">
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <div id="divEditTemplate" runat="server" style="margin-bottom: 10px;">
            <div>
                <div style="float: left; width: 100%; padding-bottom: 7px;">
                    <h2>
                        Upload New Version</h2>
                </div>
            </div>
            <div style="height: 30px;">
                <div style="float: left; width: 110px">
                    Title:<span class="star"> </span>
                </div>
                <div style="float: left; width: 380px">
                    <asp:TextBox ID="txtFileTitle_Edit" runat="server" Width="360px" Text='' />
                    <asp:RequiredFieldValidator ID="vrfFileTitle_Edit" runat="server" ValidationGroup="AttachmentViewer"
                        ControlToValidate="txtFileTitle_Edit" Visible="false" ErrorMessage="Title is mandatory">*</asp:RequiredFieldValidator>
                </div>
                <div style="float: left; padding-left: 10px; width: 60px">
                    Version:<span class="star"> </span>
                </div>
                <div style="float: left; width: 90px">
                    <asp:TextBox ID="txtCustomVersion_Edit" runat="server" Width="80px" Text='' />
                    <asp:RequiredFieldValidator ID="vrfCustomVersion_Edit" runat="server" ValidationGroup="AttachmentViewer"
                        ControlToValidate="txtFileTitle_Edit" Visible="false" ErrorMessage="Version is mandatory">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <div style="height: 130px;">
                <div style="float: left; width: 100%">
                    Description:<span class="star"> </span>
                </div>
                <div style="float: left; width: 670px">
                    <asp:TextBox ID="txtDescription_Edit" runat="server" Width="660px" Text='' TextMode="MultiLine"
                        Height="100px" />
                </div>
            </div>
            <div style="overflow: hidden">
                <div style="float: left; width: 110px">
                    File Path: <span class="star">*</span>
                </div>
                <div style="float: left; width: 535px">
                    <%--<cc:FileUploader ID="fuploadEdit" runat="server" CreateSProc="uspCreateAttachment"
                        ValidatePage="true" ValidationGroup="AttachmentViewer" CSSPath="~/css/Uploader.css"
                        UseCustomParamsForDataAppend="false" />--%>
                </div>
            </div>
            <div>
                <div style="margin-bottom: 7px;">
                    <h3>
                        History</h3>
                </div>
                <div>
                    <asp:GridView ID="gvAttachmentHistory" runat="server" GridLines="None" AllowSorting="True"
                        AutoGenerateColumns="False" CellPadding="4" DataSourceID="sdsAttachmentHistory"
                        AllowPaging="True" PageSize="5" CssClass="gridview">
                        <FooterStyle />
                        <RowStyle />
                        <Columns>
                            <asp:TemplateField HeaderText="File" HeaderStyle-HorizontalAlign="Center" SortExpression="FileType">
                                <ItemTemplate>
                                    <cc:exImageButton OnDataBinding="Image1RowDataBinding" CausesValidation="false" ID="Image1"
                                        OnClick="GetFileData" runat="server" intValue1='<%# Eval("FileHistoryID") %>'
                                        ImageUrl='<%# Eval("Imageurl") %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Center" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="CustomVersion" HeaderStyle-HorizontalAlign="Left" HeaderText="Version"
                                SortExpression="CustomVersion" />
                            <asp:TemplateField HeaderText="File Name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                                SortExpression="FileName">
                                <ItemTemplate>
                                    <cc:exLinkButton OnDataBinding="Image1RowDataBindingLinkButton" CausesValidation="false"
                                        ID="elnkbtnGetFileVersion" runat="server" OnClick="GetFileData" intValue1='<%# Eval("FileHistoryID") %>'
                                        Text='<%# Eval("FileName") %>' />
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="FileTitle" HeaderStyle-HorizontalAlign="Left" HeaderText="File Title"
                                SortExpression="FileTitle" />
                            <asp:BoundField DataField="FileDescription" HeaderStyle-HorizontalAlign="Left" HeaderText="Description"
                                SortExpression="FileDescription" />
                            <asp:BoundField DataField="FileUploadDate" HeaderStyle-HorizontalAlign="Left" HeaderText="Upload Date"
                                SortExpression="FileUploadDate" />
                            <asp:BoundField DataField="LastUpdatedBy" HeaderStyle-Width="100px" HeaderText="Uploaded By"
                                SortExpression="LastUpdatedBy" ReadOnly="True" />
                        </Columns>
                        <EmptyDataTemplate>
                            &nbsp;<asp:Label ID="Label1" runat="server" Style="color: #FF0000" Text="There is no Document History for this file"></asp:Label>
                        </EmptyDataTemplate>
                    </asp:GridView>
                </div>
            </div>
        </div>
        
            <div>
                <div style="float: left; width: 100%; padding-bottom: 7px;">
                    <h2>
                        Attachment Details</h2>
                </div>
            </div>
            <div style="height: 30px;">
                <div style="float: left; width: 110px">
                    Title:<span class="star"> </span>
                </div>
                <div style="float: left; width: 400px">
                    <asp:TextBox ID="txtFileTitle_Insert" runat="server" Width="380px" Text='' />
                    <asp:RequiredFieldValidator ID="vrfFileTitle_Insert" runat="server" ValidationGroup="AttachmentViewer"
                        ControlToValidate="txtFileTitle_Insert" ErrorMessage="Title is mandatory">*</asp:RequiredFieldValidator>
                </div>
                <div style="float: left; padding-left: 10px; width: 60px">
                    Version:<span class="star"> </span>
                </div>
                <div style="float: left; width: 90px">
                    <asp:TextBox ID="txtCustomVersion_Insert" runat="server" Width="80px" Text='' />
                    <asp:RequiredFieldValidator ID="vrfCustomVersion_Insert" runat="server" ValidationGroup="AttachmentViewer"
                        ControlToValidate="txtFileTitle_Edit" Visible="false" ErrorMessage="Version is mandatory">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <div style="height: 130px;">
                <div style="float: left; width: 100%">
                    Description:<span class="star"> </span>
                </div>
                <div style="float: left; width: 670px">
                    <asp:TextBox ID="txtDescription_Insert" runat="server" Width="660px" Height="100px"
                        Text='' TextMode="MultiLine" />
                </div>
            </div>
            <div style="overflow: hidden">
                <div style="float: left; width: 110px">
                    File Path: <span class="star">*</span>
                </div>
                <div style="float: left; width: 575px">
                    <cc:FileUploader ID="fuploadNew" runat="server" CreateSProc="uspCreateAttachment"
                        ValidatePage="true" ValidationGroup="AttachmentViewer" CSSPath="~/css/Uploader.css"
                        UseCustomParamsForDataAppend="false" />
                </div>
            </div>
        
        <%--<input type="button" value="Upload File" id="btnUpload" style="width: 24px; width: 105px"
                    class="iconButton Save" />--%>
        <asp:Button ID="btnCancel" CausesValidation="false" runat="server" Text="Cancel"
            Height="24px" CssClass="iconButton Exit" Width="75px" />
    </div>
</asp:Panel>
