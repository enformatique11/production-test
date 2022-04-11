<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true"
    CodeBehind="UserList.aspx.cs" Inherits="PwC.Pages.Super.UserList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        table.gvList {
            border-width: 0px;
        }

        table.gridview tr th {
            text-align: left;
        }

        .panConfig {
            clear: both;
        }
        .configRow{
            padding:4px;
            clear:both;
            height:30px;
        }
        .configLab{
            float:left;
            width:150px;
        }
          .configVal{
            float:left;
            width:350px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1>User List</h1>
    <asp:SqlDataSource ID="dsList" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
        SelectCommand="uspUserGetAll" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>


    <asp:Panel runat="server" ID="panConfig" CssClass="panConfig">
        <asp:SqlDataSource ID="dsConfig" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
            SelectCommand="uspConfigList" SelectCommandType="StoredProcedure">
            <SelectParameters>
                <asp:SessionParameter Name="UserID" SessionField="UserID" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Repeater runat="server" ID="rptConfig" DataSourceID="dsConfig">
            <ItemTemplate>

                <div class="configRow">
                    <asp:HiddenField runat="server" ID="hidConfigCode" Value='<%#Eval("ConfigCode") %>'></asp:HiddenField>

                    <div class="configLab">
                        <asp:Label runat="server" ID="lblConfigVal" Text='<%#Eval("ConfigCode") %>'></asp:Label>

                    </div>
                    <div class="configVal">
                        <asp:TextBox runat="server" ID="txtConfigValue_String" Text='<%#Eval("ConfigValue_String") %>'></asp:TextBox>

                    </div>

                </div>

            </ItemTemplate>
        </asp:Repeater>

        <div class="configRow">
                <asp:Button runat="server" ID="btnSaveConfig" Text="Save Config" OnClick="btnSaveConfig_Click" />
            </div> 

    </asp:Panel>

    <div style="height: 30px; float: right; margin-bottom: 3px;">
        <input value="New User" type="button" class="plusIcon" style="width: 100px" onclick="javascript: window.location = 'UserEdit.aspx'" />
    </div>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
        <Triggers>
        </Triggers>
        <ContentTemplate>
            <div>
                <asp:GridView ID="gvList" runat="server" AutoGenerateColumns="False" CssClass="gridview"
                    OnRowDataBound="gvList_OnRowDataBound" RowStyle-CssClass="row1" AlternatingRowStyle-CssClass="row0"
                    DataSourceID="dsList" AllowPaging="True" GridLines="None" AllowSorting="True"
                    PagerStyle-CssClass="pager">
                    <Columns>
                        <asp:BoundField DataField="Username" HeaderText="Username" SortExpression="Username" />
                        <asp:BoundField DataField="FirstName" HeaderText="First Name" SortExpression="FirstName" />
                        <asp:BoundField DataField="Surname" HeaderText="Surname" SortExpression="Surname" />
                        <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                        <asp:BoundField DataField="ValidFrom" HeaderText="Valid From" SortExpression="ValidFrom"
                            DataFormatString="{0:d}" />
                        <asp:BoundField DataField="ValidTo" HeaderText="Valid To" SortExpression="ValidTo"
                            DataFormatString="{0:d}" />
                        <asp:BoundField DataField="Active" HeaderText="Active" SortExpression="Active" />
                        <asp:BoundField DataField="ProjectRole" HeaderText="Role" SortExpression="ProjectRole" />
                    </Columns>
                </asp:GridView>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
