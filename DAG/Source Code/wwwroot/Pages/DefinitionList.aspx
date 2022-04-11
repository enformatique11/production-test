<%@ Page Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true"
    CodeBehind="DefinitionList.aspx.cs" Inherits="PwC.Pages.DefinitionList" %>

<%@ Register TagPrefix="cc" TagName="OwnerAssigner" Src="~/Common/Controls/OwnerAssigner.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        Definition List</h1>
    <p>You can use the drop down lists below to filter the list of definitions.</p>
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
                        Area of reporting</div>
                    <div class="fItemCtl">
                        <asp:DropDownList ID="drpSubTitle" runat="server" Width="183px" AutoPostBack="true" />
                    </div>
                    <div class="fItemLbl">
                        Owner</div>
                    <div class="fItemCtl">
                        <asp:DropDownList ID="drpOwner" runat="server" Width="183px" AutoPostBack="true" />
                    </div>
                </pwc:FilterRow>
                <pwc:FilterRow ID="FilterRow2" runat="server">
                    <div class="fItemLbl">
                        Format</div>
                    <div class="fItemCtl">
                        <asp:DropDownList ID="drpFormat" runat="server" Width="183px" AutoPostBack="true" OnSelectedIndexChanged="drpFormat_OnSelectedIndexChanged" />
                    </div>
                    <div class="fItemLbl">
                        Type</div>
                    <div class="fItemCtl">
                        <asp:DropDownList ID="drpType" runat="server" Width="183px" AutoPostBack="true" />
                    </div>
                    <div class="fItemLbl">
                        Unique Ref</div>
                    <div class="fItemCtl">
                        <asp:TextBox ID="txtDescription" runat="server" Width="178px" Height="16px" Visible="true" />
                    </div>
                </pwc:FilterRow>
            </pwc:FilterPanel>
            
            <div class="fullWidthBlock" style="margin-bottom:2px; height:26px;">
                <div style="float:left;">
                    <h2>Definitions List</h2>
                </div>
                <div class="alignRight">
                     <asp:Button ID="btnAdd" runat="server" Text="Add Definition" CssClass="plusIcon" Width="130px" OnClick="btnAdd_Click" />
                </div>
            </div>
            
            <div>
                <asp:GridView ID="gvDefinitions" runat="server" AutoGenerateColumns="False" GridLines="None"
                    CssClass="gridview" AllowPaging="True" AllowSorting="True" DataSourceID="sdsDefinitions"
                    PageSize="50">
                    <EmptyDataTemplate>
                        There are no results for the specified criteria.
                    </EmptyDataTemplate>
                    <RowStyle CssClass="row1" />
                    <AlternatingRowStyle CssClass="row0" />
                    <PagerStyle CssClass="pager" />
                    <Columns>                    
                        <asp:BoundField HeaderText="Unique Ref" DataField="UniqueRef" SortExpression="UniqueRef" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />                                            
                        <asp:BoundField HeaderText="Title" DataField="Title" SortExpression="Title" />                        
                        <asp:BoundField HeaderText="Quadrant" DataField="DefinitionRating" SortExpression="DefinitionRating" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                        <asp:BoundField HeaderText="Metric Owner" DataField="MetricOwner" SortExpression="MetricOwner" />
                        <asp:BoundField HeaderText="Data Steward" DataField="DataSteward" SortExpression="DataSteward" /> 
                        <asp:BoundField HeaderText="Data Repository" DataField="DataRepository" SortExpression="DataRepository" />
                        <asp:TemplateField HeaderText="Consolidated / Withdrawn" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Convert.ToBoolean(Eval("Consolidated").ToString()) ? "Yes" : "No" %>
                            </ItemTemplate>
                        </asp:TemplateField>                                 
                        <asp:BoundField HeaderText="No. Mappings" DataField="NumMappings" SortExpression="NumMappings" ItemStyle-Width="40px" HeaderStyle-Font-Size="8pt" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />
                        <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <cc:exImageButton ID="btnEdit" runat="server" OnClick="btnEditDefinition" CausesValidation="false" intValue1='<%# Eval("ID") %>' ImageUrl='~/img/PwCIcons/20x20/edit_icon20.png' CssClass="icon20x20 PwCOrange" /> 
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                                <cc:exImageButton ID="btnDelete" runat="server" OnClick="btnDeleteDefinition" CausesValidation="false" Visible='<%# Eval("Fields").ToString() == "0" %>' intValue1='<%# Eval("ID") %>' ImageUrl='~/img/PwCIcons/20x20/bin_icon_small.png' CssClass="icon20x20 PwCRed" OnClientClick="return confirm('Are you sure you want to delete this definition and all associated information? (i.e. Mappings, DQC, Controls, Key Contacts and Attachments');" /> 
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Data Items" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Button ID="btnDataItems" CssClass="iconButton List20" Width="55px" runat="server" OnClick="btnViewDataItems" CausesValidation="false" CommandArgument='<%# Eval("ID").ToString() %>' Text='<%# Eval("Fields").ToString()  %>' />                            
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            
            <asp:SqlDataSource ID="sdsDefinitions" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
                SelectCommand="uspDefinitionsGetList" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:ControlParameter Name="Title" DbType="String" ControlID="drpTitle" PropertyName="SelectedValue"
                        ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="SubTitle" DbType="String" ControlID="drpSubTitle" PropertyName="SelectedValue"
                        ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="Owner" DbType="String" ControlID="drpOwner" PropertyName="SelectedValue"
                        ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="Type" DbType="String" ControlID="drpType" PropertyName="SelectedValue"
                        ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="Format" DbType="String" ControlID="drpFormat"
                        PropertyName="SelectedValue" ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="Description" DbType="String" ControlID="txtDescription"
                        PropertyName="Text" ConvertEmptyStringToNull="false" />
                    <asp:SessionParameter Name="Username" DbType="String" ConvertEmptyStringToNull="false"
                        SessionField="Username" />
                    <asp:SessionParameter Name="Role" DbType="String" ConvertEmptyStringToNull="false"
                        SessionField="UserRole" />
                    <asp:Parameter Name="Valid" DbType="Boolean" Direction="Output" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
