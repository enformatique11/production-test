<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SimpleAttachmentViewer.ascx.cs" Inherits="PwC.Common.Controls.SimpleAttachmentViewer" %>
<asp:Repeater ID="rptFiles" runat="server" DataSourceID="sdsAttachments">
    <HeaderTemplate>
        <table class="adminlist sav_table" cellspacing="0" border="0" style="border-collapse: collapse;">
            <tr>
                <th scope="col"></th>
                <th align="left" scope="col">File Name</th>
                <th align="left" scope="col">Title</th>
                <th align="left" scope="col">Description</th>
            </tr>
    </HeaderTemplate>
    <ItemTemplate>
        <tr>
            <td class="sav_type_col"><asp:Image runat="server" ImageUrl='<%# Eval("Imageurl") %>' /></td>
            <td class="sav_name_col">
                <asp:HyperLink runat="server" NavigateUrl='<%# GetDownloadUrl(Eval("FileAttachmentID")) %>'>
                    <%# Eval("FileName") %>
                </asp:HyperLink>
            </td>
            <td class="sav_title_col"><%# Eval("FileTitle")%></td>
            <td class="sav_desc_col"><%# Eval("FileDescription")%></td>
        </tr>
    </ItemTemplate>
    <FooterTemplate>
        </table>
    </FooterTemplate>
</asp:Repeater>
<div id="emptyData" runat="server" class="sav_empty_row">
    No attachments were found.
</div>
<asp:SqlDataSource 
    ID="sdsAttachments" 
    runat="server" 
    ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
    SelectCommand="uspAttachmentGenericGetList" SelectCommandType="StoredProcedure"
    OnDataBinding="sdsAttachments_DataBinding"
    OnSelected="sdsAttachments_OnSelected"
    OnSelecting="sdsAttachments_OnSelecting">
    <SelectParameters>
        <asp:Parameter Name="ReferenceID" Type="Int32" />
        <asp:Parameter Name="ReferenceType" Type="String" />
    </SelectParameters>
</asp:SqlDataSource>
