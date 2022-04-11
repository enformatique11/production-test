<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true"
    CodeBehind="DataSourceDetails.aspx.cs" Inherits="PwC.Pages.DataSourceDetails" %>

<%@ Register Src="~/Common/Controls/AA.ascx" TagPrefix="uc" TagName="AA" %>
<%@ Register Src="~/Common/Controls/StatusControl/StatusControl.ascx" TagPrefix="uc"
    TagName="StatusControl" %>
<%@ Register Assembly="UploaderV4" Namespace="UploaderV4" TagPrefix="cc" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .col1 {
            float: left;
            width: 320px;
        }

        .col2 {
            float: left;
            width: 100px;
        }

        per .col3 {
            float: left;
            width: 100px;
        }

        .col4 {
            float: left;
            width: 130px;
        }

        .col5 {
            float: right;
            width: 350px;
        }

        .activityLabel {
            float: left;
            width: 317px;
        }

        .activityDropdown {
            float: left;
        }

        .fHeight {
            height: 24px;
        }

        .filterPanel {
            width: 865px !important;
            margin-top: 10px;
            border-top: 4px solid #968c6d; /* Grey */
            background-color: #f5f4f0; /* 10% Grey */
        }

        .pnlSize {
            width: 865px !important;
        }

        .filterPanel .fHeader {
            font-weight: bold;
            color: #000; /* Black */
            float: none;
            width: 865px;
            margin-bottom: 3px;
            font-size: 9pt;
            height: 22px;
            background-color: #e5e2db; /* 25% Grey */
            padding-top: 2px;
        }

        .activityDropdown {
            width: 140px;
        }

            .activityDropdown.workloadControl {
                width: 580px;
            }

        .activityComments {
            float: left;
            width: 465px;
            margin-left: 0px;
            padding-left: 0px;
        }

            .activityComments input {
                width: 450px;
                margin-left: 10px;
                text-align: left;
            }

        .activityDropdown select {
            width: 80px;
        }

        h2 {
            width: 800px;
        }

        .successMessage {
            display: none;
            background-color: #E2FFE2;
            border-top: 3px solid #5FAD10;
            border-bottom: 1px solid #5FAd10;
            padding-left: 20px;
            padding-top: 3px;
            padding-bottom: 3px;
        }

        .minifup {
            width: 160px;
        }

        .AttachmentControlFlex .Header {
            width: 620px;
        }

        .AttachmentControlFlex .Rows {
            width: 620px;
        }

        .RepeaterControl {
            width: 400px;
        }

        .divmultiple {
            width: 865px;
        }

        .divsingleleft {
            width: 440px;
        }

        .divsingleright {
            width: 440px;
        }

        input.iconButton.Edit {
            background-image: url(../img/PwCIcons/24x24/edit_icon24.png);
            padding-right: 10px;
        }


        .MPFINANCIAL {
            width: 440px;
        }

        .MPWORKLOAD {
            width: 440px;
        }

        .rapanel {
            width: 400px;
        }
    </style>



    <script type="text/javascript">




        function enableComments2(src) {


            if (src.checked == true) {

                $('#ctl00_MainContent_commentDiv1').show();

            } else {
                $('#ctl00_MainContent_commentDiv1').hide();
            }
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

        function finFinish() {
            $("#ctl00_MainContent_finTemp_inactive").show();
            $("#ctl00_MainContent_clearFinPan1").hide();
            $("#ctl00_MainContent_clearFinPan2").show();
            $("#uploadbtnfinpan").hide();

        }


        function workFinish() {
            $("#ctl00_MainContent_workTemp_inactive").show();
            $("#ctl00_MainContent_clearWorkPan1").hide();
            $("#ctl00_MainContent_clearWorkPan2").show();
            $("#uploadbtnworkpan").hide();

        }

        function uploaderStatusCallback(id, index, status, outputText) {

            //alert("findone");

            //$('#ctl00_MainContent_divDesc_DT').html(outputText);

            if (status == 3) {

                //var b = doc.getElementById("ctl00_MainContent_btnFinDummy");
                //b.click();
                // window.location = window.location;
            }

        }



        function bindEventsx() {
            scrolltoerror();


            if ($('#ctl00_MainContent_cbxFinanceDataSignOff').attr("checked") == "checked") {
                $('#divFinancePeople').fadeIn('slow');
                //$('.financialControl').css('visibility', 'visible');
                $('.MPFINANCIAL').css('visibility', 'visible');

            }
            else {
                $('#divFinancePeople').fadeOut('slow');
                //$('.financialControl').css('visibility', 'hidden');
                $('.MPFINANCIAL').css('visibility', 'hidden');
            }

            if ($('#ctl00_MainContent_cbxFinanceDataSignOffParent').attr("checked") == "checked") {
                $('#divFinancePeople').fadeIn('slow');
                //$('.financialControl').css('visibility', 'visible');
                $('.MPFINANCIAL').css('visibility', 'visible');
            }

            if ($('#ctl00_MainContent_cbxWorkloadDataSignOff').attr("checked") == "checked") {
                $('#divWorkloadPeople').fadeIn('slow');
                //$('.workloadControl').css('visibility', 'visible');
                $('.MPWORKLOAD').css('display', 'block');
            }
            else {
                $('#divWorkloadPeople').fadeOut('slow');
                //$('.workloadControl').css('visibility', 'hidden');
                $('.MPWORKLOAD').css('display', 'none');
            }

            if ($('#ctl00_MainContent_cbxWorkloadDataSignOffParent').attr("checked") == "checked") {
                $('#divWorkloadPeople').fadeIn('slow');
                //$('.workloadControl').css('visibility', 'visible');
                $('.MPWORKLOAD').css('display', 'block');
            }



            $('#ctl00_MainContent_cbxFinanceDataSignOff').change(function () {

                if (this.checked) {
                    $('#divFinancePeople').fadeIn('slow');
                    $('.financialControl').css('visibility', 'visible');
                    $('.MPFINANCIAL').css('visibility', 'visible');

                } else {
                    $('#divFinancePeople').fadeOut('slow');
                    $('.financialControl').css('visibility', 'hidden');
                    $('.MPFINANCIAL').css('visibility', 'hidden');
                }
            });

            $('#ctl00_MainContent_cbxWorkloadDataSignOff').change(function () {
                if (this.checked) {
                    $('#divWorkloadPeople').fadeIn('slow');
                    $('.workloadControl').css('visibility', 'visible');
                    $('.MPWORKLOAD').css('visibility', 'visible');
                } else {
                    $('#divWorkloadPeople').fadeOut('slow');
                    $('.workloadControl').css('visibility', 'hidden');
                    $('.MPWORKLOAD').css('visibility', 'hidden');
                }
            });
        }

        function setFinancialItemVisibility() {

            if ($('#ctl00_MainContent_cbxFinanceDataSignOff').attr("checked") != "checked") {
                $(".financialControl").each(function () {
                    $(this).css('visibility', 'hidden');
                });
                $("#financialSignOff").css('visibility', 'hidden');
            }
        }

        function setWorkloadItemVisibility() {
            if ($('#ctl00_MainContent_cbxWorkloadDataSignOff').attr("checked") != "checked") {
                $(".workloadControl").each(function () {
                    $(this).css('visibility', 'hidden');
                });
                $("#workloadSignOff").css('visibility', 'hidden');
            }
        }



        function showSuccessConfirmation(message) {

            shownotification(message);

        }




        function positionVisibleModals() {

            var obj = $(".pnNewAttachment");

            var dW = $(window).width();
            var dH = $(window).height();

            obj.each(function () {
                var t = $(this);

                var left = (dW - (t.innerWidth() + 6)) * 0.5;
                var top = (dH - (t.innerHeight() + 6)) * 0.5;

                if (left < 0) { left = 0; }
                if (top < 0) { top = 0; }

                this.style.left = left + 'px';
                this.style.top = top + 'px';
                this.style.marginLeft = 0;
            });
        }




        function showHideMethodology() {
            if ($('#<%= chkMethodologyNA.ClientID %>').is(':checked')) {
                $('#<%= divMethodologyShowHide.ClientID %>').hide();
                $('#<%= divMethodologyNARationale_Financial.ClientID %>').fadeIn('slow');
            }
            else {
                $('#<%= divMethodologyShowHide.ClientID %>').fadeIn('slow');
                $('#<%= divMethodologyNARationale_Financial.ClientID %>').hide();
            }
        }

        function showHideWorkload() {
            if ($('#<%= chkWorkloadNA.ClientID %>').is(':checked')) {
                $('#<%= divWorkloadShowHide.ClientID %>').hide();
                $('#<%= divMethodologyNARationale_Workload.ClientID %>').fadeIn('slow');
            }
            else {
                $('#<%= divWorkloadShowHide.ClientID %>').fadeIn('slow');
                $('#<%= divMethodologyNARationale_Workload.ClientID %>').hide();
            }
        }



        var normalAttachmentsMode = 'Off';
    </script>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">



    <div style="display: none" class="notification1">
    </div>


    <h1 id="heading1" runat="server"></h1>

    <asp:ValidationSummary ID="vsDataSource" runat="server" class="validationsummary"
        HeaderText="<h3>Please provide the following:</h3>" ValidationGroup="DataSourceValidation"
        CssClass="errorSummary" Visible="true" />
    <asp:ValidationSummary ID="vsMethodology" runat="server" class="validationsummary"
        HeaderText="<h3>Please provide the following:</h3>" ValidationGroup="MethodologyValidationF"
        CssClass="errorSummary" Visible="true" />
    <asp:ValidationSummary ID="ValidationSummary2" runat="server" class="validationsummary"
        HeaderText="<h3>Please provide the following:</h3>" ValidationGroup="MethodologyValidationW"
        CssClass="errorSummary" Visible="true" />
    <asp:ValidationSummary ID="vsRisk" runat="server" class="validationsummary" HeaderText="<h3>Please provide the following:</h3>"
        ValidationGroup="RiskValidation" CssClass="errorSummary" Visible="true" />
    <asp:ValidationSummary ID="vsActivity" runat="server" class="validationsummary" HeaderText="<h3>Please provide the following:</h3>"
        ValidationGroup="ActivityValidationF" CssClass="errorSummary" Visible="true" />
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" class="validationsummary"
        HeaderText="<h3>Please provide the following:</h3>" ValidationGroup="ActivityValidationW"
        CssClass="errorSummary" Visible="true" />
    <asp:ValidationSummary ID="ValidationSummary3" runat="server" class="validationsummary" HeaderText="<h3>Please provide the following:</h3>"
        ValidationGroup="ActivityValidationF2" CssClass="errorSummary" Visible="true" />
    <asp:ValidationSummary ID="ValidationSummary4" runat="server" class="validationsummary"
        HeaderText="<h3>Please provide the following:</h3>" ValidationGroup="ActivityValidationW2"
        CssClass="errorSummary" Visible="true" />
    <asp:ValidationSummary ID="SecondReviewerFSummary" runat="server" class="validationsummary"
        HeaderText="<h3>Please select a user for Second Reviewer:</h3>" ValidationGroup="SecondReviewerFSummary"
        CssClass="errorSummary" Visible="true" />
    <div id="successDiv" class="successMessage">
    </div>






    <div style="padding-bottom: 7px;">
        <div style="float: left;">
            The current NetDAR status of this data source is&nbsp;
        </div>
        <div style="float: left;">
            <uc:StatusControl runat="server" ID="ucStatusControl2" ShowHistory="true" ShowCurrent="true"
                ShowNext="false" ShowStatusVisualisation="true" />
        </div>
    </div>
    <div class="formPanel"> 
        <div id="divContents" runat="server">
            <div class="formPanelFooter" id="rowFooter" runat="server" style="padding-top: 10px; margin: 10px 0px 15px 0px;">
                <div class="pItemCtl_auto">
                    <asp:Label ID="lblLastUpdated" runat="server" />
                </div>
                <div class="pItemCtl_auto">
                    <asp:Label ID="lblUpdatedBy" runat="server" />
                </div>
            </div>
            <div class="formPanelRow">
                <h2>Main details</h2>
            </div>
            <div class="formPanelRow">
                <div class="pItemLbl_large">
                    License Condition
                </div>
                <div class="pItemCtl_auto">
                    <asp:Label ID="lblLicenseCondition" runat="server" Width="530" />
                </div>

            </div>
            <div class="formPanelRow">
                <div class="pItemLbl_large">
                    Condition Title / Table Number
                </div>
                <div class="pItemCtl" style="width: 942px; margin-right: 2px; height: 24px;">
                    <asp:TextBox ID="txtConditionTitle" runat="server" Width="940" MaxLength="255" />
                    <asp:RequiredFieldValidator ID="rfvtxtConditionTitle" runat="server" ValidationGroup="DataSourceValidation"
                        ControlToValidate="txtConditionTitle" ErrorMessage="Please enter a Condition Title"
                        SetFocusOnError="true">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="formPanelRow">
                <div class="pItemLbl_large">
                    Table type
                </div>
                <div class="pItemCtl_auto">
                    <asp:DropDownList ID="ddlTableType" runat="server">
                        <asp:ListItem></asp:ListItem>
                        <asp:ListItem>Finance only</asp:ListItem>
                        <asp:ListItem>Workload only</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvTableType" runat="server" InitialValue=""
                        ControlToValidate="ddlTableType" ValidationGroup="DataSourceValidation" 
                        ErrorMessage="Please select a table type">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="formPanelRow" style="height: 60px !important;">
                <div class="pItemLbl_large">
                    Required Information
                </div>
                <div class="pItemCtl" style="width: 942px; margin-right: 2px; height: 60px;">
                    <asp:TextBox ID="txtRequiredInfo" runat="server" Width="940" MaxLength="4000" Height="50px"
                        TextMode="MultiLine" />
                    <asp:RequiredFieldValidator ID="rfvtxtRequiredInfo" runat="server" ValidationGroup="DataSourceValidation"
                        ControlToValidate="txtRequiredInfo" ErrorMessage="Please enter Required Information"
                        SetFocusOnError="true">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="formPanelRow" id="rowMulti" runat="server" style="height: 35px">
                <div class="pItemLbl_large" style="height: 30px">
                    Is this data source made up of multiple sub tables?
                </div>
                <div class="pItemCtl_auto" style="height: 30px">
                    <asp:CheckBox ID="cbxSubTables" runat="server" />
                </div>
            </div>



            <div id="divSingle" runat="server" visible="false">
                <div class="formPanelRow" style="display: none">
                    <div class="pItemLbl_large" style="height: 30px">
                        DAG Data Champion
                    </div>
                    <div class="pItemCtl_auto" style="height: 30px">
                        <asp:DropDownList ID="drpDataChampionOwner" runat="server" Width="170px" />

                    </div>
                    <div style="display: none">
                        <div class="pItemLbl_large" style="height: 30px">
                            DAG Steering Group member
                        </div>
                        <div class="pItemCtl_auto" style="height: 30px; width: 180px;">
                            <asp:DropDownList ID="drpSteeringGroupMember" runat="server" Width="170px" />
                        </div>
                    </div>
                </div>
                <div class="formPanelRow" style="display: none">
                    <div class="pItemLbl_large" style="height: 30px;">
                        Data source business lead
                    </div>
                    <div class="pItemCtl_auto" style="height: 30px; width: 165px;">
                        <asp:DropDownList ID="drpDataSourceOwner" runat="server" Width="130px" />
                        <%--<asp:RequiredFieldValidator ID="rfvDataSourceOwner" runat="server" Display="None"
                            ErrorMessage="Please select a valid Data Source Business Lead" InitialValue="0"
                            ControlToValidate="drpDataSourceOwner" ValidationGroup="DataSourceValidation"></asp:RequiredFieldValidator>--%>
                    </div>
                    <div class="pItemLbl_large" style="height: 30px">
                        Data source exec member
                    </div>
                    <div class="pItemCtl_auto" style="height: 30px">
                        <asp:DropDownList ID="drpDataSourceExec" runat="server" Width="130px" />
                        <%-- <asp:RequiredFieldValidator ID="rfvDataSourceExec" runat="server" Display="None"
                            ErrorMessage="Please select a valid Data Source Exec Member" InitialValue="0"
                            ControlToValidate="drpDataSourceExec" ValidationGroup="DataSourceValidation"></asp:RequiredFieldValidator>--%>
                    </div>
                </div>
                <div class="formPanelRow" style="height: 150px">
                    <div class="divsingleleft" style="float: left;">
                        <div style="height: 35px; display: none;">
                            <div class="pItemLbl_large" style="">
                                <b>Financial data sign off</b>
                            </div>
                            <div class="pItemCtl_auto">
                                <asp:CheckBox ID="cbxFinanceDataSignOff" runat="server" />
                            </div>
                        </div>
                        <div id="divFinancePeople" style="display: none;">
                            <div style="clear: both">
                                <div class="pItemLbl_large" style="height: 30px">
                                    Data preparer
                                </div>
                                <div class="pItemCtl_auto" style="height: 30px">
                                    <asp:DropDownList ID="drpFinDDOwner" runat="server" Width="170px" />
                                </div>
                            </div>
                            <div style="clear: both">
                                <div class="pItemLbl_large" style="height: 30px">
                                    Business Lead
                                </div>
                                <div class="pItemCtl_auto" style="height: 30px">
                                    <asp:DropDownList ID="drpFinBLead" runat="server" Width="170px" />
                                </div>
                            </div>
                            <div style="clear: both">
                                <div class="pItemLbl_large" style="height: 30px">
                                    Exec
                                </div>
                                <div class="pItemCtl_auto" style="height: 30px">
                                    <asp:DropDownList ID="drpFExec" runat="server" Width="170px" />
                                </div>
                            </div>
                            <div style="clear: both; display: none">
                                <div class="pItemLbl_large" style="height: 30px">
                                    Second reviewer
                                </div>
                                <div class="pItemCtl_auto" style="height: 30px">
                                    <asp:DropDownList ID="drpFin2nd" runat="server" Width="170px" />
                                </div>
                            </div>
                            <style type="text/css">
                                #ctl00_MainContent_fupFin_text {
                                    display: none;
                                }

                                #ctl00_MainContent_fupFin {
                                    height: 20px;
                                }

                                    #ctl00_MainContent_fupFin .controls {
                                        display: none;
                                    }

                                #ctl00_MainContent_fupFin_percentBar {
                                    width: 150px;
                                }

                                #ctl00_MainContent_fupFin_status .ProgressBar {
                                    width: 150px;
                                }

                                #ctl00_MainContent_fupFin_percentText {
                                    width: 150px;
                                }

                                #ctl00_MainContent_fupFin_iframe {
                                    width: 200px;
                                }
                            </style>

                        </div>
                    </div>
                    <div class="divsingleright" style="float: left; border-left: solid 1px rgb(0,194,200); padding-left: 15px; width: 600px;">
                        <div style="height: 35px; display: none;">
                            <div class="pItemLbl_large">
                                <b>Workload data sign off</b>
                            </div>
                            <div class="pItemCtl_auto">
                                <asp:CheckBox ID="cbxWorkloadDataSignOff" runat="server" />
                            </div>
                        </div>
                        <div id="divWorkloadPeople" style="display: none;">
                            <div style="clear: both">
                                <div class="pItemLbl_large" style="height: 30px">
                                    Data preparer
                                </div>
                                <div class="pItemCtl_auto" style="height: 30px">
                                    <asp:DropDownList ID="drpWorkloadDDOwner" runat="server" Width="170px" />
                                </div>
                            </div>
                            <div style="clear: both">
                                <div class="pItemLbl_large" style="height: 30px">
                                    Business Lead
                                </div>
                                <div class="pItemCtl_auto" style="height: 30px">
                                    <asp:DropDownList ID="drpWorkloadBLead" runat="server" Width="170px" />
                                </div>
                            </div>
                            <div style="clear: both">
                                <div class="pItemLbl_large" style="height: 30px">
                                    Exec
                                </div>
                                <div class="pItemCtl_auto" style="height: 30px">
                                    <asp:DropDownList ID="drpWExec" runat="server" Width="170px" />
                                </div>
                            </div>
                            <div style="clear: both; display: none">
                                <div class="pItemLbl_large" style="height: 30px">
                                    Second reviewer
                                </div>
                                <div class="pItemCtl_auto" style="height: 30px">
                                    <asp:DropDownList ID="drpWorkload2nd" runat="server" Width="170px" />
                                </div>
                            </div>
                            <style type="text/css">
                                #ctl00_MainContent_fupWork_text {
                                    display: none;
                                }

                                #ctl00_MainContent_fupWork {
                                    height: 20px;
                                }

                                    #ctl00_MainContent_fupWork .controls {
                                        display: none;
                                    }

                                #ctl00_MainContent_fupWork_percentBar {
                                    width: 150px;
                                }

                                #ctl00_MainContent_fupWork_status .ProgressBar {
                                    width: 150px;
                                }

                                #ctl00_MainContent_fupWork_percentText {
                                    width: 150px;
                                }

                                #ctl00_MainContent_fupWork_iframe {
                                    width: 200px;
                                }
                            </style>

                        </div>
                    </div>
                </div>
                <div runat="server" id="divSecondPhase" visible="false">
                    <div class="formPanelRow" style="height: 40px">
                        <h2 style="clear: both; padding-top: 20px; margin-bottom: 10px;">
                            <a id="arisk" style="color: Black;">1. Perform risk assessment</a>
                        </h2>
                    </div>
                    <div class="formPanelRow" style="height: 80px;">
                        <div runat="server" id="rapanel" class="rapanel" style="float: left">
                            <div class="col1">
                                &nbsp
                            </div>
                            <div class="col2">
                                &nbsp
                            </div>
                            <div class="col3">
                                &nbsp
                            </div>
                            <div style="clear: both">
                            </div>
                            <div class="col1">
                                <div class="fHeight">
                                    Impact metric score
                                </div>
                                <div class="fHeight">
                                    Process metric score
                                </div>
                                <div class="fHeight">
                                    Overall rating
                                    <div class="infopopup">
                                        <div class="infoiconO" onclick="$(this).next().show();">
                                        </div>
                                        <div class="infocontent" style="width: 340px; right: -266px;" onclick="$(this).hide();">
                                            The risk matrix used to calculate the rating:<br />


                                            <img src="../img/Brand/riskmatrix.PNG" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col2">
                                <div class="fHeight">
                                    <asp:Label ID="lblImpactMetricScore" runat="server"></asp:Label>
                                </div>
                                <div class="fHeight">
                                    <asp:Label ID="lblProcessMetricScore" runat="server"></asp:Label>
                                </div>
                                <div class="fHeight">
                                    <asp:Label ID="lblOverallRating" runat="server"></asp:Label>
                                </div>
                            </div>
                            <div class="col3">
                                <div class="fHeight">
                                    <asp:Button Text="Edit" ID="btnEditImpactScore" OnClick="btnEditImpactScore_OnClick"
                                        Style="padding: 1px 5px; height: 20px;" runat="server"></asp:Button>
                                </div>
                                <div class="fHeight">
                                    <asp:Button Text="Edit" ID="btnEditProcessScore" OnClick="btnEditProcessScore_OnClick"
                                        Style="padding: 1px 5px; height: 20px;" runat="server"></asp:Button>
                                </div>
                            </div>
                        </div>
                        <div runat="server" id="divManualOverride" visible="false" style="border-left: solid 1px rgb(0,194,200); padding-left: 15px; width: 600px; float: left;">
                            <div class="col4">
                                Manual Override
                            </div>
                            <div class="col5">
                                Supporting Comments for manual override
                            </div>
                            <div style="clear: both">
                            </div>
                            <div class="col4">
                                <div class="fHeight">
                                    <asp:DropDownList ID="drpImpactOverride" Style="display: none" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <div class="fHeight">
                                    <asp:DropDownList ID="drpProcessOverride" Style="display: none" runat="server">
                                    </asp:DropDownList>
                                </div>
                                <div class="fHeight">
                                    <asp:DropDownList ID="drpOverallOverride" runat="server">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col5">
                                <asp:TextBox ID="txtOverride" runat="server" TextMode="MultiLine" Height="60px" Width="305px"></asp:TextBox>
                            </div>
                        </div>

                        <div runat="server" id="divRA_NAParents" visible="false">
                            The risk assessment is only required at the parent level. 
                        </div>


                        <asp:CustomValidator ID="cvRiskAssessment" runat="server" Display="None" ErrorMessage="Please ensure both risk levels have been set"
                            OnServerValidate="cvRiskAssessment_OnServerValidate" ValidationGroup="RiskValidation"></asp:CustomValidator>

                        <asp:CustomValidator ID="cvRiskAssessmentOverride" runat="server" Display="None" ErrorMessage="If an override rating has been provided then you must provide a comment"
                            OnServerValidate="cvRiskAssessmentOverride_OnServerValidate" ValidationGroup="RiskValidation"></asp:CustomValidator>


                    </div>
                    <div style="clear: both; padding-bottom: 10px;">
                    </div>
                    <div class="formPanelRow" style="clear: both">
                        <h2 style="clear: both; padding-top: 10px; margin-bottom: 10px; width: 95%">2. Upload methodology statement</h2>
                    </div>


                    <div class="MPFINANCIAL" style="float: left">

                        <div style="margin: 10px 0 0 0;">
                            <div style="float: left; width: 318px;">
                                Methodology statement not applicable
                            </div>
                            <div style="float: left; width: 100px;">
                                <asp:CheckBox ID="chkMethodologyNA" runat="server" onclick="showHideMethodology()" />
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div id="divMethodologyNARationale_Financial" runat="server">
                            <p>Rationale for not applicable methodology</p>
                            <asp:TextBox ID="txtMethodologyNARationale_Financial" Width="580px" Height="90px" runat="server" TextMode="MultiLine"></asp:TextBox>
                            <asp:CustomValidator ID="cvMethodologyNARationale_Financial" runat="server" Display="None" ErrorMessage="Please provide rationale for the methodology not being applicable"
                                OnServerValidate="cvMethodologyNARationale_Financial_OnServerValidate" ValidationGroup="MethodologyValidationF"></asp:CustomValidator>
                        </div>
                        <div id="divMethodologyShowHide" runat="server">

                            <asp:Panel runat="server" ID="pnlMethodologyStatement" CssClass="pnlSize">
                            </asp:Panel>
                            <div>
                                <br />
                                or Link/details of associated methodology statement (optional)<br />
                                <br />
                            </div>
                            <div>
                                <asp:TextBox runat="server" ID="txtLinkMethodologyStatement" Width="390px"></asp:TextBox>
                            </div>
                            <asp:CustomValidator ID="cvSecondPhaseF" runat="server" Display="None" ErrorMessage="Please upload a methodology statement or provide a link/details of associated methodology statement"
                                OnServerValidate="cvSecondPhaseF_OnServerValidate" ValidationGroup="MethodologyValidationF"></asp:CustomValidator>
                        </div>
                    </div>
                    <div class="MPWORKLOAD" style="float: left; border-left: solid 1px rgb(0,194,200); padding-left: 15px; width: 600px;">

                        <div style="margin: 10px 0 0 0;">
                            <div style="float: left; width: 318px;">
                                Workload methodology statement not applicable
                            </div>
                            <div style="float: left; width: 100px;">
                                <asp:CheckBox ID="chkWorkloadNA" runat="server" onclick="showHideWorkload()" />
                            </div>
                        </div>
                        <div style="clear: both;"></div>
                        <div id="divMethodologyNARationale_Workload" runat="server">
                            <p>Rationale for not applicable methodology</p>
                            <asp:TextBox ID="txtMethodologyNARationale_Workload" Width="580px" Height="90px" runat="server" TextMode="MultiLine"></asp:TextBox>
                            <asp:CustomValidator ID="cvMethodologyNARationale_Workload" runat="server" Display="None" ErrorMessage="Please provide rationale for the workload methodology not being applicable"
                                OnServerValidate="cvMethodologyNARationale_Workload_OnServerValidate" ValidationGroup="MethodologyValidationW"></asp:CustomValidator>
                        </div>
                        <br />
                        <div id="divWorkloadShowHide" runat="server">
                            Workload<asp:Panel runat="server" ID="pnlMethodologyStatementW" CssClass="pnlSize">
                            </asp:Panel>
                            <div>
                                <br />
                                or Link/details of associated methodology statement (optional)<br />
                                <br />
                            </div>
                            <div>
                                <asp:TextBox runat="server" ID="txtLinkMethodologyStatementW" Width="390px"></asp:TextBox>
                            </div>
                            <asp:CustomValidator ID="cvSecondPhaseW" runat="server" Display="None" ErrorMessage="Please upload a methodology statement or provide a link/details of associated methodology statement"
                                OnServerValidate="cvSecondPhaseW_OnServerValidate" ValidationGroup="MethodologyValidationW"></asp:CustomValidator>
                        </div>
                    </div>


                    <div style="clear: both">
                    </div>
                    <div class="formPanelRow" style="height: 50px;">
                        <h2 style="clear: both; padding-top: 20px; margin-bottom: 10px;">3. Determine Assurance Activities</h2>
                    </div>
                    <div id="aapanel" runat="server">
                        <div class="formPanelRow">
                            <div class="activityLabel">
                                <b>Planning</b>
                            </div>
                            <div id="financialSignOff" class="activityDropdown financialControl" style="display: none;">
                                <b>Financial</b>
                            </div>
                            <div id="workloadSignOff" class="activityDropdown workloadControl" style="border-left: solid 1px rgb(0,194,200); padding-left: 15px;">
                                <b>Workload</b>
                            </div>
                            <div style="clear: both">
                            </div>
                        </div>
                        <uc:AA runat="server" ID="ucAA_Planning_MS" IsMandatory="true" Level="PlanMethodologyStatement" />
                        <uc:AA runat="server" ID="ucAA_Planning_SM" IsMandatory="true" Visible="false" Level="PlanSMSignOff" />
                        <div class="formPanelRow">
                            <div class="activityLabel">
                                <b>Review / Preparation</b>
                            </div>
                            <div style="clear: both">
                            </div>
                        </div>
                        <uc:AA runat="server" ID="ucAA_Submission_2nd" IsMandatory="false" Level="SecondPersonReview" IsMandatoryWithValue="true" />
                        <asp:CustomValidator ID="cvAA_Submission_2ndF" runat="server" ValidationGroup="ActivityValidationF" ErrorMessage="Name of second reviewer is required"
                            OnServerValidate="cvAA_Submission_2ndF_ServerValidate">*</asp:CustomValidator>
                        <asp:CustomValidator ID="cvAA_Submission_2ndW" runat="server" ValidationGroup="ActivityValidationW" ErrorMessage="Name of second reviewer is required"
                            OnServerValidate="cvAA_Submission_2ndW_ServerValidate">*</asp:CustomValidator>
                        <uc:AA runat="server" ID="ucAA_Submission_IER" Level="InternalExpertReview" />
                        <div class="formPanelRow" style="display: none;">
                            <div class="activityLabel">
                                <b>Independent Assurance (refer to IA)</b>
                            </div>
                            <div style="clear: both">
                            </div>
                        </div>
                        <!-- no longer needed in submission workflow -->
                         <uc:AA runat="server" ID="ucAA_Submission_EDA" Level="ExternalDataAudit" Visible="false" />
                        <uc:AA runat="server" ID="ucAA_Submission_EPA" Level="ExternalProcessAudit" Visible="false" />
                        <div class="formPanelRow">
                            <div class="activityLabel">
                                <b>Sign-Off</b>
                            </div>
                            <div style="clear: both">
                            </div>
                        </div>

                        <uc:AA runat="server" ID="ucAA_Submission_FSM" IsMandatory="true" Level="SMSignOff" Visible="false" />
                        <uc:AA runat="server" ID="ucAA_Submission_FEX" IsMandatory="true" Level="EOSignOff" />
                        
                        
                        <div class="formPanelRow">
                        
                           <div  class="activityLabel" >Is Internal Audit required for this table?</div>
                    <div class="activityDropdown financialControl" >
                        <asp:DropDownList AutoPostBack="true" Width="200px"  runat="server" ID="ddlIsIARequired" OnSelectedIndexChanged="ddlIsIARequired_SelectedIndexChanged" >
                            <asp:ListItem>No</asp:ListItem>
                            <asp:ListItem>Yes - Internal Data and Process</asp:ListItem>
                            <asp:ListItem>Yes - Internal Data Only</asp:ListItem>
                            <asp:ListItem>Yes - Internal Process Only</asp:ListItem>
                        </asp:DropDownList>

                    </div></div>
                        
                        <uc:AA runat="server" ID="ucAA_Submission_IDA" Level="InternalDataAudit" Visible="true" />
                        <uc:AA runat="server" ID="ucAA_Submission_IPA" Level="InternalProcessAudit" Visible="true" />
                       
                        
                        <!--<uc:aa runat="server" id="ucAA_Submission_FCE" level="CEOSignOff" />-->
                        <!--<uc:aa runat="server" id="ucAA_Submission_FBD" level="BoardSignOff" />-->
                    </div>
                    <div runat="server" id="divAA_NAParents" visible="false">
                        Assurance activities are only required at the parent level. 
                    </div>
                </div>
            </div>
            <div id="divMultiple" runat="server" visible="false" class="divmultiple">

                <div class="divsingleleft" style="float: left;">
                    <div style="height: 35px; display: none;">
                        <div class="pItemLbl_large">
                            <b>Financial data sign off</b>
                        </div>
                        <div class="pItemCtl_auto">
                            <asp:CheckBox ID="cbxFinanceDataSignOffParent" runat="server" Enabled="false" Checked="false" />
                        </div>
                    </div>
                </div>



                <div class="divsingleright" style="float: left; border-left: solid 1px rgb(0,194,200); padding-left: 15px; width: 600px;">
                    <div style="height: 35px; display: none;">
                        <div class="pItemLbl_large">
                            <b>Workload data sign off</b>
                        </div>
                        <div class="pItemCtl_auto">
                            <asp:CheckBox ID="cbxWorkloadDataSignOffParent" runat="server" Enabled="false" Checked="true" />
                        </div>
                    </div>
                </div>

                <div class="formPanelRow" style="height: 40px">
                    <h2 style="clear: both; padding-top: 20px; margin-bottom: 10px;">
                        <a id="arisk2" style="color: Black;">1. Perform risk assessment</a>
                    </h2>
                </div>
                <div class="formPanelRow" style="height: 90px;">
                    <div runat="server" id="Div1" class="rapanel" style="float: left;">
                        <div class="col1">
                            &nbsp
                        </div>
                        <div class="col2">
                            &nbsp
                        </div>
                        <div class="col3">
                            &nbsp
                        </div>
                        <div style="clear: both">
                        </div>
                        <div class="col1">
                            <div class="fHeight">
                                Impact metric score
                            </div>
                            <div class="fHeight">
                                Process metric score
                            </div>
                            <div class="fHeight">
                                Overall rating
                                    <div class="infopopup">
                                        <div class="infoiconO" onclick="$(this).next().show();">
                                        </div>
                                        <div class="infocontent" style="width: 340px; right: -266px;" onclick="$(this).hide();">
                                            The risk matrix used to calculate the rating:<br />


                                            <img src="../img/Brand/riskmatrix.PNG" />

                                        </div>
                                    </div>
                            </div>
                        </div>
                        <div class="col2">
                            <div class="fHeight">
                                <asp:Label ID="lblImpactMetricScore2" runat="server"></asp:Label>
                            </div>
                            <div class="fHeight">
                                <asp:Label ID="lblProcessMetricScore2" runat="server"></asp:Label>
                            </div>
                            <div class="fHeight">
                                <asp:Label ID="lblOverallRating2" runat="server"></asp:Label>
                            </div>
                        </div>
                        <div class="col3">
                            <div class="fHeight">
                                <asp:Button Text="Edit" ID="btnEditImpactScore2" OnClick="btnEditImpactScore2_OnClick"
                                    Style="padding: 1px 5px; height: 20px;" runat="server"></asp:Button>
                            </div>
                            <div class="fHeight">
                                <asp:Button Text="Edit" ID="btnEditProcessScore2" OnClick="btnEditProcessScore2_OnClick"
                                    Style="padding: 1px 5px; height: 20px;" runat="server"></asp:Button>
                            </div>
                        </div>
                    </div>
                    <div runat="server" id="div2" visible="true" style="width: 600px; float: left; border-left: solid 1px rgb(0,194,200); padding-left: 15px;">
                        <div class="col4" style="width: 160px;">
                            Manual Override
                        </div>
                        <div class="col5" style="width: 400px;">
                            Supporting Comments for manual override
                        </div>
                        <div style="clear: both">
                        </div>
                        <div class="col4" style="width: 160px;">
                            <div class="fHeight">
                                <asp:DropDownList ID="DropDownList1" Style="display: none" runat="server">
                                </asp:DropDownList>
                            </div>
                            <div class="fHeight">
                                <asp:DropDownList ID="DropDownList2" Style="display: none" runat="server">
                                </asp:DropDownList>
                            </div>
                            <div class="fHeight">
                                <asp:DropDownList ID="ddOverride2" runat="server">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col5" style="width: 400px;">
                            <asp:TextBox ID="txtOverrideComments2" runat="server" TextMode="MultiLine" Height="60px" Width="390px"></asp:TextBox>
                        </div>
                    </div>


                    <asp:CustomValidator ID="cvRiskAssessment2" runat="server" Display="None" ErrorMessage="Please ensure both risk levels have been set"
                        OnServerValidate="cvRiskAssessment2_OnServerValidate" ValidationGroup="ParentRA"></asp:CustomValidator>

                    <asp:CustomValidator ID="cvRiskAssessmentOverride2" runat="server" Display="None" ErrorMessage="If an override rating has been provided then you must provide a comment"
                        OnServerValidate="cvRiskAssessmentOverride2_OnServerValidate" ValidationGroup="ParentRA"></asp:CustomValidator>

                </div>
                <div style="clear: both">
                </div>
                <div class="formPanelRow" style="height: 50px;">
                    <h2 style="clear: both; padding-top: 20px; margin-bottom: 10px;">3. Determine Assurance Activities</h2>
                </div>
                <div id="aapanel2" runat="server">
                    <div class="formPanelRow">
                        <div class="activityLabel">
                            <b>Planning</b>
                        </div>
                        <div id="financialSignOff2" class="activityDropdown financialControl" style="display: none;">
                            <b>Financial</b>
                        </div>
                        <div id="workloadSignOff2" class="activityDropdown workloadControl" style="border-left: solid 1px rgb(0,194,200); padding-left: 15px;">
                            <b>Workload</b>
                        </div>
                        <div style="clear: both">
                        </div>
                    </div>
                    <uc:AA runat="server" ID="ucAA_Planning_MS2" IsMandatory="true" Level="PlanMethodologyStatement" />
                    <uc:AA runat="server" ID="ucAA_Planning_SM2" IsMandatory="true" Visible="false" Level="PlanSMSignOff" />
                    <div class="formPanelRow">
                        <div class="activityLabel">
                            <b>Review / Preparation</b>
                        </div>
                        <div style="clear: both">
                        </div>
                    </div>
                    <uc:AA runat="server" ID="ucAA_Submission_2nd2" IsMandatory="false" Level="SecondPersonReview" IsMandatoryWithValue="true" />
                    <asp:CustomValidator ID="cvAA_Submission_2ndF2" runat="server" ValidationGroup="ActivityValidationF2" ErrorMessage="Name of second reviewer is required"
                        OnServerValidate="cvAA_Submission_2ndF2_ServerValidate">*</asp:CustomValidator>
                    <asp:CustomValidator ID="cvAA_Submission_2ndW2" runat="server" ValidationGroup="ActivityValidationW2" ErrorMessage="Name of second reviewer is required"
                        OnServerValidate="cvAA_Submission_2ndW2_ServerValidate">*</asp:CustomValidator>
                    <uc:AA runat="server" ID="ucAA_Submission_IER2" Level="InternalExpertReview" />
                    <div class="formPanelRow" style="display: none;">
                        <div class="activityLabel">
                            <b>Independent Assurance (refer to IA)</b>
                        </div>
                        <div style="clear: both">
                        </div>
                    </div>
                    <uc:AA runat="server" ID="ucAA_Submission_EDA2" Level="ExternalDataAudit" Visible="false" />
                    <uc:AA runat="server" ID="ucAA_Submission_EPA2" Level="ExternalProcessAudit" Visible="false" />
                    <div class="formPanelRow">
                        <div class="activityLabel">
                            <b>Sign-Off</b>
                        </div>
                        <div style="clear: both">
                        </div>
                    </div>
                    <uc:AA runat="server" ID="ucAA_Submission_FSM2" IsMandatory="true" Level="SMSignOff" Visible="false" />
                    <uc:AA runat="server" ID="ucAA_Submission_FEX2" IsMandatory="true" Level="EOSignOff" />


             

                    <uc:AA runat="server" ID="ucAA_Submission_IDA2" Level="InternalDataAudit" Visible="true" />
                    <uc:AA runat="server" ID="ucAA_Submission_IPA2" Level="InternalProcessAudit" Visible="true" />
                    



                    <%--<uc:aa runat="server" id="ucAA_Submission_FCE2" level="CEOSignOff" />
                        <uc:aa runat="server" id="ucAA_Submission_FBD2" level="BoardSignOff" />--%>
                </div>


                <pwc:FilterPanel ID="PageFilter" runat="server" FilterTitle="Filter Results" ShowSearchButton="true">
                    <pwc:FilterRow ID="FilterRow1" runat="server">
                        <div class="fItemLbl">
                            Search
                        </div>
                        <div class="fItemCtl">
                            <asp:TextBox ID="txtSearch" runat="server" Width="183px" AutoPostBack="true" />
                        </div>
                    </pwc:FilterRow>
                </pwc:FilterPanel>
                <div class="fullWidthBlock" style="margin-bottom: 2px; height: 26px;">
                    <div class="alignRight">
                        <asp:Button ID="btnAdd" runat="server" Text="Add New Data Source" CssClass="plusIcon"
                            Width="170px" OnClick="btnAdd_Click" />
                    </div>
                </div>
                <div>
                    <asp:GridView ID="gvDataSources" runat="server" AutoGenerateColumns="False" GridLines="None"
                        CssClass="gridview" AllowPaging="True" AllowSorting="True" DataSourceID="sdsDataSources"
                        PageSize="10">
                        <EmptyDataTemplate>
                            There are no results for the specified criteria.
                        </EmptyDataTemplate>
                        <RowStyle CssClass="row1" />
                        <AlternatingRowStyle CssClass="row0" />
                        <PagerStyle CssClass="pager" />
                        <Columns>
                            <asp:BoundField HeaderText="License Condition" DataField="LicenseCondition" SortExpression="LicenseCondition"
                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField HeaderText="Required information" DataField="RequiredInformation"
                                SortExpression="RequiredInformation" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField HeaderText="NetDAR status" DataField="Stage1Status" SortExpression="Stage1Status"
                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField HeaderText="Submission status" DataField="Stage2Status" SortExpression="Stage2Status"
                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField HeaderText="Overall Rating" Visible="false" DataField="OverallRating" SortExpression="OverallRating"
                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField HeaderText="Impact Score" Visible="false" DataField="ImpactScore" SortExpression="ImpactScore"
                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField HeaderText="Process Score" Visible="false" DataField="ProcessScore" SortExpression="ProcessScore"
                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField HeaderText="DAG Year" DataField="DAGYear" SortExpression="DAGYear"
                                HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:TemplateField HeaderText="Edit" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <cc:exImageButton ID="btnEdit" runat="server" OnClick="btnEditDataSources" CausesValidation="false"
                                        intValue2='<%# Eval("RegulationID") %>' intValue1='<%# Eval("DataSourceID") %>'
                                        intValue3='<%# Eval("ParentDataSourceID") %>' ImageUrl='~/img/PwCIcons/20x20/edit_icon20.png'
                                        CssClass="icon20x20 PwCOrange" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
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
                    SelectCommand="uspDataSourceGetListChild" SelectCommandType="StoredProcedure">
                    <SelectParameters>
                        <asp:ControlParameter Name="searchText" DbType="String" ControlID="txtSearch" PropertyName="Text"
                            ConvertEmptyStringToNull="false" />
                        <asp:SessionParameter Name="Username" DbType="String" ConvertEmptyStringToNull="false"
                            SessionField="Username" />
                        <asp:SessionParameter Name="Role" DbType="String" ConvertEmptyStringToNull="false"
                            SessionField="UserRole" />
                        <asp:Parameter Name="RegulationID" DbType="Int32" ConvertEmptyStringToNull="false" />
                        <asp:Parameter Name="ParentDSID" DbType="Int32" ConvertEmptyStringToNull="false" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </div>
    <div style="width: 100%; font-family: Arial; position: fixed; bottom: 0; left: 0; background: white; z-index: 999999; border-top: 4px solid #e0301e; padding: 5px 5px 5px 5px;">
        <div style="float: left">
            <div runat="server" id="divPopup" style="display: none">
                <div class="modal-fill" style="background-color: #939598;">
                </div>
                <div class="modal" style="width: 500px; margin-left: -250px; position: fixed; background-color: white;">
                    <div class="modal-title">
                        Update status
                    </div>
                    <div class="modal-content">
                        <div class="form-panel">
                            <asp:ValidationSummary ID="vsSummary" runat="server" class="validationsummary" ValidationGroup="ParentRA"
                                HeaderText="<h3>Please provide the following:</h3>" CssClass="errorSummary" Visible="true" />
                            <div id="disclaimerTextDiv" runat="server" style="padding-bottom: 5px;" class="form-panel-row">
                                <asp:Label ID="disclaimerText" Visible="true" Text="disclaimer text" runat="server"></asp:Label>
                            </div>
                            <div style="clear: both;">
                            </div>
                            <div class="form-panel-row">
                                <div class="grid_2">
                                    <div style="float: left;">
                                        Add Comments?
                                    </div>
                                    <div style="float: left; padding-left: 7px; margin-top: -3px;">
                                        <input type="checkbox" name="chk" onclick="enableComments2(this);" id="chkComments" />
                                    </div>
                                </div>
                            </div>
                            <div style="clear: both;">
                            </div>
                            <div id="commentDiv1" runat="server" style="display: none" class="form-panel-row">
                                <div class="grid_5">
                                    <asp:TextBox runat="server" ID="txtStatusComments" Width="475px" Height="100px" TextMode="MultiLine"></asp:TextBox>
                                    <asp:RequiredFieldValidator ControlToValidate="txtStatusComments" runat="server" ID="rfSC"
                                        ValidationGroup="ParentRA" ErrorMessage="Please provide comments">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                        </div>
                        <asp:Button runat="server" ID="btnSavePopup" ValidationGroup="ParentRA" Text="Save" OnClick="StatusSave" />
                        <input type="button" value="Cancel" class="icon-button cancel" onclick="$(this).parent().parent().parent().hide();" />
                    </div>
                </div>
            </div>
        </div>
        <div style="float: left;">
            <asp:Button ID="btnCancel" runat="server" Text="Back to Parent Return" CssClass="iconButton Exit"
                Width="200" OnClick="btnCancel_OnClick" CausesValidation="false" OnClientClick="return confirm('You are about to leave the page, any unsaved changes will be lost. Do you wish to continue?');" />

            <asp:Button ID="btnCancel2" runat="server" Visible="true" Text="Back to User Summary" CssClass="iconButton Exit"
                Width="170" CausesValidation="false" OnClientClick="if( confirm('You are about to leave the page, any unsaved changes will be lost. Do you wish to continue?')){ window.location='Reporting/NewChartsDasboard/UserSpecificReporting.aspx';  } return false;" />

            <asp:Button ID="btnParentRA" Visible="false" runat="server" CommandArgument="SubmitRA" Text="Submit risk assessment" Style="background-color: #ffAD10;" CssClass="iconButton Save"
                Width="195" OnClick="StatusClick" CausesValidation="true" />

            <asp:Button ID="btnParentAA_F" Visible="false" ValidationGroup="ActivityValidationF2" runat="server" CommandArgument="SubmitAA_F" Text="Submit Assurance Activities" Style="background-color: #ffAD10;" CssClass="iconButton Save"
                Width="270" OnClick="StatusClick" CausesValidation="true" />

            <asp:Button ID="btnParentAA_W" Visible="false" ValidationGroup="ActivityValidationW2" runat="server" CommandArgument="SubmitAA_W" Text="Submit Assurance Activities (Workload)" Style="background-color: #ffAD10;" CssClass="iconButton Save"
                Width="270" OnClick="StatusClick" CausesValidation="true" />

            <asp:Button ID="btnSave" runat="server" Text="Save Main Details" CssClass="iconButton Save"
                Width="195" OnClick="btnSave_OnClick" CausesValidation="true" ValidationGroup="DataSourceValidation" />
            <asp:Button ID="btnSubmissions" runat="server" Text="Go to Submissions" CssClass="iconButton"
                Width="165" OnClick="btnSubmissions_OnClick" CausesValidation="false" />
            <asp:Button ID="btnUserSpecific" runat="server" Visible="false"  Text="Go to User Specific Reporting" CssClass="iconButton"
                Width="227" OnClick="btnUserSpecific_Click" CausesValidation="false" />
        </div>
        <div style="float: left; padding-left: 10px">
            <uc:StatusControl runat="server" ID="ucStatusControl1" ShowHistory="false" ShowCurrent="false"
                OnAfterSave="OnAfterSave" OnAfterReload="onAfterReload" OnBeforeSave="OnBeforeSave"
                ShowNext="true" />
        </div>

        <div runat="server" id="divAdmin" visible="false" style="float: right">

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
        <div style="float: right">
        </div>
    </div>
    <div style="display: none;">
        <div id="divCustomFields">
            <div style="height: 40px">
                <div style="width: 150px; float: left; font-family: Arial">
                    Title
                </div>
                <asp:TextBox runat="server" CssClass="customfield" Style="float: left" ID="txtTitle"
                    Width="550px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtTitle" ValidationGroup="atvMethodology_ValGroup"
                    runat="server" ControlToValidate="txtTitle" ErrorMessage="The title is required">*</asp:RequiredFieldValidator>
            </div>
            <div style="height: 100px">
                <div style="width: 150px; float: left; font-family: Arial">
                    Description of the file to be attached
                </div>
                <asp:TextBox runat="server" CssClass="customfield" Style="float: left" ID="txtDescription"
                    TextMode="MultiLine" Height="80px" Width="550px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="rfvtxtDescription" ValidationGroup="atvMethodology_ValGroup"
                    runat="server" ControlToValidate="txtDescription" ErrorMessage="The description is required">*</asp:RequiredFieldValidator>
            </div>
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




    <script type="text/javascript">

        Sys.Application.add_load(bindEventsx);

        $(document).ready(function () {

            bindEventsx();

            //setWorkloadItemVisibility();
            //setFinancialItemVisibility();

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


            // Set financial and workload checkboxes (split no longer needed)
            $('#ctl00_MainContent_cbxFinanceDataSignOff').attr("checked", true);
            $('#ctl00_MainContent_cbxWorkloadDataSignOff').attr("checked", false);
            $('#ctl00_MainContent_cbxFinanceDataSignOffParent').attr("checked", true);
            $('#ctl00_MainContent_cbxWorkloadDataSignOffParent').attr("checked", false);

            $('.financialControl').css('visibility', 'visible');
            $('.workloadControl').css('visibility', 'hidden');

            $('#divFinancePeople').show();
            $('.financeControl').css('visibility', 'visible');
            $('.MPWORKLOAD').css('visibility', 'visible');


            if ($('#hasWLOADSpecial').val()=='1') {
                $('#divWorkloadPeople').show();
                $('.workloadControl').css('visibility', 'visible');
                $('.MPWORKLOAD').css('visibility', 'visible');
               

            }
            else {

                $('#divWorkloadPeople').hide();
                $('.workloadControl').css('visibility', 'hidden');
                $('.MPWORKLOAD').css('visibility', 'hidden');

            }
        });



        $(window).resize(function () {
            positionVisibleModals();
        });


        function scrolltoerror() {

            var iserrorshown = false;
            $('.errorSummary').each(function () { if ($(this).is(":visible") == true) { iserrorshown = true; } });

            if (iserrorshown == true) {
                window.scrollTo(0, 0);
            }
        }

    </script>


    <asp:HiddenField runat="server" ID="hasWLOADSpecial" ClientIDMode="Static" />

    <%--
        </ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
