<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard4.aspx.cs" Inherits="PwC.Pages.Reporting.NewChartsDasboard.Dashboard4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>  

    <script type="text/javascript">

        $(document).ready(function () {

            google.load("visualization", "1", { packages: ["corechart"], callback: Charts });

        });

        function Charts() {

            var owner = $("#ctl00_MainContent_ddlOwner").val();
            var retur = $("#ctl00_MainContent_ddlReturn").val();
            var year = $("#ctl00_MainContent_ddlYear").val();
            var stage = $("#ctl00_MainContent_drpStatus").val();

            //Progress Summary chart
            $.ajax({
                type: "POST",
                url: "Dashboard4.aspx/Dashboard4Data",
                beforeSend: function (xhr) { xhr.setRequestHeader("Content-type", "application/json; charset=utf-8"); },
                dataType: "json",
                data: "{'owner': " + owner + ",'retur': " + retur + ",'year': '" + year + "','stage': '" + stage + "'}",
                success: function (response) {

                    var dataTable = jQuery.parseJSON(response.d);

                    var options = {
                        width: 930,
                        height: 300,
                        legend: 'none',
                        bar: { groupWidth: '60%' },
                        isStacked: true,
                        colors: ['rgb(57,89,99)', 'rgb(216,225,69)'],
                        chartArea: {'width': '90%', 'height': '80%'},
                        vAxis: {
                            gridlines: { color: 'transparent' },
                            textPosition: 'none'
                        },
                        hAxis: {
                            gridlines: { color: 'transparent' },
                            textStyle: {color: 'black', fontName: 'Arial', fontSize: 12}
                        }
                    };

                    var data = new google.visualization.DataTable();

                    data.addColumn('string', 'level');
                    data.addColumn('number', 'Outstanding');
                    data.addColumn('number', 'Completed');
                    

                    for (var i = 0; i < dataTable.length; i++) {
                        data.addRow([dataTable[i].level, dataTable[i].OutstandingCount, dataTable[i].CompleteCount]);
                    }

                    stackedChart = new google.visualization.ColumnChart(document.getElementById('chartArea'));
                    stackedChart.draw(data, options);
                    
                    function selectHandler() {

                        var selectedItem = stackedChart.getSelection()[0];

                        if (selectedItem) {
                            var sectionText = data.getValue(selectedItem.row, 0);
                            var answerType = data.getColumnLabel(selectedItem.column);

                            $("#ctl00_MainContent_ddlFilter").val(answerType);
                        }

                        getChartDetail(sectionText, answerType);
                    }

                    google.visualization.events.addListener(stackedChart, 'select', selectHandler);
                },
                error: function () {

                }
            });

            //Datasource other data  
            $.ajax({
                type: "POST",
                url: "Dashboard4.aspx/DashboardOtherData",
                beforeSend: function (xhr) { xhr.setRequestHeader("Content-type", "application/json; charset=utf-8"); },
                dataType: "json",
                data: "{'owner': " + owner + ",'retur': " + retur + "}",
                success: function (response) {

                    var data = jQuery.parseJSON(response.d);

                    $("#ctl00_MainContent_lblOwners").html(data.count);

                   
                },
                error: function () {

                }
            });

        }

        function getChartDetail(arg, status) {
            
            var owner = $("#ctl00_MainContent_ddlOwner").val();
            var retur = $("#ctl00_MainContent_ddlReturn").val();
            var year = $("#ctl00_MainContent_ddlYear").val();
            var level = 'Not Set';

            
            if (arg == '') {
                arg = $("#lblSelectedOwnerInfo").html();
            }

            $.ajax({
                type: "POST",
                url: "Dashboard4.aspx/Dashboard4DataDetail",
                beforeSend: function (xhr) { xhr.setRequestHeader("Content-type", "application/json; charset=utf-8"); },
                dataType: "json",
                data: "{'owner': " + owner + ",'retur': " + retur + ",'year': '" + year + "','level': '" + level + "','filter': '" + status + "','levelcode': '" + arg + "' }",
                success: function (response) {

                    $("#divOwnerInfo").html(response.d);         
                    $("#divBottomSection").show();
                    $("#lblSelectedOwnerInfo").html(arg);
                    
                   
                },
                error: function () {

                }
            });
        }

        function SetArgument(data) {
            //alert(data);
            $('#ctl00_MainContent_hdnClickArg').val(data);

            var bb = document.getElementById('ctl00_MainContent_btnClickDummy');
            bb.click();
        }
    </script>
    <div>
        
        <h1 onclick="window.location='Dashboard.aspx'" style="width: 170px; float: left;
            cursor: pointer; color: #d2d2d2; font-size: 14px;">
            High Level Summary</h1>
        <h1 onclick="window.location='Dashboard2.aspx'" style="width: 220px; float: left; color: #d2d2d2;
            cursor: pointer; font-size: 14px;">
            Status Report - submissions</h1>
        
        <h1 onclick="window.location='Dashboard4.aspx'" style="width: 220px; float: left; cursor: pointer;
            font-size: 14px;">
            Status Report - Sign-Off</h1>
        <div style="clear: both;">
        </div>
        <asp:UpdatePanel ID="updDashboard" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlOwner" />
                <asp:AsyncPostBackTrigger ControlID="ddlReturn" />
                <asp:AsyncPostBackTrigger ControlID="btnClickDummy" />
            </Triggers>
            <ContentTemplate>
                <asp:Button runat="server" ID="btnClickDummy" OnClick="btnClickDummy_Click" Style="display: none;" />
                <div id="topSection">
                    <div class="repSection repHeader" style="padding-top:0px; height:92px">
                        <div class="repTitle">
                            Owners</div>
                        <table width="100%" style="font-family: Arial; margin-top: 30px; color: #a32020;
                            font-weight: bold;">
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <td rowspan="2" style="text-align: right; font-size: 32px;color: rgb(57,89,99); font-family: Arial;">
                                    <asp:Label ID="lblOwners" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="color: #6d6e71">
                                    Total Number
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="repSection" style="width: 445px !Important; margin-left: 10px;">
                        <div class="repHeader" style="float: left; width: 195px; color: #a32020; height:82px; ">
                            <div style="float: left;visibility:hidden;">
                                <asp:Label ID="lblCompleteOwners" runat="server" Style="font-size: 24px; margin-top: -10px"></asp:Label><div
                                    style="margin-top: 5px">
                                    Owners with complete actions</div>
                            </div>
                            <div style="float: right">
                                
                            </div>
                            <div style="clear: both">
                            </div>
                        </div>
                        <div style="float: left; border-right: 1px solid #e8c7c7; margin: 10px 5px 10px 0px;
                            padding-right: 5px; height: 70px">
                            &nbsp
                        </div>
                        <div class="repHeader" style="float: left; width: 194px; font-family: Arial; height:82px;">
                            <div style="margin-top: 5px">
                                <div style="float: left">
                                    Owner</div>
                                <asp:DropDownList ID="ddlOwner" runat="server" Width="135px" Style="float: right"
                                    AutoPostBack="false" onchange="Charts();">
                                </asp:DropDownList>
                                <div style="clear: both">
                                </div>
                            </div>
                            <div style="margin-top: 3px">
                                <div style="float: left">
                                    Return</div>
                                <asp:DropDownList ID="ddlReturn" runat="server" Width="135px" Style="float: right"
                                    AutoPostBack="false" onchange="Charts();">
                                </asp:DropDownList>
                                <div style="clear: both">
                                </div>
                            </div>
                            <div style="margin-top: 3px">
                                <div style="float: left">
                                    Year</div>
                                <asp:DropDownList ID="ddlYear" runat="server" Width="135px" Style="float: right"
                                    AutoPostBack="false" onchange="Charts();">
                                </asp:DropDownList>
                                <div style="clear: both">
                                </div>
                            </div>
                            <div style="margin-top: 3px">
                                <div style="float: left">
                                    Stage</div>
                                <asp:DropDownList runat="server" ID="drpStatus" Width="135px" Style="float: right" AutoPostBack="false" onchange="Charts();">
                                    <asp:ListItem Text="NETDAR" Value="NETDAR" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="Submissions" Value="Submissions"></asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div style="clear: both">
                        </div>
                    </div>
                    <div style="clear: both">
                    </div>
                </div>
                <div id="middleSection" style="height: 320px">

                    <div id="chartArea">
                    
                    </div>
                    <%--<dxchartsui:WebChartControl ID="WebChartControl1" runat="server" 
                        DataSourceID="dsSignOff" Height="302px" PaletteName="Palette 1" 
                        OnObjectSelected="WebChartControl1_ObjectSelected" EnableCallBacks="False"
                        SideBySideEqualBarWidth="True" Width="895px">
                        <borderoptions visible="False" />
                        <borderoptions visible="False" />
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx visibleinpanesserializable="-1">
                                    
                                    
                                <tickmarks minorvisible="False" visible="False" /><range sidemarginsenabled="True" /><tickmarks minorvisible="False" visible="False" /><range sidemarginsenabled="True" /></axisx>
                                <axisy visibleinpanesserializable="-1">
                                    
                                    
                                    
                                <tickmarks minorvisible="False" visible="False" /><range sidemarginsenabled="True" /><tickmarks minorvisible="False" visible="False" /><range sidemarginsenabled="True" /><gridlines visible="False">
                                    </gridlines></axisy>
                                <defaultpane bordervisible="False">
                                </defaultpane>
                            </cc1:XYDiagram>
                        </diagramserializable>
                        <fillstyle>
                            <optionsserializable>
                                <cc1:SolidFillOptions />
                            </optionsserializable>
                        </fillstyle>
                        <legend visible="False"></legend>
                        <seriesserializable>
                            <cc1:Series ArgumentDataMember="level" Name="Completed" 
                                ValueDataMembersSerializable="CompleteCount" LegendText="Completed">
                                <viewserializable>
                                    <cc1:StackedBarSeriesView>
                                    </cc1:StackedBarSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:StackedBarSeriesLabel>
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PointOptions>
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:StackedBarSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                            <cc1:Series ArgumentDataMember="level" Name="Outstanding" 
                                ValueDataMembersSerializable="OutstandingCount" LegendText="Outstanding">
                                <viewserializable>
                                    <cc1:StackedBarSeriesView>
                                    </cc1:StackedBarSeriesView>
                                </viewserializable>
                                <labelserializable>
                                    <cc1:StackedBarSeriesLabel>
                                        <fillstyle>
                                            <optionsserializable>
                                                <cc1:SolidFillOptions />
                                            </optionsserializable>
                                        </fillstyle>
                                        <pointoptionsserializable>
                                            <cc1:PointOptions>
                                            </cc1:PointOptions>
                                        </pointoptionsserializable>
                                    </cc1:StackedBarSeriesLabel>
                                </labelserializable>
                                <legendpointoptionsserializable>
                                    <cc1:PointOptions>
                                    </cc1:PointOptions>
                                </legendpointoptionsserializable>
                            </cc1:Series>
                        </seriesserializable>
                        <seriestemplate>
                            <viewserializable>
                                <cc1:StackedBarSeriesView>
                                </cc1:StackedBarSeriesView>
                            </viewserializable>
                            <labelserializable>
                                <cc1:StackedBarSeriesLabel>
                                    <fillstyle>
                                        <optionsserializable>
                                            <cc1:SolidFillOptions />
                                        </optionsserializable>
                                    </fillstyle>
                                    <pointoptionsserializable>
                                        <cc1:PointOptions>
                                        </cc1:PointOptions>
                                    </pointoptionsserializable>
                                </cc1:StackedBarSeriesLabel>
                            </labelserializable>
                            <legendpointoptionsserializable>
                                <cc1:PointOptions>
                                </cc1:PointOptions>
                            </legendpointoptionsserializable>
                        </seriestemplate>
                        <palettewrappers>
                            <dxchartsui:PaletteWrapper Name="Palette 1" ScaleMode="Repeat">
                                <palette>
                                    <cc1:PaletteEntry Color="146, 208, 80" Color2="146, 208, 80" />
                                    <cc1:PaletteEntry Color="217, 217, 217" Color2="217, 217, 217" />
                                </palette>
                            </dxchartsui:PaletteWrapper>
                        </palettewrappers>
                        <crosshairoptions>
                            <commonlabelpositionserializable>
                                <cc1:CrosshairMousePosition />
                            </commonlabelpositionserializable>
                        </crosshairoptions>
                        <tooltipoptions>
                            <tooltippositionserializable>
                                <cc1:ToolTipMousePosition />
                            </tooltippositionserializable>
                        </tooltipoptions>
                    </dxchartsui:WebChartControl>
                    <asp:SqlDataSource ID="dsSignOff" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>" 
                        SelectCommand="uspDashboard3SignOff" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter Name="Username" SessionField="UserName" Type="String" />
                            <asp:SessionParameter Name="Role" SessionField="UserRole" Type="String" />
                            <asp:ControlParameter ControlID="ddlOwner" DefaultValue="0" Name="Owner" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlReturn" DefaultValue="0" Name="Return" 
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlYear" DefaultValue="" Name="year" 
                                PropertyName="SelectedValue" Type="String" />
                            <asp:ControlParameter ControlID="drpStatus" DefaultValue="" Name="stage" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>--%>
                    
                </div>
                <asp:HiddenField ID="hdnClickArg" runat="server" />
                <div id="divBottomSection" style="border-top: 1px dotted #555555; margin-top:25px; padding: 10px; padding-left: 0px; height:24px !important">
                    <label id="lblSelectedOwnerInfo" Style="float: left; font-size:18px !important;"></label>&nbsp
                    <asp:DropDownList runat="server" Style="float: right" ID="ddlFilter" AutoPostBack="false" onchange="getChartDetail('', this.value)">
                        <asp:ListItem>Outstanding</asp:ListItem>
                        <asp:ListItem>Completed</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div id="divOwnerInfo" style="font-family: arial;">
                    <%--<asp:Repeater ID="rptDetailedSubs" runat="server" OnItemDataBound="rptDetailedSubs_OnItemDataBound">
                        <HeaderTemplate>
                            <div class="ownerRow">
                                <div style="float: left" class="ownerRow1 rowHead">
                                    License Condition</div>
                                <div style="float: left" class="ownerRow2 rowHead">
                                    Condition title / Table number</div>
                                <div style="float: left" class="ownerRow3 rowHead">
                                    NETDAR status</div>
                                <div style="float: left" class="ownerRow4 rowHead">
                                    Submission status</div>
                                <div style="float: left" class="ownerRow5 rowHead">
                                    DAG Year</div>
                                <div style="clear: both">
                                </div>
                            </div>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <div class="ownerRow">
                                <div style="float: left" class="ownerRow1">
                                    <asp:Label ID="lblLicenseCondition" runat="server"></asp:Label></div>
                                <div style="float: left" class="ownerRow2">
                                    <asp:Label ID="lblCondTitle" runat="server"></asp:Label></div>
                               
                                <div style="float: left" class="ownerRow3">
                                    <asp:Label ID="lblNETDAR" runat="server"></asp:Label></div>
                                <div style="float: left" class="ownerRow4">
                                    <asp:Label ID="lblSubmission" runat="server"></asp:Label></div>
                                <div style="float: left" class="ownerRow5">
                                    <asp:Label ID="lblDAGYear" runat="server"></asp:Label></div>
                                <div style="clear: both">
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>--%>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
