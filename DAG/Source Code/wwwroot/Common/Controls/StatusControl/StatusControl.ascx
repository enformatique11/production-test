<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StatusControl.ascx.cs"
    Inherits="PwC.Controls.StatusControl" %>
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
<div runat="server" id="divStatus" visible="false" style="float: left">
    
    <asp:Repeater runat="server" ID="rptStatus">
        <ItemTemplate>
            <asp:Button runat="server" ID="btnStatus" CommandArgument='<%# Eval("StatusTo").ToString()+"|"+Eval("NeedsComments").ToString()+"|"+Eval("SubSection").ToString()+"|"+Eval("WorkflowID").ToString()+"|"+Eval("Field4").ToString()+"|"+Eval("StatusText").ToString()+"|"+Eval("Field3").ToString() %>'
                Text='<%# Eval("StatusToDisplayText") %>' CssClass='<%# "SC Future "+ Eval("StatusToDisplayText").ToString().Replace(" ","").Replace("(","").Replace(")","")+" "+ Eval("StatusTo").ToString().Replace(" ","").Replace("(","").Replace(")","")+ " IsRej_"+(Eval("StatusToDisplayText").ToString().Contains("Send back") ? "Y" : "N") %>'
                OnClick="StatusClick" />
        </ItemTemplate>
    </asp:Repeater>

</div>
<div style="position: relative; float: left;">
    <asp:Button runat="server" ID="btnStatusSB" Visible="false"  Style="position: absolute; left: 0px; top: 0px;" Text='Send Back' CssClass="SC Future IsRej_Y2"
        OnClientClick="showHideSendBacks(this);return false;" />
    


    <div class="RejPop" style="position: absolute; left: 0px; bottom: 0px; display: none; padding: 7px; background-color: white; border: solid 1px #f00">
    </div>

</div>





<div runat="server" id="divCurrent" visible="false" style="float: left; text-align: left; font-weight:bold;
    margin-right: 3px">
    <asp:Repeater runat="server" ID="rptCurrent">
        <ItemTemplate>
            <asp:Literal runat="server" ID="lblStatus" Text='<%#Eval("StatusDisplayText").ToString()+ " ("+Eval("Field3").ToString()+"); " %>'></asp:Literal>
        </ItemTemplate>
    </asp:Repeater>
</div><div runat="server" id="divHistory" visible="false" style="float: left; padding-right: 3px;">
    <div id="slink" onclick="$(this).next().next().show();" style="cursor: pointer; padding-bottom: 5px; text-decoration: underline; float:left">

        Click to view history
    </div>
   <div style="float:left">&nbsp;the next available actions are listed at the bottom of the screen.</div>
    


    <div style="display: none;">
        <div class="modal-fill" style="background-color: #939598;">
        </div>
        <div class="modal" style="width: 700px;margin-left:-350px; height:400px; position: fixed; background-color: white;">
            <div class="modal-title">
             <div style="float:left">   Sign-off history</div>  <input type="button" value="Close" style="float:right" class="icon-button cancel" onclick="$(this).parent().parent().parent().hide();" /></div>
            <div class="modal-content" style="height:360px; overflow:auto;">
                <asp:GridView ID="gvHistory" runat="server" AutoGenerateColumns="False" CssClass="gridview"
                    RowStyle-CssClass="row1" AlternatingRowStyle-CssClass="row1" GridLines="Horizontal"
                    EmptyDataText="No history was found">
                    <Columns>
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:BoundField DataField="Comments" HeaderText="Comments" />
                        <asp:BoundField DataField="CreatedWhen" HeaderText="CreatedOn" />
                        <asp:BoundField DataField="CreatedByName" HeaderText="CreatedByName" />
                    </Columns>
                </asp:GridView>
                
            </div>
        </div>
    </div>
</div>

<div runat="server" id="divStatusVisualisation" visible="false" style="float: left;display:none; padding-right: 3px;">
    <div id="svLink" style="cursor: pointer; padding-bottom: 5px; text-decoration: underline; float:left">
        Click to visualise status
    </div>  
    
    <div style="display: none;">
        <div class="modal-fill" style="background-color: #939598;">
        </div>
        <div class="modal" style="width: 830px; position: fixed; background-color: white;">
            <div class="modal-title">
                Status Visualisation</div>
            <div class="modal-content">                
                <input type="button" value="Close" class="icon-button cancel" onclick="$(this).parent().parent().parent().hide();" />
                <div id="canvas" runat="server"/>
            </div>
        </div>
    </div>
</div>

<div runat="server" id="divPopup" style="display: none">
    <div class="modal-fill" style="background-color: #939598;">
    </div>
    <div class="modal" style="width: 500px;margin-left:-250px;  position: fixed; background-color: white;">
        <div class="modal-title">
            Update status
        </div>
        <div class="modal-content">
            <div class="form-panel">
                <asp:ValidationSummary ID="vsSummary" runat="server" class="validationsummary" ValidationGroup="SC"
                    HeaderText="<h3>Please provide the following:</h3>" CssClass="errorSummary" Visible="true" />
                <div id="disclaimerTextDiv" runat="server" style="padding-bottom: 5px;" class="form-panel-row">
                    <asp:Label ID="disclaimerText" Visible="true" Text="disclaimer text" runat="server"></asp:Label>
                </div>
                <div style="clear: both;">
                </div>
                <div class="form-panel-row">
                    <div class="grid_2">
                        <div style="float: left;">
                            Add Comments?</div>
                        <div style="float: left; padding-left: 7px; margin-top: -3px;">
                            <input type="checkbox" name="chk" onclick="enableComments(this);" id="chkComments" />
                        </div>
                    </div>
                </div>
                <div style="clear: both;">
                </div>
                <div id="commentDiv1" runat="server" style="display: none" class="form-panel-row">
                    <div class="grid_5">
                        <asp:TextBox runat="server" ID="txtComments" Width="475px" Height="100px" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ControlToValidate="txtComments" runat="server" ID="rfSC"
                            ValidationGroup="SC" ErrorMessage="Please provide comments">*</asp:RequiredFieldValidator>
                    </div>
                </div>
            </div>
            <asp:Button runat="server" ID="btnSave" ValidationGroup="SC" Text="Save" OnClick="StatusSave" />
            <asp:Button runat="server" ID="btnCancel" CausesValidation="false" CssClass="icon-button cancel"  Text="Cancel" OnClick="btnCancel_Click" />
            
            <asp:HiddenField runat="server" ID="hidStatus" />
            <asp:HiddenField runat="server" ID="hidSubSection" />
            <asp:HiddenField runat="server" ID="hidWorkflowID" />
        </div>
    </div>
</div>

