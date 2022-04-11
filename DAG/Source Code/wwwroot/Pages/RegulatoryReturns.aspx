<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true" CodeBehind="RegulatoryReturns.aspx.cs" Inherits="PwC.Pages.RegulatoryReturns" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<style type="text/css" >

table.gridview tr td{ vertical-align:top;}



</style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        Regulatory Returns</h1>
    <p>You can use the drop down lists below to filter the list of Regulatory Returns.</p>
    <asp:UpdatePanel ID="updpanel" runat="server">
        <ContentTemplate>
            <pwc:FilterPanel ID="PageFilter" runat="server" FilterTitle="Filter Results" ShowSearchButton="true">
                <pwc:FilterRow ID="FilterRow1" runat="server">
                    <div class="fItemLbl">
                        Search</div>
                    <div class="fItemCtl">
                        <asp:TextBox ID="txtSearch" runat="server" Width="183px" AutoPostBack="true" />
                    </div>
                    <div class="fItemLbl">
                        License Condition</div>
                    <div class="fItemCtl">
                        <asp:DropDownList ID="drpLCondition" DataTextField="DataText" DataValueField="DataText" runat="server" Width="183px" AutoPostBack="true" />
                    </div>
                    <div class="fItemLbl">
                        Submissions Made Within</div>
                    <div class="fItemCtl">
                        <asp:DropDownList ID="drpDAGYear" OnSelectedIndexChanged="drpDAGYear_SelectedIndexChanged" runat="server" Width="183px" AutoPostBack="true" />
                    </div>
                </pwc:FilterRow>
                <pwc:FilterRow ID="FilterRow2" runat="server">
                    <div class="fItemLbl">
                        Owner</div>
                    <div class="fItemCtl">
                        <asp:DropDownList ID="drpOwner" runat="server" Width="183px" AutoPostBack="true"  />
                    </div>

                    <div class="fItemLbl" style="width: 200px; margin-top: 3px;">
                        Only show items awaiting my action</div>
                    <div class="fItemCtl">
                        <asp:CheckBox ID="chkShowMine" runat="server" AutoPostBack="true" />
                    </div>

                    <div style="float: right;">
                        <asp:Button ID="btnClearSearch" runat="server" Text="Clear" Width="46" OnClick="btnClearSearch_Click" />
                    </div>
                </pwc:FilterRow>
            </pwc:FilterPanel>
            
            <div class="fullWidthBlock" style="margin-bottom:2px; height:26px;">
                <div class="alignRight">
                     <asp:Button ID="btnAdd" runat="server" Text="Add New Regulatory Return" CssClass="plusIcon" Width="210px" OnClick="btnAdd_Click" />
                </div>
            </div>
            
            <div>
                <asp:GridView ID="gvRegulations" runat="server" AutoGenerateColumns="False" GridLines="None"
                    CssClass="gridview" AllowPaging="True" AllowSorting="True" DataSourceID="sdsRegulations"
                    PageSize="10">
                    <EmptyDataTemplate>
                        There are no results for the specified criteria.
                    </EmptyDataTemplate>
                    <RowStyle CssClass="row1" />
                    <AlternatingRowStyle CssClass="row0" />
                    <PagerStyle CssClass="pager" />
                    <Columns>    
                        <asp:BoundField   ItemStyle-Width="80px" HeaderText="License Condition" DataField="LicenseCondition" SortExpression="LicenseCondition" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />                
                        <asp:BoundField   ItemStyle-Width="80px" HeaderText="Submissions Made Within" DataField="DAGYear" SortExpression="DAGYear" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        <asp:BoundField   ItemStyle-Width="300px" HeaderText="NetDAR status" DataField="NETDARStatus" SortExpression="NETDARStatus" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        <asp:BoundField   ItemStyle-Width="300px" HeaderText="Submission status" DataField="SubmissionStatus" SortExpression="SubmissionStatus" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        <asp:BoundField   ItemStyle-Width="80px" HeaderText="No. of data sources" DataField="Sources" SortExpression="Sources" HeaderStyle-HorizontalAlign="Right" ItemStyle-HorizontalAlign="Right" />
                        
                       <%--<asp:TemplateField HeaderText="Consolidated / Withdrawn" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Convert.ToBoolean(Eval("Consolidated").ToString()) ? "Yes" : "No" %>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <asp:TemplateField ItemStyle-Width="50px"  HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <cc:exImageButton ID="btnEdit" runat="server" OnClick="btnEditReturn" CausesValidation="false" intValue1='<%# Eval("RegulationID") %>' ImageUrl='~/img/PwCIcons/20x20/edit_icon20.png' CssClass="icon20x20 PwCOrange" /> 
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false"  ItemStyle-Width="50px" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <cc:exImageButton ID="btnDelete" runat="server" OnClick="btnDeleteReturn" OnClientClick="return confirm('Are you sure you want delete?');" CausesValidation="false" intValue1='<%# Eval("RegulationID") %>' ImageUrl="~/img/PwCIcons/20x20/delete_icon20.png" CssClass="icon20x20 PwCRed" /> 
                            </ItemTemplate>
                        </asp:TemplateField>
                       
                    </Columns>
                </asp:GridView>
            </div>
            
            <asp:SqlDataSource ID="sdsRegulations" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
                SelectCommand="uspRegulationGetList" SelectCommandType="StoredProcedure">
                <SelectParameters>
                        <asp:ControlParameter Name="lCondition" DbType="String" ControlID="drpLCondition" PropertyName="SelectedValue"
                        ConvertEmptyStringToNull="false" />
                        <asp:ControlParameter Name="DAGYear" DbType="String" ControlID="drpDAGYear" PropertyName="SelectedValue"
                        ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="Owner" DbType="String" ControlID="drpOwner" PropertyName="SelectedValue"
                        ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="searchText" DbType="String" ControlID="txtSearch"
                        PropertyName="Text" ConvertEmptyStringToNull="false" />
                    <asp:SessionParameter Name="Username" DbType="String" ConvertEmptyStringToNull="false"
                        SessionField="Username" />
                    <asp:SessionParameter Name="Role" DbType="String" ConvertEmptyStringToNull="false"
                        SessionField="UserRole" />
                    <asp:ControlParameter Name="ShowMine" DbType="Boolean" ControlID="chkShowMine" PropertyName="Checked"
                        ConvertEmptyStringToNull="false" />
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
