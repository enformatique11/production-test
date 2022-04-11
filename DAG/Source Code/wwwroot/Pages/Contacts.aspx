<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true"
    CodeBehind="Contacts.aspx.cs" Inherits="PwC.Contacts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>
        Contacts</h1>
    <div class="filterPanel">
        <div class="fHeader">
            <div class="filterTitle upIcon">
                Filter Options</div>
            <asp:Button ID="btnSearch" runat="server" Text="Search" Style="float: right" /></div>
        <div class="fContent">
            <div class="filterRow">
                <div class="fItemLbl">
                    Search Text
                </div>
                <div class="fItemCtl">
                    <asp:TextBox ID="txtSearch" runat="server" Width="120px" Height="16px"></asp:TextBox>
                </div>
                <div class="fItemLbl">
                    Role
                </div>
                <div class="fItemCtl">
                    <asp:DropDownList ID="drdProjectRole" DataSourceID="dsProjectRole" DataTextField="ValueText"
                        DataValueField="ValueText" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="dsProjectRole" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
                        SelectCommand="select * from (select 0 as 'seq', 'All' as ValueText union select distinct 1 as 'seq',Role from vwUsers WHERE IsNull(Contact,'No')='Yes') k order by k.seq">
                    </asp:SqlDataSource>
                </div>
                <div class="fItemLbl">
                    Home Office
                </div>
                <div class="fItemCtl">
                    <asp:DropDownList ID="drdHomeOffice" DataSourceID="dsHomeOffice" DataTextField="ValueText"
                        DataValueField="ValueID" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="dsHomeOffice" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
                        SelectCommand="uspLookupGet" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="HomeOffice" Name="LookupCode" Type="String" />
                            <asp:Parameter DefaultValue="All" Name="InitialValuesFlag" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
            </div>
            <div class="filterRow">
                <div class="fItemLbl">
                    Organisation
                </div>
                <div class="fItemCtl">
                    <asp:DropDownList ID="drdOrganisation" DataSourceID="dsOrganisation" DataTextField="ValueText"
                        DataValueField="ValueID" runat="server" AutoPostBack="True">
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="dsOrganisation" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
                        SelectCommand="uspLookupGet" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="Organisation" Name="LookupCode" Type="String" />
                            <asp:Parameter DefaultValue="All" Name="InitialValuesFlag" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </div>
                <div class="fItemLbl">
                    Job Title
                </div>
                <div class="fItemCtl">
                    <asp:DropDownList ID="drdJobTitle" DataSourceID="dsJobTitle" DataTextField="ValueText"
                        DataValueField="ValueText" runat="server" AutoPostBack="True" AppendDataBoundItems="true">
                        <asp:ListItem Text="All" />
                    </asp:DropDownList>
                    <asp:SqlDataSource ID="dsJobTitle" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
                        SelectCommand="select distinct JobTitle AS ValueText from vwUsers WHERE IsNull(Contact,'No')='Yes'">
                    </asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    <div class="panel">
        <asp:GridView ID="GridView1" DataSourceID="dsContacts" AutoGenerateColumns="False"
            GridLines="None" CssClass="gridview" runat="server" AllowPaging="True" AllowSorting="True">
            <EmptyDataTemplate>
                There are no contacts matching your search criteria
            </EmptyDataTemplate>
            <RowStyle CssClass="row1" />
            <AlternatingRowStyle CssClass="row0" />
            <Columns>
                <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="SurName" HeaderText="Last Name" SortExpression="SurName">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="PhoneNumber" HeaderText="Phone" SortExpression="PhoneNumber">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="EmailAddress" HeaderText="Email Address" SortExpression="EmailAddress">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Role" HeaderText="Role" SortExpression="Role">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="JobTitle" HeaderText="Job Title" SortExpression="JobTitle">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="HomeOffice" HeaderText="Home Office" SortExpression="HomeOffice">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
                <asp:BoundField DataField="Organisation" HeaderText="Organisation" SortExpression="Organisation">
                    <HeaderStyle HorizontalAlign="Left" />
                </asp:BoundField>
            </Columns>
        </asp:GridView>
    </div>
    <asp:SqlDataSource ID="dsContacts" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
        SelectCommand="uspContactsGetList" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtSearch" Name="Search" DefaultValue=" " PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="drdProjectRole" DefaultValue="All" Name="ProjectRole"
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="drdHomeOffice" DefaultValue="All" Name="HomeOffice"
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="drdOrganisation" DefaultValue="All" Name="Organisation"
                PropertyName="SelectedValue" Type="String" />
            <asp:ControlParameter ControlID="drdJobTitle" DefaultValue="All" Name="JobTitle"
                PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>
