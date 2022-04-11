<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucAttachmentViewer.ascx.cs"
    Inherits="PwC.ucAttachmentViewer" %>
<%@ Register Assembly="UploaderV4" Namespace="UploaderV4" TagPrefix="cc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc" %>
<div style="width: 100%; clear: both; margin-bottom: 2px; height: 26px">
    <h2 style="float: left">
        <asp:Label ID="lblTitle" runat="server">Attachments</asp:Label></h2>
    <asp:Button ID="btnAddAttachment" runat="server" Text="Add Attachment" CssClass="plusIcon"
        Width="140px" OnClick="btnAddAttachment_Click" Style="float: right" />
</div>
<asp:GridView ID="gvAttachments" runat="server" AutoGenerateColumns="false" GridLines="None"
    AllowSorting="False" CssClass="gridview" RowStyle-CssClass="row1" AlternatingRowStyle-CssClass="row0">
    <EmptyDataTemplate>
        There are no attachments currently assigned
    </EmptyDataTemplate>
    <Columns>
        <asp:TemplateField SortExpression="FileType" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:ImageButton ID="btnDownload" runat="server" ImageUrl='<%# Eval("Imageurl") %>'
                    CommandArgument='<%# Eval("FileAttachmentID") %>' CausesValidation="false" OnClick="btnDownload_Click" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="File Name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
            SortExpression="FileName">
            <ItemTemplate>
                <asp:LinkButton ID="lnkDownload" runat="server" Text='<%# Eval("FileName") %>' CommandArgument='<%# Eval("FileAttachmentID") %>'
                    CausesValidation="false" OnClick="lnkDownload_Click" />
            </ItemTemplate>
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
                <asp:ImageButton ID="btnEdit" runat="server" CssClass="icon20x20 PwCOrange" ImageUrl="~/img/PwCIcons/20x20/edit_icon20.png"
                    CommandArgument='<%# Eval("FileAttachmentID") %>' CausesValidation="false" OnClick="btnEdit_Click" />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Delete" SortExpression="FileID" HeaderStyle-HorizontalAlign="Center"
            ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:ImageButton ID="btnDelete" runat="server" CssClass="icon20x20 PwCRed" ImageUrl="~/img/PwCIcons/20x20/bin_icon_small.png"
                    CommandArgument='<%# Eval("FileAttachmentID") %>' OnClientClick="return confirm('Are you sure you want to delete this document?');"
                    CausesValidation="false" OnClick="btnDelete_Click" />
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<div style="clear: both;">
    <!-- clear -->
</div>
<asp:Button ID="btnDummy" CausesValidation="false" runat="server" Text="" Style="display: none;" />
<cc:ModalPopupExtender ID="mpAttachmentDetail" runat="server" TargetControlID="btnDummy"
    PopupControlID="pnlAttachmentDetail" BackgroundCssClass="modalBackground" PopupDragHandleControlID="phead">
</cc:ModalPopupExtender>
<asp:Panel ID="pnlAttachmentDetail" runat="server" CssClass="modalPopup" Style="display: none;">
    <div id="phead" runat="server" class="popupHeader">
        Attachments
    </div>
    <div style="padding: 7px; overflow: auto; font-family: Arial;">
        <asp:ValidationSummary ID="vsAttachments" runat="server" HeaderText="<h3>Please provide the following information:</h3>"
            ForeColor="" BorderColor="Red" ValidationGroup="AttachmentViewer" BorderStyle="Solid"
            BorderWidth="1px" CssClass="errorSummary" />
        <h2 id="lblModalHeading" runat="server" style="margin-bottom: 7px">
        </h2>
        <div style="height: 30px;">
            <div style="float: left; width: 110px">
                Title:<span class="star"> </span>
            </div>
            <div style="float: left; width: 400px">
                <asp:TextBox ID="txtFileTitle" runat="server" Width="380px" Text='' />
                <asp:RequiredFieldValidator ID="vrfFileTitle" runat="server" ValidationGroup="AttachmentViewer"
                    ControlToValidate="txtFileTitle" ErrorMessage="Title is mandatory">*</asp:RequiredFieldValidator>
            </div>
            <div style="float: left; padding-left: 10px; width: 60px">
                Version:<span class="star"> </span>
            </div>
            <div style="float: left; width: 90px">
                <asp:TextBox ID="txtCustomVersion" runat="server" Width="80px" Text='' />
                <asp:RequiredFieldValidator ID="vrfCustomVersion" runat="server" ValidationGroup="AttachmentViewer"
                    ControlToValidate="txtCustomVersion" Visible="false" ErrorMessage="Version is mandatory">*</asp:RequiredFieldValidator>
            </div>
        </div>
        <div style="height: 130px;">
            <div style="float: left; width: 100%">
                Description:<span class="star"> </span>
            </div>
            <div style="float: left; width: 670px">
                <asp:TextBox ID="txtDescription" runat="server" Width="660px" Height="100px" Text=''
                    TextMode="MultiLine" />
            </div>
        </div>
        <div style="height: 55px">
            <div style="float: left; width: 110px" id="divFilePath" runat="server">
                File Path: <span class="star">*</span>
            </div>
            <div style="float: left; width: 476px">
                <cc:FileUploader ID="fileUploader" runat="server" CreateSProc="uspAttachmentGenericCreate"
                    ValidatePage="true" ValidationGroup="AttachmentViewer" CSSPath="~/css/Uploader.css"
                    UseCustomParamsForDataAppend="false" />
            </div>
            <asp:Button ID="btnCancel" CausesValidation="false" runat="server" Text="Close" Height="23px"
                CssClass="iconButton Exit" Width="73px" OnClick="btnClose_Click" Style="margin-right: 23px;
                float: right" />
        </div>
        <asp:Panel ID="pnlHistory" runat="server">
            <div style="margin-bottom: 7px;">
                <h3>
                    History</h3>
            </div>
            <asp:GridView ID="gvAttachmentHistory" runat="server" GridLines="None" AllowSorting="False"
                AutoGenerateColumns="False" CellPadding="4" AllowPaging="True" PageSize="5" CssClass="gridview"
                RowStyle-CssClass="row1" AlternatingRowStyle-CssClass="row0">
                <EmptyDataTemplate>
                    &nbsp;<span style="color: Red">There is no Document History for this file</span>
                </EmptyDataTemplate>
                <Columns>
                    <asp:TemplateField HeaderText="File" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                        SortExpression="FileType">
                        <ItemTemplate>
                            <asp:ImageButton ID="btnDownloadHistory" runat="server" CommandArgument='<%# Eval("FileHistoryID") %>'
                                ImageUrl='<%# Eval("Imageurl") %>' CausesValidation="false" OnClick="btnDownloadHistory_Click" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="CustomVersion" HeaderStyle-HorizontalAlign="Left" HeaderText="Version"
                        SortExpression="CustomVersion" />
                    <asp:TemplateField HeaderText="File Name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left"
                        SortExpression="FileName">
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDownloadHistory" runat="server" CommandArgument='<%# Eval("FileHistoryID") %>'
                                CausesValidation="false" OnClick="lnkDownloadHistory_Click" Text='<%# Eval("FileName") %>' />
                        </ItemTemplate>
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
            </asp:GridView>
        </asp:Panel>
    </div>
</asp:Panel>
