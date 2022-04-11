<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true" CodeBehind="UserSpecificReporting.aspx.cs" Inherits="PwC.Pages.Reporting.NewChartsDasboard.UserSpecificReporting" %>

<%@ Register Src="~/Common/Controls/StatusControl/StatusDiagram.ascx" TagPrefix="uc" TagName="StatusDiagram" %>
<%@ Register Assembly="DevExpress.Web.v14.2, Version=14.2.5.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">
        #divUserTableStatusGrid table {
            border: none;
            font-size: 0.9em;
        }

        #divUserTableStatusGrid th {
            background-color: #F2F2F2;
            border: none;
            border-bottom: solid 3px #9AB4CD;
            padding: 6px;
        }

        #divUserTableStatusGrid td {
            border: none;
            background-color: #F2F2F2;
            padding-left: 5px;
            padding-top: 3px;
            padding-bottom: 3px;
        }

        #divReadyForIAReviewGrid table {
            border: none;
            font-size: 0.9em;
        }

        #divReadyForIAReviewGrid th {
            background-color: #F2F2F2;
            border: none;
            border-bottom: solid 3px #9AB4CD;
            padding: 6px;
        }

        #divReadyForIAReviewGrid td {
            border: none;
            background-color: #F2F2F2;
            padding-left: 5px;
            padding-top: 3px;
            padding-bottom: 3px;
        }

        .gridpan {
            width: 920px;
        }

        .blankLinkButton {
            text-decoration: none;
        }


        .dashDONE {
            width: 20px;
            height: 20px;
            border-radius: 10px;
            background-color: rgb(57,89,99);
        }

        .dashOUTSTANDING_ACTION {
            width: 20px;
            height: 20px;
            border-radius: 10px;
            background-color: rgb(240, 124, 11);
        }

        .dashOUTSTANDING {
            width: 20px;
            height: 20px;
            border-radius: 10px;
            background-color: rgb(252,190,0);
        }

        .dashNA {
            width: 20px;
            height: 20px;
            border-radius: 10px;
            background-color: #c8c8c8;
        }


        .repTitle {
            float: left;
        }

        #ctl00_MainContent_gvUserTableStatus tr td {
            border-bottom: solid 1px #9AB4CD;
        }

        #ctl00_MainContent_gvReadyForIAReview tr td {
            border-bottom: solid 1px #9AB4CD;
        }

        .viewstat1 {
            width: 20px;
            height: 20px;
            background-color: rgb(0,187,200);
            background-image: url(../../../img/PwCIcons/20x20/list_icon20.png);
        }


        .isSendBack_False {
            width: 20px;
            height: 20px;
        }

        .isSendBack_True {
            width: 0;
            height: 0;
            border-left: 10px solid transparent;
            border-right: 10px solid transparent;
            border-bottom: 20px solid #F5080E;
        }

        .tabbutton {
            background-color: #c8c8c8 !important;
            padding: 3px;
        }

            .tabbutton.selected {
                background-color: #F07C0B !important;
            }

            .spLinkButton span{
                white-space: normal;
            }
    </style>

    <script type="text/javascript">

        var gloDAGYearShortText = "";
        var gloDAGYearShort4Text = "";
        var gloLicenseConditionText = "";
        var gloLicenseCondition4Text = "";
        var gloStatus_F_DSText = "";
        var gloStatus_F_SRText = "";
        var gloStatus_F_IEText = "";
        var gloStatus_W_DSText = "";
        var gloStatus_W_SRText = "";
        var gloStatus_W_IEText = "";
        var gloStatus_BLText = "";
        var gloStatus_COText = "";
        var gloStatus_EOText = "";
        var gloStatus_IAText = "";
        var gloStatus_HIAText = "";
        var gloImpactScoreText = "";
        var gloProcessScoreText = "";
        var gloOverallRatingText = "";
        var gloStage2StatusText = "";

        var gloRiskAssessmentStatusText = "";
        var gloMethodologyStatusText = "";
        var gloReadyForIAReviewStatusText = "";
        var gloAssuranceActivitiesStatusText = "";
        var gloDAGComplianceOfficerStatusText = "";
        var gloExecOwnerStatusText = "";
        var gloHeadOfIASignOffStatusText = "";
        var gloImpactScore4Text = "";
        var gloProcessScore4Text = "";
        var gloOverallRating4Text = "";
        var gloStage1StatusText = "";

        function openFilterF5(s,e, gloname)
        {
            s.ShowDropDown();

            $('#ctl00_MainContent_gvList_Section5_' + gloname + '_DDD_gv_DXFilterRow').find('input.dxeEditArea.dxeEditAreaSys').focus();
        }

        function openFilterF4(s, e, gloname) {
            s.ShowDropDown();

            $('#ctl00_MainContent_gvList_' + gloname + '_DDD_gv_DXFilterRow').find('input.dxeEditArea.dxeEditAreaSys').focus();
        }

    </script>

    <link rel="stylesheet" runat="server" href="../../../css/wide.css" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="../../../js/devextreme/Lib/js/jquery-1.11.3.js"></script>
    <script type="text/javascript" src="../../../js/devextreme/Lib/js/globalize.js"></script>
    <script type="text/javascript" src="../../../js/devextreme/Lib/js/dx.webappjs.js"></script>

    <div class="repTitle" style="padding-bottom: 20px;">
        Your Summary
    </div>
    <div style="float: right; padding-top: 10px;">

        <div style="float: left; padding-right: 10px;">
            User
        </div>

        <div style="float: left; padding-right: 10px;">
            <asp:DropDownList ID="ddlUser" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlUser_SelectedIndexChanged"></asp:DropDownList>
        </div>


        <span style="                float: left;
                padding-right: 20px;
        ">Key: </span>
        <div class="dashDONE" style="float: left"></div>
        <span style="float: left; padding-left: 10px; padding-right: 20px;">Completed</span>
        <div class="dashOUTSTANDING" style="float: left;"></div>
        <span style="float: left; padding-left: 10px; padding-right: 20px;">Outstanding</span>
        <div class="dashOUTSTANDING_ACTION" style="float: left;"></div>
        <span style="float: left; padding-left: 10px; padding-right: 20px;">Requires User's Action</span>
        <div class="dashNA" style="float: left;"></div>
        <span style="float: left; padding-left: 10px; padding-right: 20px;">Not Applicable</span>
        <div class="isSendBack_True" style="float: left;"></div>
        <span style="float: left; padding-left: 10px;">Sent back</span>



    </div>

    <div style="clear: both; height: 30px;">
        <div style="float: right">
            <asp:Button ID="btnTab4" runat="server" CssClass="tabbutton" Text="NetDAR" OnClientClick="$('.tabbutton').removeClass('selected');$(this).addClass('selected'); $('.divSection').hide(); $('.divSection.S4').show();  return false;" />
            <asp:Button ID="btnTab5" runat="server" CssClass="tabbutton selected" Text="Submission" OnClientClick="$('.tabbutton').removeClass('selected');$(this).addClass('selected');$('.divSection').hide(); $('.divSection.S5').show();  return false;" />
        </div>
    </div>

    <asp:Button ID="btnClearFilters" runat="server" OnClick="btnClearFilters_Click" Text="Clear Filters" Style="float: right; margin-top: 10px;" />

    <div class="divSection S4" id="divSection4" runat="server" style="clear: both; padding-top: 15px;">

        <dx:ASPxGridView ID="gvList" ClientSideEvents-EndCallback="" ClientInstanceName="gvList" runat="server" DataSourceID="dsList" OnProcessColumnAutoFilter="gvList_ProcessColumnAutoFilter" KeyFieldName="DataSourceID" AutoGenerateColumns="false" EnableRowsCache="false" >
            <ClientSideEvents />

            <Columns>
                <%--<dx:GridViewDataColumn Width="55px" Caption="Ref" FieldName="DataTableID" />--%>
                <%--<dx:GridViewDataColumn Width="53px" Caption="Type" FieldName="SubmissionType" />
                            <dx:GridViewDataColumn Width="67px" Caption="LC" FieldName="LC" />
                --%>
                <dx:GridViewDataColumn Visible="false" Caption="" FieldName="RegulationID" Settings-HeaderFilterMode="CheckedList">
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Width="60px" Caption="Year" ToolTip="Submissions Made Within" FieldName="DAGYearShort" Settings-HeaderFilterMode="CheckedList">
                    <FilterTemplate>
                        <dx:ASPxGridLookup ID="gloDAGYearShort4" ClientInstanceName="gloDAGYearShort4" runat="server" SelectionMode="Multiple" OnInit="gloDAGYearShort4_Init"
                            KeyFieldName="DAGYearShort" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                            <ClientSideEvents  GotFocus="function(s,e){  openFilterF4(s,e,'FC1_gloDAGYearShort4');  }"   DropDown="function(s,e){ gloDAGYearShort4Text = s.GetText(); }" CloseUp="function(s,e) { if(gloDAGYearShort4Text != s.GetText()) { gvList.AutoFilterByColumn('DAGYearShort', s.GetText()); } }" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                <dx:GridViewDataColumn FieldName="DAGYearShort" Caption="All" CellStyle-CssClass="">
                                    <DataItemTemplate>
                                        <dx:ASPxLabel runat="server" Width="200px" CssClass="" ForeColor="Black" Text='<%# Eval("DAGYearShort") %>'></dx:ASPxLabel>
                                    </DataItemTemplate>
                                     <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataColumn>
                            </Columns>
                            <GridViewProperties>
                                <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                <Settings  ShowFilterRow="true"   />
                            </GridViewProperties>
                            <GridViewStyles>
                                <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                <Row BackColor="Transparent" ForeColor="Black"></Row>
                            </GridViewStyles>
                        </dx:ASPxGridLookup>
                    </FilterTemplate>
                    <Settings AutoFilterCondition="Like" FilterMode="Value" />
                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Width="70px" Caption="L.C." FieldName="LicenseCondition" Settings-HeaderFilterMode="CheckedList">
                    <FilterTemplate>
                        <dx:ASPxGridLookup ID="gloLicenseCondition4" ClientInstanceName="gloLicenseCondition4" runat="server" SelectionMode="Multiple" OnInit="gloLicenseCondition4_Init"
                            KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                            <ClientSideEvents  GotFocus="function(s,e){  openFilterF4(s,e,'FC2_gloLicenseCondition4');  }"  DropDown="function(s,e){ gloLicenseCondition4Text = s.GetText(); }" CloseUp="function(s,e) { if(gloLicenseCondition4Text != s.GetText()) { gvList.AutoFilterByColumn('LicenseCondition', s.GetText()); } }" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                    <DataItemTemplate>
                                        <dx:ASPxLabel runat="server" Width="200px"  CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                    </DataItemTemplate>
                                     <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataColumn>
                            </Columns>
                            <GridViewProperties>
                                <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                <Settings  ShowFilterRow="true"   />
                            </GridViewProperties>
                            <GridViewStyles>
                                <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                <Row BackColor="Transparent" ForeColor="Black"></Row>
                            </GridViewStyles>
                        </dx:ASPxGridLookup>
                    </FilterTemplate>
                    <Settings AutoFilterCondition="Default" />


                </dx:GridViewDataColumn>

                <dx:GridViewDataColumn Width="240px" Caption="Title" FieldName="ConditionTitle" Settings-HeaderFilterMode="CheckedList">
                    <DataItemTemplate>
                        <dx:ASPxButton ID="lnkEdit4" CssClass="spLinkButton" HoverStyle-ForeColor="Red" HorizontalAlign="Left" Font-Underline="true"  BackgroundImage-ImageUrl="None"   Width="240px" BackColor="White" Border-BorderWidth="0" AutoPostBack="false"  runat="server"  OnInit="lnkEdit4_Init"    ></dx:ASPxButton>

                    </DataItemTemplate>
                    <Settings AutoFilterCondition="Contains" />
                </dx:GridViewDataColumn>

                <dx:GridViewDataColumn Width="60px" Caption="R.A." ToolTip="Risk Assessment" CellStyle-HorizontalAlign="Center" FieldName="RiskAssessmentStatus" Settings-HeaderFilterMode="CheckedList">
                    <DataItemTemplate>
                        <div title="Risk Assessment" runat="server" class='<%#"dashIcon dash"+Eval("RiskAssessmentStatus").ToString() %>'></div>
                    </DataItemTemplate>
                    <FilterTemplate>
                        <dx:ASPxGridLookup ID="gloRiskAssessmentStatus" ClientInstanceName="gloRiskAssessmentStatus" runat="server" SelectionMode="Multiple" OnInit="gloRiskAssessmentStatus_Init"
                            KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                            <ClientSideEvents  GotFocus="function(s,e){  openFilterF4(s,e,'FC4_gloRiskAssessmentStatus');  }"  DropDown="function(s,e){ gloRiskAssessmentStatusText = s.GetText(); }" CloseUp="function(s,e) { if(gloRiskAssessmentStatusText != s.GetText()) { gvList.AutoFilterByColumn('RiskAssessmentStatus', s.GetText()); } }" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                    <DataItemTemplate>
                                        <dx:ASPxLabel runat="server" Width="200px"  CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                    </DataItemTemplate>
                                     <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataColumn>
                            </Columns>
                            <GridViewProperties>
                                <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                <Settings  ShowFilterRow="true"   />
                            </GridViewProperties>
                            <GridViewStyles>
                                <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                <Row BackColor="Transparent" ForeColor="Black"></Row>
                            </GridViewStyles>
                        </dx:ASPxGridLookup>
                    </FilterTemplate>
                    <Settings AutoFilterCondition="Like" />

                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Width="60px" Caption="Mth." ToolTip="Methodology Statement" CellStyle-HorizontalAlign="Center" FieldName="MethodologyStatus" Settings-HeaderFilterMode="CheckedList">
                    <DataItemTemplate>
                        <div title="Methodology Statement" runat="server" class='<%#"dashIcon dash"+Eval("MethodologyStatus").ToString() %>'></div>
                    </DataItemTemplate>
                    <FilterTemplate>
                        <dx:ASPxGridLookup ID="gloMethodologyStatus" ClientInstanceName="gloMethodologyStatus" runat="server" SelectionMode="Multiple" OnInit="gloMethodologyStatus_Init"
                            KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                            <ClientSideEvents   GotFocus="function(s,e){  openFilterF4(s,e,'FC5_gloMethodologyStatus');  }" DropDown="function(s,e){ gloMethodologyStatusText = s.GetText(); }" CloseUp="function(s,e) { if(gloMethodologyStatusText != s.GetText()) { gvList.AutoFilterByColumn('MethodologyStatus', s.GetText()); } }" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                    <DataItemTemplate>
                                        <dx:ASPxLabel runat="server" Width="200px"  CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                    </DataItemTemplate>
                                     <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataColumn>
                            </Columns>
                            <GridViewProperties>
                                <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                <Settings  ShowFilterRow="true"   />
                            </GridViewProperties>
                            <GridViewStyles>
                                <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                <Row BackColor="Transparent" ForeColor="Black"></Row>
                            </GridViewStyles>
                        </dx:ASPxGridLookup>
                    </FilterTemplate>
                    <Settings AutoFilterCondition="Like" />

                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Width="60px" Caption="IA." ToolTip="Ready for IA Review" CellStyle-HorizontalAlign="Center" FieldName="ReadyForIAReviewStatus" Settings-HeaderFilterMode="CheckedList">
                    <DataItemTemplate>
                        <div title="Ready for IA Review" runat="server" class='<%#"dashIcon dash"+Eval("ReadyForIAReviewStatus").ToString() %>'></div>
                    </DataItemTemplate>
                    <FilterTemplate>
                        <dx:ASPxGridLookup ID="gloReadyForIAReviewStatus" ClientInstanceName="gloReadyForIAReviewStatus" runat="server" SelectionMode="Multiple" OnInit="gloReadyForIAReviewStatus_Init"
                            KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                            <ClientSideEvents  GotFocus="function(s,e){  openFilterF4(s,e,'FC6_gloReadyForIAReviewStatus');  }" DropDown="function(s,e){ gloReadyForIAReviewStatusText = s.GetText(); }" CloseUp="function(s,e) { if(gloReadyForIAReviewStatusText != s.GetText()) { gvList.AutoFilterByColumn('ReadyForIAReviewStatus', s.GetText()); } }" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                    <DataItemTemplate>
                                        <dx:ASPxLabel runat="server" Width="200px"  CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                    </DataItemTemplate>
                                     <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataColumn>
                            </Columns>
                            <GridViewProperties>
                                <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                <Settings  ShowFilterRow="true"   />
                            </GridViewProperties>
                            <GridViewStyles>
                                <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                <Row BackColor="Transparent" ForeColor="Black"></Row>
                            </GridViewStyles>
                        </dx:ASPxGridLookup>
                    </FilterTemplate>
                    <Settings AutoFilterCondition="Like" />

                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Width="60px" Caption="A.A." ToolTip="Assurance Activities" CellStyle-HorizontalAlign="Center" FieldName="AssuranceActivitiesStatus" Settings-HeaderFilterMode="CheckedList">
                    <DataItemTemplate>
                        <div title="Assurance Activities" runat="server" class='<%#"dashIcon dash"+Eval("AssuranceActivitiesStatus").ToString() %>'></div>
                    </DataItemTemplate>
                    <FilterTemplate>
                        <dx:ASPxGridLookup ID="gloAssuranceActivitiesStatus" ClientInstanceName="gloAssuranceActivitiesStatus" runat="server" SelectionMode="Multiple" OnInit="gloAssuranceActivitiesStatus_Init"
                            KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                            <ClientSideEvents  GotFocus="function(s,e){  openFilterF4(s,e,'FC7_gloAssuranceActivitiesStatus');  }"  DropDown="function(s,e){ gloAssuranceActivitiesStatusText = s.GetText(); }" CloseUp="function(s,e) { if(gloAssuranceActivitiesStatusText != s.GetText()) { gvList.AutoFilterByColumn('AssuranceActivitiesStatus', s.GetText()); } }" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                    <DataItemTemplate>
                                        <dx:ASPxLabel runat="server" Width="200px"  CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                    </DataItemTemplate>
                                     <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataColumn>
                            </Columns>
                            <GridViewProperties>
                                <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                <Settings  ShowFilterRow="true"   />
                            </GridViewProperties>
                            <GridViewStyles>
                                <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                <Row BackColor="Transparent" ForeColor="Black"></Row>
                            </GridViewStyles>
                        </dx:ASPxGridLookup>
                    </FilterTemplate>
                    <Settings AutoFilterCondition="Like" />

                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Width="60px" Caption="D.C.O." ToolTip="DAG Compliance Officer Review" CellStyle-HorizontalAlign="Center" FieldName="DAGComplianceOfficerStatus" Settings-HeaderFilterMode="CheckedList">
                    <DataItemTemplate>
                        <div title="DAG Compliance Officer Review" runat="server" class='<%#"dashIcon dash"+Eval("DAGComplianceOfficerStatus").ToString() %>'></div>
                    </DataItemTemplate>
                    <FilterTemplate>
                        <dx:ASPxGridLookup ID="gloDAGComplianceOfficerStatus" ClientInstanceName="gloDAGComplianceOfficerStatus" runat="server" SelectionMode="Multiple" OnInit="gloDAGComplianceOfficerStatus_Init"
                            KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                            <ClientSideEvents  GotFocus="function(s,e){  openFilterF4(s,e,'FC8_gloDAGComplianceOfficerStatus');  }" DropDown="function(s,e){ gloDAGComplianceOfficerStatusText = s.GetText(); }" CloseUp="function(s,e) { if(gloDAGComplianceOfficerStatusText != s.GetText()) { gvList.AutoFilterByColumn('DAGComplianceOfficerStatus', s.GetText()); } }" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                    <DataItemTemplate>
                                        <dx:ASPxLabel runat="server" Width="200px"  CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                    </DataItemTemplate>
                                     <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataColumn>
                            </Columns>
                            <GridViewProperties>
                                <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                <Settings  ShowFilterRow="true"   />
                            </GridViewProperties>
                            <GridViewStyles>
                                <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                <Row BackColor="Transparent" ForeColor="Black"></Row>
                            </GridViewStyles>
                        </dx:ASPxGridLookup>
                    </FilterTemplate>
                    <Settings AutoFilterCondition="Like" />

                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Width="60px" Caption="Exec" ToolTip="Exec Owner Review" CellStyle-HorizontalAlign="Center" FieldName="ExecOwnerStatus" Settings-HeaderFilterMode="CheckedList">
                    <DataItemTemplate>
                        <div title="Exec Owner Review" runat="server" class='<%#"dashIcon dash"+Eval("ExecOwnerStatus").ToString() %>'></div>
                    </DataItemTemplate>
                    <FilterTemplate>
                        <dx:ASPxGridLookup ID="gloExecOwnerStatus" ClientInstanceName="gloExecOwnerStatus" runat="server" SelectionMode="Multiple" OnInit="gloExecOwnerStatus_Init"
                            KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                            <ClientSideEvents  GotFocus="function(s,e){  openFilterF4(s,e,'FC9_gloExecOwnerStatus');  }"  DropDown="function(s,e){ gloExecOwnerStatusText = s.GetText(); }" CloseUp="function(s,e) { if(gloExecOwnerStatusText != s.GetText()) { gvList.AutoFilterByColumn('ExecOwnerStatus', s.GetText()); } }" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                    <DataItemTemplate>
                                        <dx:ASPxLabel runat="server" Width="200px"  CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                    </DataItemTemplate>
                                     <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataColumn>
                            </Columns>
                            <GridViewProperties>
                                <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                <Settings  ShowFilterRow="true"   />
                            </GridViewProperties>
                            <GridViewStyles>
                                <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                <Row BackColor="Transparent" ForeColor="Black"></Row>
                            </GridViewStyles>
                        </dx:ASPxGridLookup>
                    </FilterTemplate>
                    <Settings AutoFilterCondition="Like" />

                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Width="60px" Caption="H.o.IA." ToolTip="Signed Off By Head of Internal Audit" CellStyle-HorizontalAlign="Center" FieldName="HeadOfIASignOffStatus" Settings-HeaderFilterMode="CheckedList">
                    <DataItemTemplate>
                        <div title="Signed Off By Head of Internal Audit" runat="server" class='<%#"dashIcon dash"+Eval("HeadOfIASignOffStatus").ToString() %>'></div>
                    </DataItemTemplate>
                    <FilterTemplate>
                        <dx:ASPxGridLookup ID="gloHeadOfIASignOffStatus" ClientInstanceName="gloHeadOfIASignOffStatus" runat="server" SelectionMode="Multiple" OnInit="gloHeadOfIASignOffStatus_Init"
                            KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                            <ClientSideEvents  GotFocus="function(s,e){  openFilterF4(s,e,'FC10_gloHeadOfIASignOffStatus');  }"   DropDown="function(s,e){ gloHeadOfIASignOffStatusText = s.GetText(); }" CloseUp="function(s,e) { if(gloHeadOfIASignOffStatusText != s.GetText()) { gvList.AutoFilterByColumn('HeadOfIASignOffStatus', s.GetText()); } }" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                    <DataItemTemplate>
                                        <dx:ASPxLabel runat="server" Width="200px"  CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                    </DataItemTemplate>
                                     <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataColumn>
                            </Columns>
                            <GridViewProperties>
                                <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                <Settings  ShowFilterRow="true"   />
                            </GridViewProperties>
                            <GridViewStyles>
                                <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                <Row BackColor="Transparent" ForeColor="Black"></Row>
                            </GridViewStyles>
                        </dx:ASPxGridLookup>
                    </FilterTemplate>
                    <Settings AutoFilterCondition="Like" />

                </dx:GridViewDataColumn>

                <dx:GridViewDataColumn Width="60px" Caption="Imp." ToolTip="Impact Score" FieldName="ImpactScore" Settings-HeaderFilterMode="CheckedList">

                    <FilterTemplate>
                        <dx:ASPxGridLookup ID="gloImpactScore4" ClientInstanceName="gloImpactScore4" runat="server" SelectionMode="Multiple" OnInit="gloImpactScore4_Init"
                            KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                            <ClientSideEvents  GotFocus="function(s,e){  openFilterF4(s,e,'FC11_gloImpactScore4');  }"  DropDown="function(s,e){ gloImpactScore4Text = s.GetText(); }" CloseUp="function(s,e) { if(gloImpactScore4Text != s.GetText()) { gvList.AutoFilterByColumn('ImpactScore', s.GetText()); } }" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                    <DataItemTemplate>
                                        <dx:ASPxLabel runat="server" Width="200px"  CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                    </DataItemTemplate>
                                     <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataColumn>
                            </Columns>
                            <GridViewProperties>
                                <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                <Settings  ShowFilterRow="true"   />
                            </GridViewProperties>
                            <GridViewStyles>
                                <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                <Row BackColor="Transparent" ForeColor="Black"></Row>
                            </GridViewStyles>
                        </dx:ASPxGridLookup>
                    </FilterTemplate>
                    <Settings AutoFilterCondition="Like" />

                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Width="60px" Caption="Prc." ToolTip="Process Score" FieldName="ProcessScore" Settings-HeaderFilterMode="CheckedList">
                    <FilterTemplate>
                        <dx:ASPxGridLookup ID="gloProcessScore4" ClientInstanceName="gloProcessScore4" runat="server" SelectionMode="Multiple" OnInit="gloProcessScore4_Init"
                            KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                            <ClientSideEvents  GotFocus="function(s,e){  openFilterF4(s,e,'FC12_gloProcessScore4');  }"  DropDown="function(s,e){ gloProcessScore4Text = s.GetText(); }" CloseUp="function(s,e) { if(gloProcessScore4Text != s.GetText()) { gvList.AutoFilterByColumn('ProcessScore', s.GetText()); } }" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                    <DataItemTemplate>
                                        <dx:ASPxLabel runat="server" Width="200px"  CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                    </DataItemTemplate>
                                     <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataColumn>
                            </Columns>
                            <GridViewProperties>
                                <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                <Settings  ShowFilterRow="true"   />
                            </GridViewProperties>
                            <GridViewStyles>
                                <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                <Row BackColor="Transparent" ForeColor="Black"></Row>
                            </GridViewStyles>
                        </dx:ASPxGridLookup>
                    </FilterTemplate>
                    <Settings AutoFilterCondition="Like" />

                </dx:GridViewDataColumn>
                <dx:GridViewDataColumn Width="60px" Caption="Score" ToolTip="Overall Rating" CellStyle-HorizontalAlign="Left" FieldName="OverallRating" Settings-HeaderFilterMode="CheckedList">
                    <DataItemTemplate>
                        <asp:Label runat="server" Text='<%# Eval("OverallRatingOverride").ToString()=="No rating" ?  Eval("OverallRating").ToString()  : Eval("OverallRatingOverride").ToString()+"*" %>'></asp:Label>
                    </DataItemTemplate>
                    <FilterTemplate>
                        <dx:ASPxGridLookup ID="gloOverallRating4" ClientInstanceName="gloOverallRating4" runat="server" SelectionMode="Multiple" OnInit="gloOverallRating4_Init"
                            KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                            <ClientSideEvents GotFocus="function(s,e){  openFilterF4(s,e,'FC13_gloOverallRating4');  }"   DropDown="function(s,e){ gloOverallRating4Text = s.GetText(); }" CloseUp="function(s,e) { if(gloOverallRating4Text != s.GetText()) { gvList.AutoFilterByColumn('OverallRating', s.GetText()); } }" />
                            <Columns>
                                <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                    <DataItemTemplate>
                                        <dx:ASPxLabel runat="server" Width="200px"  CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                    </DataItemTemplate>
                                     <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataColumn>
                            </Columns>
                            <GridViewProperties>
                                <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                <Settings  ShowFilterRow="true"   />
                            </GridViewProperties>
                            <GridViewStyles>
                                <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                <Row BackColor="Transparent" ForeColor="Black"></Row>
                            </GridViewStyles>
                        </dx:ASPxGridLookup>
                    </FilterTemplate>
                    <Settings AutoFilterCondition="Like" />
                </dx:GridViewDataColumn>


                <dx:GridViewDataColumn Width="60px" Caption="Rej." ToolTip="Sent back, rejected" CellStyle-HorizontalAlign="Center" FieldName="IsSendBack" Settings-AllowAutoFilter="False" Settings-ShowInFilterControl="False" Settings-HeaderFilterMode="CheckedList">
                    <DataItemTemplate>
                        <div id="isSendBack" class='<%# "isSendBack_"+ Eval("IsSendBack").ToString() %>' runat="server" style="text-align: center;">
                        </div>
                    </DataItemTemplate>
                </dx:GridViewDataColumn>


                <dx:GridViewDataColumn Width="155px" Caption="NET DAR Status" FieldName="Stage1Status" Settings-HeaderFilterMode="CheckedList">
                    <Settings AutoFilterCondition="Contains" />
                    <FilterTemplate>
                        <dx:ASPxGridLookup ID="gloStage1Status" ClientInstanceName="gloStage1Status" runat="server" SelectionMode="Multiple" OnInit="gloStage1Status_Init"
                            KeyFieldName="StatusValue" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                            <ClientSideEvents GotFocus="function(s,e){  openFilterF4(s,e,'FC15_gloStage1Status');  }"  DropDown="function(s,e){ gloStage1StatusText = s.GetText(); }" CloseUp="function(s,e) { if(gloStage1StatusText != s.GetText()) { gvList.AutoFilterByColumn('Stage1Status', s.GetText()); } }" />
                            <Columns>
                                <dx:GridViewCommandColumn  Width="40px" ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                <dx:GridViewDataColumn  Width="250px" CellStyle-HorizontalAlign="Left"  FieldName="StatusValue" Caption="All" CellStyle-CssClass="">
                                    <DataItemTemplate>
                                        <dx:ASPxLabel runat="server" Width="200px"  CssClass="" ForeColor="Black" Text='<%# Eval("StatusValue") %>'></dx:ASPxLabel>
                                    </DataItemTemplate>
                                     <Settings AutoFilterCondition="Contains" />
                                </dx:GridViewDataColumn>
                            </Columns>
                            <GridViewProperties>
                                <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                <Settings  ShowFilterRow="true"   />
                            </GridViewProperties>
                            <GridViewStyles>
                                <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                <Row BackColor="Transparent" ForeColor="Black"></Row>
                            </GridViewStyles>
                        </dx:ASPxGridLookup>
                    </FilterTemplate>
                    <Settings AutoFilterCondition="Like" />
                </dx:GridViewDataColumn>

                <dx:GridViewDataColumn Caption="Edit" Width="40px" Settings-AllowAutoFilter="False">

                    <DataItemTemplate>
                        <dx:ASPxButton ID="btnEdit" OnClick="btnEdit1_Click" CommandArgument="1" CssClass="editButton" runat="server" AutoPostBack="false" UseSubmitBehavior="false" ToolTip="Edit">
                            <Image Url="~/img/PwCIcons/20x20/edit_icon20.png" Width="20" Height="20" SpriteProperties-CssClass="icon-bg20" SpriteProperties-HottrackedCssClass="" SpriteProperties-PressedCssClass=""></Image>
                        </dx:ASPxButton>

                    </DataItemTemplate>
                </dx:GridViewDataColumn>

                <dx:GridViewDataColumn Width="40px" Caption="Work-flow" FieldName="DataSourceID" Settings-AllowAutoFilter="False">
                    <DataItemTemplate>
                        <div>
                            <uc:StatusDiagram runat="server" ID="ucStatusDiagram" ReferenceID='<%#Eval("DataSourceID") %>' SectionValue="4" />
                        </div>
                    </DataItemTemplate>
                </dx:GridViewDataColumn>


                <dx:GridViewBandColumn Name="RiskD" Visible="true">
                    <Columns>
                        <dx:GridViewDataColumn Visible="true" Caption="(a) Customers" FieldName="ImpactQuestion1"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="(b) Competition" FieldName="ImpactQuestion2"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="(c) Financial" FieldName="ImpactQuestion3"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="(d) Comparative Efficiency" FieldName="ImpactQuestion4"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="I1. Complexity of Data Sources" FieldName="ProcessQuestion1"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="I2. Completeness of Data Set" FieldName="ProcessQuestion2"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="I3. Extent of Manual Intervention" FieldName="ProcessQuestion3"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="I4. Complexity & Maturity of Reporting Rules" FieldName="ProcessQuestion4"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="C1. Control Activities" FieldName="ProcessQuestion5"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="C2. Experience of Personnel" FieldName="ProcessQuestion6"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="C3. Evidence of Historical Errors with this Data" FieldName="ProcessQuestion7"></dx:GridViewDataColumn>
                    </Columns>
                </dx:GridViewBandColumn>

            </Columns>

            <Styles>
                <Header Wrap="True"></Header>
            </Styles>
            <SettingsBehavior AllowSort="true" AllowDragDrop="true" EnableCustomizationWindow="true" ColumnResizeMode="Control" FilterRowMode="OnClick" />
            <Settings ShowHeaderFilterButton="false" ShowFilterRow="True" />
            <SettingsPager PageSize="20"></SettingsPager>
        </dx:ASPxGridView>
        <asp:ObjectDataSource ID="dsList" runat="server" SelectMethod="GetUserDataSourcesStatus" TypeName="PwC.Business.ReportingManager"
            OnObjectCreating="dsList_ObjectCreating">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlUser" Name="recordUser" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter Name="dAGYear" DefaultValue="All" Type="String" />

            </SelectParameters>
        </asp:ObjectDataSource>




        <div style="float: right; margin: 5px 0 0 0;">
            <asp:Button ID="btnExportRABreakdown4" runat="server" OnClick="btnExportRABreakdown4_Click" Text="Export Summary Table" />

        </div>

    </div>

    <div class="divSection S5" id="divSection5" runat="server" style="display: none; clear: both; padding-top: 15px;">

        <dx:ASPxGridView ID="gvList_Section5" OnProcessColumnAutoFilter="gvList_Section5_ProcessColumnAutoFilter" ClientInstanceName="gvList_Section5" runat="server" DataSourceID="dsList2" KeyFieldName="DataSourceID" AutoGenerateColumns="false" EnableRowsCache="false">
            <ClientSideEvents />
            <Columns>

                <dx:GridViewBandColumn>
                    <Columns>
                        <dx:GridViewDataColumn Visible="false" Caption="" FieldName="RegulationID" Settings-HeaderFilterMode="CheckedList">
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Width="60px" ToolTip="Submissions Made Within" Caption="Year" FieldName="DAGYearShort" Settings-AllowAutoFilterTextInputTimer="False">


                            <FilterTemplate>
                                <dx:ASPxGridLookup ID="gloDAGYearShort" ClientInstanceName="gloDAGYearShort" runat="server" SelectionMode="Multiple" OnInit="gloDAGYearShort_Init"
                                    KeyFieldName="DAGYearShort" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents  GotFocus="function(s,e){  openFilterF5(s,e,'FC2_gloDAGYearShort');  }"  DropDown="function(s,e){ gloDAGYearShortText = s.GetText(); }" CloseUp="function(s,e) { if(gloDAGYearShortText != s.GetText()) { gvList_Section5.AutoFilterByColumn('DAGYearShort', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                        <dx:GridViewDataColumn FieldName="DAGYearShort" Caption="All" CellStyle-CssClass="">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" CssClass="" Width="200px"  ForeColor="Black" Text='<%# Eval("DAGYearShort") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                            <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>

                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                         <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Like" FilterMode="Value" />
                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Width="70px" Caption="L.C." FieldName="LicenseCondition">

                            <FilterTemplate>
                                <dx:ASPxGridLookup ID="gloLicenseCondition"    IncrementalFilteringMode="Contains"  ClientInstanceName="gloLicenseCondition" runat="server" SelectionMode="Multiple" OnInit="gloLicenseCondition_Init"
                                    KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents   GotFocus="function(s,e){  openFilterF5(s,e,'FC3_gloLicenseCondition');  }" DropDown="function(s,e){ gloLicenseConditionText = s.GetText(); }" CloseUp="function(s,e) { if(gloLicenseConditionText != s.GetText()) { gvList_Section5.AutoFilterByColumn('LicenseCondition', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" Width="50px" />
                                        <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="" Width="200px">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" CssClass="" Width="200px" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                           <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>
                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                        <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Default" />


                        </dx:GridViewDataColumn>

                        <dx:GridViewDataColumn Width="240px" Caption="Title" FieldName="ConditionTitle" Settings-HeaderFilterMode="CheckedList">
                            <DataItemTemplate>
                                <dx:ASPxButton ID="lnkEdit3" CssClass="spLinkButton" HoverStyle-ForeColor="Red" HorizontalAlign="Left" Font-Underline="true"  BackgroundImage-ImageUrl="None"   Width="240px" BackColor="White" Border-BorderWidth="0" AutoPostBack="false"  runat="server"  OnInit="lnkEdit3_Init"    ></dx:ASPxButton>

                                <%--<asp:LinkButton runat="server" OnClick="lnkEdit2_Click" Text='<%#Eval("ConditionTitle") %>'></asp:LinkButton>--%>

                            </DataItemTemplate>
                            <Settings AutoFilterCondition="Contains" />
                        </dx:GridViewDataColumn>
                    </Columns>
                </dx:GridViewBandColumn>
                <dx:GridViewBandColumn Caption="Financial">
                    <Columns>


                        <dx:GridViewDataColumn Width="40px" Caption="DP" ToolTip="Data Preparer" CellStyle-HorizontalAlign="Center" FieldName="Status_F_DS" Settings-HeaderFilterMode="CheckedList">
                            <DataItemTemplate>
                                <div title="Data Preparer Submission" runat="server" class='<%#"dashIcon dash"+Eval("Status_F_DS").ToString() %>'></div>
                            </DataItemTemplate>
                            <FilterTemplate>
                                <dx:ASPxGridLookup ID="gloStatus_F_DS" ClientInstanceName="gloStatus_F_DS" runat="server" SelectionMode="Multiple" OnInit="gloStatus_F_DS_Init"
                                    KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents  GotFocus="function(s,e){  openFilterF5(s,e,'FC6_gloStatus_F_DS');  }"  DropDown="function(s,e){ gloStatus_F_DSText = s.GetText(); }" CloseUp="function(s,e) { if(gloStatus_F_DSText != s.GetText()) { gvList_Section5.AutoFilterByColumn('Status_F_DS', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                        <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" CssClass="" Width="200px" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                        <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>

                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                        <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Like" />



                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Width="40px" Caption="SR" ToolTip="Second Reviewer" CellStyle-HorizontalAlign="Center" FieldName="Status_F_SR" Settings-HeaderFilterMode="CheckedList">
                            <DataItemTemplate>
                                <div title="Second Reviewer" runat="server" class='<%#"dashIcon dash"+Eval("Status_F_SR").ToString() %>'></div>
                            </DataItemTemplate>
                            <FilterTemplate>
                                <dx:ASPxGridLookup ID="gloStatus_F_SR" ClientInstanceName="gloStatus_F_SR" runat="server" SelectionMode="Multiple" OnInit="gloStatus_F_SR_Init"
                                    KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents GotFocus="function(s,e){  openFilterF5(s,e,'FC7_gloStatus_F_SR');  }"   DropDown="function(s,e){ gloStatus_F_SRText = s.GetText(); }" CloseUp="function(s,e) { if(gloStatus_F_SRText != s.GetText()) { gvList_Section5.AutoFilterByColumn('Status_F_SR', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                        <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" CssClass="" Width="200px" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                             <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>
                                       
                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                        <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Like" />


                        </dx:GridViewDataColumn>

                        <dx:GridViewDataColumn Width="40px" Caption="IE" ToolTip="Internal Expert" CellStyle-HorizontalAlign="Center" FieldName="Status_F_IE" Settings-HeaderFilterMode="CheckedList">
                            <DataItemTemplate>
                                <div title="Internal Expert" runat="server" class='<%#"dashIcon dash"+Eval("Status_F_IE").ToString() %>'></div>
                            </DataItemTemplate>
                            <FilterTemplate>
                                <dx:ASPxGridLookup ID="gloStatus_F_IE" ClientInstanceName="gloStatus_F_IE" runat="server" SelectionMode="Multiple" OnInit="gloStatus_F_IE_Init"
                                    KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents GotFocus="function(s,e){  openFilterF5(s,e,'FC8_gloStatus_F_IE');  }"  DropDown="function(s,e){ gloStatus_F_IEText = s.GetText(); }" CloseUp="function(s,e) { if(gloStatus_F_IEText != s.GetText()) { gvList_Section5.AutoFilterByColumn('Status_F_IE', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                        <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" Width="200px" CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                            <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>
                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                        <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Like" />

                        </dx:GridViewDataColumn>

                    </Columns>
                </dx:GridViewBandColumn>

                <dx:GridViewBandColumn Caption="Workload">
                    <Columns>


                        <dx:GridViewDataColumn Width="40px" Caption="DP" ToolTip="Data Preparer" CellStyle-HorizontalAlign="Center" FieldName="Status_W_DS" Settings-HeaderFilterMode="CheckedList">
                            <DataItemTemplate>
                                <div title="Data Preparer" runat="server" class='<%#"dashIcon dash"+Eval("Status_W_DS").ToString() %>'></div>
                            </DataItemTemplate>
                            <FilterTemplate>
                                <dx:ASPxGridLookup ID="gloStatus_W_DS" ClientInstanceName="gloStatus_W_DS" runat="server" SelectionMode="Multiple" OnInit="gloStatus_W_DS_Init"
                                    KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents  GotFocus="function(s,e){  openFilterF5(s,e,'FC10_gloStatus_W_DS');  }" DropDown="function(s,e){ gloStatus_W_DSText = s.GetText(); }" CloseUp="function(s,e) { if(gloStatus_W_DSText != s.GetText()) { gvList_Section5.AutoFilterByColumn('Status_W_DS', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                        <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" Width="200px" CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                             <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>
                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                        <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Like" />

                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Width="40px" Caption="SR" ToolTip="Workload Second Reviewer" CellStyle-HorizontalAlign="Center" FieldName="Status_W_SR" Settings-HeaderFilterMode="CheckedList">
                            <DataItemTemplate>
                                <div title="Workload Second Reviewer" runat="server" class='<%#"dashIcon dash"+Eval("Status_W_SR").ToString() %>'></div>
                            </DataItemTemplate>
                            <FilterTemplate>
                                <dx:ASPxGridLookup ID="gloStatus_W_SR" ClientInstanceName="gloStatus_W_SR" runat="server" SelectionMode="Multiple" OnInit="gloStatus_W_SR_Init"
                                    KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents  GotFocus="function(s,e){  openFilterF5(s,e,'FC11_gloStatus_W_SR');  }"  DropDown="function(s,e){ gloStatus_W_SRText = s.GetText(); }" CloseUp="function(s,e) { if(gloStatus_W_SRText != s.GetText()) { gvList_Section5.AutoFilterByColumn('Status_W_SR', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                        <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" CssClass="" Width="200px" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                             <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>
                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                         <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Like" />

                        </dx:GridViewDataColumn>


                        <dx:GridViewDataColumn Width="40px" Caption="IE" ToolTip="Workload Internal Expert" CellStyle-HorizontalAlign="Center" FieldName="Status_W_IE" Settings-HeaderFilterMode="CheckedList">
                            <DataItemTemplate>
                                <div title="Workload Internal Expert" runat="server" class='<%#"dashIcon dash"+Eval("Status_W_IE").ToString() %>'></div>
                            </DataItemTemplate>
                            <FilterTemplate>
                                <dx:ASPxGridLookup ID="gloStatus_W_IE" ClientInstanceName="gloStatus_W_IE" runat="server" SelectionMode="Multiple" OnInit="gloStatus_W_IE_Init"
                                    KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents  GotFocus="function(s,e){  openFilterF5(s,e,'FC12_gloStatus_W_IE');  }"  DropDown="function(s,e){ gloStatus_W_IEText = s.GetText(); }" CloseUp="function(s,e) { if(gloStatus_W_IEText != s.GetText()) { gvList_Section5.AutoFilterByColumn('Status_W_IE', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                        <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" Width="200px" CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                             <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>
                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                        <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Like" />

                        </dx:GridViewDataColumn>


                    </Columns>
                </dx:GridViewBandColumn>

                <dx:GridViewBandColumn Caption="Final Approval">
                    <Columns>
                        <dx:GridViewDataColumn Width="40px" Caption="BL" ToolTip="Business Lead Review" CellStyle-HorizontalAlign="Center" FieldName="Status_BL" Settings-HeaderFilterMode="CheckedList">
                            <DataItemTemplate>
                                <div title="Business Lead Review" runat="server" class='<%#"dashIcon dash"+Eval("Status_BL").ToString() %>'></div>
                            </DataItemTemplate>
                            <FilterTemplate>
                                <dx:ASPxGridLookup ID="gloStatus_BL" ClientInstanceName="gloStatus_BL" runat="server" SelectionMode="Multiple" OnInit="gloStatus_BL_Init"
                                    KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents  GotFocus="function(s,e){  openFilterF5(s,e,'FC14_gloStatus_BL');  }"  DropDown="function(s,e){ gloStatus_BLText = s.GetText(); }" CloseUp="function(s,e) { if(gloStatus_BLText != s.GetText()) { gvList_Section5.AutoFilterByColumn('Status_BL', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                        <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" Width="200px" CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                             <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>
                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                        <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Like" />

                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Width="40px" Caption="CO" ToolTip="DAG Compliance Officer Review" CellStyle-HorizontalAlign="Center" FieldName="Status_CO" Settings-HeaderFilterMode="CheckedList">
                            <DataItemTemplate>
                                <div title="DAG Compliance Officer Review" runat="server" class='<%#"dashIcon dash"+Eval("Status_CO").ToString() %>'></div>
                            </DataItemTemplate>
                            <FilterTemplate>
                                <dx:ASPxGridLookup ID="gloStatus_CO" ClientInstanceName="gloStatus_CO" runat="server" SelectionMode="Multiple" OnInit="gloStatus_CO_Init"
                                    KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents  GotFocus="function(s,e){  openFilterF5(s,e,'FC15_gloStatus_CO');  }"  DropDown="function(s,e){ gloStatus_COText = s.GetText(); }" CloseUp="function(s,e) { if(gloStatus_COText != s.GetText()) { gvList_Section5.AutoFilterByColumn('Status_CO', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                        <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" Width="200px" CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                             <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>
                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                        <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Like" />

                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Width="40px" Caption="EO" ToolTip="Exec Owner Review" CellStyle-HorizontalAlign="Center" FieldName="Status_EO" Settings-HeaderFilterMode="CheckedList">
                            <DataItemTemplate>
                                <div title="Exec Owner Review" runat="server" class='<%#"dashIcon dash"+Eval("Status_EO").ToString() %>'></div>
                            </DataItemTemplate>
                            <FilterTemplate>
                                <dx:ASPxGridLookup ID="gloStatus_EO" ClientInstanceName="gloStatus_EO" runat="server" SelectionMode="Multiple" OnInit="gloStatus_EO_Init"
                                    KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents  GotFocus="function(s,e){  openFilterF5(s,e,'FC16_gloStatus_EO');  }"  DropDown="function(s,e){ gloStatus_EOText = s.GetText(); }" CloseUp="function(s,e) { if(gloStatus_EOText != s.GetText()) { gvList_Section5.AutoFilterByColumn('Status_EO', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                        <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" Width="200px" CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                             <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>
                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                        <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Like" />

                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Width="40px" Caption="IA" ToolTip="Internal Audit Review" CellStyle-HorizontalAlign="Center" FieldName="Status_IA" Settings-HeaderFilterMode="CheckedList">
                            <DataItemTemplate>
                                <div title="Internal Audit Review" runat="server" class='<%#"dashIcon dash"+Eval("Status_IA").ToString() %>'></div>
                            </DataItemTemplate>
                            <FilterTemplate>
                                <dx:ASPxGridLookup ID="gloStatus_IA" ClientInstanceName="gloStatus_IA" runat="server" SelectionMode="Multiple" OnInit="gloStatus_IA_Init"
                                    KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents  GotFocus="function(s,e){  openFilterF5(s,e,'FC17_gloStatus_IA');  }" DropDown="function(s,e){ gloStatus_IAText = s.GetText(); }" CloseUp="function(s,e) { if(gloStatus_IAText != s.GetText()) { gvList_Section5.AutoFilterByColumn('Status_IA', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                        <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" Width="200px" CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                             <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>
                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                        <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Like" />

                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Width="40px" Caption="HIA" ToolTip="Head of Internal Audit Review" CellStyle-HorizontalAlign="Center" FieldName="Status_HIA" Settings-HeaderFilterMode="CheckedList">
                            <DataItemTemplate>
                                <div title="Head of Internal Audit Review" runat="server" class='<%#"dashIcon dash"+Eval("Status_HIA").ToString() %>'></div>
                            </DataItemTemplate>
                            <FilterTemplate>
                                <dx:ASPxGridLookup ID="gloStatus_HIA" ClientInstanceName="gloStatus_HIA" runat="server" SelectionMode="Multiple" OnInit="gloStatus_HIA_Init"
                                    KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents  GotFocus="function(s,e){  openFilterF5(s,e,'FC18_gloStatus_HIA');  }" DropDown="function(s,e){ gloStatus_HIAText = s.GetText(); }" CloseUp="function(s,e) { if(gloStatus_HIAText != s.GetText()) { gvList_Section5.AutoFilterByColumn('Status_HIA', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                        <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" Width="200px" CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                             <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>
                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                        <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Like" />

                        </dx:GridViewDataColumn>

                    </Columns>
                </dx:GridViewBandColumn>


                <dx:GridViewBandColumn Caption="">
                    <Columns>

                        <dx:GridViewDataColumn Width="60px" Caption="Imp." ToolTip="Impact Score" FieldName="ImpactScore" Settings-HeaderFilterMode="CheckedList">
                            <FilterTemplate>
                                <dx:ASPxGridLookup ID="gloImpactScore" ClientInstanceName="gloImpactScore" runat="server" SelectionMode="Multiple" OnInit="gloImpactScore_Init"
                                    KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents  GotFocus="function(s,e){  openFilterF5(s,e,'FC20_gloImpactScore');  }"  DropDown="function(s,e){ gloImpactScoreText = s.GetText(); }" CloseUp="function(s,e) { if(gloImpactScoreText != s.GetText()) { gvList_Section5.AutoFilterByColumn('ImpactScore', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                        <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" Width="200px" CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                             <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>
                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                        <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Like" />

                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Width="60px" Caption="Prc." ToolTip="Process Score" FieldName="ProcessScore" Settings-HeaderFilterMode="CheckedList">
                            <FilterTemplate>
                                <dx:ASPxGridLookup ID="gloProcessScore" ClientInstanceName="gloProcessScore" runat="server" SelectionMode="Multiple" OnInit="gloProcessScore_Init"
                                    KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents  GotFocus="function(s,e){  openFilterF5(s,e,'FC21_gloProcessScore');  }"  DropDown="function(s,e){ gloProcessScoreText = s.GetText(); }" CloseUp="function(s,e) { if(gloProcessScoreText != s.GetText()) { gvList_Section5.AutoFilterByColumn('ProcessScore', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                        <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" Width="200px" CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                             <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>
                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                        <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Like" />

                        </dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Width="60px" Caption="Score" ToolTip="Overall Rating" CellStyle-HorizontalAlign="Left" FieldName="OverallRating" Settings-HeaderFilterMode="CheckedList">
                            <DataItemTemplate>
                                <asp:Label runat="server" Text='<%# Eval("OverallRatingOverride").ToString()=="No rating" ?  Eval("OverallRating").ToString()  : Eval("OverallRatingOverride").ToString()+"*" %>'></asp:Label>
                            </DataItemTemplate>
                            <FilterTemplate>
                                <dx:ASPxGridLookup ID="gloOverallRating" ClientInstanceName="gloOverallRating" runat="server" SelectionMode="Multiple" OnInit="gloOverallRating_Init"
                                    KeyFieldName="DataText" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents  GotFocus="function(s,e){  openFilterF5(s,e,'FC22_gloOverallRating');  }"  DropDown="function(s,e){ gloOverallRatingText = s.GetText(); }" CloseUp="function(s,e) { if(gloOverallRatingText != s.GetText()) { gvList_Section5.AutoFilterByColumn('OverallRating', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                        <dx:GridViewDataColumn FieldName="DataText" Caption="All" CellStyle-CssClass="">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" Width="200px" CssClass="" ForeColor="Black" Text='<%# Eval("DataText") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                             <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>
                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                        <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Like" />

                        </dx:GridViewDataColumn>


                        <dx:GridViewDataColumn Width="60px" Caption="Rej." ToolTip="Sent back, rejected" CellStyle-HorizontalAlign="Center" FieldName="IsSendBack" Settings-AllowAutoFilter="False" Settings-ShowInFilterControl="False" Settings-HeaderFilterMode="CheckedList">
                            <DataItemTemplate>
                                <div id="isSendBack" class='<%# "isSendBack_"+ Eval("IsSendBack").ToString() %>' runat="server" style="text-align: center;">
                                </div>
                            </DataItemTemplate>
                        </dx:GridViewDataColumn>

                        <dx:GridViewDataColumn Width="135px" Caption="Submission Status" FieldName="Stage2Status" Settings-AllowAutoFilter="True" Settings-HeaderFilterMode="CheckedList">
                            <FilterTemplate>
                                <dx:ASPxGridLookup  ID="gloStage2Status" ClientInstanceName="gloStage2Status" runat="server" SelectionMode="Multiple" OnInit="gloStage2Status_Init"
                                    KeyFieldName="StatusValue" Width="100%" TextFormatString="{0}" MultiTextSeparator="; ">
                                    <ClientSideEvents GotFocus="function(s,e){  openFilterF5(s,e,'FC24_gloStage2Status');  }"  DropDown="function(s,e){ gloStage2StatusText = s.GetText(); }" CloseUp="function(s,e) { if(gloStage2StatusText != s.GetText()) { gvList_Section5.AutoFilterByColumn('Stage2Status', s.GetText()); } }" />
                                    <Columns>
                                        <dx:GridViewCommandColumn Width="40px" ShowSelectCheckbox="true" SelectAllCheckboxMode="Page" />
                                        <dx:GridViewDataColumn Width="250px" CellStyle-HorizontalAlign="Left"  FieldName="StatusValue" Caption="All" CellStyle-CssClass="">
                                            <DataItemTemplate>
                                                <dx:ASPxLabel runat="server" Width="200px" CssClass="" ForeColor="Black" Text='<%# Eval("StatusValue") %>'></dx:ASPxLabel>
                                            </DataItemTemplate>
                                             <Settings AutoFilterCondition="Contains" />
                                        </dx:GridViewDataColumn>
                                    </Columns>
                                    <GridViewProperties>
                                        <SettingsBehavior AllowSort="false" AllowDragDrop="false" />
                                        <Settings  ShowFilterRow="true"   />
                                    </GridViewProperties>
                                    <GridViewStyles>
                                        <SelectedRow BackColor="Transparent" ForeColor="Black"></SelectedRow>
                                        <Row BackColor="Transparent" ForeColor="Black"></Row>
                                    </GridViewStyles>
                                </dx:ASPxGridLookup>
                            </FilterTemplate>
                            <Settings AutoFilterCondition="Like" />

                        </dx:GridViewDataColumn>

                        <dx:GridViewDataColumn Caption="Edit" Width="40px">

                            <DataItemTemplate>
                                <dx:ASPxButton ID="btnEdit" OnClick="btnEdit_Click" CommandArgument="2" CssClass="editButton" runat="server" AutoPostBack="false" UseSubmitBehavior="false" ToolTip="Edit">
                                    <Image Url="~/img/PwCIcons/20x20/edit_icon20.png" Width="20" Height="20" SpriteProperties-CssClass="icon-bg20" SpriteProperties-HottrackedCssClass="" SpriteProperties-PressedCssClass=""></Image>
                                </dx:ASPxButton>

                            </DataItemTemplate>
                        </dx:GridViewDataColumn>


                    </Columns>
                </dx:GridViewBandColumn>

                <dx:GridViewDataColumn Width="40px" Caption="Work-flow" Settings-AllowAutoFilter="False" FieldName="DataSourceID">
                    <DataItemTemplate>
                        <div>
                            <uc:StatusDiagram runat="server" ID="ucStatusDiagram" ReferenceID='<%#Eval("DataSourceID") %>' SectionValue="5" />
                        </div>
                    </DataItemTemplate>
                </dx:GridViewDataColumn>
                <dx:GridViewBandColumn Name="RiskD" Visible="true">
                    <Columns>
                        <dx:GridViewDataColumn Visible="true" Caption="(a) Customers" FieldName="ImpactQuestion1"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="(b) Competition" FieldName="ImpactQuestion2"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="(c) Financial" FieldName="ImpactQuestion3"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="(d) Comparative Efficiency" FieldName="ImpactQuestion4"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="I1. Complexity of Data Sources" FieldName="ProcessQuestion1"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="I2. Completeness of Data Set" FieldName="ProcessQuestion2"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="I3. Extent of Manual Intervention" FieldName="ProcessQuestion3"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="I4. Complexity & Maturity of Reporting Rules" FieldName="ProcessQuestion4"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="C1. Control Activities" FieldName="ProcessQuestion5"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="C2. Experience of Personnel" FieldName="ProcessQuestion6"></dx:GridViewDataColumn>
                        <dx:GridViewDataColumn Visible="true" Caption="C3. Evidence of Historical Errors with this Data" FieldName="ProcessQuestion7"></dx:GridViewDataColumn>
                    </Columns>
                </dx:GridViewBandColumn>

            </Columns>

            <Styles>
                <Header Wrap="True"></Header>
            </Styles>
            <SettingsBehavior AllowSort="true" AllowDragDrop="true" EnableCustomizationWindow="true" ColumnResizeMode="Control" FilterRowMode="OnClick" />
            <Settings ShowHeaderFilterButton="false" ShowFilterRow="True" />
            <SettingsPager PageSize="20"></SettingsPager>
        </dx:ASPxGridView>
        <asp:ObjectDataSource ID="dsList2" runat="server" SelectMethod="GetUserDataSourcesStatus_Section5" TypeName="PwC.Business.ReportingManager"
            OnObjectCreating="dsList2_ObjectCreating">
            <SelectParameters>
                <asp:ControlParameter ControlID="ddlUser" Name="recordUser" PropertyName="SelectedValue" Type="String" />
                <asp:Parameter Name="dAGYear" DefaultValue="All" Type="String" />

            </SelectParameters>
        </asp:ObjectDataSource>

        <div style="float: right; margin: 5px 0 0 0;">
            <asp:Button ID="btnExportRABreakdown5" runat="server" OnClick="btnExportRABreakdown5_Click" Text="Export Summary Table" />

        </div>
    </div>


    <div style="float: right; margin: 5px 0 0 0;">


        <dx:ASPxGridViewExporter ID="gvList_Export" GridViewID="gvList" runat="server"></dx:ASPxGridViewExporter>
        <dx:ASPxGridViewExporter ID="gvList_Export5" GridViewID="gvList_Section5" runat="server"></dx:ASPxGridViewExporter>

    </div>



    <div style="clear: both"></div>
    <script>

        function bindClick(that) {
            var status = $(that).parent().parent().parent().prev().prev().text();
            showMeStatusDiagram($(that), status);
        }

        function showMeStatusDiagram(src, currentStatus) {
            if ($('.tabbutton.selected').val() == "NetDAR") {
                $('.status-diagram-netdar').show();
                $('.status-diagram-submission').hide();
            } else {
                $('.status-diagram-submission').show();
                $('.status-diagram-netdar').hide();
            }

            var diagram = $(src).parent();

            $(src).next().show();

            var statlist = currentStatus.split('; ');
            var ob = "";
            var pos = [];

            for (var i = 0; i < statlist.length; i++) {
                var stat = statlist[i];
                ob = diagram.find('.filter6.a[actualtext*="' + stat + '"]');
                $(ob).attr("class", $(ob).attr("baseclass") + " selected");
                pos.push(parseInt($(ob).attr("transform").replace("translate(", "").replace(")", "").split(",")[0]));
            }

            ob = diagram.find('.filter6.a[actualtext*="' + statlist[0] + '"]');
            if ($(ob).attr("transform") != undefined && $(ob).attr("transform") != null) {
                var newpos = parseInt($(ob).attr("transform").replace("translate(", "").replace(")", "").split(",")[0]);
                diagram.find('.mainpanel').scrollLeft(Array.min(pos) - 100);
            }
        }

        function showMeSubmissionDiagram(src, currentStatus, svLink) {

        }

        Array.min = function (array) {
            return Math.min.apply(Math, array);
        };
    </script>
</asp:Content>
