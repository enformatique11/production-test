<%@ Page Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true" CodeBehind="DataItemList.aspx.cs" Inherits="PwC.Pages.DataItemList" Title="Data Items List" %>
<%@ Register Src="~/Common/Controls/ucAttachmentViewer.ascx" TagName="AttachmentViewer" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>Data Items List</h1>
    <p>You can use the drop down lists below to filter the list of data items.</p>
    <asp:UpdatePanel ID="updpanel" runat="server">
        <ContentTemplate>      
            <pwc:FilterPanel ID="PageFilter" runat="server" FilterTitle="Filter Results" ShowSearchButton="true">
                <pwc:FilterRow ID="FilterRow1" runat="server">
                    <div class="fItemLbl">
                        Title</div>
                    <div class="fItemCtl">
                        <asp:DropDownList ID="drpTitle" runat="server" Width="183px" AutoPostBack="true" />
                    </div>
                    <div class="fItemLbl">
                        Description</div>
                    <div class="fItemCtl">
                        <asp:TextBox ID="txtDescription" runat="server" Width="178px" Height="16px" />
                    </div>
                    <div class="fItemLbl">
                        Group</div>
                    <div class="fItemCtl">
                        <asp:DropDownList ID="drpGroup" runat="server" Width="183px" AutoPostBack="true" />
                    </div>
                </pwc:FilterRow>    
                <pwc:FilterRow ID="FilterRow2" runat="server">
                    <div class="fItemLbl">
                        Materiality</div>
                    <div class="fItemCtl">
                        <asp:DropDownList ID="drpMateriality" runat="server" Width="183px" AutoPostBack="true" />
                    </div>
                </pwc:FilterRow>               
            </pwc:FilterPanel>
            
            <div class="fullWidthBlock" style="margin-bottom:2px; height:26px;">
                <div style="float:left;">
                    <h2 style="float:left;">Data Items for Definition:</h2><h3 style="float:left;">&nbsp;<asp:Label ID="lblDefinitionLabel" runat="server" Text=""></asp:Label></h3>
                </div>
                <div class="alignRight" style="width:140px;">
                    <asp:Button ID="btNewField" runat="server" Text="Add Data Item" CssClass="plusIcon" Width="130px" OnClick="btNewField_OnClick" />
                </div>
            </div>
            
            <asp:GridView ID="gvDataFieldsList" runat="server" AutoGenerateColumns="False" GridLines="None"
                CssClass="gridview" AllowPaging="True" AllowSorting="True" DataSourceID="sdsDataFieldList" PageSize="15" >
                <EmptyDataTemplate>
                    There are no results for the specified criteria.
                </EmptyDataTemplate>
                <RowStyle CssClass="row1" />
                <AlternatingRowStyle CssClass="row0" />
                <PagerStyle CssClass="pager" />
                <Columns>
                    <asp:BoundField HeaderText="ID" DataField="ID" SortExpression="ID" />
                    <asp:BoundField HeaderText="Title" DataField="Title" SortExpression="Title" />
                    <asp:BoundField HeaderText="Description" DataField="TruncatedDescription" SortExpression="TruncatedDescription" />
                    <asp:BoundField HeaderText="Group" DataField="Group" SortExpression="Group" />
                    <asp:BoundField HeaderText="Materiality" DataField="Materiality" SortExpression="Materiality" ItemStyle-Width="160px" /> 
                    <asp:BoundField HeaderText="No. Key Contacts" DataField="NumOwners" SortExpression="NumOwners" ItemStyle-Width="40px" HeaderStyle-Font-Size="8pt" />
                    <asp:BoundField HeaderText="No. DQC" DataField="NumDQC" SortExpression="NumDQC" ItemStyle-Width="40px" HeaderStyle-Font-Size="8pt" />
                    <asp:BoundField HeaderText="No. Mappings" DataField="NumMappings" SortExpression="NumMappings" ItemStyle-Width="40px" HeaderStyle-Font-Size="8pt" />
                    <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <cc:exImageButton ID="btnEdit" runat="server" OnClick="btnEditDataItems" CausesValidation="false" intValue1='<%# Eval("ID") %>' ImageUrl='~/img/PwCIcons/20x20/edit_icon20.png' CssClass="icon20x20 PwCOrange" /> 
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <cc:exImageButton ID="btnDeleteItem" runat="server" OnClick="btnDeleteDataItems" CausesValidation="false" intValue1='<%# Eval("ID") %>' ImageUrl='~/img/PwCIcons/20x20/bin_icon_small.png' CssClass="icon20x20 PwCRed" OnClientClick="return confirm('Are you sure you want to delete this data item and all associated information? (i.e. Mappings, DQC, Controls, Key Contacts, Attachments and Deficiencies');" /> 
                        </ItemTemplate>
                    </asp:TemplateField>                    
                </Columns>
            </asp:GridView>
            
            <div class="fullWidthBlock" style="padding: 5px 0px 10px 0px">
                <asp:Button ID="btnBack" runat="server" CssClass="iconButton Exit" Text="Back" Width="65px" OnClick="btnBack_OnClick" />
            </div>
            
            <asp:SqlDataSource ID="sdsDataFieldList" runat="server" 
                ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>" 
                SelectCommand="uspDataFieldGetListFiltered" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="Username" SessionField="Username" DbType="String" ConvertEmptyStringToNull="false" />
                    <asp:SessionParameter Name="Role" SessionField="UserRole" DbType="String" ConvertEmptyStringToNull="false" />
                    <asp:QueryStringParameter Name="DefinitionID" QueryStringField="Definition" DbType="Int32" ConvertEmptyStringToNull="false" /> 
                    <asp:ControlParameter Name="Title" DbType="String" ControlID="drpTitle"
                        PropertyName="SelectedValue" ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="Description" DbType="String" ControlID="txtDescription"
                        PropertyName="Text" ConvertEmptyStringToNull="false" /> 
                    <asp:ControlParameter Name="Group" DbType="String" ControlID="drpGroup"
                        PropertyName="SelectedValue" ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="Materiality" DbType="String" ControlID="drpMateriality"
                        PropertyName="SelectedValue" ConvertEmptyStringToNull="false" />                     
                    <asp:Parameter Name="Valid" Direction="Output" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
            
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
