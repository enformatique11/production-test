<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true" CodeBehind="HelpSupport.aspx.cs" Inherits="PwC.Pages.HelpSupport" %>

<%@ Register Assembly="DevExpress.Web.ASPxHtmlEditor.v14.2, Version=14.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web.ASPxHtmlEditor" TagPrefix="dx" %>
<%@ Register Src="~/Common/Controls/ucAttachmentViewer.ascx" TagPrefix="uc" TagName="ucAttachmentViewer" %>
<%@ Register Src="~/Common/Controls/Card/CardA.ascx" TagPrefix="uc" TagName="Card" %>
<%@ Register Src="~/Common/Controls/Card/CardEdit.ascx" TagPrefix="uc" TagName="CardEdit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css" >

        .cContact {
            width: 150px;
            height: 90px;
            padding: 15px;
            background-color: #00BBC6;
        }

        .cContactTitle {
            font-size: 20px;
            font-weight: bold;
            color: white;
            
        }

        .cContactDate {
            font-style: italic;
            color: white;
            margin-top: 5px;
        }


        .mnItem{
            width: 150px; float: left;
        cursor: pointer; font-size: 14px; margin-right: 10px;
        color:#d2d2d2;
        }

        .mnItem.selected{color:#000000;}

    </style>

    <script type="text/javascript" >

        var normalAttachmentsMode = 'Off';

        function positionVisibleModals() {

            var obj = $(".pnlSize");
            var obj2 = $(".pnlUploadOptions");

            var dW = $(window).width();
            var dH = $(window).height();

            var scrollAmount = $(window).scrollTop();

            obj.each(function () {
                var t = $(this);

                var left = (dW - (t.innerWidth() + 6)) * 0.5;
                var top = (dH - (t.innerHeight() + 6)) * 0.5 + scrollAmount;

                if (left < 0) { left = 0; }
                if (top < 0) { top = 0; }

                this.style.left = left + 'px';
                this.style.top = top + 'px';
                this.style.marginLeft = 0;
            });

            obj2.each(function () {
                var t = $(this);

                var left = (dW - (t.innerWidth() + 6)) * 0.5;
                var top = (dH - (t.innerHeight() + 6)) * 0.5 + scrollAmount;

                if (left < 0) { left = 0; }
                if (top < 0) { top = 0; }

                this.style.left = left + 'px';
                this.style.top = top + 'px';
                this.style.marginLeft = 0;
            });
        }



    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <h1 id="mnHelpSupport" runat="server"  onclick="window.location='HelpSupport.aspx?Cat=HelpSupport'" class="mnItem" >
        Help & Support</h1>
    <h1 id="mnReferenceCards" runat="server"  onclick="window.location='HelpSupport.aspx?Cat=ReferenceCards'"  class="mnItem" >
        Reference Cards</h1>
    <h1 id="mnDagBuddies" runat="server"  onclick="window.location='HelpSupport.aspx?Cat=DagBuddies'"  class="mnItem" >
        DAG Buddies</h1>
    <h1 id="mnContactUs" runat="server"  onclick="window.location='HelpSupport.aspx?Cat=ContactUs'"  class="mnItem" >
        Contact Us</h1>
    <h1 id="mnVideoTutorials" runat="server"  onclick="window.location='HelpSupport.aspx?Cat=VideoTutorials'"  class="mnItem" >
        Video Tutorial</h1>
    <div style="clear: both; margin-bottom: 20px;">
    </div>

    <div id="divCatText" runat="server" style="margin-bottom: 50px;">
        <asp:Label ID="lblCatText" runat="server"></asp:Label>
    </div>

    <div id="divCatTextEditor" runat="server" style="margin-bottom: 50px;">
        <dx:ASPxHtmlEditor ID="htmCatTextEditor" runat="server" Width="1260px" Height="350px"></dx:ASPxHtmlEditor>
        <asp:Button ID="btnSaveCatText" runat="server" Text="Save" OnClick="btnSaveCatText_Click" style="width: 70px; height: 26px; margin-top: 10px;" />
    </div>
    

   

   <asp:Panel runat="server" ID="pnlTemplates" CssClass="pnlSize">
    </asp:Panel>

    <div style="display: none;">
        <div id="divCustomFields">
            <div style="height: 40px">
                <div style="width: 150px; float: left; font-family: Arial">
                    Title
                </div>
                <asp:TextBox runat="server" CssClass="customfield" Style="float: left" ID="txtTitle"
                    Width="550px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtTitle" ValidationGroup="atvTemplate_ValGroup" runat="server"
                    ControlToValidate="txtTitle" ErrorMessage="The title is required">*</asp:RequiredFieldValidator>
            </div>
            <div style="height: 100px">
                <div style="width: 150px; float: left; font-family: Arial">
                    Description of the file to be attached
                </div>
                <asp:TextBox runat="server" CssClass="customfield" Style="float: left" ID="txtDescription"
                    TextMode="MultiLine" Height="80px" Width="550px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtDescription" ValidationGroup="atvTemplate_ValGroup"
                    runat="server" ControlToValidate="txtDescription" ErrorMessage="The description is required">*</asp:RequiredFieldValidator>
            </div>
        </div>
    </div>

    <asp:Panel runat="server" Visible="false" >

        <uc:Card runat="server" id="cOne" CardTemplateID="1" CardRecordID="1" CardSectionID="1" />
        <uc:CardEdit runat="server" id="CardEdit" />

    </asp:Panel>

</asp:Content>
