<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AttachmentViewer.ascx.cs"
    Inherits="PwC.Common.Controls.AttachmentViewer" %>
<%@ Register Assembly="PwC" Namespace="PwC" TagPrefix="cc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="UploaderV4" Namespace="UploaderV4" TagPrefix="cc" %>
<!-- attachments -->
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <asp:Label ID="lblTitle" runat="server" CssClass="AttachmentViewer_Title">Attachments</asp:Label>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="Sql_getSupportingEvidence"
            GridLines="None" AllowSorting="True" CssClass="gridview" RowStyle-CssClass="row1"
            AlternatingRowStyle-CssClass="row0">
            <EmptyDataTemplate>
                There are currently no attachments in this section
            </EmptyDataTemplate>
            <Columns>
                <asp:TemplateField HeaderText="" SortExpression="FileType">
                    <ItemTemplate>
                        <cc:exImageButton OnDataBinding="Image1RowDataBinding" CausesValidation="false" ID="imgBtnGetFile"
                            runat="server" OnClick="imgBtnGetFile" stringValue1='<%# Eval("FileAttachmentID") %>'
                            ImageUrl='<%# Eval("Imageurl") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="FileName" HeaderText="File Name" SortExpression="FileName"
                    ReadOnly="True" />
                <asp:BoundField DataField="FileTitle" HeaderText="File Title" SortExpression="FileTitle"
                    ReadOnly="true" />
                <asp:BoundField DataField="FileDescription" HeaderText="Description" SortExpression="FileDescription"
                    ReadOnly="True" />
                <asp:BoundField DataField="FileUploadDate" HeaderText="Upload Date" SortExpression="FileUploadDate"
                    ReadOnly="True" />
                <asp:TemplateField HeaderText="Delete" SortExpression="FileID">
                    <ItemTemplate>
                        <cc:exImageButton ID="imgBtnDeleteAttachment" runat="server" OnClick="DeleteAttachment"
                            stringValue1='<%# Eval("FileAttachmentID") %>' ImageUrl='../../img/delete_page.gif'
                            OnClientClick="return confirm('Are you sure you want to delete this document?');" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <%--DataSource to get list of attachments for the current audit--%>
        <asp:SqlDataSource ID="Sql_getSupportingEvidence" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
            SelectCommand="uspAttachmentGenericGetList" SelectCommandType="StoredProcedure" OnDataBinding="Sql_getSupportingEvidence_DataBinding">
            <SelectParameters>
                <asp:Parameter Name="ReferenceID" Type="Int32" />
                <asp:Parameter Name="ReferenceType" Type="String" />
                <asp:Parameter Name="SearchText" Type="String" DefaultValue="" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--Add attachment link--%>
        <div style="border: 1px solid #999999; padding: 10px; margin-top: 10px; float: right;
            background-color: #ffffff;" id="addAttachmentButton" runat="server">
            <asp:Image ImageUrl="~/img/attachment.gif" AlternateText="Add an attachment" Style="float: left;"
                runat="server" />
            <asp:LinkButton ID="lnkBtnAddAttachment" runat="server" CausesValidation="false"
                OnClick="lnkBtnAddAttachment_Click">Add Attachment</asp:LinkButton>
        </div>
        <div style="clear: both;">
            <!-- clear -->
        </div>
    </ContentTemplate>
</asp:UpdatePanel>
<!---------------------------------------------------------------------------------------------------->
<asp:Button ID="Button1" CausesValidation="false" runat="server" Text="" Style="display: none;" />
<cc1:ModalPopupExtender ID="AttachmentManagerModalPopup" runat="server" TargetControlID="Button1"
    PopupControlID="attachmentPanel" BackgroundCssClass="modalBackground" Drag="false">
</cc1:ModalPopupExtender>
<asp:Panel ID="attachmentPanel" runat="server" Width="710px" CssClass="modalPopup"
    Style="display: none;">
    <%--<asp:UpdatePanel ID="UpdatePanel2" runat="server">
        <ContentTemplate>--%>

    <asp:ValidationSummary ID="ValidationSummary2" runat="server" HeaderText="Validation Summary"
        ForeColor="" BorderColor="Red" BorderStyle="Solid" BorderWidth="1px" CssClass="errorSummary" />
    <%--            <div id="EditTemplate" runat="server">
                <span style="font-size: 12px; color: #002147; font-weight: bold;">Upload New Version</span>
                <fieldset>
                    <table>
                        <tr>
                            <td>
                                Title:<span class="star"> </span>
                            </td>
                            <td>
                                <asp:TextBox ID="filetitletextbox" runat="server" Width="600px" Text='' />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ValidationGroup="AttachmentViewer"
                                    ControlToValidate="filetitletextbox" Visible="false" ErrorMessage="Title is mandatory">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                Description:
                            </td>
                            <td>
                                <asp:TextBox ID="descriptiontextbox" runat="server" Width="600px" Text='' TextMode="MultiLine"
                                    Height="100px" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                File Path: <span class="star">*</span>
                            </td>
                            <td>
                                <asp:FileUpload ID="fileUploadBrowser" runat="server" Height="20px" Visible="True"
                                    Width="600px" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ValidationGroup="AttachmentViewer"
                                    ControlToValidate="fileUploadBrowser" Visible="false" ErrorMessage="File path is mandatory">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>
                </fieldset>
                <br />
                <span style="font-size: 12px; color: #002147; font-weight: bold;">Attachment History</span>
                <br />
                <asp:GridView ID="GridView2" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                    CellPadding="4" DataSourceID="SqlDataSource2" AllowPaging="True" PageSize="5"
                    CssClass="adminlist" Font-Size="X-Small" ForeColor="#333333" GridLines="Horizontal">
                    <FooterStyle />
                    <RowStyle />
                    <HeaderStyle BorderStyle="Solid" BorderWidth="1px" Font-Bold="True" Font-Underline="True"
                        HorizontalAlign="Center" ForeColor="White" />
                    <Columns>
                        <asp:TemplateField HeaderText="File" SortExpression="FileType">
                            <ItemTemplate>
                                <cc:exImageButton OnDataBinding="Image1RowDataBinding" CausesValidation="false" ID="Image1"
                                    OnClick="GetFileData" runat="server" stringValue1='<%# Eval("FileHistoryID") %>'
                                    ImageUrl='<%# Eval("Imageurl") %>' />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="VersionID" HeaderText="Version ID" SortExpression="VersionID" />
                        <asp:BoundField DataField="FileTitle" HeaderText="File Title" SortExpression="FileTitle" />
                        <asp:BoundField DataField="FileName" HeaderText="File Name" SortExpression="FileName" />
                        <asp:BoundField DataField="FileCategory" HeaderText="Category" SortExpression="FileCategory" />
                        <asp:BoundField DataField="FileDescription" HeaderText="Description" SortExpression="FileDescription" />
                        <asp:BoundField DataField="FileUploadDate" HeaderText="Upload Date" SortExpression="FileUploadDate" />
                    </Columns>
                    <EmptyDataTemplate>
                        &nbsp;<asp:Label ID="Label1" runat="server" Style="color: #FF0000" Text="There is no Document History for this file"></asp:Label>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
            <div id="InsertTemplate" runat="server" visible="false">--%>
    <span style="font-size: 12px; color: #002147; font-weight: bold;">Attachment Details</span>
    <fieldset>
        <table>
            <%--<tr><td>File Path:<span class="star">  </span></td>
                            <td><asp:FileUpload ID="fileUploadBrowser2" runat="server" Height="20px" 
                                    Visible="True" Width="619px" />
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ValidationGroup="AttachmentViewer" 
                                    ControlToValidate="fileUploadBrowser2" ErrorMessage="File path is mandatory">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>--%>
            <tr>
                <td>
                    Title:<span class="star"> </span>
                </td>
                <td>
                    <asp:TextBox ID="filetitletextbox2" runat="server" Width="605px" Text='' />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="filetitletextbox2"
                        ErrorMessage="Title is mandatory">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>
                    Description:
                </td>
                <td>
                    <asp:TextBox ID="descriptiontextbox2" runat="server" Width="605px" Height="100px"
                        Text='' TextMode="MultiLine" />
                </td>
            </tr>
            <tr>
                <td>
                    File Path:<span class="star"> </span>
                </td>
                <td>
                    <cc:FileUploader ID="fupload" runat="server" CreateSProc="uspCreateAttachment" ValidatePage="true"
                        CSSPath="~/css/Uploader.css" ExternalButton="btnUpload" UseCustomParamsForDataAppend="false" />
                </td>
            </tr>
        </table>
    </fieldset>
    <%--</div>--%>
    <br />
    <asp:Button ID="btnCancel" runat="server" OnClick="test" Text="Close" />
    <input type="button" value="Upload File" id="btnUpload" />
    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Panel>
