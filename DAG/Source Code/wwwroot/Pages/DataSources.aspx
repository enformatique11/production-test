<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true"
    CodeBehind="DataSources.aspx.cs" Inherits="PwC.Pages.DataSources" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <style type="text/css">
        
        table.gridview tr td{ vertical-align:top;}

        .backLink
        {
            font-family: Arial;
            font-size: 12px;
        }
        
        table.gridview tr.rejrow td
        {
            background-color: rgb(221,221,35);
        }
        
        .hdrfilter
        {
            display: none;
        }
    </style>
    <%--<asp:LinkButton ID="btnBackPage" runat="server" Text="<< Back to previous page" CssClass="backLink" OnClick="btnBackPage_OnClick"></asp:LinkButton>
<br /><br />--%>
    <h1>
        Data Sources</h1>
    <p>
        You can use the drop down lists below to filter the list of Data Sources.</p>
    <asp:UpdatePanel ID="updpanel" runat="server">
        <ContentTemplate>
            <pwc:FilterPanel ID="PageFilter" runat="server" FilterTitle="Filter Results" HeaderCssClass="hdrfilter"
                ShowSearchButton="true">
                <pwc:FilterRow ID="FilterRow1" runat="server">
                    <div class="fItemLbl">
                        Search</div>
                    <div class="fItemCtl">
                        <asp:TextBox ID="txtSearch" runat="server" Width="183px" AutoPostBack="true" />
                    </div>
                    <div class="fItemLbl">
                        License Condition</div>
                    <div class="fItemCtl">
                        <asp:DropDownList ID="drpLCondition" runat="server" Width="183px" AutoPostBack="true" />
                    </div>
                    <div class="fItemLbl">
                        Submissions Made Within</div>
                    <div class="fItemCtl">
                        <asp:DropDownList ID="drpDAGYear" DataTextField="DataText" DataValueField="DataText" OnSelectedIndexChanged="drpDAGYear_SelectedIndexChanged" runat="server" Width="183px" AutoPostBack="true" />
                    </div>
                </pwc:FilterRow>
                <pwc:FilterRow ID="FilterRow2" runat="server">

                    <div class="fItemLbl">
                        Business Lead</div>
                    <div class="fItemCtl">
                        <asp:DropDownList runat="server" ID="drpOwner" AutoPostBack="true" />
                    </div>

                    <div class="fItemLbl" style="width: 200px; margin-top: 3px;">
                        Only show items awaiting my action</div>
                    <div class="fItemCtl">
                        <asp:CheckBox runat="server" ID="chkShowMine" AutoPostBack="true" />
                    </div>
                    <div style="float: right">
                        <asp:Button runat="server" ID="btnClear" Text="Clear" Style="margin-left: 5px" OnClick="btnClear_Click" />
                        <asp:Button runat="server" ID="btnSearch" Text="Search" />
                    </div>
                </pwc:FilterRow>
                <%--<pwc:FilterRow ID="FilterRow2" runat="server">
                    <div class="fItemLbl">
                        Owner</div>
                    <div class="fItemCtl">
                        <asp:DropDownList ID="drpOwner" runat="server" Width="183px" AutoPostBack="true"  />
                    </div>
                </pwc:FilterRow>--%>
            </pwc:FilterPanel>
            <div style="clear: both; margin-top: 5px; height:24px;">
                <div style="float: left">
                    Key:
                </div>
                <div style="float: left; margin-top: 4px; background-color: rgb(221,221,35); width: 10px;
                    height: 10px;">
                    &nbsp;</div>
                <div style="float: left">
                    = record was rejected back to current status.</div>
            </div>
            <div >
                <asp:GridView ID="gvDataSources" runat="server" AutoGenerateColumns="False" GridLines="None"
                    CssClass="gridview" AllowPaging="True" AllowSorting="True" DataSourceID="sdsDataSources"
                    OnRowDataBound="gvDataSources_OnRowDataBound" PageSize="10">
                    <EmptyDataTemplate>
                        There are no results for the specified criteria.
                    </EmptyDataTemplate>
                    <RowStyle CssClass="row1" />
                    <AlternatingRowStyle CssClass="row0" />
                    <PagerStyle CssClass="pager" />
                    <Columns>
                        <asp:BoundField ItemStyle-Width="80px" HeaderText="License Condition" DataField="LicenseCondition"
                            SortExpression="LicenseCondition" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        <asp:BoundField ItemStyle-Width="200px" HeaderText="Condition title / table number"
                            DataField="ConditionTitle" SortExpression="ConditionTitle" HeaderStyle-HorizontalAlign="Left"
                            ItemStyle-HorizontalAlign="Left" />
                        <asp:BoundField ItemStyle-Width="200px" HeaderText="NetDAR status" DataField="Stage1Status"
                            SortExpression="Stage1Status" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        <asp:BoundField ItemStyle-Width="200px" HeaderText="Submission status" DataField="Stage2Status"
                            SortExpression="Stage2Status" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        <asp:BoundField ItemStyle-Width="80px" HeaderText="Submissions Made Within" DataField="DAGYear"
                            SortExpression="DAGYear" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                        <%--<asp:BoundField HeaderText="Unique Ref" DataField="UniqueRef" SortExpression="UniqueRef" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />                                            
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
                        <asp:BoundField HeaderText="No. Mappings" DataField="NumMappings" SortExpression="NumMappings" ItemStyle-Width="40px" HeaderStyle-Font-Size="8pt" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center" />--%>
                        <asp:TemplateField ItemStyle-Width="50px" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <cc:exImageButton ID="btnEdit" runat="server" OnClick="btnEditDataSources" CausesValidation="false"
                                    intValue2='<%# Eval("RegulationID") %>' intValue1='<%# Eval("DataSourceID") %>'
                                    ImageUrl='~/img/PwCIcons/20x20/edit_icon20.png' CssClass="icon20x20 PwCOrange" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField Visible="false" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <cc:exImageButton ID="btnDelete" runat="server" OnClientClick="return confirm('Are you sure you want delete?');"
                                    OnClick="btnDeleteDataSource" CausesValidation="false" intValue1='<%# Eval("DataSourceID") %>'
                                    ImageUrl='~/img/PwCIcons/20x20/delete_icon20.png' CssClass="icon20x20 PwCRed" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <%--<asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                                <cc:exImageButton ID="btnDelete" runat="server" OnClick="btnDeleteDefinition" CausesValidation="false" Visible='<%# Eval("Fields").ToString() == "0" %>' intValue1='<%# Eval("ID") %>' ImageUrl='~/img/PwCIcons/20x20/bin_icon_small.png' CssClass="icon20x20 PwCRed" OnClientClick="return confirm('Are you sure you want to delete this definition and all associated information? (i.e. Mappings, DQC, Controls, Key Contacts and Attachments');" /> 
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                        <%--<asp:TemplateField HeaderText="Data Sources" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:Button ID="btnDataSources" CssClass="iconButton List20" Width="55px" runat="server" OnClick="btnViewDataSources" CausesValidation="false" CommandArgument='<%# Eval("RegulationID").ToString() %>' Text='<%# Eval("Sources").ToString()  %>' />                            
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                    </Columns>
                </asp:GridView>
            </div>
            <asp:SqlDataSource ID="sdsDataSources" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
                SelectCommand="uspDataSourceGetList" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <%--<asp:ControlParameter Name="Title" DbType="String" ControlID="drpTitle" PropertyName="SelectedValue"
                        ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="SubTitle" DbType="String" ControlID="drpSubTitle" PropertyName="SelectedValue"
                        ConvertEmptyStringToNull="false" />--%>
                    <asp:ControlParameter Name="lCondition" DbType="String" ControlID="drpLCondition"
                        PropertyName="SelectedValue" ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="DAGYear" DbType="String" ControlID="drpDAGYear" PropertyName="SelectedValue"
                        ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="Owner" DbType="String" ControlID="drpOwner" PropertyName="SelectedValue"
                        ConvertEmptyStringToNull="false" />
                    <%--<asp:ControlParameter Name="Type" DbType="String" ControlID="drpType" PropertyName="SelectedValue"
                        ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="Format" DbType="String" ControlID="drpFormat"
                        PropertyName="SelectedValue" ConvertEmptyStringToNull="false" />--%>
                    <asp:ControlParameter Name="searchText" DbType="String" ControlID="txtSearch" PropertyName="Text"
                        ConvertEmptyStringToNull="false" />
                    <asp:SessionParameter Name="Username" DbType="String" ConvertEmptyStringToNull="false"
                        SessionField="Username" />
                    <asp:SessionParameter Name="Role" DbType="String" ConvertEmptyStringToNull="false"
                        SessionField="UserRole" />
                    <asp:Parameter Name="RegulationID" DbType="Int32" ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="ParentDSID" DbType="Int32" ConvertEmptyStringToNull="false" />
                    <asp:ControlParameter Name="ShowMine" DbType="Boolean" ControlID="chkShowMine" PropertyName="Checked"
                        ConvertEmptyStringToNull="false" />
                    <%--<asp:Parameter Name="Valid" DbType="Boolean" Direction="Output" />--%>
                </SelectParameters>
            </asp:SqlDataSource>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
