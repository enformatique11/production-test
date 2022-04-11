<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WStatusUpdate.ascx.cs" Inherits="PwC.Common.Controls.WorkflowControl.WStatusUpdate.WStatusUpdate" %>

<script type="text/javascript">
    function showHideSendBacks(button) {
        if ($(button).next().is(":visible")) {
            $(button).next().hide();
        }
        else {
            $(button).next().show();
        }
    }
</script>


<!-- Current status buttons -->
<div id="divCurrentStatuses" runat="server" style="float: left; height: 20px;">
    <asp:Repeater ID="rptCurrentStatuses" runat="server">
        <ItemTemplate>
            <asp:Button runat="server" ID="btnStatus" Text='<%# Eval("StepText").ToString() %>' CssClass='<%# "SU Current " + Eval("StepType").ToString() + 
                " " + Eval("FromValue").ToString() %>' OnClick="StatusUpdate" CommandArgument='<%# Eval("ToValue").ToString() + "|" + Eval("StepType").ToString() + "|" + Eval("StepOptions").ToString() + "|" + Eval("WorkflowID").ToString() + "|" + Eval("StepDisclaimer").ToString() %>' />
        </ItemTemplate>
    </asp:Repeater>
</div>

<!-- Send back buttons pop-up -->
<%--<div id="divCurrentSendBackStatuses" runat="server" style="float: left;" visible="false">
    <asp:Button ID="btnShowSendBackOptions" runat="server" visible="false" Text="Send Back" OnClientClick="showHideSendBacks(this); return false;" />

    <div id="divSendBackOptions">
        <asp:Repeater ID="rptSendBackOption" runat="server">
            <ItemTemplate>
                <div runat="server" style="width: 100%">
                    <asp:Button runat="server" ID="btnSendBack" Text='<%# Eval("StepText").ToString() %>' OnClick="StatusUpdate"
                        CommandArgument='<%# Eval("ToValue").ToString() + "|" + Eval("StepType").ToString() + "|" + Eval("StepOptions").ToString() + "|" + Eval("WorkflowID").ToString() %>'
                        CssClass='<%# "SU Current SendBack " + Eval("StepType").ToString() + " " + Eval("FromValue").ToString() %>' />
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>--%>

<!-- Comments and confirmation model -->
<div runat="server" id="divPopup" style="display: none">
    <div class="modal-fill" style="background-color: #939598;">
    </div>
    <div class="modal" style="width: 500px;margin-left:-250px;  position: fixed; background-color: white;">
        <div class="modal-title">
            Update status
        </div>
        <div class="modal-content">
            <div class="form-panel">
                <asp:ValidationSummary ID="vsSummary" runat="server" class="validationsummary" ValidationGroup="SU"
                    HeaderText="<h3>Please provide the following:</h3>" CssClass="errorSummary" Visible="true" />
                <div id="divDisclaimerText" runat="server" style="padding-bottom: 5px;" class="form-panel-row">
                    <asp:Label ID="lblDisclaimerText" Visible="true" Text="disclaimer text" runat="server"></asp:Label>
                </div>
                <div style="clear: both;">
                </div>
                <div class="form-panel-row">
                    <div class="grid_2">
                        <div style="float: left;">
                            <asp:Label ID="lblAddUpdateComments" runat="server">Comments:</asp:Label>    
                        </div>
                    </div>
                </div>
                <div style="clear: both;">
                </div>
                <div id="divStatusUpdateComments" runat="server" class="form-panel-row">
                    <div class="grid_5">
                        <asp:TextBox runat="server" ID="txtComments" Width="475px" Height="100px" TextMode="MultiLine"></asp:TextBox>
                        <asp:CustomValidator runat="server" ID="cvComments" ValidationGroup="SU" ErrorMessage="Please provide comments" 
                            OnServerValidate="cvComments_ServerValidate">*</asp:CustomValidator>
                    </div>
                </div>
            </div>
            <asp:Button runat="server" ID="btnSave" ValidationGroup="SU" Text="Save" OnClick="StatusSave" />
            <input type="button" value="Cancel" class="icon-button cancel" onclick="$(this).parent().parent().parent().hide();" />
            <asp:HiddenField runat="server" ID="hidStatus" />
            <asp:HiddenField runat="server" ID="hidWorkflowID" />
            <asp:HiddenField runat="server" ID="hidStepOptions" />
        </div>
    </div>
</div>