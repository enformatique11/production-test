<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucGlobalAttachmentViewer.ascx.cs" Inherits="PwC.ucGlobalAttachmentViewer" %>
<%@ Register Assembly="PwC" Namespace="PwC" TagPrefix="cc" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!-- attachments -->
<asp:UpdatePanel ID="upnlAttachments" runat="server">
    <ContentTemplate>
        <h3><asp:Label ID="lblTitle" runat="server">Attachments</asp:Label></h3>
        <asp:GridView ID="gvAttachments" runat="server" AutoGenerateColumns="False" DataSourceID="sdsAttachments" GridLines="None" AllowSorting="True" CssClass="gridview" OnDataBound="GridView1_DataBound" OnPreRender="GridView1_PreRender" PageSize="15">
            <EmptyDataTemplate>
                No documents were found for the search text provided.
            </EmptyDataTemplate>
            <RowStyle CssClass="row1" />
            <AlternatingRowStyle CssClass="row0" />
            <Columns>                
                <asp:TemplateField HeaderText="" SortExpression="FileType">
                    <ItemTemplate>
                        <cc:exImageButton OnDataBinding="Image1RowDataBinding" CausesValidation="false" ID="eimgbtnGetFile" runat="server" OnClick="eimgbtnGetFile_Click" intValue1='<%# Eval("FileAttachmentID") %>' ImageUrl='<%# Eval("Imageurl") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="File Name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" SortExpression="FileName" ItemStyle-Width="175">
                    <ItemTemplate>
                        <cc:exLinkButton OnDataBinding="Image1RowDataBindingLinkButton" CausesValidation="false" ID="elnkbtnGetFile" runat="server" OnClick="eimgbtnGetFile_Click" intValue1='<%# Eval("FileAttachmentID") %>' Text='<%# Eval("FileName") %>' />
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Document Section" ItemStyle-Width="400">
                    <ItemTemplate>
                        <a style="color:#000" href='<%# ResolveUrl("~/Pages/DocumentViewer.aspx?Menu=" + Eval("MenuSectionID") + "&DocSection=" + Eval("DocSectionID")) %>' >
                            <%# Eval("MenuSectionTitle") + " " + (char)187 + " " + Eval("MainSectionTitle") + " " + (char)187 + " " + Eval("SubSectionTitle") + " " + (char)187 + " " + Eval("DocSectionTitle") %></a>                                                
                    </ItemTemplate>
                </asp:TemplateField>               
                <asp:BoundField DataField="FileTitle" HeaderText="File Title" SortExpression="FileTitle" ReadOnly="True" />
                <asp:BoundField DataField="FileDescription" HeaderText="Description" SortExpression="FileDescription" ReadOnly="True" />
                <asp:TemplateField HeaderText="Edit" SortExpression="FileID">
                    <ItemTemplate>
                        <cc:exImageButton ID="imgBtnEditAttachment" runat="server" OnClick="elnkbtnGoEditMode_Click"  CausesValidation="false"  intValue1='<%# Eval("FileAttachmentID") %>' stringValue1='<%# Eval("ReferenceType") %>' ImageUrl='~/img/text_page.gif' />
                    </ItemTemplate>
                </asp:TemplateField>               
            </Columns>
        </asp:GridView>
        <%--DataSource to get list of attachments for the current audit--%>
        <asp:SqlDataSource ID="sdsAttachments" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>" SelectCommand="uspAttachmentGlobalSearchGetList" SelectCommandType="StoredProcedure" OnDataBinding="sdsAttachments_DataBinding">
            <SelectParameters>
                <asp:Parameter Name="SearchText" DbType="String" ConvertEmptyStringToNull="false" />
            </SelectParameters>
        </asp:SqlDataSource>
        <%--Add attachment link--%>
        <div id="divAddAttachment" runat="server">
            <asp:LinkButton ID="lnkbtnAddAttachment" runat="server" CssClass="addAttachment" CausesValidation="false" OnClick="lnkbtnAddAttachment_Click">Add Attachment</asp:LinkButton>
        </div>
        <div style="clear: both;">
            <!-- clear -->
        </div>
    </ContentTemplate>
</asp:UpdatePanel>

<asp:Button ID="btnDummy" CausesValidation="false" runat="server" Text="" Style="display: none;" />
<cc1:ModalPopupExtender ID="mpAttachmentDetail" runat="server" TargetControlID="btnDummy" PopupControlID="pnlAttachmentDetail" BackgroundCssClass="modalBackground" PopupDragHandleControlID="phead">
</cc1:ModalPopupExtender>
<asp:Panel ID="pnlAttachmentDetail" runat="server" CssClass="modalPopup" Style="display: none;">
    <div id="phead" runat="server" class="popupHeader">
        Attachments History
    </div>
    <div style="padding: 7px; overflow: auto;">
        <asp:UpdatePanel ID="upnlAttachmentDetail" runat="server">
            <Triggers>
                <asp:PostBackTrigger ControlID="btnUploadFile" />
                <%--<asp:AsyncPostBackTrigger ControlID="btnCancel" />--%>
            </Triggers>
            <ContentTemplate>
                <asp:SqlDataSource ID="sdsAttachmentHistory" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>" SelectCommand="uspAttachmentGenericGetVersionList" SelectCommandType="StoredProcedure" UpdateCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter Name="FileAttachmentID" Type="Int32" />
                        <asp:Parameter Name="ReferenceType" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:ValidationSummary ID="vsAttachments" runat="server" class="validationsummary" HeaderText="Validation Summary" ForeColor="" BorderColor="Red" ValidationGroup="AttachmentViewer" BorderStyle="Solid" BorderWidth="1px" CssClass="errorSummary" Visible="false" />
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
                <div id="divEditTemplate" runat="server">
                    <div style="display:none;">
                        <div>
                          <div style="float: left; width: 100%; padding-bottom:7px;">
                                  Upload New Version
                            </div>
                        </div>
                        <div style="height: 30px;">
                            <div style="float: left; width: 110px">
                                Title:<span class="star"> </span>
                            </div>
                            <div style="float: left; width: 380px">
                                <asp:TextBox ID="txtFileTitle_Edit" runat="server" Width="360px" Text='' />
                                <asp:RequiredFieldValidator ID="vrfFileTitle_Edit" runat="server" ValidationGroup="AttachmentViewer" ControlToValidate="txtFileTitle_Edit" Visible="false" ErrorMessage="Title is mandatory">*</asp:RequiredFieldValidator>
                            </div>
                            <div style="float: left; padding-left: 10px; width: 60px">
                                Version:<span class="star"> </span>
                            </div>
                            <div style="float: left; width: 90px">
                                <asp:TextBox ID="txtCustomVersion_Edit" runat="server" Width="80px" Text='' />
                                <asp:RequiredFieldValidator ID="vrfCustomVersion_Edit" runat="server" ValidationGroup="AttachmentViewer" ControlToValidate="txtFileTitle_Edit" Visible="false" ErrorMessage="Version is mandatory">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                        <div style="height: 130px;">
                            <div style="float: left; width: 100%">
                                Description:<span class="star"> </span>
                            </div>
                            <div style="float: left; width: 670px">
                                <asp:TextBox ID="txtDescription_Edit" runat="server" Width="660px" Text='' TextMode="MultiLine" Height="100px" />
                            </div>
                        </div>
                        <div style="height: 30px;">
                            <div style="float: left; width: 110px">
                                File Path: <span class="star">*</span>
                            </div>
                            <div style="float: left; width: 535px">
                                <asp:FileUpload ID="fuBrowser_Edit" runat="server" Height="20px" Visible="True" Width="525px" />
                                </div>
                              <div style="float: left; width: 5px">
                              
                                <asp:RequiredFieldValidator ID="vrfBrowser_Edit" runat="server" ValidationGroup="AttachmentViewer" ControlToValidate="fuBrowser_Edit" Visible="false" ErrorMessage="File path is mandatory">*</asp:RequiredFieldValidator>
                            </div>
                        </div>
                    </div>
                    <div>
                            <asp:GridView ID="gvAttachmentHistory"  runat="server" GridLines="None" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataSourceID="sdsAttachmentHistory" AllowPaging="True" PageSize="5" CssClass="gridview">
                                <FooterStyle />
                                <RowStyle />
                                <Columns>
                                    <asp:TemplateField HeaderText="File" HeaderStyle-HorizontalAlign="Center" SortExpression="FileType">
                                        <ItemTemplate>
                                            <cc:exImageButton OnDataBinding="Image1RowDataBinding" CausesValidation="false" ID="Image1" OnClick="GetFileData" runat="server" intValue1='<%# Eval("FileHistoryID") %>' ImageUrl='<%# Eval("Imageurl") %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Center" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="CustomVersion" HeaderStyle-HorizontalAlign="Left" HeaderText="Version" SortExpression="CustomVersion" />
                                    <asp:TemplateField HeaderText="File Name" ItemStyle-HorizontalAlign="Left" HeaderStyle-HorizontalAlign="Left" SortExpression="FileName">
                                        <ItemTemplate>
                                            <cc:exLinkButton OnDataBinding="Image1RowDataBindingLinkButton" CausesValidation="false" ID="elnkbtnGetFileVersion" runat="server" OnClick="GetFileData" intValue1='<%# Eval("FileHistoryID") %>' Text='<%# Eval("FileName") %>' />
                                        </ItemTemplate>
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:TemplateField>
                                    <asp:BoundField DataField="FileTitle" HeaderStyle-HorizontalAlign="Left" HeaderText="File Title" SortExpression="FileTitle" />
                                    
                                    <asp:BoundField DataField="FileDescription" HeaderStyle-HorizontalAlign="Left" HeaderText="Description" SortExpression="FileDescription" />
                                    <asp:BoundField DataField="FileUploadDate" HeaderStyle-HorizontalAlign="Left" HeaderText="Upload Date" SortExpression="FileUploadDate" />
                                    <asp:BoundField DataField="LastUpdatedBy" HeaderStyle-Width="100px" HeaderText="Uploaded By" SortExpression="LastUpdatedBy" ReadOnly="True" />
                                </Columns>
                                <EmptyDataTemplate>
                                    &nbsp;<asp:Label ID="Label1" runat="server" Style="color: #FF0000" Text="There is no Document History for this file"></asp:Label>
                                </EmptyDataTemplate>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
                <div id="divInsertTemplate" runat="server" visible="false">
                    <div>
                        <div style="float: left; width: 100%; padding-bottom:7px;">
                            Attachment Details
                        </div>
                    </div>
                    <div style="height: 30px;">
                        <div style="float: left; width: 110px">
                            File Path: <span class="star">*</span>
                        </div>
                        <div style="float: left; width: 575px">
                            <asp:FileUpload ID="fuBrowser_Insert" runat="server" Height="20px" Visible="True" Width="555px" />
                            <asp:RequiredFieldValidator ID="vrfBrowser_Insert" runat="server" ValidationGroup="AttachmentViewer" ControlToValidate="fuBrowser_Insert" ErrorMessage="File path is mandatory">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div style="height: 30px;">
                        <div style="float: left; width: 110px">
                            Title:<span class="star"> </span>
                        </div>
                        <div style="float: left; width: 400px">
                            <asp:TextBox ID="txtFileTitle_Insert" runat="server" Width="380px" Text='' />
                            <asp:RequiredFieldValidator ID="vrfFileTitle_Insert" runat="server" ValidationGroup="AttachmentViewer" ControlToValidate="txtFileTitle_Insert" ErrorMessage="Title is mandatory">*</asp:RequiredFieldValidator>
                        </div>
                        <div style="float: left; padding-left: 10px; width: 60px">
                            Version:<span class="star"> </span>
                        </div>
                        <div style="float: left; width: 90px">
                            <asp:TextBox ID="txtCustomVersion_Insert" runat="server" Width="80px" Text='' />
                            <asp:RequiredFieldValidator ID="vrfCustomVersion_Insert" runat="server" ValidationGroup="AttachmentViewer" ControlToValidate="txtFileTitle_Edit" Visible="false" ErrorMessage="Version is mandatory">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div style="height: 130px;">
                        <div style="float: left; width: 100%">
                            Description:<span class="star"> </span>
                        </div>
                        <div style="float: left; width: 670px">
                            <asp:TextBox ID="txtDescription_Insert" runat="server" Width="660px" Height="100px" Text='' TextMode="MultiLine" />
                        </div>
                    </div>
                </div>
                <hr />
                <asp:Button ID="btnCancel"  CausesValidation="false"  runat="server" Text="Cancel" />
                <asp:Button ID="btnUploadFile" runat="server" Text="Upload File" OnClick="btnUploadFile_Click" CausesValidation="true" ValidationGroup="AttachmentViewer" Visible="false" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Panel>
