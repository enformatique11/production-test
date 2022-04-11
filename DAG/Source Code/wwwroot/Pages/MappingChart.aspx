<%@ Page Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true"
    CodeBehind="MappingChart.aspx.cs" Inherits="PwC.Pages.MappingChart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h1 id="pageTitle" runat="server"></h1>
    <div class="formPanel">
        <div class="formPanelRow">
            <h3>Definition Details</h3>
        </div>
        <div class="formPanelRow">
            <div class="pItemLbl_large">
                Definition Title</div>
            <div class="pItemCtl_auto">
                <asp:TextBox ID="txtDefinitionTitle" runat="server" Width="220px" ReadOnly="true"
                    CssClass="readonly" />
            </div>
            <div class="pItemLbl">
                Area of reporting</div>
            <div class="pItemCtl_auto">
                <asp:TextBox ID="txtDefinitionSubTitle" runat="server" Width="220px" ReadOnly="true"
                    CssClass="readonly" />
            </div>
        </div>
        <div class="formPanelRow">
            <div class="pItemLbl_large">
                Definition Type</div>
            <div class="pItemCtl_auto">
                <asp:TextBox ID="txtDefinitionType" runat="server" Width="220px" ReadOnly="true"
                    CssClass="readonly" /></div>            
        </div>
        <div id="divDataItemDetails" runat="server" visible="false">
            <div class="formPanelRow">
                <h3>Data Item Details</h3>
            </div>
            <div class="formPanelRow">
                <div class="pItemLbl_large">
                    Data Item Title
                </div>
                <div class="pItemCtl_auto">
                    <asp:TextBox ID="txtFieldTitle" runat="server" Width="612px" ReadOnly="true" CssClass="readonly" />
                </div>
            </div>
            <div class="formPanelRow_x3">
                <div class="pItemLbl_large">
                    Description</div>
                <div class="pItemCtl_auto">
                    <asp:TextBox ID="txtFieldDescription" runat="server" TextMode="MultiLine" Width="612px"
                        CssClass="readonly" ReadOnly="true" Height="70px" /></div>
            </div>
        </div>
    </div>
    <div class="formPanel">
        <div class="formPanelRow" style="height:35px;">
            <div class="pItemLbl_large">
                Direction 
            </div>
            <div class="pItemCtl_auto">
                <asp:DropDownList ID="drpMappingDirection" runat="server" Width="150px">
                    <asp:ListItem Text="All" Value="ALL" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Usage Direction" Value="USAGE"></asp:ListItem>
                    <asp:ListItem Text="Source Direction" Value="SOURCE"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="pItemLbl_large">
                Show Mapping Description     
            </div>
            <div class="pItemCtl_auto">
               <asp:DropDownList ID="drpShowDescription" runat="server" Width="150px">
                    <asp:ListItem Text="Yes" Value="Yes" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="No" Value="No"></asp:ListItem>
                </asp:DropDownList>
            </div>            
        </div>  
        <div class="formPanelRow" style="height:40px;">
            <div class="pItemLbl_large">
                Chart Direction      
            </div>
            <div class="pItemCtl_auto">
               <asp:DropDownList ID="drpChartDirection" runat="server" Width="150px">
                    <asp:ListItem Text="Vertical" Value="Vertical" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="Horizontal" Value="Horizontal"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>  
        <div class="formPanelRow" style="height:30px;">           
            <asp:Button ID="btnUpdateChart" runat="server" Text="Update Chart" Height="19px" OnClick="btnUpdateChart_OnClick" />        
        </div>
    </div>
    <asp:UpdatePanel ID="upChart" runat="server">
        <ContentTemplate>
            <div style="padding:10px 10px 10px 10px; margin:20px 0px 20px 0px; overflow:scroll; width:880px; max-height:600px; border:1px solid #fceae9; text-align:center;">
                <asp:Image ID="imgChart" runat="server" />
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:Button ID="btnBack" runat="server" Text="Back" CssClass="iconButton Exit" Width="65px"  OnClick="btnBack_Click" />
</asp:Content>
