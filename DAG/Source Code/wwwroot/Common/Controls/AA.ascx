<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AA.ascx.cs" Inherits="PwC.Common.Controls.AA" %>
<div class="formPanelRow">
    <div class="activityLabel">
        <asp:Label runat="server" ID="lblLevel"></asp:Label>
        <asp:HiddenField runat="server" ID="hidID" />
        <asp:HiddenField runat="server" ID="hidRegulationID" />
        
    </div>
    <div class="activityDropdown financialControl" style="height:27px">
        <asp:DropDownList ID="drpRequiredF" runat="server" Style="float: left;width:170px">
        </asp:DropDownList>
        <asp:Label runat="server" ID="lblF" Text="Mandatory" Visible="false"  Style="float: left" ></asp:Label>
        <asp:ImageButton runat="server" ID="btnF" ImageUrl='~/img/PwCIcons/20x20/edit_icon20.png'
            OnClientClick="$(this).next().show();return false;" CssClass="icon20x20 PwCOrange"
            Style="margin-left: 5px; float: left" />
        <div runat="server" id="divPopupF" style="display: none">
            <div class="modal-fill" style="background-color: #939598;">
            </div>
            <div class="modal" style="width: 500px; position: fixed; background-color: white;">
                <div class="modal-title">
                    Financial - Comments</div>
                <div class="modal-content">
                    <div class="form-panel">
                        <div class="form-panel-row">
                            <div class="grid_2">
                                Comments</div>
                        </div>
                        <div class="form-panel-row">
                            <div class="grid_5">
                                <asp:TextBox runat="server" ID="txtCommentsF" Width="475px" Height="100px" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <input type="button" value="Close" class="icon-button cancel" onclick="$(this).parent().parent().parent().hide();" />
                </div>
            </div>
        </div>
    </div>
    <div class="activityDropdown workloadControl" style="border-left:solid 1px rgb(0,194,200);padding-left:15px; width:600px;height:27px;">
        <div style="float:left;width:317px;height:20px;"><asp:Label runat="server" ID="lblLevel2"></asp:Label></div>
        <asp:DropDownList ID="drpRequiredW" runat="server" Style="float: left;width:170px">
        </asp:DropDownList>
       
        <asp:Label runat="server" ID="lblW" Text="Mandatory" Visible="false"  Style="float: left" ></asp:Label>
        <asp:ImageButton runat="server" ID="btnW" ImageUrl='~/img/PwCIcons/20x20/edit_icon20.png'
            OnClientClick="$(this).next().show();return false;" CssClass="icon20x20 PwCOrange"
            Style="margin-left: 5px; float: left" />
        <div runat="server" id="divPopupW" style="display: none">
            <div class="modal-fill" style="background-color: #939598;">
            </div>
            <div class="modal" style="width: 500px; position: fixed; background-color: white;">
                <div class="modal-title">
                    Workload - Comments</div>
                <div class="modal-content">
                    <div class="form-panel">
                        <div class="form-panel-row">
                            <div class="grid_2">
                                Comments</div>
                        </div>
                        <div class="form-panel-row">
                            <div class="grid_5">
                                <asp:TextBox runat="server" ID="txtCommentsW" Width="475px" Height="100px" TextMode="MultiLine"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <input type="button" value="Close" class="icon-button cancel" onclick="$(this).parent().parent().parent().hide();" />
                </div>
            </div>
        </div>
    </div>
    <div style="clear: both">
    </div>
</div>
