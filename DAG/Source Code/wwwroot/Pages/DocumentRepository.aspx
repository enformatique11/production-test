<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true"
    CodeBehind="DocumentRepository.aspx.cs" Inherits="PwC.Pages.DocumentRepository" %>

<%@ Register Src="~/Common/Controls/ucAttachmentViewer.ascx" TagName="AttachmentViewer"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        Project Document Repository</h1>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <h4>
                <asp:Label runat="server" ID="lblHeader" Text=" ">&nbsp;</asp:Label></h4>
            <div style="float: left; width: 240px;">
                <asp:SqlDataSource ID="dsDocumentCategories" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
                    SelectCommand="uspLookupGet" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="DocumentCategory" Name="LookupCode" Type="String" />
                        <asp:Parameter DefaultValue=" " Name="InitialValuesFlag" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:TreeView ID="TreeView1" Width="100%" runat="server" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                    SelectedNodeStyle-CssClass="selectedNode" CssClass="treeview" NodeStyle-CssClass="node">
                    <Nodes>
                    </Nodes>
                </asp:TreeView>
            </div>
            <div style="float: right; width: 640px; margin-left: 15px; display:block;">
                <uc1:AttachmentViewer ReferenceID="-1" ID="AttachmentViewer1" Title="" ReferenceType="Solvency II Regulatory Requirements"
                    ShowAddAttachment="true" EnableDelete="true" runat="server" />
            </div>
            <%--Following clear:both required for IE6 styling--%>
            <div style="clear: both;">
                &nbsp;</div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
