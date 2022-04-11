<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true"
    CodeBehind="RegulationDetails.aspx.cs" Inherits="PwC.Pages.RegulationDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        table.gridview tr.rejrow td {
            background-color: rgb(221,221,35);
        }

        table.gridview tr td {
            vertical-align: top;
        }

        .filterRow {
            height: 20px !important;
            width: 500px;
        }

        .fItemCtl {
            width: 170px !important;
        }

        .filterPanel {
            width: 905px;
            margin-top: 10px;
            background-color: #f5f4f0; /* 10% Grey */
        }

            .filterPanel .fHeader {
                font-weight: bold;
                color: #000; /* Black */
                float: none;
                width: 905px;
                margin-bottom: 3px;
                font-size: 9pt;
                height: 22px;
                background-color: #f5f4f0; /* 25% Grey */
                padding-top: 2px;
                display: nonde;
            }

        .fContent {
            width: 905px;
        }

        .hdrfilter {
            display: none;
        }
    </style>
    <script type="text/javascript">

        function enableComments(src) {


            if (src.checked == true) {

                $('#ctl00_MainContent_commentDiv1').show();

            } else {
                $('#ctl00_MainContent_commentDiv1').hide();
            }
        }

        function showSuccessConfirmation(message) {

            shownotification(message);

        }

        function shownotification(message) {
            $('.notification1').html(message);


            $('.notification1').fadeIn('slow', function () {
                $(this).delay(5000).fadeOut('slow');
            });

        }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <%--  <asp:UpdatePanel ID="updPanel" runat="server">
        <ContentTemplate>--%>
    <div style="display: none" class="notification1">
    </div>
    <h1 id="heading1" runat="server"></h1>
    <asp:ValidationSummary ID="vsRegulation" runat="server" class="validationsummary"
        HeaderText="<h3>Please provide the following:</h3>" ValidationGroup="RegulationValidation"
        CssClass="errorSummary" Visible="true" />
    <div class="formPanel">
        <div id="divContents" runat="server">
            <div class="formPanelFooter" id="rowFooter" runat="server" style="margin: 10px 0px 15px 0px;">
                <div class="pItemCtl_auto">
                    <asp:Label ID="lblLastUpdated" runat="server" />
                </div>
                <div class="pItemCtl_auto">
                    <asp:Label ID="lblUpdatedBy" runat="server" />
                </div>
            </div>
            <div class="formPanelRow">
                <div style="float: left; width: 200px;">
                    <h2>Main Details</h2>
                </div>
            </div>
            <div class="formPanelRow">
                <div class="pItemLbl_large">
                    License Condition
                </div>
                <div class="pItemCtl_auto" style="width: 942px; margin-right: 2px;">
                    <asp:TextBox ID="txtLicenseCondition" runat="server" Width="940" MaxLength="255" />
                    <asp:RequiredFieldValidator ID="rfvtxtLicenseCondition" runat="server" ValidationGroup="RegulationValidation"
                        ControlToValidate="txtLicenseCondition" ErrorMessage="Please enter a License Condition"
                        SetFocusOnError="true">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="formPanelRow">
                <div class="pItemLbl_large">
                    License Title
                </div>
                <div class="pItemCtl_auto" style="width: 942px; margin-right: 2px;">
                    <asp:TextBox ID="txtLicenseTitle" runat="server" Width="940" MaxLength="255" />
                    <asp:RequiredFieldValidator ID="rfvtxtLicenseTitle" runat="server" ValidationGroup="RegulationValidation"
                        ControlToValidate="txtLicenseTitle" ErrorMessage="Please enter a License Title"
                        SetFocusOnError="true">*</asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="formPanelRow" style="height: 80px !important">
                <div class="pItemLbl_large">
                    License Description
                </div>
                <div class="pItemCtl_auto" style="width: 942px; margin-right: 2px;">
                    <asp:TextBox ID="txtLicenseDescription" runat="server" Width="940" Height="50px" MaxLength="4000"
                        TextMode="MultiLine" />
                    <div style="clear: both">
                    </div>
                </div>
            </div>
            <div class="formPanelRow">
                <div class="pItemLbl_large">
                    DAG Year
                </div>
                <div class="pItemCtl_auto">
                    <asp:DropDownList ID="drpDAGYear" runat="server" Width="200" />
                    <asp:RequiredFieldValidator ID="rfvdrpDAGYear" runat="server" ValidationGroup="RegulationValidation"
                        ControlToValidate="drpDAGYear" ErrorMessage="Please select a DAG Year" SetFocusOnError="true"
                        InitialValue="--- Please Select ---">*</asp:RequiredFieldValidator>
                </div>
            </div>
        </div>
        <div id="divDataSources" runat="server" visible="false" style="width: 905px">
            <h2>Data Sources</h2>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <pwc:FilterPanel ID="PageFilter" runat="server" HeaderCssClass="hdrfilter" FilterTitle="Filter Results"
                        ShowSearchButton="true">
                        <pwc:FilterRow ID="FilterRow1" runat="server">
                            <div class="fItemLbl">
                                Search
                            </div>
                            <div class="fItemCtl">
                                <asp:TextBox ID="txtSearch" runat="server" Width="183px" AutoPostBack="true" />
                            </div>
                            <div class="fItemLbl" style="display: none">
                                License Condition
                            </div>
                            <div class="fItemCtl" style="display: none">
                                <asp:DropDownList ID="drpLCondition" runat="server" Width="183px" AutoPostBack="true" />
                            </div>
                            <div class="fItemLbl" style="display: none">
                                DAG Year
                            </div>
                            <div class="fItemCtl" style="display: none">
                                <asp:DropDownList ID="DropDownList1" runat="server" Width="183px" AutoPostBack="true" />
                            </div>
                        </pwc:FilterRow>
                    </pwc:FilterPanel>
                    <div class="fullWidthBlock" style="margin-bottom: 2px; height: 26px;">
                        <div style="float: left">
                            Key:
                        </div>
                        <div style="float: left; margin-top: 4px; background-color: rgb(221,221,35); width: 10px; height: 10px;">
                            &nbsp;
                        </div>
                        <div style="float: left">
                            = record was rejected back to current status.
                        </div>

                        <div class="alignRight">
                            <asp:Button runat="server" ID="btnClear" Text="Clear" Style="margin-left: 5px; height: 24px"
                                OnClick="btnClear_Click" />
                            <asp:Button runat="server" ID="btnSearch" Text="Search" Style="height: 24px" />
                            <asp:Button ID="btnAdd" runat="server" Text="Add New Data Source" Style="height: 24px"
                                CssClass="plusIcon" Width="170px" OnClick="btnAdd_Click" />
                        </div>
                    </div>

                    <asp:GridView ID="gvDataSources" runat="server" AutoGenerateColumns="False" GridLines="None" Width="1256px"
                        CssClass="gridview" AllowPaging="True" AllowSorting="True" DataSourceID="sdsDataSources"
                        PageSize="10" OnRowDataBound="gvDataSources_OnRowDataBound">
                        <EmptyDataTemplate>
                            There are no results for the specified criteria.
                        </EmptyDataTemplate>
                        <RowStyle CssClass="row1" />
                        <AlternatingRowStyle CssClass="row0" />
                        <PagerStyle CssClass="pager" />
                        <Columns>
                            <asp:BoundField ItemStyle-Width="80px" HeaderText="License Condition" DataField="LicenseCondition"
                                SortExpression="LicenseCondition" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField ItemStyle-Width="200px" HeaderText="Condition title / table number"
                                DataField="ConditionTitle" SortExpression="ConditionTitle" HeaderStyle-HorizontalAlign="Left"
                                ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField ItemStyle-Width="200px" HeaderText="NetDAR status" DataField="Stage1Status"
                                SortExpression="Stage1Status" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField ItemStyle-Width="200px" HeaderText="Submission status" DataField="Stage2Status"
                                SortExpression="Stage2Status" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:BoundField ItemStyle-Width="80px" HeaderText="DAG Year" DataField="DAGYear"
                                SortExpression="DAGYear" HeaderStyle-HorizontalAlign="Left" ItemStyle-HorizontalAlign="Left" />
                            <asp:TemplateField ItemStyle-Width="50px" HeaderText="Edit" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <cc:exImageButton ID="btnEdit" runat="server" OnClick="btnEditDataSources" CausesValidation="false"
                                        intValue2='<%# Eval("RegulationID") %>' intValue1='<%# Eval("DataSourceID") %>'
                                        ImageUrl='~/img/PwCIcons/20x20/edit_icon20.png' CssClass="icon20x20 PwCOrange" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-Width="50px" Visible="false" HeaderText="Delete" HeaderStyle-HorizontalAlign="Center"
                                ItemStyle-HorizontalAlign="Center">
                                <ItemTemplate>
                                    <cc:exImageButton ID="btnDelete" runat="server" OnClientClick="return confirm('Are you sure you want delete?');"
                                        OnClick="btnDeleteDataSource" CausesValidation="false" intValue1='<%# Eval("DataSourceID") %>'
                                        ImageUrl='~/img/PwCIcons/20x20/delete_icon20.png' CssClass="icon20x20 PwCRed" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="sdsDataSources" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
                        SelectCommand="uspDataSourceGetList" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:Parameter Name="lCondition" DbType="String" DefaultValue="All" ConvertEmptyStringToNull="false" />
                            <asp:Parameter Name="DAGYear" DbType="String" DefaultValue="All" ConvertEmptyStringToNull="false" />
                            <asp:ControlParameter Name="searchText" DbType="String" ControlID="txtSearch" PropertyName="Text"
                                ConvertEmptyStringToNull="false" DefaultValue="" />
                            <asp:SessionParameter Name="Username" DbType="String" ConvertEmptyStringToNull="false"
                                SessionField="Username" />
                            <asp:SessionParameter Name="Role" DbType="String" ConvertEmptyStringToNull="false"
                                SessionField="UserRole" />
                            <asp:Parameter Name="RegulationID" DbType="Int32" ConvertEmptyStringToNull="false" />
                            <asp:Parameter Name="ParentDSID" DbType="Int32" ConvertEmptyStringToNull="false" />
                            <asp:Parameter Name="Owner" DbType="String" ConvertEmptyStringToNull="false" DefaultValue="-1" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <div style="width: 100%; font-family: Arial; position: fixed; bottom: 0; left: 0; background: white; z-index: 999999; border-top: 4px solid #e0301e; padding: 5px 5px 5px 5px;">
        
        <div style="float: left;">
            <div runat="server" id="divPopup" style="display: none">
                <div class="modal-fill" style="background-color: #939598;">
                </div>
                <div class="modal" style="width: 500px; position: fixed; background-color: white;">
                    <div class="modal-title">
                        Update status
                    </div>
                    <div class="modal-content">
                        <div class="form-panel">
                            <asp:ValidationSummary ID="vsSummary" runat="server" class="validationsummary" ValidationGroup="SC"
                                HeaderText="<h3>Please provide the following:</h3>" CssClass="errorSummary" Visible="true" />
                            <div id="disclaimerTextDiv" runat="server" style="padding-bottom: 5px;" class="form-panel-row">
                                <asp:Label ID="disclaimerText" Visible="true" Text="Head of Internal Audit Sign Off" runat="server"></asp:Label>
                            </div>
                            <div style="clear: both;">
                            </div>
                            <div class="form-panel-row">
                                <div class="grid_2">
                                    <div style="float: left;">
                                        Add Comments?
                                    </div>
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


                        <asp:Button runat="server" ID="btnSavePopup" ValidationGroup="SC" Style="" CssClass="SC Future" Text="Submit" OnClick="StatusSave" />

                        <input type="button" value="Close" style="" class="SC icon-button cancel" onclick="$(this).parent().parent().parent().hide();" />





                    </div>
                </div>
            </div>
            <asp:Button ID="btnCancel" runat="server" Text="Back" CssClass="iconButton Exit"
                Width="65" OnClick="btnCancel_OnClick" CausesValidation="false" OnClientClick="return confirm('You are about to leave the page, any unsaved changes will be lost. Do you wish to continue?');" />
            <asp:Button ID="btnSave" runat="server" Text="Save Regulatory Return Details" CssClass="iconButton Save"
                Width="218" OnClick="btnSave_OnClick" CausesValidation="true" ValidationGroup="RegulationValidation" />
            <div style="display: none">


                <asp:Button ID="btnDAGSignOffStage1" Style="background-color: #ffAD10;" Visible="false"
                    runat="server" Text="Sign-off NetDAR (as DAG steering group)" CssClass="iconButton Save"
                    Width="300" OnClick="StatusClick" CausesValidation="false" CommandArgument="DAGSignOffStage1" />
                <asp:Button ID="btnDAGSignOffStage2" Style="background-color: #ffAD10;" Visible="false"
                    runat="server" Text="Sign-off Submissions (as DAG steering group)" CssClass="iconButton Save"
                    Width="320" OnClick="StatusClick" CausesValidation="false" CommandArgument="DAGSignOffStage2" />
                <asp:Button ID="btnSignOffStage1" Style="background-color: #ffAD10;" Visible="false"
                    runat="server" Text="Sign-off NetDAR (as Group exec)" CssClass="iconButton Save"
                    Width="270" OnClick="StatusClick" CausesValidation="false" CommandArgument="SignOffStage1" />
                <asp:Button ID="btnSignOffStage2" Style="background-color: #ffAD10;" Visible="false"
                    runat="server" Text="Sign-off Submissions (as Group exec)" CssClass="iconButton Save"
                    Width="290" OnClick="StatusClick" CausesValidation="false" CommandArgument="SignOffStage2" />
            </div>
            <asp:Button ID="btnIASignOffStage1" Style="background-color: #ffAD10;" Visible="false"
                runat="server" Text="Sign-off NetDAR (as Head of Internal Audit)" CssClass="iconButton Save"
                Width="340" OnClick="StatusClick" CausesValidation="false" CommandArgument="IASignOffStage1" />

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
            <div  Visible="false" runat="server" id="panIASendBackStage1" style="position: relative; float: right;">
               

                <asp:Button runat="server" ID="btnStatusSB" Visible="true" Style="" Text='Send back NetDAR (as Head of internal audit)' CssClass="SC Future IsRej_Y2"
                    OnClientClick="showHideSendBacks(this);return false;" />
                <div class="RejPop" style="position: absolute; left: 0px; bottom: 24px; display: none; padding: 7px; background-color: white; border: solid 1px #f00">
                    <asp:Button OnClick="StatusClick" CausesValidation="false" runat="server" ID="btnSendBack_Stage1_RiskAssessment" CssClass="SC Future IsRej_Y2" ValidationGroup="SC" Text="Send Back (Risk Assessment)" CommandArgument="Stage1Rej_RiskAssessment" />
                    <asp:Button OnClick="StatusClick" CausesValidation="false" runat="server" ID="btnSendBack_Stage1_MethodologyStatement" CssClass="SC Future IsRej_Y2" ValidationGroup="SC" Text="Send Back (Methodology Statement)" CommandArgument="Stage1Rej_MethodologyStatement" />
                    <asp:Button OnClick="StatusClick" CausesValidation="false" runat="server" ID="btnSendBack_Stage1_IAReview" CssClass="SC Future IsRej_Y2" ValidationGroup="SC" Text="Send Back (IA Review)" CommandArgument="Stage1Rej_IAReview" />
                    <asp:Button OnClick="StatusClick" CausesValidation="false" runat="server" ID="btnSendBack_Stage1_AssuranceActivities" CssClass="SC Future IsRej_Y2" ValidationGroup="SC" Text="Send Back (Assurance Activities)" CommandArgument="Stage1Rej_AssuranceActivities" />
                    <asp:Button OnClick="StatusClick" CausesValidation="false" runat="server" ID="btnSendBack_Stage1_DAGOfficer" CssClass="SC Future IsRej_Y2" ValidationGroup="SC" Text="Send Back (DAG Officer)" CommandArgument="Stage1Rej_DAGOfficer" />
                    <asp:Button OnClick="StatusClick" CausesValidation="false" runat="server" ID="btnSendBack_Stage1_ExecOwner" CssClass="SC Future IsRej_Y2" ValidationGroup="SC" Text="Send Back (Exec Owner)" CommandArgument="Stage1Rej_ExecOwner" />


                </div>
            </div>


           



            <asp:Button ID="btnIASignOffStage2" Style="background-color: #ffAD10;" Visible="false"
                runat="server" Text="Sign-off Submissions (as Head of Internal Audit)" CssClass="iconButton Save"
                Width="340" OnClick="StatusClick" CausesValidation="false" CommandArgument="IASignOffStage2" />


             <div  Visible="false" runat="server" id="panIASendBackStage2" style="position: relative; float: right;">


                <asp:Button runat="server" ID="Button1" Visible="true" Style="" Text='Send back Submissions (as Head of internal audit)' CssClass="SC Future IsRej_Y2"
                    OnClientClick="showHideSendBacks(this);return false;" />
                <div class="RejPop" style="position: absolute; left: 0px; bottom: 24px; display: none; padding: 7px; background-color: white; border: solid 1px #f00">
                    <asp:Button OnClick="StatusClick" CausesValidation="false" runat="server" ID="btnSendBack_Stage2_DataPreparer" CssClass="SC Future IsRej_Y2" ValidationGroup="SC" Text="Send Back (Data Preparer)" CommandArgument="Stage2Rej_DataPreparer" />
                    <asp:Button OnClick="StatusClick" CausesValidation="false" runat="server" ID="btnSendBack_Stage2_SecondReviewer" CssClass="SC Future IsRej_Y2" ValidationGroup="SC" Text="Send Back (Second Reviewer)" CommandArgument="Stage2Rej_SecondReviewer" />
                    <asp:Button OnClick="StatusClick" CausesValidation="false" runat="server" ID="btnSendBack_Stage2_InternalExpert" CssClass="SC Future IsRej_Y2" ValidationGroup="SC" Text="Send Back (Internal Expert)" CommandArgument="Stage2Rej_InternalExpert" />
                    <asp:Button OnClick="StatusClick" CausesValidation="false" runat="server" ID="btnSendBack_Stage2_BusinessLead" CssClass="SC Future IsRej_Y2" ValidationGroup="SC" Text="Send Back (Business Lead)" CommandArgument="Stage2Rej_BusinessLead" />
                    <asp:Button OnClick="StatusClick" CausesValidation="false" runat="server" ID="btnSendBack_Stage2_DAGOfficer" CssClass="SC Future IsRej_Y2" ValidationGroup="SC" Text="Send Back (DAG Officer)" CommandArgument="Stage2Rej_DAGOfficer" />
                    <asp:Button OnClick="StatusClick" CausesValidation="false" runat="server" ID="btnSendBack_Stage2_ExecOwner" CssClass="SC Future IsRej_Y2" ValidationGroup="SC" Text="Send Back (Exec Owner)" CommandArgument="Stage2Rej_ExecOwner" />
                    <asp:Button OnClick="StatusClick" CausesValidation="false" runat="server" ID="btnSendBack_Stage2_InternalAudit" CssClass="SC Future IsRej_Y2" ValidationGroup="SC" Text="Send Back (Internal Audit)" CommandArgument="Stage2Rej_InternalAudit" />





                </div>
            </div>

        </div>
        <div style="float: right">
            <div class="SC Current">
                <asp:Label runat="server" ID="lblRegStatus"></asp:Label>
            </div>
        </div>
    </div>
    <%--</ContentTemplate>
    </asp:UpdatePanel>--%>
</asp:Content>
