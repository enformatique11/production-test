<%@ Page Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true"
    CodeBehind="DefinitionDetails.aspx.cs" Inherits="PwC.Pages.DefinitionDetails"
    Title="Definition Details" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Src="~/Common/Controls/ucAttachmentViewer.ascx" TagName="AttachmentViewer"
    TagPrefix="uc1" %>
<%@ Register Src="~/Common/Controls/OwnerAssigner.ascx" TagName="OwnerAssigner" TagPrefix="uc1" %>
<%@ Register Src="~/Common/Controls/DataQualityCriteriaViewer.ascx" TagName="DataQualityCriteriaViewer"
    TagPrefix="uc1" %>
<%@ Register Src="~/Common/Controls/DataQualityCriteriaInheritedViewer.ascx" TagName="DataQualityCriteriaInheritedViewer"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">

        var showHide = 'show';
        var disabled = true;

        function ToggleHideShowFormSection(divID) {
            $('#ctl00_MainContent_' + divID).toggle('fast');
        }

        function ToggleHideShowFormSectionsAll() {
            if (!disabled) return;

            disabled = false;

            if (showHide == 'hide') {
                $('#ctl00_MainContent_divMetricInformation').show('fast');
                $('#ctl00_MainContent_divEquityStory').show('fast');
                $('#ctl00_MainContent_divReportingRequirements').show('fast');

                if ($('#ctl00_MainContent_divOtherInformation') != null) {
                    $('#ctl00_MainContent_divOtherInformation').show('fast');
                }

                showHide = 'show';
            }
            else {
                $('#ctl00_MainContent_divMetricInformation').hide('fast');
                $('#ctl00_MainContent_divEquityStory').hide('fast');
                $('#ctl00_MainContent_divReportingRequirements').hide('fast');

                if ($('#ctl00_MainContent_divOtherInformation') != null) {
                    $('#ctl00_MainContent_divOtherInformation').hide('fast');
                }

                showHide = 'hide';
            }

            disabled = true;
        }
    
    </script>
    <style type="text/css">
        table.table2
        {
            border-left: solid 1px #dddddd;
            border-top: solid 1px #dddddd;
        }
        
        table.table2 tr th, table.table2 tr td
        {
            border-right: solid 1px #dddddd;
            border-bottom: solid 1px #dddddd;
        }
        
        table.table2 tr td
        {
            height: 40px;
        }
        
        .col1{ padding-top:15px; font-weight:bold;}
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:UpdatePanel ID="updPanel" runat="server">
        <ContentTemplate>
            <h1 id="heading1" runat="server">
            </h1>
            <asp:ValidationSummary ID="vsDefinition" runat="server" class="validationsummary"
                HeaderText="<h3>Please provide the following:</h3>" ValidationGroup="DefinitionValidation"
                CssClass="errorSummary" Visible="true" />
            <div class="formPanel">
                <div id="divContents" runat="server">
                    <div class="formPanelFooter" id="rowFooter" runat="server" style="margin: 10px 0px 15px 0px;">
                        <div class="pItemCtl_auto">
                            <asp:Label ID="lblUpdatedBy" runat="server" /></div>
                        <div class="pItemCtl_auto">
                            <asp:Label ID="lblLastUpdated" runat="server" /></div>
                    </div>
                    <div class="formPanelRow">
                        <div style="float: left; width: 200px;">
                            <h2>
                                Main Details</h2>
                        </div>
                        <div style="float: right; padding-right: 20px;">
                            <a style="text-decoration: none; font-size: 8pt;" href="javascript:ToggleHideShowFormSectionsAll();">
                                Show / Hide All Sections</a>
                        </div>
                    </div>
                    <div class="formPanelRow">
                        <div class="pItemLbl_large">
                            Format</div>
                        <div class="pItemCtl_auto">
                            <asp:DropDownList ID="drpFormat" runat="server" Width="200" AutoPostBack="true" OnSelectedIndexChanged="drpFormat_OnSelectedIndexChanged" />
                            <asp:RequiredFieldValidator ID="rfvdrpFormat" runat="server" ValidationGroup="DefinitionValidation"
                                ControlToValidate="drpType" ErrorMessage="Please select a format" SetFocusOnError="true"
                                InitialValue="--- Please Select ---">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="formPanelRow">
                        <div class="pItemLbl_large">
                            Type</div>
                        <div class="pItemCtl_auto">
                            <asp:DropDownList ID="drpType" runat="server" Width="200" />
                            <asp:RequiredFieldValidator ID="rfvdrpType" runat="server" ValidationGroup="DefinitionValidation"
                                ControlToValidate="drpType" ErrorMessage="Please select a type" SetFocusOnError="true"
                                InitialValue="--- Please Select ---">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="formPanelRow">
                        <div class="pItemLbl_large">
                            Title</div>
                        <div class="pItemCtl_auto">
                            <asp:TextBox ID="txtTitle" runat="server" Width="530" MaxLength="255" />
                            <asp:RequiredFieldValidator ID="rfvtxtTitle" runat="server" ValidationGroup="DefinitionValidation"
                                ControlToValidate="txtTitle" ErrorMessage="Please enter a title" SetFocusOnError="true">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="formPanelRow">
                        <div class="pItemLbl_large">
                            Unique Ref</div>
                        <div class="pItemCtl_auto">
                            <asp:TextBox ID="txtUniqueRef" runat="server" Width="530" MaxLength="255" />
                            <asp:RequiredFieldValidator ID="rfvtxtUniqueRef" runat="server" ValidationGroup="DefinitionValidation"
                                ControlToValidate="txtUniqueRef" ErrorMessage="Please enter a unique reference"
                                SetFocusOnError="true">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="formPanelRow" style="height: 35px;">
                        <div class="pItemLbl_large">
                            Priority Quadrant</div>
                        <div class="pItemCtl_auto">
                            <asp:TextBox ID="txtDefinitionRating" runat="server" Width="530" MaxLength="255" />
                            <asp:RequiredFieldValidator ID="rfvtxtDefinitionRating" runat="server" ValidationGroup="DefinitionValidation"
                                ControlToValidate="txtDefinitionRating" ErrorMessage="Please enter a quadrant"
                                SetFocusOnError="true">*</asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="formPanelRow" style="height: 35px">
                        <div class="pItemLbl_large">
                            Business Glossary Ref</div>
                        <div class="pItemCtl_auto">
                            <asp:TextBox ID="txtBusinessGlossaryRef" runat="server" Width="530" MaxLength="255" />
                        </div>
                    </div>
                    <div class="formPanelRow">
                        <div style="float: left; padding-top: 5px; width: 200px;">
                            <h3>
                                Status</h3>
                        </div>
                        <div style="float: right; padding-right: 20px;">
                            <a style="text-decoration: none; font-size: 8pt;" href="javascript:ToggleHideShowFormSection('divDefinitionStatus');">
                                Show / Hide Status</a>
                        </div>
                    </div>
                    <div id="divDefinitionStatus" runat="server" style="display: none;">
                        <div class="formPanelRow" style="padding-top: 10px; height: 30px">
                            <i>For each checkbox below, tick if yes.</i>
                        </div>
                        <div class="formPanelRow" style="height: 55px">
                            <div class="pItemLbl_large">
                                In Progress</div>
                            <div class="pItemCtl_auto" style="width: 45px;">
                                <asp:CheckBox ID="chkMetricAccepted" runat="server" TextAlign="Right" />
                            </div>
                            <div class="pItemLbl_large">
                                Identified to Repository and Data Availability Confirmed</div>
                            <div class="pItemCtl_auto" style="width: 45px;">
                                <asp:CheckBox ID="chkIdentifiedToRepository" runat="server" TextAlign="Right" />
                            </div>
                            <div class="pItemLbl_large">
                                Deficiency Identified</div>
                            <div class="pItemCtl_auto" style="width: 45px;">
                                <asp:CheckBox ID="chkMetricUnClear" runat="server" TextAlign="Right" />
                            </div>
                            <div class="pItemLbl_large">
                                Lineage of Metric Traced to Appropriate Sources</div>
                            <div class="pItemCtl_auto" style="width: 45px;">
                                <asp:CheckBox ID="chkLineageTraced" runat="server" TextAlign="Right" />
                            </div>
                        </div>
                        <div class="formPanelRow" style="height: 55px">
                            <div class="pItemLbl_large">
                                Consolidated / Withdrawn</div>
                            <div class="pItemCtl_auto" style="width: 45px;">
                                <asp:CheckBox ID="chkConsolidated" runat="server" TextAlign="Right" />
                            </div>
                            <div class="pItemLbl_large">
                                Referred to Design Authority</div>
                            <div class="pItemCtl_auto" style="width: 45px;">
                                <asp:CheckBox ID="chkReferDesignAuthority" runat="server" TextAlign="Right" />
                            </div>
                            <div class="pItemLbl_large">
                                Quality Requirements Defined</div>
                            <div class="pItemCtl_auto" style="width: 45px;">
                                <asp:CheckBox ID="chkQualityRequirementsDefined" runat="server" TextAlign="Right" />
                            </div>
                            <div class="pItemLbl_large">
                                In Process Guide
                            </div>
                            <div class="pItemCtl_auto" style="width: 45px;">
                                <asp:CheckBox ID="chkDefinitionAccepted" runat="server" TextAlign="Right" />
                            </div>
                        </div>
                        <div class="formPanelRow" style="height: 40px">
                            <div class="pItemLbl_large">
                                Definition Completed
                            </div>
                            <div class="pItemCtl_auto" style="width: 45px;">
                                <asp:CheckBox ID="chkDefinitionCompleted" runat="server" TextAlign="Right" />
                            </div>
                            <div class="pItemLbl_large">
                                Controls Identified</div>
                            <div class="pItemCtl_auto" style="width: 45px;">
                                <asp:CheckBox ID="chkControlsIdentifier" runat="server" TextAlign="Right" />
                            </div>
                        </div>
                        <div runat="server" visible="false">
                            <div class="pItemLbl_large">
                                Removed By Business</div>
                            <div class="pItemCtl_auto" style="width: 45px;">
                                <asp:CheckBox ID="chkRemovedByBusiness" runat="server" TextAlign="Right" />
                            </div>
                            <div class="pItemLbl_large">
                                Metric No Longer Required</div>
                            <div class="pItemCtl_auto" style="width: 45px;">
                                <asp:CheckBox ID="chkMetricNoLongerRequired" runat="server" TextAlign="Right" />
                            </div>
                            <div class="pItemLbl_large">
                                No Clear Source Available</div>
                            <div class="pItemCtl_auto" style="width: 45px;">
                                <asp:CheckBox ID="chkNoClearSource" runat="server" TextAlign="Right" />
                            </div>
                            <div class="pItemLbl_large">
                                Data Owner Not Available</div>
                            <div class="pItemCtl_auto" style="width: 45px;">
                                <asp:CheckBox ID="chkDataOwnerNotAvailable" runat="server" TextAlign="Right" />
                            </div>
                        </div>
                    </div>
                    <ajaxToolKit:MutuallyExclusiveCheckBoxExtender ID="me1" runat="server" TargetControlID="chkMetricAccepted"
                        Key="CheckboxesMutuallyExclusive">
                    </ajaxToolKit:MutuallyExclusiveCheckBoxExtender>
                    <ajaxToolKit:MutuallyExclusiveCheckBoxExtender ID="me2" runat="server" TargetControlID="chkReferDesignAuthority"
                        Key="CheckboxesMutuallyExclusive">
                    </ajaxToolKit:MutuallyExclusiveCheckBoxExtender>
                    <ajaxToolKit:MutuallyExclusiveCheckBoxExtender ID="me3" runat="server" TargetControlID="chkConsolidated"
                        Key="CheckboxesMutuallyExclusive">
                    </ajaxToolKit:MutuallyExclusiveCheckBoxExtender>
                    <div style="display: none">
                        <div>
                            <div style="margin: 10px 10px 0px 0px; width: 860px; border-top: 1px solid #6d6e71;">
                            </div>
                        </div>
                        <div class="formPanelRow">
                            <div style="float: left; width: 300px;">
                                <h2>
                                    Equity Story / Usage</h2>
                            </div>
                            <div style="float: right; padding-right: 20px;">
                                <a style="text-decoration: none; font-size: 8pt;" href="javascript:ToggleHideShowFormSection('divEquityStory');">
                                    Show / Hide Equity Story</a>
                            </div>
                        </div>
                        <div id="divEquityStory" runat="server">
                            <div class="formPanelRow">
                                <div class="pItemLbl_large">
                                    Area of reporting</div>
                                <div class="pItemCtl_auto">
                                    <asp:DropDownList ID="drpSubTitle" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvdrpSubTitle" runat="server" ValidationGroup="DefinitionValidationxx"
                                        ControlToValidate="drpSubTitle" ErrorMessage="Please select the area of reporting"
                                        SetFocusOnError="true" InitialValue="--- Please Select ---">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="formPanelRow">
                                <div class="pItemLbl_large">
                                    Area of Business</div>
                                <div class="pItemCtl_auto">
                                    <asp:DropDownList ID="drpAreaOfBusiness" runat="server">
                                    </asp:DropDownList>
                                    <asp:RequiredFieldValidator ID="rfvdrpAreaOfBusiness" runat="server" ValidationGroup="DefinitionValidationxx"
                                        ControlToValidate="drpAreaOfBusiness" ErrorMessage="Please select the area of the business"
                                        SetFocusOnError="true" InitialValue="--- Please Select ---">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="formPanelRow" style="height: 35px">
                                <div class="pItemLbl_large">
                                    Likely Usage in IPO Documentation</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtLikelyIPOUsage" runat="server" Width="530" MaxLength="255" />
                                    <asp:RequiredFieldValidator ID="rfvtxtLikelyIPOUsage" runat="server" ValidationGroup="DefinitionValidationxx"
                                        ControlToValidate="txtLikelyIPOUsage" ErrorMessage="Please enter the likely usage in IPO documentation"
                                        SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="formPanelRow">
                                <div class="pItemLbl_large">
                                    Original Source</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtOriginalSource" runat="server" Width="530" MaxLength="255" />
                                    <asp:RequiredFieldValidator ID="rfvtxtOriginalSource" runat="server" ValidationGroup="DefinitionValidationxx"
                                        ControlToValidate="txtOriginalSource" ErrorMessage="Please enter the original source"
                                        SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="formPanelRow_x3">
                                <div class="pItemLbl_large">
                                    Which Message(s) is this supporting?</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtSupportingMessage" runat="server" Width="530" TextMode="MultiLine"
                                        Height="70px" />
                                    <asp:RequiredFieldValidator ID="rfvtxtSupportingMessage" runat="server" ValidationGroup="DefinitionValidationxx"
                                        ControlToValidate="txtSupportingMessage" ErrorMessage="Please enter a the supporting message(s)"
                                        SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                    <asp:RegularExpressionValidator ID="regtxtSupportingMessage" runat="server" ValidationGroup="DefinitionValidationxx"
                                        ControlToValidate="txtSupportingMessage" ValidationExpression="^[\s\S]{0,4000}$"
                                        ErrorMessage="The supporting messages text must contained less than 4000 characters"
                                        SetFocusOnError="true">*</asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="formPanelRow">
                                <div class="pItemLbl_large">
                                    Level of Disclosure</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtLevelOfDisclosure" runat="server" Width="530" MaxLength="255" />
                                    <asp:RequiredFieldValidator ID="rfvtxtLevelOfDisclosure" runat="server" ValidationGroup="DefinitionValidationxx"
                                        ControlToValidate="txtLevelOfDisclosure" ErrorMessage="Please enter the level of disclosure"
                                        SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="formPanelRow">
                                <div class="pItemLbl_large">
                                    Risk of Use</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtRiskOfUse" runat="server" Width="530" MaxLength="255" />
                                    <asp:RequiredFieldValidator ID="rfvtxtRiskOfUse" runat="server" ValidationGroup="DefinitionValidationxx"
                                        ControlToValidate="txtRiskOfUse" ErrorMessage="Please enter the risk of use"
                                        SetFocusOnError="true">*</asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="formPanelRow_x3">
                                <div class="pItemLbl_large">
                                    Risk of Use Comments</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtRiskOfUseComments" runat="server" Width="530" TextMode="MultiLine"
                                        Height="70px" />
                                    <asp:RegularExpressionValidator ID="regtxtRiskOfUseComments" runat="server" ValidationGroup="DefinitionValidationxx"
                                        ControlToValidate="txtRiskOfUseComments" ValidationExpression="^[\s\S]{0,4000}$"
                                        ErrorMessage="The risk of use comments must contained less than 4000 characters"
                                        SetFocusOnError="true">*</asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="formPanelRow_x3">
                                <div class="pItemLbl_large">
                                    Additional Comments</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtAdditionalComments" runat="server" Width="530" TextMode="MultiLine"
                                        Height="70px" />
                                    <asp:RegularExpressionValidator ID="regtxtAdditionalComments" runat="server" ValidationGroup="DefinitionValidationxx"
                                        ControlToValidate="txtAdditionalComments" ValidationExpression="^[\s\S]{0,4000}$"
                                        ErrorMessage="The additional comments must contained less than 4000 characters"
                                        SetFocusOnError="true">*</asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div>
                        <div style="margin: 10px 10px 0px 0px; width: 860px; border-top: 1px solid #6d6e71;">
                        </div>
                        <div class="formPanelRow">
                            <div style="float: left; width: 200px;">
                                <h2>
                                    Metric Information</h2>
                            </div>
                            <div style="float: right; padding-right: 20px;">
                                <a style="text-decoration: none; font-size: 8pt;" href="javascript:ToggleHideShowFormSection('divMetricInformation');">
                                    Show / Hide Metric Information</a>
                            </div>
                        </div>
                        <div id="divMetricInformation" runat="server">
                            <div class="formPanelRow_x3">
                                <div class="pItemLbl_large">
                                    Metric Definition</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtDescription" runat="server" Width="530" TextMode="MultiLine"
                                        Height="70px" />
                                    <%--<asp:RequiredFieldValidator ID="rfvDescription" runat="server" ValidationGroup="DefinitionValidation" ControlToValidate="txtDescription" ErrorMessage="Please enter a metric definition" SetFocusOnError="true">*</asp:RequiredFieldValidator>--%>
                                    <asp:RegularExpressionValidator ID="regDescription" runat="server" ValidationGroup="DefinitionValidation"
                                        ControlToValidate="txtDescription" ValidationExpression="^[\s\S]{0,4000}$" ErrorMessage="The metric definition must contained less than 4000 characters"
                                        SetFocusOnError="true">*</asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="formPanelRow">
                                <div class="pItemLbl_large">
                                    Metric Allocation</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtMetricAllocation" runat="server" Width="530" MaxLength="255" />
                                </div>
                            </div>
                            <div class="formPanelRow" style="height: 55px">
                                <div class="pItemLbl_large">
                                    Metric Owner (Assumed / Work in Progress)</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtMetricOwner" runat="server" Width="530" MaxLength="255" />
                                </div>
                            </div>
                            <div class="formPanelRow" style="height: 55px">
                                <div class="pItemLbl_large">
                                    Data Steward (Assumed / Work in Progress)</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtDataSteward" runat="server" Width="530" MaxLength="255" />
                                </div>
                            </div>
                            <div class="formPanelRow" style="height: 55px">
                                <div class="pItemLbl_large">
                                    Data Manager (Assumed / Work in Progress)</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtInformedShareholder" runat="server" Width="530" MaxLength="255" />
                                </div>
                            </div>
                            <div class="formPanelRow" runat="server" visible="false">
                                <div class="pItemLbl_large">
                                    Data Dimension</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtDataDimension" runat="server" Width="530" MaxLength="255" />
                                </div>
                            </div>
                            <div class="formPanelRow_x3" runat="server" visible="false">
                                <div class="pItemLbl_large">
                                    Sub-metrics</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtSubMetrics" runat="server" Width="530" TextMode="MultiLine" Height="70px" />
                                    <asp:RegularExpressionValidator ID="regtxtSubMetrics" runat="server" ValidationGroup="DefinitionValidation"
                                        ControlToValidate="txtSubMetrics" ValidationExpression="^[\s\S]{0,4000}$" ErrorMessage="The sub-metric details must contained less than 4000 characters"
                                        SetFocusOnError="true">*</asp:RegularExpressionValidator>
                                </div>
                            </div>
                            <div class="formPanelRow_x3">
                                <div class="pItemLbl_large">
                                    Details of Alternative Definitions</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtAlternativeDefinition" runat="server" Width="530" TextMode="MultiLine"
                                        Height="70px" />
                                    <asp:RegularExpressionValidator ID="regAlternativeDefinition" runat="server" ValidationGroup="DefinitionValidation"
                                        ControlToValidate="txtAlternativeDefinition" ValidationExpression="^[\s\S]{0,4000}$"
                                        ErrorMessage="The alternative definition details must contained less than 4000 characters"
                                        SetFocusOnError="true">*</asp:RegularExpressionValidator>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div id="div1" runat="server">
                        <div>
                            <div style="margin: 10px 10px 0px 0px; width: 860px; border-top: 1px solid #6d6e71;">
                            </div>
                        </div>
                        <div class="formPanelRow">
                            <div style="float: left; width: 400px;">
                                <h2>
                                    Risk Assessment</h2>
                            </div>
                            <div style="float: right; padding-right: 20px;">
                                <a style="text-decoration: none; font-size: 8pt;" href="javascript:ToggleHideShowFormSection('divRiskAssessment');">
                                    Show / Hide Risk Assessment</a>
                            </div>
                        </div>
                    </div>
                    <div id="div2" runat="server">
                        <div id="divRiskAssessment" class="formPanelRow_x3" style="height: 500px;" runat="server"
                            visible="true">
                            <div style="width: 420px; float: left; height: 250px;">
                                <div class="formPanelRow">
                                    <div class="pItemLbl_large">
                                        Regulatory year</div>
                                    <div class="pItemCtl">
                                        <asp:DropDownList runat="server" ID="ddlRA_RegYear">
                                            <asp:ListItem Text="-- Please Select --"></asp:ListItem>
                                            <asp:ListItem Text="2008"></asp:ListItem>
                                            <asp:ListItem Text="2009"></asp:ListItem>
                                            <asp:ListItem Text="2010"></asp:ListItem>
                                            <asp:ListItem Text="2011"></asp:ListItem>
                                            <asp:ListItem Text="2012"></asp:ListItem>
                                            <asp:ListItem Text="2013"></asp:ListItem>
                                            <asp:ListItem Text="2014"></asp:ListItem>
                                            <asp:ListItem Text="2015"></asp:ListItem>
                                            <asp:ListItem Text="2016"></asp:ListItem>
                                            <asp:ListItem Text="2017"></asp:ListItem>
                                            <asp:ListItem Text="2018"></asp:ListItem>
                                            <asp:ListItem Text="2019"></asp:ListItem>
                                            <asp:ListItem Text="2020"></asp:ListItem>
                                        </asp:DropDownList>
                                    </div>
                                </div>
                                <div class="formPanelRow_x2">
                                    <div class="pItemLbl_large">
                                        Licence condition</div>
                                    <div class="pItemCtl">
                                        <asp:TextBox runat="server" ID="txtRA_LicenceCondition" TextMode="MultiLine" Height="40px"
                                            Width="260px"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="formPanelRow_x2">
                                    <div class="pItemLbl_large">
                                        Summary</div>
                                    <div class="pItemCtl">
                                        <asp:TextBox runat="server" ID="txtRA_Summary" TextMode="MultiLine" Height="40px"
                                            Width="260px"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="formPanelRow">
                                    <div class="pItemLbl_large">
                                        Submission date</div>
                                    <div class="pItemCtl" style="width: 200px;">
                                        <asp:TextBox ID="txtRA_SubmissionDate" Width="100" runat="server"></asp:TextBox>
                                        <ajaxToolKit:CalendarExtender ID="txtRA_SubmissionDate_CalendarExtender" runat="server"
                                            PopupPosition="TopLeft" Enabled="True" PopupButtonID="btnRA_SubmissionDate" TargetControlID="txtRA_SubmissionDate"
                                            Format="dd/MM/yyyy" />
                                        <asp:ImageButton ID="btnRA_SubmissionDate" CausesValidation="false" ImageUrl="~/img/PwcIcons/20x20/calendar_icon20.png"
                                            CssClass="iconCalendar PwCOrange" Width="20px" Height="20px" runat="server" />
                                    </div>
                                </div>
                                <div class="formPanelRow">
                                    <div class="pItemLbl_large">
                                        Return date</div>
                                    <div class="pItemCtl" style="width: 200px;">
                                        <asp:TextBox ID="txtRA_ReturnDate" Width="100" runat="server"></asp:TextBox>
                                        <ajaxToolKit:CalendarExtender ID="txtRA_ReturnDate_CalendarExtender" runat="server"
                                            PopupPosition="TopLeft" Enabled="True" PopupButtonID="btnRA_ReturnDate" TargetControlID="txtRA_ReturnDate"
                                            Format="dd/MM/yyyy" />
                                        <asp:ImageButton ID="btnRA_ReturnDate" CausesValidation="false" ImageUrl="~/img/PwcIcons/20x20/calendar_icon20.png"
                                            CssClass="iconCalendar PwCOrange" Width="20px" Height="20px" runat="server" />
                                    </div>
                                </div>
                                <div class="formPanelRow">
                                    <div class="pItemLbl_large">
                                        Data period</div>
                                    <div class="pItemCtl">
                                        <asp:TextBox runat="server" ID="txtRA_DataPeriod" Width="260px"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div style="width: 420px; float: left; height: 250px;">
                                <div style="clear: both; padding-bottom: 5px;">
                                    DAG risk assessment</div>
                                <table class="table2">
                                    <thead>
                                        <tr>
                                            <th style="width: 180px;">
                                                &nbsp;
                                            </th>
                                            <th style="width: 60px; text-align: center">
                                                Calculated score
                                            </th>
                                            <th style="width: 60px; text-align: center">
                                                Override score
                                            </th>
                                            <th style="width: 40px; text-align: center">
                                                Edit
                                            </th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>
                                                Impact Score (1,2,3,4)
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td style="text-align: center">
                                                <asp:Button runat="server" ID="btnEditRA_Impact" OnClick="btnEditRA_Impact_Click"
                                                    CssClass="icon20x20 List" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Probability Score (1,2,3,4)
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td style="text-align: center">
                                                <asp:Button runat="server" ID="btnEditRA_Probability" OnClick="btnEditRA_Probability_Click"
                                                    CssClass="icon20x20 List" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                Overall Rating (Low, medium, high, critical)
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td>
                                                &nbsp;
                                            </td>
                                            <td style="text-align: center">
                                                &nbsp;
                                            </td>
                                        </tr>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div id="Div3" class="formPanelRow_x3" runat="server" visible="true">
                                <div class="pItemLbl_large">
                                    COMMENTS (Any manual override to the calculated assessment must be fully explained)</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtRA_OverrideComments" runat="server" Width="530" TextMode="MultiLine"
                                        Height="70px" />
                                </div>
                            </div>
                            <div style="font-weight: bold; padding-bottom: 10px;">
                                Sign off
                            </div>
                            <div class="formPanelRow">
                                <div class="pItemLbl_large">
                                    Prepared by</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="TextBox1" runat="server" Width="230" MaxLength="255" />
                                </div>
                            </div>
                            <div class="formPanelRow">
                                <div class="pItemLbl_large">
                                    Reviewed by</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="TextBox2" runat="server" Width="230" MaxLength="255" />
                                </div>
                            </div>
                            <div class="formPanelRow">
                                <div class="pItemLbl_large">
                                    Manual override agreed by</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="TextBox3" runat="server" Width="230" MaxLength="255" />
                                </div>
                            </div>
                            <div class="formPanelRow">
                                <div class="pItemLbl_large">
                                    Manual override reviewed by</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="TextBox4" runat="server" Width="230" MaxLength="255" />
                                </div>
                            </div>
                            <div class="formPanelRow">
                                <div class="pItemLbl_large">
                                    &nbsp;
                                </div>
                            </div>
                        </div>
                    </div>
                    <asp:Button ID="btnDummayRAI" CausesValidation="false" runat="server" Text="" Style="display: none;" />
                    <cc1:ModalPopupExtender ID="mpRA_Impact" runat="server" TargetControlID="btnDummayRAI"
                        PopupControlID="popRA_Impact" BackgroundCssClass="modalBackground" Drag="false">
                    </cc1:ModalPopupExtender>
                    <style type="text/css">
                        table.table3
                        {
                            padding: 0px;
                            margin: 0px;
                        }
                        table.table3 tr td
                        {
                            font-size: 11px;
                            vertical-align: top;
                            border-bottom: solid 1px #d2d2d2;
                            padding-top: 5px;
                            padding-bottom: 7px;
                            padding-left: 5px;
                        }
                        
                        table.table3 tr th
                        {
                            font-size: 11px;
                            border-bottom: solid 1px black;
                        }
                    </style>
                    <asp:Panel ID="popRA_Impact" runat="server" Width="900px" CssClass="modalPopup" Style="display: none;">
                        <h2>
                            Impact assessment</h2>
                        <table class="table3" cellpadding="0px" cellspacing="0px">
                            <tr>
                                <th style="width: 80px;">
                                    Impact score
                                </th>
                                <th style="width: 150px;">
                                    4
                                </th>
                                <th style="width: 250px;">
                                    3
                                </th>
                                <th style="width: 150px;">
                                    2
                                </th>
                                <th style="width: 150px;">
                                    1
                                </th>
                                <th>
                                    Rationale
                                </th>
                            </tr>
                            <tr>
                                <td>
                                    a. Customers
                                </td>
                                <td>
                                    Creates a breach in licence conditions that has a major impact on a large number
                                    of customers, other network operator, service providers or shippers;
                                    <br />
                                    or
                                    <br />
                                    Creates a significant number of legitimate customer complaints either directly or
                                    indirectly;
                                </td>
                                <td>
                                    Creates a breach in licence conditions that has a moderate impact on a large number
                                    of customers, other network operator, service providers or shippers;
                                    <br />
                                    or
                                    <br />
                                    Creates a breach that has a major impact on a small number of customers, other network
                                    operators, service providers or shippers;
                                    <br />
                                    or
                                    <br />
                                    Creates a moderate but high profile number of legitimate customer complaints or
                                    dissatisfaction, either directly or indirectly;
                                </td>
                                <td>
                                    Creates a breach in licence conditions that has a moderate service impact onany
                                    customers, other network operator, service providers or shippers (and does not score
                                    a 3 or 4);
                                    <br />
                                    or
                                    <br />
                                    Creates a moderate but low profile level of legitimate customer complaints, either
                                    directly or indirectly;
                                </td>
                                <td>
                                    Has no or negligible service impact on all customers, other network operators, service
                                    providers or shippers.
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Impact?
                                </td>
                                <td>
                                    <asp:DropDownList runat="server">
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList1" runat="server">
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList2" runat="server">
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList3" runat="server">
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    b. Competition
                                </td>
                                <td>
                                    High impact on the ability of third parties to compete in the market place.
                                </td>
                                <td>
                                    Moderate impact on the ability of third parties to compete in the market place.
                                </td>
                                <td>
                                    Low impact on the ability of third parties to compete in the market place.
                                </td>
                                <td>
                                    Has no or negligible impact on the ability of third parties to compete in the market
                                    place .
                                </td>
                                <td>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Impact?
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList4" runat="server">
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList5" runat="server">
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList6" runat="server">
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList7" runat="server">
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    c. Financial
                                </td>
                                <td>
                                    An error or omission could potentially give rise to a major financial impact ( >±5%
                                    of licensee's annual baseline totex).
                                </td>
                                <td>
                                    An error or omission could potentially give rise to a significant financial impact
                                    (> ±1% licensee's annual baseline totex but less than ±5%).
                                </td>
                                <td>
                                    An error or omission could potentially give rise to alow financial impact ( >±1%
                                    of licensee's annual baseline totex).
                                </td>
                                <td>
                                    No or negligible financial impact on the level of incentives receivable from the
                                    Regulator as a result of an error.
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Impact?
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList8" runat="server">
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList9" runat="server">
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList10" runat="server">
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList11" runat="server">
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    d. Comparative efficiency
                                </td>
                                <td>
                                    Comparative efficiency analysis impact from an error of >5% of licensee’s annual
                                    baseline totex allowance.
                                </td>
                                <td>
                                    Comparative efficiency analysis impact from an error of between 1 - 5% of licensee’s
                                    annual baseline totex allowance.
                                </td>
                                <td>
                                    Comparative efficiency analysis impact from an error of less than 1% of licensee’s
                                    annual baseline totex allowance.
                                </td>
                                <td>
                                    No or negligible comparative efficiency analysis impact from an error.
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    Impact?
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList12" runat="server">
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList13" runat="server">
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList14" runat="server">
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    <asp:DropDownList ID="DropDownList15" runat="server">
                                        <asp:ListItem Text=""></asp:ListItem>
                                        <asp:ListItem Text="Yes"></asp:ListItem>
                                        <asp:ListItem Text="No"></asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td>
                                    &nbsp;
                                </td>
                            </tr>
                        </table>
                        <asp:Button runat="server" ID="btnRA_Impact_Close" Text="Close" OnClick="btnRA_Impact_Close_Click" />
                        <asp:Button runat="server" ID="btnRA_Impact_Save" Text="Save" OnClick="btnRA_Impact_Save_Click"
                            Style="margin-left: 5px;" />
                    </asp:Panel>
                    <asp:Button ID="btnDummayRAP" CausesValidation="false" runat="server" Text="" Style="display: none;" />
                    <cc1:ModalPopupExtender ID="mpRA_Probability" runat="server" TargetControlID="btnDummayRAP"
                        PopupControlID="popRA_Probability" BackgroundCssClass="modalBackground" Drag="false">
                    </cc1:ModalPopupExtender>
                    <asp:Panel ID="popRA_Probability" runat="server" Width="710px" CssClass="modalPopup"
                        Style="display: none;">
                        POPUP TO BE COMPLETED
                        <br />
                        <asp:Button runat="server" ID="btnRA_Probability_Close" Text="Close" OnClick="btnRA_Probability_Close_Click" />
                        <asp:Button runat="server" ID="btnRA_Probability_Save" Text="Save" OnClick="btnRA_Probability_Save_Click"
                            Style="margin-left: 5px;" />
                    </asp:Panel>
                    <div runat="server" id="panReportingRequirements_USAGE">
                        <div class="formPanelRow" style="height: 50px;">
                            <div style="clear: both;">
                                <div style="margin: 10px 10px 0px 0px; width: 860px; border-top: 1px solid #6d6e71;">
                                </div>
                            </div>
                            <div style="float: left;">
                                <h2>
                                    Reporting Requirements</h2>
                            </div>
                            <div style="float: right; padding-right: 20px">
                                <a style="text-decoration: none; font-size: 8pt;" href="javascript:ToggleHideShowFormSection('divReportingRequirements');">
                                    Show / Hide Reporting Requirements</a>
                            </div>
                        </div>
                        <div id="divReportingRequirements" runat="server" style="clear: both; margin-top: 50px">
                            <div class="formPanelRow" style="height: 35px; clear: both; width: 900px;">
                                <div class="pItemLbl_large">
                                    Trend vs. Snapshot</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtTimeSeriesVsDiscrete" runat="server" Width="530" MaxLength="255" />
                                </div>
                            </div>
                            <div class="formPanelRow" style="height: 35px;">
                                <div class="pItemLbl_large">
                                    Years of Track Record</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtTrackRecordYears" runat="server" Width="530" MaxLength="255" />
                                </div>
                            </div>
                            <div class="formPanelRow" style="height: 50px;">
                                <div class="pItemLbl_large">
                                    Discontinuity in Timeseries / Change of basis</div>
                                <div class="pItemCtl_auto">
                                    <asp:TextBox ID="txtTimeSeriesDiscontinuity" runat="server" Width="530" MaxLength="255" />
                                </div>
                            </div>
                            <div id="divHideReportingFields" runat="server" visible="false">
                                <div class="formPanelRow_x3">
                                    <div class="pItemLbl_large">
                                        Historic / YTD / Planning</div>
                                    <div class="pItemCtl_auto">
                                        <asp:TextBox ID="txtHistoricYTD" runat="server" Width="530" TextMode="MultiLine"
                                            Height="70px" />
                                        <asp:RegularExpressionValidator ID="regtxtHistoricYTD" runat="server" ValidationGroup="DefinitionValidation"
                                            ControlToValidate="txtHistoricYTD" ValidationExpression="^[\s\S]{0,4000}$" ErrorMessage="The historic / YTD / Planning details must contained less than 4000 characters"
                                            SetFocusOnError="true">*</asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="formPanelRow">
                                    <div class="pItemLbl_large">
                                        Period</div>
                                    <div class="pItemCtl_auto">
                                        <asp:TextBox ID="txtPeriod" runat="server" Width="530" MaxLength="255" />
                                    </div>
                                </div>
                                <div class="formPanelRow">
                                    <div class="pItemLbl_large">
                                        Timeliness</div>
                                    <div class="pItemCtl_auto">
                                        <asp:TextBox ID="txtTimeliness" runat="server" Width="530" MaxLength="255" />
                                    </div>
                                </div>
                                <div class="formPanelRow_x3">
                                    <div class="pItemLbl_large">
                                        YTD vs. Full Year Rec Issues?</div>
                                    <div class="pItemCtl_auto">
                                        <asp:TextBox ID="txtYTDVsFull" runat="server" Width="530" TextMode="MultiLine" Height="70px" />
                                        <asp:RegularExpressionValidator ID="regtxtYTDVsFull" runat="server" ValidationGroup="DefinitionValidation"
                                            ControlToValidate="txtYTDVsFull" ValidationExpression="^[\s\S]{0,4000}$" ErrorMessage="The YTD vs. Full year rec issues must contained less than 4000 characters"
                                            SetFocusOnError="true">*</asp:RegularExpressionValidator>
                                    </div>
                                </div>
                                <div class="formPanelRow" style="height: 35px;">
                                    <div class="pItemLbl_large">
                                        Planning Horizon (& Period)</div>
                                    <div class="pItemCtl_auto">
                                        <asp:TextBox ID="txtPlanningHorizon" runat="server" Width="530" MaxLength="255" />
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div runat="server" id="panAssuranceActivities_SOURCE">
                        <div class="formPanelRow" style="height: 50px;">
                            <div style="clear: both;">
                                <div style="margin: 10px 10px 0px 0px; width: 860px; border-top: 1px solid #6d6e71;">
                                </div>
                            </div>
                            <div style="float: left;">
                                <h2>
                                    Assurance Activities</h2>
                            </div>
                            <div style="float: right; padding-right: 20px">
                                <a style="text-decoration: none; font-size: 8pt;" href="javascript:ToggleHideShowFormSection('divAssuranceActivities');">
                                    Show / Hide Assurance Activities</a>
                            </div>
                        </div>
                        <div id="divAssuranceActivities" runat="server" style="clear: both; margin-top: 50px">
                            <table>
                                <tr>
                                    <td style="width:300px">
                                        &nbsp;
                                    </td>
                                    <td style="width:100px">
                                        Required by DAG/Internal business rules, Yes/No
                                    </td>
                                    <td style="width:100px">
                                        Completed prior year,Yes/No
                                    </td>
                                    <td>
                                        Link to previous year assurance
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="col1">
                                        Planning
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Methodology statement
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList18" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList19" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Senior manager sign off
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList21" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList22" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox5" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                   <td colspan="4" class="col1">
                                        Review / preparation
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ‘Second person ‘ review (may be within team)
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList27" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList28" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox6" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        ‘Internal Expert ‘ review (may be within team)
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList30" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList31" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox7" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" class="col1">
                                        Independent Assurance (refer to TL)
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Internal Data Audit (IA team)
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList36" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList37" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox8" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Internal Process Audit (IA team)
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList39" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList40" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox9" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        External Data Audit (Co-ordinated by IA team)
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList42" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList43" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox10" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        External Process Audit (Co-ordinated by IA team)
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList45" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList46" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox11" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                   <td colspan="4" class="col1">
                                        Sign –off
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Senior manager sign-off
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList51" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList52" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox12" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Director Sign-off
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList54" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList55" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox13" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        CEO sign-off
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList57" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList58" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox14" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Board Sign-off
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList60" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DropDownList61" runat="server">
                                            <asp:ListItem Value=" "></asp:ListItem>
                                            <asp:ListItem Value="Yes"></asp:ListItem>
                                            <asp:ListItem Value="No"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TextBox15" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <div runat="server" id="panProcessGuide_USAGE">
                    <div id="divProcessGuideHeader" runat="server">
                        <div>
                            <div style="margin: 10px 10px 0px 0px; width: 860px; border-top: 1px solid #6d6e71;">
                            </div>
                        </div>
                        <div class="formPanelRow">
                            <div style="float: left; width: 400px;">
                                <h2>
                                    Process Guide</h2>
                            </div>
                            <div style="float: right; padding-right: 20px;">
                                <a style="text-decoration: none; font-size: 8pt;" href="javascript:ToggleHideShowFormSection('divOtherInformation');">
                                    Show / Hide Process Guide</a>
                            </div>
                        </div>
                    </div>
                    <div id="divOtherInformation" runat="server">
                        <div class="formPanelRow_x3" runat="server" visible="false">
                            <div class="pItemLbl_large">
                                Notes</div>
                            <div class="pItemCtl_auto">
                                <asp:TextBox ID="txtNotes" runat="server" Width="530" TextMode="MultiLine" Height="70px" />
                                <asp:RegularExpressionValidator ID="regtxtNotes" runat="server" ValidationGroup="DefinitionValidation"
                                    ControlToValidate="txtNotes" ValidationExpression="^[\s\S]{0,4000}$" ErrorMessage="The notes must contained less than 4000 characters"
                                    SetFocusOnError="true">*</asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="formPanelRow" runat="server" visible="false">
                            <div class="pItemLbl_large">
                                Data Item</div>
                            <div class="pItemCtl_auto">
                                <asp:TextBox ID="txtDataItem" runat="server" Width="530" MaxLength="255" />
                            </div>
                        </div>
                        <div class="formPanelRow_x3" runat="server" visible="false">
                            <div class="pItemLbl_large">
                                Data Source</div>
                            <div class="pItemCtl_auto">
                                <asp:TextBox ID="txtDataSource" runat="server" Width="530" TextMode="MultiLine" Height="70px" />
                                <asp:RegularExpressionValidator ID="regtxtDataSource" runat="server" ValidationGroup="DefinitionValidation"
                                    ControlToValidate="txtDataSource" ValidationExpression="^[\s\S]{0,4000}$" ErrorMessage="The data source details must contained less than 4000 characters"
                                    SetFocusOnError="true">*</asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="formPanelRow" runat="server" visible="false">
                            <div class="pItemLbl_large">
                                Day Extracted</div>
                            <div class="pItemCtl_auto">
                                <asp:TextBox ID="txtDayExtracted" runat="server" Width="530" MaxLength="255" />
                            </div>
                        </div>
                        <div class="formPanelRow">
                            <div class="pItemLbl_large">
                                Immediate Source</div>
                            <div class="pItemCtl_auto">
                                <asp:TextBox ID="txtImmediateSource" runat="server" Width="530" MaxLength="255" />
                            </div>
                        </div>
                        <div class="formPanelRow_x3">
                            <div class="pItemLbl_large">
                                Immediate Source Table/Field</div>
                            <div class="pItemCtl_auto">
                                <asp:TextBox ID="txtImmediateSourceTableField" runat="server" Width="530" TextMode="MultiLine"
                                    Height="70px" />
                                <asp:RegularExpressionValidator ID="regtxtImmediateSourceTableField" runat="server"
                                    ValidationGroup="DefinitionValidation" ControlToValidate="txtImmediateSourceTableField"
                                    ValidationExpression="^[\s\S]{0,4000}$" ErrorMessage="The immediate source table/field must contained less than 4000 characters"
                                    SetFocusOnError="true">*</asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="formPanelRow">
                            <div class="pItemLbl_large">
                                Data Repository</div>
                            <div class="pItemCtl_auto">
                                <asp:TextBox ID="txtDataRepository" runat="server" Width="530" MaxLength="255" />
                            </div>
                        </div>
                        <div class="formPanelRow" style="height: 35px;">
                            <div class="pItemLbl_large">
                                Calculations Required</div>
                            <div class="pItemCtl_auto">
                                <asp:TextBox ID="txtCalculationsRequired" runat="server" Width="530" MaxLength="255" />
                            </div>
                        </div>
                        <div class="formPanelRow" style="height: 35px;">
                            <div class="pItemLbl_large">
                                Period Available for Data</div>
                            <div class="pItemCtl_auto">
                                <asp:TextBox ID="txtPeriodAvailableForData" runat="server" Width="530" MaxLength="255" />
                            </div>
                        </div>
                        <div class="formPanelRow" style="height: 35px;">
                            <div class="pItemLbl_large">
                                Frequency of Data Refresh</div>
                            <div class="pItemCtl_auto">
                                <asp:TextBox ID="txtFrequencyOfDataRefresh" runat="server" Width="530" MaxLength="255" />
                            </div>
                        </div>
                        <div class="formPanelRow" style="height: 150px;">
                            <div class="pItemLbl_large">
                                Creation of Metric</div>
                            <div class="pItemCtl_auto">
                                <asp:TextBox ID="txtCreationOfMetric" runat="server" Width="530" TextMode="MultiLine"
                                    Height="140px" />
                                <asp:RegularExpressionValidator ID="regtxtCreationOfMetric" runat="server" ValidationGroup="DefinitionValidation"
                                    ControlToValidate="txtCreationOfMetric" ValidationExpression="^[\s\S]{0,4000}$"
                                    ErrorMessage="The creation of metric field must contained less than 4000 characters"
                                    SetFocusOnError="true">*</asp:RegularExpressionValidator>
                            </div>
                        </div>
                        <div class="formPanelRow" runat="server" visible="false">
                            <div class="pItemLbl_large">
                                Alternative Repository</div>
                            <div class="pItemCtl_auto">
                                <asp:TextBox ID="txtAlternativeRepository" runat="server" Width="530" MaxLength="255" />
                            </div>
                        </div>
                    </div>
                </div>
                <div runat="server" id="panProcessGuide_SOURCE">
                    <div id="div5" runat="server">
                        <div>
                            <div style="margin: 10px 10px 0px 0px; width: 860px; border-top: 1px solid #6d6e71;">
                            </div>
                        </div>
                        <div class="formPanelRow">
                            <div style="float: left; width: 400px;">
                                <h2>
                                    Process Guide</h2>
                            </div>
                            <div style="float: right; padding-right: 20px;">
                                <a style="text-decoration: none; font-size: 8pt;" href="javascript:ToggleHideShowFormSection('divProcessGuideX');">
                                    Show / Hide Process Guide</a>
                            </div>
                        </div>
                    </div>
                    <div id="divProcessGuideX" runat="server">
                        <div style="font-weight: bold">
                            INTRODUCTION</div>
                        As part of the changes made to the GT Licence for the implementation of RIIO, Ofgem
                        introduced the Standard Special Condition A55 Data Assurance Requirements.
                        <br />
                        <br />
                        The Licence condition, states that each GDN must undertake assurance work over its
                        submissions with a view 'to reduce the risk of inaccurate reporting and misreporting
                        to all stakeholders, such as ccutomers, Ofgem and licensees.
                        <br />
                        <br />
                        In order to facilitate compliance with this condition, Ofgem have introduced the
                        Data Assurance Guidance (The DAG). The stated approach of the DAG is to:
                        <br />
                        <br />
                        1. place the onus of ensuring the integrity of data submitted firmly on the licensee;
                        and
                        <br />
                        2. adopt a risk based approach to its application, where data assurance activities
                        are undertaken by the licensee in a manner proportionate to risk and materiality
                        of the submission.
                        <br />
                        <br />
                        This model has been designed to facilitate the risk assessment required over all
                        data submissions covered by the DAG.
                        <br />
                        <br />
                        A schedule of submissions covered is included within the workbook.
                        <br />
                        <br />
                    </div>
                </div>
            </div>
            <div id="divOwners" runat="server" visible="false">
                <uc1:OwnerAssigner ID="ucOwners" runat="server" ReferenceType="DEFINITION" />
            </div>
            <div id="divDataQualityCriteria" runat="server" visible="false">
                <uc1:DataQualityCriteriaViewer ID="DQCViewer" runat="server" ReferenceType="DEFINITION">
                </uc1:DataQualityCriteriaViewer>
            </div>
            <div id="divDataQualityCriteriaInherited" runat="server" visible="false" style="margin-bottom: 15px;">
                <uc1:DataQualityCriteriaInheritedViewer ID="DQCInheritedViewer" runat="server" ReferenceType="DEFINITION">
                </uc1:DataQualityCriteriaInheritedViewer>
            </div>
            <div id="divMappings" runat="server" visible="false" style="margin-bottom: 15px;">
                <div class="fullWidthBlock" style="margin-bottom: 2px; height: 26px;">
                    <div style="float: left;">
                        <h2>
                            Data Mappings</h2>
                    </div>
                    <div style="float: left; margin-left: 10px;">
                        <asp:Button ID="btnShowChart" runat="server" Text="Show Chart" OnClick="btnShowChart_Click"
                            Visible="true" />
                    </div>
                    <div class="alignRight">
                        <asp:Button ID="btnAddMapping" runat="server" Text="Add Mapping" CssClass="plusIcon"
                            OnClick="btnAddMapping_OnClick" Width="120px" />
                    </div>
                </div>
                <asp:GridView ID="gvMappings" runat="server" AutoGenerateColumns="False" GridLines="None"
                    CssClass="gridview" AllowPaging="True" AllowSorting="True" DataSourceID="sdsMappings"
                    PageSize="15">
                    <EmptyDataTemplate>
                        There are no data mappings currently assigned.
                    </EmptyDataTemplate>
                    <RowStyle CssClass="row1" />
                    <AlternatingRowStyle CssClass="row0" />
                    <PagerStyle CssClass="pager" />
                    <Columns>
                        <asp:TemplateField ItemStyle-Width="180px">
                            <HeaderTemplate runat="server">
                                Source Definition</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# "<b>" + Eval("SourceDefinitionTitle")
            + "</b> (<i>" + Eval("SourceDefinitionSubTitle") + "</i>)" %> '></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="80px">
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageAlign="Middle" ImageUrl="~/img/arrow_right.png" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField ItemStyle-Width="180px">
                            <HeaderTemplate runat="server">
                                Target Definition</HeaderTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# "<b>" + Eval("TargetDefinitionTitle")
            + "</b> (<i>" + Eval("TargetDefinitionSubTitle") + "</i>)" %> '></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField HeaderText="Type" DataField="MappingType" SortExpression="MappingType" />
                        <asp:BoundField HeaderText="Risk" DataField="MappingRisk" SortExpression="MappingRisk" />
                        <asp:BoundField HeaderText="Mapping Description" DataField="TruncatedDescription"
                            SortExpression="TruncatedDescription" />
                        <asp:TemplateField HeaderText="Edit" SortExpression="ID" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                            <ItemTemplate>
                                <cc:exImageButton ID="imgBtnEditMapping" runat="server" OnClick="EditMapping" CausesValidation="false"
                                    intValue1='<%# Eval("ID") %>' intValue2='<%# Eval("SourceID")
            %>' intValue3='<%# Eval("TargetID") %>' CssClass="icon20x20 PwCOrange" ImageUrl='~/img/PwCIcons/20x20/edit_icon20.png' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete" SortExpression="ID" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                            <ItemTemplate>
                                <cc:exImageButton ID="imgBtnDeleteMapping" runat="server" OnClick="DeleteMapping"
                                    CausesValidation="false" intValue1='<%# Eval("ID") %>' ImageUrl='~/img/PwCIcons/20x20/bin_icon_small.png'
                                    CssClass="icon20x20 PwCRed" OnClientClick="return confirm('Are you sure you want
            to delete this mapping?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div id="divDeficiencies" runat="server" visible="false" style="margin-bottom: 15px;">
                <div class="fullWidthBlock" style="margin-bottom: 2px; height: 26px;">
                    <div style="float: left;">
                        <h2>
                            Deficiencies</h2>
                    </div>
                    <div class="alignRight">
                        <asp:Button ID="btnAddDeficiency" runat="server" Text="Add Deficiency" CssClass="plusIcon"
                            Width="130px" OnClick="btnAddDeficiency_OnClick" />
                    </div>
                </div>
                <asp:GridView ID="gvDeficiencies" runat="server" AutoGenerateColumns="false" GridLines="None"
                    CssClass="gridview" AllowPaging="True" AllowSorting="True" DataSourceID="sdsDeficiencies"
                    PageSize="15">
                    <EmptyDataTemplate>
                        There are no deficiencies currently assigned.
                    </EmptyDataTemplate>
                    <RowStyle CssClass="row1" />
                    <AlternatingRowStyle CssClass="row0" />
                    <PagerStyle CssClass="pager" />
                    <Columns>
                        <asp:BoundField HeaderText="ID" DataField="ID" SortExpression="ID" Visible="false" />
                        <asp:BoundField HeaderText="Title" DataField="Title" SortExpression="Title" />
                        <asp:BoundField HeaderText="Created Date" DataField="CreatedDate" SortExpression="CreatedDate" />
                        <asp:BoundField HeaderText="Assigned To" DataField="Owners" SortExpression="Owners" />
                        <asp:BoundField HeaderText="Impact" DataField="DeficiencyLevel" SortExpression="DeficiencyLevel" />
                        <asp:BoundField HeaderText="Status" DataField="Status" SortExpression="Status" />
                        <asp:BoundField HeaderText="Target Date" DataField="TargetDate" SortExpression="TargetDate" />
                        <asp:BoundField HeaderText="Last Updated" DataField="LastUpdatedDate" SortExpression="LastUpdatedDate" />
                        <asp:TemplateField HeaderText="Edit" SortExpression="ID" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-Width="40px">
                            <ItemTemplate>
                                <cc:exImageButton ID="imgBtnEditDeficiency" runat="server" OnClick="EditDeficiency"
                                    CausesValidation="false" intValue1='<%# Eval("ID") %>' CssClass="icon20x20 PwCOrange"
                                    ImageUrl='~/img/PwCIcons/20x20/edit_icon20.png' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete" SortExpression="ID" HeaderStyle-HorizontalAlign="Center"
                            ItemStyle-HorizontalAlign="Center" ItemStyle-Width="60px">
                            <ItemTemplate>
                                <cc:exImageButton ID="imgBtnDeletedDeficiency" runat="server" OnClick="DeleteDeficiency"
                                    CausesValidation="false" intValue1='<%# Eval("ID") %>' ImageUrl='~/img/PwCIcons/20x20/bin_icon_small.png'
                                    CssClass="icon20x20 PwCRed" OnClientClick="return confirm('Are you sure you want
            to delete this deficiency?');" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
            <div id="divAttachments" runat="server" visible="false" style="font-size: 8pt;">
                <uc1:AttachmentViewer ID="atvAttachments" runat="server" BehaviourID="attachments"
                    ReferenceType="DEFINITION" Title="Attachments" ShowAddAttachment="true" EnableDelete="true" />
            </div>
            <asp:SqlDataSource ID="sdsMappings" runat="server" ConnectionString="<%$
            ConnectionStrings:DagDirectoryWWU %>" SelectCommand="uspMappingGetListForDefinitionID_All"
                SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="Username" SessionField="Username" DbType="String" ConvertEmptyStringToNull="false" />
                    <asp:SessionParameter Name="Role" SessionField="UserRole" DbType="String" ConvertEmptyStringToNull="false" />
                    <asp:QueryStringParameter Name="DefinitionID" QueryStringField="ID" DbType="Int32"
                        ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="Valid" Direction="Output" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="sdsDeficiencies" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
                SelectCommand="uspDeficiencyGetListWithReferenceIDAndType" SelectCommandType="StoredProcedure">
                <SelectParameters>
                    <asp:SessionParameter Name="Username" SessionField="Username" DbType="String" ConvertEmptyStringToNull="false" />
                    <asp:SessionParameter Name="Role" SessionField="UserRole" DbType="String" ConvertEmptyStringToNull="false" />
                    <asp:QueryStringParameter Name="ReferenceID" QueryStringField="ID" DbType="Int32"
                        ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="ReferenceType" Direction="Input" Type="String" DefaultValue="DEFINITION"
                        ConvertEmptyStringToNull="false" />
                    <asp:Parameter Name="Valid" Direction="Output" Type="Boolean" />
                </SelectParameters>
            </asp:SqlDataSource>
            <div style="width: 100%; height: 40px;">
            </div>
            <div style="width: 100%; font-family: Arial; position: fixed; bottom: 0; left: 0;
                background: white; z-index: 999999; border-top: 4px solid #e0301e; padding: 5px 5px 5px 5px;">
                <div style="float: left; padding: 5px 15px 0px 10px; font-size: 9pt;">
                    Page Controls
                </div>
                <div style="float: left; width: 300px">
                    <asp:Button ID="btnSave" runat="server" Text="Save Definition
            Details" CssClass="iconButton Save" Width="178" OnClick="btnSave_Click" CausesValidation="true"
                        ValidationGroup="DefinitionValidation" />
                    <asp:Button ID="btnCancel" runat="server" Text="Back" CssClass="iconButton Exit"
                        Width="65" OnClick="btnCancel_Click" CausesValidation="false" />
                </div>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
