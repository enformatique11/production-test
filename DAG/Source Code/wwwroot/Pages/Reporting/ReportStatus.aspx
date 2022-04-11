<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/PwCMaster.Master"
    CodeBehind="ReportStatus.aspx.cs" Inherits="PwC.Pages.Reporting.ReportStatus" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">

    <script language="javascript" type="text/javascript">
        function CheckBoxListSelect(cbControl, state) {
            var chkBoxList = document.getElementById(cbControl);
            var chkBoxCount = chkBoxList.getElementsByTagName("input");
            for (var i = 0; i < chkBoxCount.length; i++) {
                chkBoxCount[i].checked = state;
            }

            return false;
        }
    </script>

</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<h1>Reports</h1> 
    <p>
        Please use the drop-down lists below to set the report population criteria.
    </p>

    <div style="padding-bottom:10px; background-color:#F7F7F7;">
        <pwc:FilterPanel ID="PageFilter" runat="server" FilterTitle="Filter Results" ShowSearchButton="false">
            <pwc:FilterRow ID="FilterRow1" runat="server">
                <div class="fItemLbl">
                    Quadrant</div>
                <div class="fItemCtl">
                    <asp:DropDownList ID="drpQuadrant" runat="server" Width="183px" />
                </div>
                <div class="fItemLbl">
                    Area of reporting</div>
                <div class="fItemCtl">
                    <asp:DropDownList ID="drpProspectus" runat="server" Width="183px" />
                </div>
                <div class="fItemLbl">
                    Supporting Message</div>
                <div class="fItemCtl">
                    <asp:DropDownList ID="drpSupportingMessage" runat="server" Width="183px" />
                </div>
            </pwc:FilterRow>   
            <pwc:FilterRow ID="FilterRow2" runat="server">
                <div class="fItemLbl">
                    Status</div>
                <div class="fItemCtl">
                    <asp:DropDownList ID="drpProgressStatus" runat="server" Width="183px">
                        <asp:ListItem Text="All" Value="All"></asp:ListItem>
                        <asp:ListItem Text="In Progress" Value="InProgress"></asp:ListItem>
                        <asp:ListItem Text="Not In Progress" Value="NotInProgress"></asp:ListItem>                    
                    </asp:DropDownList>
                </div>
                <div class="fItemLbl">
                    Other Options</div>
                <div class="fItemCtl">
                    <asp:DropDownList ID="drpMetrics" runat="server" Width="183px">
                        <asp:ListItem Text="All Metrics" Value="All"></asp:ListItem>
                        <asp:ListItem Text="Metrics With Deficiencies Only" Value="MetricsWithDeficiencies"></asp:ListItem>                                        
                    </asp:DropDownList>
                </div>
            </pwc:FilterRow>             
        </pwc:FilterPanel>
    </div>
  
    <p>Please find descriptions for each report below.</p>
    
    <div style="margin-top:10px; overflow:hidden; clear:both;"> 
        <div style="clear:both; overflow:hidden; margin-bottom:20px;">
            <div style="float:left; width:430px">
                <h3 style="margin-bottom:5px; color:#e0301e;">1. Data Residency Matrix</h3>            
                <p style="margin-top:2px;">
                    This report allows the Client to understand where the data that informs each metric resides within the business.
                </p>
                <asp:CheckBox ID="chkDataResidencyMatrix" runat="server" Text="Tick to include in report" />
            </div>  
            <div style="float:right; width:430px;">
                <h3 style="margin-bottom:5px; color:#e0301e;">2. Data Dictionary and Controls</h3>            
                <p style="margin-top:2px;">
                    This is the central record of the detailed data requirements for each KPI and also links these to the source systems.
                </p>
                <asp:CheckBox ID="chkDataDictionaryAndControls" runat="server" Text="Tick to include in report" />
            </div>  
        </div>   
        <div style="clear:both; overflow:hidden; margin-bottom:20px;">
            <div style="float:left; width:430px;">
                <h3 style="margin-bottom:5px; color:#e0301e;">3. Data Owners, Stewards and Managers</h3>            
                <p style="margin-top:2px;">
                    This report contains the names of data owners, stewards and managers relevant to each metric.
                </p>
                <asp:CheckBox ID="chkDataOwnersAndStewards" runat="server" Text="Tick to include in report" />
            </div>  
            <div style="float:right; width:430px;">
                <h3 style="margin-bottom:5px; color:#e0301e;">4. Performance against Quality Requirements</h3>            
                <p style="margin-top:2px;">
                    This report shows each metric with aggregated information on the number of quality requirements, data sources and controls in place.
                </p>
                <asp:CheckBox ID="chkPerformanceAgainstQualityRequirements" runat="server" Text="Tick to include in report" />
            </div> 
        </div>                
    </div>  
    
    <div style="margin-bottom:20px; font-family:Arial;">
        <a href="../../Resources/Data Directory Reports Glossary v2.pptx">Click here to download the reports glossary</a>
    </div>
    
    <asp:Button ID="btnGenerate" runat="server" Height="24px" Width="160px" Text="Generate Excel Report"
                    OnClick="btnReportGenerate_Click" />
    
    <%--<p>Please select the reports you would like to export into excel.</p>
    
    <div class="formPanel">
        <div>
            <div class="formPanelRow_auto" style="margin: 10px 0px 10x 0px;">
                <h3>
                    Data Reports</h3>
                <a id="selectAll" href="#" runat="server" onclick="javascript:CheckBoxListSelect('ctl00_MainContent_chkFieldList', true)"
                    class="links">Select All</a> | <a id="deSelectAll" href="#" runat="server" onclick="javascript:CheckBoxListSelect('ctl00_MainContent_chkFieldList', false)"
                        class="links">De-Select All</a>
            </div>
            <div class="formPanelRow_auto" style="margin-bottom: 15px;">
                <asp:CheckBoxList ID="chkFieldList" runat="server" TextAlign="Right" RepeatLayout="Table"
                    RepeatDirection="Horizontal" RepeatColumns="4" CssClass="checkBoxListHorizontal">
                    <asp:ListItem Text="Data Residency Matrix" Value="DataResidencyMatrix"></asp:ListItem>
                    <asp:ListItem Text="Data Dictionary And Controls" Value="DataDictionaryAndControls"></asp:ListItem>
                    <asp:ListItem Text="Data Owners and Stewards" Value="DataOwnersAndStewards"></asp:ListItem>
                    <asp:ListItem Text="Performance against Quality Requirements" Value="PerformanceAgainstQualityRequirements"></asp:ListItem>    
                    <asp:ListItem Text="Quadrant Summary" Value="QuadrantSummary"></asp:ListItem>
                </asp:CheckBoxList>
            </div>
            <div class="controls" style="padding-bottom: 10px;">
                
            </div>
        </div>
    </div>--%>
</asp:Content>
