<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ucMultiBox.ascx.cs" Inherits="PwC.ucMultiBox" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolKit" %>

<script type="text/javascript">

    

    function checkMandatory(source, args) {

        var list = document.getElementById(source.controltovalidate);

        if (list.options.length == 0) {
            args.IsValid = false;

        }
        else {
            args.IsValid = true;
        }
    }
    


</script>

<%-- <ajaxToolKit:ModalPopupExtender  runat="server" ID="mpIndustry" BackgroundCssClass="modalBackground"  PopupControlID="panPopupControlID" TargetControlID="imbtnTargetControlID"    BehaviorID="imbtnTargetControlID" OkControlID="btnDummy" ></ajaxToolKit:ModalPopupExtender> 
   --%>
   
<asp:TextBox ID="txtContainedListedLeft" style="display:none" runat="server"></asp:TextBox>
<asp:TextBox ID="txtContainedListedRight" style="display:none" runat="server"></asp:TextBox>
   
<asp:Panel ID="panPopupControlID" runat="server" Width="910px">
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <Triggers>
        </Triggers>
        <ContentTemplate>
            <asp:Button runat="server" Text="" Style="display: none" ID="btnDummy" />
            <div style="float: left; width: 100%;">
                <div style="float: left; width: 45%">
                    <div id="divHeader1a" style="width: 100%; padding: 7px 0px 4px 0px; padding-top: 2px; padding-bottom: 0px;" runat="server">
                        <asp:Label ID="divHeader1" runat="server" Text="Label" Width="100%"></asp:Label>
                    </div>
                    <asp:ListBox ID="drdSnapshotIndustryAll"    CssClass="lb" runat="server" Width="100%" Height="50px" SelectionMode="Multiple" AppendDataBoundItems="true" OnDataBound="drdSnapshotIndustryAll_DataBound"></asp:ListBox>
                </div>
                <div style="float: left; width: 7%; text-align: center; font-size:10px; font-weight:normal; vertical-align: bottom; padding-top: 17px;">
                    <a runat="server" id="aButtonAdd">
                        
                        <input type="button" style="width:24px; color:Green "  value=">" />
                    </a><a runat="server" id="aButtonRemove">
                        <input type="button" style="width:24px; color:Red" value="<" /><br />
                    </a><a runat="server" id="aButtonAddAll">
                        <input type="button" style="width:24px; color:Green " value=">>" />
                    </a><a runat="server" id="aButtonRemoveAll">
                        <input type="button" style="width:24px; color:Red" value="<<" />
                    </a>
                </div>
                <div style="float: left; width: 45%">
                    <div id="divHeader2a" style="width: 100%; padding: 7px 0px 4px 0px; padding-top: 2px; padding-bottom: 0px;" runat="server">
                        <asp:Label ID="divHeader2" runat="server" Text="Label" Width="100%"></asp:Label>
                    </div>
                    <asp:ListBox ID="drdSnapshotIndustry"  CssClass="lb" runat="server" Width="100%" Height="50px" SelectionMode="Multiple"></asp:ListBox>
                    </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Panel>
