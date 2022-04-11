<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true"
    CodeBehind="DataSourceSubmissions.aspx.cs" Inherits="PwC.Pages.DataSourceSubmissions" %>

<%@ Register Src="~/Common/Controls/DetailsPanel.ascx" TagName="DetailsPanel" TagPrefix="dpl" %>
<%@ Register Src="~/Common/Controls/StatusControl/StatusControl.ascx" TagPrefix="uc"
    TagName="StatusControl" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        input.iconButton.Edit {
            background-image: url(../img/PwCIcons/24x24/edit_icon24.png);
            padding-right: 10px;
        }

        .atmHeader.col6{
            display:none;
        }

        .atmItem.col6{
            clear:both;
            padding-top:10px;
            padding-bottom:3px;
            width:945px !important;
        }

        .ProgressBar{
            width:700px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div style="display: none" class="notification1">
    </div>
    <script type="text/javascript">
        function showSuccessConfirmation(message) {

            shownotification(message);

        }

        function enableComments(src) {


            if (src.checked == true) {

                $('#ctl00_MainContent_ucStatusControl1_commentDiv1').show();

            } else {
                $('#ctl00_MainContent_ucStatusControl1_commentDiv1').hide();
            }
        }

        function shownotification(message) {
            $('.notification1').html(message);


            $('.notification1').fadeIn('slow', function () {
                $(this).delay(5000).fadeOut('slow');
            });

        }

        

        $(window).resize(function () {
            positionVisibleModals();
        });

        function positionVisibleModals() {

            var obj = $(".pnNewAttachment");
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



        function validateLength2(oSrc, args) {
            
            args.IsValid = (args.Value.length <= 4000);
        }

        function validateExtra_Upload(oSrc, args)
        {
            
            if ($('#ctl00_MainContent_url2Text_SUBMISSION_UPLOAD').val() == "" && $('#ctl00_MainContent_reasonText_SUBMISSION_UPLOAD').val() == "") {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }
        function validateExtra_Template(oSrc, args) {
            
            if ($('#ctl00_MainContent_url2Text_SUBMISSION_TEMPLATE').val() == "" && $('#ctl00_MainContent_reasonText_SUBMISSION_TEMPLATE').val() == "") {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }
        function validateExtra_Evidence(oSrc, args) {
            
            if ($('#ctl00_MainContent_url2Text_SUBMISSION_EVIDENCE').val() == "" && $('#ctl00_MainContent_reasonText_SUBMISSION_EVIDENCE').val() == "") {
                args.IsValid = false;
            }
            else {
                args.IsValid = true;
            }
        }


        var normalAttachmentsMode = <% =IsNormalAttachments %>;

        
    </script>

    <h1 id="heading1" runat="server"></h1>
    <asp:ValidationSummary ID="vsDataSource" runat="server" class="validationsummary"
        HeaderText="<h3>Please provide the following:</h3>" ValidationGroup="Submission"
        CssClass="errorSummary" Visible="true" />
    <%--  <asp:UpdatePanel ID="upds" runat="server" UpdateMode="Conditional">
        <ContentTemplate>--%>
    <dpl:DetailsPanel ID="dplDetails" runat="server" />
    <div style="padding-bottom: 7px; padding-top: 5px;">
        <div style="float: left;">
            The current SUBMISSION status of this data source is&nbsp;
        </div>
        <div style="float: left;">
            <uc:StatusControl runat="server" ID="ucStatusControl2" ShowHistory="true" ShowCurrent="true"
                ShowNext="false" />
        </div>

    </div>



    <h2 style="clear: both; padding-top: 10px;">1. Download templates</h2>
    <asp:Panel runat="server" ID="pnlTemplates" CssClass="pnlSize">
    </asp:Panel>
    <br />
    <h2>2. Upload submissions</h2>
    <asp:Panel runat="server" ID="pnlUploads" CssClass="pnlSize">
    </asp:Panel>
    <asp:CustomValidator ID="cvSubmission" runat="server" Display="None" ErrorMessage="Please upload your submission"
        OnServerValidate="cvSubmission_OnServerValidate" ValidationGroup="Submission"></asp:CustomValidator>
    <br />
    <h2>3. Evidence of review</h2>
    <asp:Panel runat="server" ID="pnlEvidence" CssClass="pnlSize">
    </asp:Panel>
    <asp:CustomValidator ID="cvEvidence" runat="server" Display="None" ErrorMessage="Please upload your evidence"
        OnServerValidate="cvEvidence_OnServerValidate" ValidationGroup="Evidence"></asp:CustomValidator>
    <div style="width: 100%; font-family: Arial; position: fixed; bottom: 0; left: 0; background: white; z-index: 999999; border-top: 4px solid #e0301e; padding: 5px
            5px 5px 5px;">
       
        <div style="float: left;">
            <asp:Button ID="btnDone" runat="server" Text="Back to Data Source Details" CssClass="iconButton Exit" Width="195"
                OnClick="btnDone_OnClick" CausesValidation="false" OnClientClick="return confirm('You are about to leave the page, any unsaved changes will be lost. Do you wish to continue?');" />
            <asp:Button ID="btnCancel2" runat="server" Text="Back to User Summary" CssClass="iconButton Exit"
                Width="170" CausesValidation="false" OnClientClick="if( confirm('You are about to leave the page, any unsaved changes will be lost. Do you wish to continue?')){ window.location='Reporting/NewChartsDasboard/UserSpecificReporting.aspx';  } return false;" />

        </div>
        <div style="float: left; padding-left: 10px">
            <uc:StatusControl runat="server" ID="ucStatusControl1" ShowHistory="false" ShowCurrent="false"
                OnAfterSave="OnAfterSave" OnAfterReload="onAfterReload" OnBeforeSave="OnBeforeSave"
                ShowNext="true" />
        </div>

        <div runat="server" id="divAdmin" visible="false" style="float: right;">

            <div style="float: right; margin-right: 10px;">
                <asp:Button ID="btOverride" runat="server" Text="Override" CssClass="iconButton Edit" OnClick="btOverride_Click" Visible="true" CausesValidation="false" />
            </div>
            <div style="float: right; margin-right: 5px;">
                <asp:Button ID="btUnlock" runat="server" Text="Unlock" CssClass="iconButton Edit" OnClick="btUnlock_Click" Visible="true" CausesValidation="false" />
            </div>
            <div style="float: right; margin-right: 5px;">
                <asp:Button ID="btCancelLock" runat="server" Text="Cancel and Lock" CssClass="iconButton Save" Style="padding-right: 5px;" OnClick="btCancelLock_Click" Visible="false" CausesValidation="false" CommandArgument="1" />
            </div>
            <div style="float: right; margin-right: 5px;">
                <asp:Button ID="btSaveAndLock" runat="server" Text="Save and Lock" CssClass="iconButton Save" Style="padding-right: 5px;" OnClick="btSaveAndLock_Click" Visible="false" CommandArgument="1" />
            </div>
        </div>
    </div>
    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
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

                <asp:CustomValidator ID="cvDesc1" runat="server" ControlToValidate="txtDescription" EnableClientScript="true" ClientValidationFunction="validateLength2" ValidationGroup="atvTemplate_ValGroup" ErrorMessage="The description field must be a maximum of 4000 characters long"></asp:CustomValidator>

            </div>
        </div>
        <div id="divCustomFields2">
            Please provide a link to any underlying data source supporting this submission. If you do not have a link then please provide a reason.
            <div style="padding-top: 10px">I have a link to source data, the link is provided below.</div>

            <div style="float: left; margin-top: 10px; margin-bottom: 10px;">
                <input runat="server" id="url2Text_SUBMISSION_TEMPLATE" type="text" style="width: 685px;" />

            </div>
            <div style="clear:both" >I do not have a link to source data, the reasoning is provided below.</div>
            <div style="float:left; margin-top:10px;margin-bottom:10px;"><input  runat="server" id="reasonText_SUBMISSION_TEMPLATE" type="text" style="width:685px;"/></div>
       
            <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="txtDescription" EnableClientScript="true" ClientValidationFunction="validateExtra_Template" ValidationGroup="atvTemplate_ValGroup" ErrorMessage="You must provide a link to source data or a reason for not providing one.">*</asp:CustomValidator>

        </div>




        <div id="divCustomFieldsSub">
            <div style="height: 40px">
                <div style="width: 150px; float: left; font-family: Arial">
                    Title
                </div>
                <asp:TextBox runat="server" CssClass="customfield" Style="float: left" ID="txtTitleSub"
                    Width="550px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ValidationGroup="atvUpload_ValGroup" runat="server"
                    ControlToValidate="txtTitleSub" ErrorMessage="The title is required">*</asp:RequiredFieldValidator>
            </div>
            <div style="height: 100px">
                <div style="width: 150px; float: left; font-family: Arial">
                    Description of the file to be attached
                </div>
                <asp:TextBox runat="server" CssClass="customfield" Style="float: left" ID="txtDescriptionSub"
                    TextMode="MultiLine" Height="80px" Width="550px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ValidationGroup="atvUpload_ValGroup"
                    runat="server" ControlToValidate="txtDescriptionSub" ErrorMessage="The description is required">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvDesc2" runat="server" ControlToValidate="txtDescriptionSub" EnableClientScript="true" ClientValidationFunction="validateLength2" ValidationGroup="atvUpload_ValGroup" ErrorMessage="The description field must be a maximum of 4000 characters long"></asp:CustomValidator>

            </div>
        </div>
        <div id="divCustomFieldsSub2">
            Please provide a link to any underlying data source supporting this submission. If you do not have a link then please provide a reason.
            <div style="padding-top: 10px">I have a link to source data, the link is provided below.</div>

            <div style="float: left; margin-top: 10px; margin-bottom: 10px;">
                <input runat="server" id="url2Text_SUBMISSION_UPLOAD" type="text" style="width: 685px;" />

            </div>
            <div style="clear:both" >I do not have a link to source data, the reasoning is provided below.</div>
            <div style="float:left; margin-top:10px;margin-bottom:10px;"><input  runat="server" id="reasonText_SUBMISSION_UPLOAD" type="text" style="width:685px;"/></div>
       
            <asp:CustomValidator ID="cvExtra1" runat="server" ControlToValidate="txtDescriptionSub" EnableClientScript="true" ClientValidationFunction="validateExtra_Upload" ValidationGroup="atvUpload_ValGroup" ErrorMessage="You must provide a link to source data or a reason for not providing one.">*</asp:CustomValidator>

        </div>

        <div id="divCustomFieldsEvi">
            <div style="height: 40px">
                <div style="width: 150px; float: left; font-family: Arial">
                    Title
                </div>
                <asp:TextBox runat="server" CssClass="customfield" Style="float: left" ID="txtTitleEvi"
                    Width="550px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="atvEvidence_ValGroup" runat="server"
                    ControlToValidate="txtTitleEvi" ErrorMessage="The title is required">*</asp:RequiredFieldValidator>
            </div>
            <div style="height: 100px">
                <div style="width: 150px; float: left; font-family: Arial">
                    Description of the file to be attached
                </div>
                <asp:TextBox runat="server" CssClass="customfield" Style="float: left" ID="txtDescriptionEvi"
                    TextMode="MultiLine" Height="80px" Width="550px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="atvEvidence_ValGroup"
                    runat="server" ControlToValidate="txtDescriptionEvi" ErrorMessage="The description is required">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="cvDesc3" runat="server" ControlToValidate="txtDescriptionEvi" EnableClientScript="true" ClientValidationFunction="validateLength2" ValidationGroup="atvEvidence_ValGroup" ErrorMessage="The description field must be a maximum of 4000 characters long"></asp:CustomValidator>

            </div>
        </div>
        <div id="divCustomFieldsEvi2">
            Please provide a link to any underlying data source supporting this submission. If you do not have a link then please provide a reason.
            <div style="padding-top: 10px">I have a link to source data, the link is provided below.</div>

            <div style="float: left; margin-top: 10px; margin-bottom: 10px;">
                <input runat="server" id="url2Text_SUBMISSION_EVIDENCE" type="text" style="width: 685px;" />

            </div>
            <div style="clear:both" >I do not have a link to source data, the reasoning is provided below.</div>
            <div style="float:left; margin-top:10px;margin-bottom:10px;"><input  runat="server" id="reasonText_SUBMISSION_EVIDENCE" type="text" style="width:685px;"/></div>
       
            <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="txtDescriptionEvi" EnableClientScript="true" ClientValidationFunction="validateExtra_Evidence" ValidationGroup="atvEvidence_ValGroup" ErrorMessage="You must provide a link to source data or a reason for not providing one.">*</asp:CustomValidator>

        </div>

    </div>
    <asp:Panel ID="pnOverride" ClientIDMode="Static" runat="server" Visible="false">
        <div class="modal-fill" style="background-color: #939598;">
        </div>
        <div class="modal" style="width: 524px; margin-left: -250px; position: fixed;">
            <div class="modal-title">
                Status Override
            </div>
            <div class="modal-content">
                <div class="form-panel">
                    <div class="form-panel-row">
                        <div class="fgrid_3">Workflow status</div>
                        <div class="fgrid_7">
                            <asp:DropDownList ID="ddlStatus" runat="server" DataTextField="Value" DataValueField="Value" AppendDataBoundItems="false" />
                        </div>
                    </div>
                    <div class="form-panel-row">
                        <div class="fgrid_3">Comments</div>
                        <div class="fgrid_7">
                            <asp:TextBox ID="txtOverrideComments" runat="server" TextMode="MultiLine" Rows="4" Width="100%" />
                        </div>
                    </div>
                </div>

                <asp:Button ID="btSetStatus" runat="server" CssClass="icon-button save" Text="Set Status" OnClick="btSetStatus_Click" CausesValidation="false" />
                <asp:Button ID="btCancelStatus" runat="server" CssClass="icon-button cancel" Text="Cancel" OnClick="btCancelStatus_Click" CausesValidation="false" />
            </div>
        </div>

    </asp:Panel>


    <script type="text/javascript" >
        $(document).ready(function () {

            $(".btnUpload2").click(function () {
                positionVisibleModals();
            });


            var anyExist = false;
            $('.IsRej_Y').each(function () {

                $(this).appendTo($(this).parent().next().find(".RejPop"));
                anyExist = true;
            });

            
            if (anyExist == false) {
                $('.IsRej_Y2').hide();
            }

        });
    </script>
</asp:Content>
