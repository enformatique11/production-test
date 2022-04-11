<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true"
    CodeBehind="Dashboard.aspx.cs" Inherits="PwC.Pages.Reporting.DiogoCharts.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <style type="text/css">

        #divGvBulkEmailUsersList table
        {
            border: none;
            font-size: 0.9em;
        }

        #divGvBulkEmailUsersList th
        {
            background-color: #F2F2F2;
            border: none;
            border-bottom: solid 3px #9AB4CD;
            padding: 6px;
            color: #003B94;
        }

        #divGvBulkEmailUsersList td
        {
            border: none;
            background-color: #F2F2F2;
            padding-left: 5px;
            padding-top:3px;
            padding-bottom: 3px;
        }

    </style>
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
 
            //Progress Summary chart
            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/ProgressChart",
                beforeSend: function (xhr) { xhr.setRequestHeader("Content-type", "application/json; charset=utf-8"); },
                dataType: "json",
                data: "{'owner': " + owner + ",'retur': " + retur + ",'year': '" + year + "'}",
                success: function (response) {

                    var dataTable = jQuery.parseJSON(response.d);

                    var data = new google.visualization.DataTable();

                    data.addColumn('string', 'Status');
                    data.addColumn('number', 'Count');
                    data.addColumn({ type: 'string', role: 'style' });
                    data.addColumn({ type: 'string', role: 'tooltip' });

                    for (var i = 0; i < dataTable.length; i++) {
                        var style;
                        if (dataTable[i].Status == 'Not Started') { style = '#F5080E' }
                        else if (dataTable[i].Status == 'In Progress') { style = '#FCBE00' }
                        else if (dataTable[i].Status == 'Completed') { style = 'rgb(216,225,69)' }

                        data.addRow([dataTable[i].Status, dataTable[i].Count, style, dataTable[i].Status + ': ' + dataTable[i].Count]); //, summaryInfo[i].Value1.toString(), summaryInfo[i].Value2, summaryInfo[i].Value2.toString(), summaryInfo[i].Value3, summaryInfo[i].Value3.toString(), summaryInfo[i].Value4, summaryInfo[i].Value4.toString()]);
                    }

                    var options = {
                        backgroundColor: 'transparent',
                        width: 103,
                        height: 75,
                        colors: ['#F5080E', 'rgb(57,89,99)', 'rgb(216,225,69)'],
                        legend: 'none',
                        tooltip: {textStyle:  {fontSize: 12,bold: false}},
                        chartArea: { 'height': '100%', 'width': '100%' },
                        vAxis: {
                            gridlines: { color: 'transparent' },
                            textPosition: 'none'
                        }

                    };

                    var chart = new google.visualization.ColumnChart(document.getElementById('progress_Chart'));

                    chart.draw(data, options);

                },
                error: function () {

                }
            });

            //Ongoing activities chart
            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/OngoingActivitiesChart",
                beforeSend: function (xhr) { xhr.setRequestHeader("Content-type", "application/json; charset=utf-8"); },
                dataType: "json",
                data: "{'owner': " + owner + ",'retur': " + retur + ",'year': '" + year + "','sectionvalue': '" + 4 + "'}",
                success: function (response) {

                    var dataTable = jQuery.parseJSON(response.d);

                    var data = new google.visualization.DataTable();

                    data.addColumn('string', 'Activities');
                    data.addColumn('number', 'Count');
                    data.addColumn({ type: 'string', role: 'style' });
                    data.addColumn({ type: 'number', role: 'annotation'});

                    for (var i = 0; i < dataTable.length; i++) {
                        
                        var style;
                        if (dataTable[i].Activities == 'Not started') { style = '#F5080E' }
                        else if (dataTable[i].Activities == 'Final Sign Off complete') { style = 'rgb(216,225,69)' }
                        else { style = 'rgb(57,89,99)' }
                       
                        
                        data.addRow([dataTable[i].Activities, dataTable[i].Count,style, dataTable[i].Count]); //, summaryInfo[i].Value1.toString(), summaryInfo[i].Value2, summaryInfo[i].Value2.toString(), summaryInfo[i].Value3, summaryInfo[i].Value3.toString(), summaryInfo[i].Value4, summaryInfo[i].Value4.toString()]);
                    }

                    var options = {
                        width: 430,
                        height: 250,
                        colors: ['#F5080E', 'rgb(57,89,99)', 'rgb(216,225,69)'],
                        legend: 'none',
                        chartArea: { 'height': '80%', 'width': '60%', 'left': '40%' },
                        hAxis: {
                            gridlines: { color: 'transparent' },
                            textPosition: 'none'
                        }
                    };

                    var chart = new google.visualization.BarChart(document.getElementById('activities_chart'));
                    chart.draw(data, options);

                    function selectHandler2() {
                    
                        var selectedItem = chart.getSelection()[0];
                    
                        if (selectedItem) {
                            var text = data.getValue(selectedItem.row, 0);
                            var value = data.getValue(selectedItem.row, 1);
                            $('#risksDetails').hide();
                            $('#activitiesDetails2').hide();
                            activitiesChartDetail(text);
                            
                        }  else {
                            $('#activitiesDetails').hide();
                            $('#activitiesDetails2').hide();
                            $("#risksDetails").hide();
                        }                      
                    }

                    google.visualization.events.addListener(chart, 'select', selectHandler2);

                },
                error: function () {

                }
            });

            //Ongoing activities chart
            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/OngoingActivitiesChart",
                beforeSend: function (xhr) { xhr.setRequestHeader("Content-type", "application/json; charset=utf-8"); },
                dataType: "json",
                data: "{'owner': " + owner + ",'retur': " + retur + ",'year': '" + year + "','sectionvalue': '" + 5 + "'}",
                success: function (response) {

                    var dataTable = jQuery.parseJSON(response.d);

                    var data = new google.visualization.DataTable();

                    data.addColumn('string', 'Activities');
                    data.addColumn('number', 'Count');
                    data.addColumn({ type: 'string', role: 'style' });
                    data.addColumn({ type: 'number', role: 'annotation'});

                    for (var i = 0; i < dataTable.length; i++) {
                        
                        var style;
                        if (dataTable[i].Activities == 'Not started') { style = '#F5080E' }
                        else if (dataTable[i].Activities == 'Final Sign Off complete') { style = 'rgb(216,225,69)' }
                        else { style = 'rgb(57,89,99)' }
                       
                        
                        data.addRow([dataTable[i].Activities, dataTable[i].Count,style, dataTable[i].Count]); //, summaryInfo[i].Value1.toString(), summaryInfo[i].Value2, summaryInfo[i].Value2.toString(), summaryInfo[i].Value3, summaryInfo[i].Value3.toString(), summaryInfo[i].Value4, summaryInfo[i].Value4.toString()]);
                    }

                    var options = {
                        width: 430,
                        height: 250,
                        colors: ['#F5080E', 'rgb(57,89,99)', 'rgb(216,225,69)'],
                        legend: 'none',
                        chartArea: { 'height': '80%', 'width': '60%', 'left': '40%' },
                        hAxis: {
                            gridlines: { color: 'transparent' },
                            textPosition: 'none'
                        }
                        
                    };

                    var chart = new google.visualization.BarChart(document.getElementById('activities_chart2'));
                    chart.draw(data, options);

                    function selectHandler3() {
                    
                        var selectedItem = chart.getSelection()[0];
                    
                        if (selectedItem) {
                            var text = data.getValue(selectedItem.row, 0);
                            var value = data.getValue(selectedItem.row, 1);
                            $('#risksDetails').hide();
                            $('#activitiesDetails2').hide();
                            activitiesChartDetail2(text);
                            
                        }  else {
                            $('#activitiesDetails').hide();
                            $('#activitiesDetails2').hide();
                            $("#risksDetails").hide();
                        }                      
                    }

                    google.visualization.events.addListener(chart, 'select', selectHandler3);

                },
                error: function () {

                }
            });

            //Risk Level chart
            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/RiskLevelChart",
                beforeSend: function (xhr) { xhr.setRequestHeader("Content-type", "application/json; charset=utf-8"); },
                dataType: "json",
                data: "{'owner': " + owner + ",'retur': " + retur + ",'year': '" + year + "'}",
                success: function (response) {

                    var dataTable = jQuery.parseJSON(response.d);

                    var data = new google.visualization.DataTable();

                    data.addColumn('string', 'Risk');
                    data.addColumn('number', 'Count');
                    data.addColumn({ type: 'string', role: 'style' });

                    for (var i = 0; i < dataTable.length; i++) {
                        var style;
                        if (dataTable[i].Risk == 'Low') { style = '#8FCC4E' }
                        else if (dataTable[i].Status == 'Medium') { style = '#FCBE00' }
                        else if (dataTable[i].Status == 'High') { style = '#FF0000' }
                        else if (dataTable[i].Status == 'Critical') { style = '#B20000' }
                        else if (dataTable[i].Status == 'Not Set') { style = '#9AB4CD' }

                        data.addRow([dataTable[i].Risk, dataTable[i].Count, style]); 
                    }

                    var options = {
                        width: 470,
                        height: 250,
                        colors: ['#8FCC4E', '#FCBE00', '#FF0000', '#B20000', '#9AB4CD'],
                        chartArea: { 'height': '90%', 'width': '100%' },
                        pieHole: 0.6
                    };

                    var chart = new google.visualization.PieChart(document.getElementById('risk_chart'));
                    chart.draw(data, options);

                    function selectHandler() {
                    
                        var selectedItem = chart.getSelection()[0];
                    
                        if (selectedItem) {
                            var text = data.getValue(selectedItem.row, 0);
                            var value = data.getValue(selectedItem.row, 1);
                            $('#activitiesDetails').hide();
                            $('#activitiesDetails2').hide();
                            riskLevelChartDetail(text);
                        }  else {
                            $('#activitiesDetails').hide();
                            $('#activitiesDetails2').hide();
                            $("#risksDetails").hide();
                        }                      
                    }

                    google.visualization.events.addListener(chart, 'select', selectHandler);
                },
                error: function () {

                }
            });

            //Datasource other data  
            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/DashboardOtherData",
                beforeSend: function (xhr) { xhr.setRequestHeader("Content-type", "application/json; charset=utf-8"); },
                dataType: "json",
                data: "{'owner': " + owner + ",'retur': " + retur + ",'year': '" + year + "' }",
                success: function (response) {

                    var data = jQuery.parseJSON(response.d);

                    $("#ctl00_MainContent_lblDataSource").html(data.count);
                    $("#ctl00_MainContent_lblPercentComplete").html(data.completePercentage+"%");

                    $('#pccompletebar').css('width',data.completePercentage+"%");

                    $("#top5RisksDiv").html(data.top5RisksHtml);
                   
                },
                error: function () {

                }
            });
        }

        function riskLevelChartDetail(rating) {

            var owner = $("#ctl00_MainContent_ddlOwner").val();
            var retur = $("#ctl00_MainContent_ddlReturn").val();
            var year = $("#ctl00_MainContent_ddlYear").val();
 
            

            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/RiskLevelChart_Detail",
                beforeSend: function (xhr) { xhr.setRequestHeader("Content-type", "application/json; charset=utf-8"); },
                dataType: "json",
                data: "{'owner': " + owner + ",'retur': " + retur + ",'year': '" + year + "','rating': '" + rating + "'}",
                success: function (response) {

                    $("#risksDetails").html(response.d);
                    $("#risksDetails").show();
                   
                },
                error: function () {

                }
            });
        }

         function activitiesChartDetail(rating) {

            var owner = $("#ctl00_MainContent_ddlOwner").val();
            var retur = $("#ctl00_MainContent_ddlReturn").val();
            var year = $("#ctl00_MainContent_ddlYear").val();
 
            

            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/ActivitiesChart_Detail",
                beforeSend: function (xhr) { xhr.setRequestHeader("Content-type", "application/json; charset=utf-8"); },
                dataType: "json",
                data: "{'owner': " + owner + ",'retur': " + retur + ",'year': '" + year + "','rating': '" + rating + "','sectionvalue': '" + 4 + "'}",
                success: function (response) {

                    $("#activitiesDetails").html(response.d);
                    $("#activitiesDetails").show();
                   
                },
                error: function () {
                alert(1);
                }
            });
        }

        function activitiesChartDetail2(rating) {

            var owner = $("#ctl00_MainContent_ddlOwner").val();
            var retur = $("#ctl00_MainContent_ddlReturn").val();
            var year = $("#ctl00_MainContent_ddlYear").val();
 
            

            $.ajax({
                type: "POST",
                url: "Dashboard.aspx/ActivitiesChart_Detail",
                beforeSend: function (xhr) { xhr.setRequestHeader("Content-type", "application/json; charset=utf-8"); },
                dataType: "json",
                data: "{'owner': " + owner + ",'retur': " + retur + ",'year': '" + year + "','rating': '" + rating + "','sectionvalue': '" + 5 + "'}",
                success: function (response) {

                    $("#activitiesDetails2").html(response.d);
                    $("#activitiesDetails2").show();
                   
                },
                error: function () {
                
                }
            });
        }
        

    </script>
    <div>
        <h1 onclick="window.location='Dashboard.aspx'" style="width: 170px; float: left;
            cursor: pointer; font-size: 14px;">
            High Level Summary</h1>
        <h1 onclick="window.location='Dashboard2.aspx'" style="width: 220px; float: left;
            cursor: pointer; color: #d2d2d2; font-size: 14px;">
            Status Report - submissions</h1>
        <h1 onclick="window.location='Dashboard4.aspx'" style="width: 220px; float: left;
            cursor: pointer; color: #d2d2d2; font-size: 14px; cursor: pointer;">
            Status Report - Sign-Off</h1>
        <div style="float: right;">
            <asp:Button ID="btnBulkUserEmail" runat="server" OnClick="btnBulkUserEmail_Click" Text="Bulk User Emailing" Font-Size="Small" />
        </div>
        
        <div style="clear: both;">
        </div>
        <asp:UpdatePanel ID="updDashboard" runat="server">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="ddlOwner" />
                <asp:AsyncPostBackTrigger ControlID="ddlReturn" />
            </Triggers>
            <ContentTemplate>
                <div id="topSection">
                    <div class="repSection repHeader">
                        <div class="repTitle" style="padding-top: 0px;">
                            DAG Status</div>
                        <table width="100%" style="font-family: Arial; margin-top: 20px; color: #555555;">
                            <tr>
                                <td>
                                    Data sources<br />
                                    % completed
                                </td>
                                <td rowspan="2" style="text-align: left; font-size: 32px; width:250px; vertical-align:top; font-family: Arial; font-weight: bold;
                                    color: rgb(57,89,99);">
                                    <div style="position: relative;">
                                        <div style="width: 250px; height: 30px;  background-color:#e2e2e2; position: absolute">
                                            <div id="pccompletebar" style="height: 30px; width:0%; background-color: rgb(216,225,69)">
                                            </div>
                                        </div>
                                        <div style="position: absolute; font-size:16px;  padding-top:7px; padding-left:5px;">
                                            <asp:Label ID="lblPercentComplete" style="float:right" runat="server">0</asp:Label>
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            
                        </table>
                    </div>
                    <div class="repSection" style="width: 445px !Important; margin-left: 10px;">
                        <div class="repHeader" style="float: left; width: 194px; color: #555555">
                            <div style="float: left">
                                <asp:Label ID="lblDataSource" runat="server" Style="font-size: 46px; margin-top: -10px;
                                    color: rgb(57,89,99)"></asp:Label><div style="margin-top: 5px">
                                        Datasources</div>
                            </div>
                            <div id="progress_Chart" style="float: right;">
                                <%--<dxchartsui:WebChartControl ID="WebChartControl3" runat="server" CrosshairEnabled="True"
                                    DataSourceID="dsOverall" Height="75px" PaletteName="CharnOverall" Width="110px"
                                    ToolTipEnabled="True" SideBySideEqualBarWidth="True">
                                    <padding bottom="0" left="0" right="0" top="0" />
                                    <borderoptions visible="False" />
                                    <padding bottom="0" left="0" right="0" top="0" />
                                    <borderoptions visible="False" />
                                    <diagramserializable>
                                <cc1:XYDiagram PaneDistance="0">
                                    <axisx visibleinpanesserializable="-1"><tickmarks minorvisible="False" visible="False" /><tickmarks minorvisible="False" visible="False" /><tickmarks minorvisible="False" visible="False" /><tickmarks minorvisible="False" visible="False" /><tickmarks minorvisible="False" visible="False" /><tickmarks minorvisible="False" visible="False" /><tickmarks minorvisible="False" visible="False" /><tickmarks minorvisible="False" visible="False" /><label Visible="False"><resolveoverlappingoptions minindent="2" /><resolveoverlappingoptions minindent="2" /><resolveoverlappingoptions minindent="2" /><resolveoverlappingoptions minindent="2" /><resolveoverlappingoptions minindent="2" /><resolveoverlappingoptions minindent="2" /></label></axisx>
                                    <axisy visibleinpanesserializable="-1" visible="False"><tickmarks minorvisible="False" visible="False" /><tickmarks minorvisible="False" visible="False" /><tickmarks minorvisible="False" visible="False" /><tickmarks minorvisible="False" visible="False" /><tickmarks minorvisible="False" visible="False" /><tickmarks minorvisible="False" visible="False" /><tickmarks minorvisible="False" visible="False" /><tickmarks minorvisible="False" visible="False" /><label visible="False"></label><gridlines visible="False"></gridlines></axisy>
                                    <margins bottom="0" left="0" right="0" top="0" />
                                    <margins bottom="0" left="0" right="0" top="0" />
                                    <defaultpane bordervisible="False" weight="0.1"></defaultpane>
                                </cc1:XYDiagram>
                            </diagramserializable>
                                    <legend visible="False" alignmenthorizontal="Center" alignmentvertical="TopOutside"
                                        direction="LeftToRight" equallyspaceditems="False">
                                        <border visible="False" />
                                    </legend>
                                    <seriesserializable>
                                <cc1:Series ArgumentDataMember="Status" Name="Series 1" 
                                    ValueDataMembersSerializable="Count">
                                    <viewserializable><cc1:SideBySideBarSeriesView ColorEach="True"></cc1:SideBySideBarSeriesView></viewserializable>
                                    <labelserializable><cc1:SideBySideBarSeriesLabel TextColor="0, 0, 0" Indent="9" 
                                            Position="BottomInside"  ><border visible="False" /><border visible="False" /><border visible="False" /><border visible="False" /><border visible="False" /><border visible="False" /><border visible="False" /><border visible="False" /></cc1:SideBySideBarSeriesLabel></labelserializable>
                                </cc1:Series>
                            </seriesserializable>
                                    <palettewrappers>
                                <dxchartsui:PaletteWrapper Name="CharnOverall" ScaleMode="Repeat">
                                    <palette><cc1:PaletteEntry Color="191, 191, 191" Color2="191, 191, 191" /><cc1:PaletteEntry Color="254, 192, 0" Color2="254, 192, 0" /><cc1:PaletteEntry Color="92, 207, 80" Color2="92, 207, 80" /></palette>
                                </dxchartsui:PaletteWrapper>
                            </palettewrappers>
                                </dxchartsui:WebChartControl>
                                <asp:SqlDataSource ID="dsOverall" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
                                    SelectCommand="uspDashboardDataSourceProgress" SelectCommandType="StoredProcedure">
                                    <SelectParameters>
                                        <asp:SessionParameter DefaultValue="" Name="Username" SessionField="UserName" Type="String" />
                                        <asp:SessionParameter DefaultValue="" Name="Role" SessionField="UserRole" Type="String" />
                                        <asp:ControlParameter ControlID="ddlOwner" DefaultValue="0" Name="Owner" PropertyName="SelectedValue"
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlReturn" DefaultValue="0" Name="Return" PropertyName="SelectedValue"
                                            Type="Int32" />
                                        <asp:ControlParameter ControlID="ddlYear" DefaultValue="0" Name="year" PropertyName="SelectedValue"
                                            Type="String" />
                                    </SelectParameters>
                                </asp:SqlDataSource>--%>
                            </div>
                            <div style="clear: both">
                            </div>
                        </div>
                        <div style="float: left; border-right: 1px solid #e8c7c7; margin: 10px 5px 10px 0px;
                            padding-right: 5px; height: 70px">
                            &nbsp
                        </div>
                        <div class="repHeader" style="float: left; width: 195px; font-family: Arial">
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
                        </div>
                        <div style="clear: both">
                        </div>
                    </div>
                    <div style="clear: both">
                    </div>
                </div>
                <div id="midSection">
                    <div class="repSectionChart repChart" >
                        <div class="repTitle">
                            Ongoing activities - NET DAR
                        </div>
                        <div>
                            <div id="activities_chart" style="width: 428px; height: 250px">
                            </div>
                        </div>
                        <div style="">
                            &nbsp
                        </div>
                    </div>
                    <div class="repSectionChart repChart">
                        <div class="repTitle">
                            Risk Level
                        </div>
                        <div id="risk_chart" style="width: 435px;">
                        </div>
                    </div>
                    <div style="clear: both;">
                    </div>
                    <div id="risksDetails" style="max-height: 200px; overflow-y: auto; display: none;">
                    </div>
                    <div id="activitiesDetails" style="max-height: 200px; overflow-y: auto; display: none;">
                    </div>
                    <div id="activitiesDetails2" style="max-height: 200px; overflow-y: auto; display: none;">
                    </div>
                    <div style="clear: both;">
                    </div>
                    <div class="repSectionChart repChart" style="z-index:1; margin-top:56px;" >
                        <div class="repTitle">
                            Ongoing activities - Submissions
                        </div>
                        <div>
                            <div id="activities_chart2" style="width: 428px; height: 250px">
                            </div>
                        </div>
                        <div class="repTitleSub">
                                &nbsp;
                            </div>
                    </div>
                    <div class="repSectionChart repChart" style="">
                        <div class="repTitleSub">
                            &nbsp;
                        </div>
                        <div style="margin-top: 10px; height: 300px">
                            <div class="repTitle">
                                Top 5 focus areas
                            </div>
                            <div id="top5RisksDiv" style="height: 226px; padding-top: 20px; z-index:999;">
                                &nbsp
                            </div>
                            <div class="repTitleSub">
                                &nbsp;
                            </div>
                        </div>
                    </div>
                </div>
                <div style="clear: both">
                </div>
                
                <div style="clear: both">
                </div>

            </ContentTemplate>
        </asp:UpdatePanel>
        
        <%--      <div id="RisksPopUp" style="display:none; top position:absolute; border:1px solid black; width:450px; height:183px; background-color:#FBF0E5; " >
        
            <div style="height:25px; border-bottom:1px solid black; text-align:center; padding-top:7px; "><b>Risks List</b></div>
            <div style="padding-left:10px;">
                
                <label id="risksDetails"></label>
                
            </div>      
        
        </div>--%>
    </div>
    <div style="clear: both">
    </div>

    <div id="divBulkEmailModal" runat="server" visible="false">
        <div class="modal-fill" style="background-color: #939598;">
        </div>
        <div class="modal" style="width: 500px; position: fixed;">
            <div class="modal-title">
                Bulk Emailing</div>
            <div class="modal-content">
                
                <div style="float: left; width: 480px; margin: 10px 0 0 0;">
                    <div style="margin: 5px 20px 0 0;">
                        <label style="font-size: 12pt;">Recipient List:</label>
                    </div>

                    <div style="margin: 10px 0 0 0;">
                        <asp:TextBox ID="txtRecipientList" runat="server" Width="477" onfocus="javascript:this.select();" Font-Size="Small"></asp:TextBox>
                    </div>
                </div>
                
                <div style="float: left; width: 480px; margin: 20px 0 0 0;">
                    <div style="margin: 0 0 10px 0;">
                        <label style="font-size: 12pt;">Users included in list:</label>
                    </div>

                    <div id="divGvBulkEmailUsersList" style="max-height: 250px; overflow-y:auto;">
                        <asp:GridView ID="gvBulkEmailUsersList" runat="server" CssClass="gridview" EmptyDataText="No users found with email addresses" 
                            OnRowDataBound="gvBulkEmailUsersList_RowDataBound" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField HeaderText="Name" DataField="FullName" ItemStyle-Width="100" />
                                <asp:BoundField HeaderText="Email" DataField="Email"  ItemStyle-Width="150" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
                

                <div style="float: left; width: 480px; margin: 20px 0 0 0;">
                    <asp:Button ID="btnCloseBulkEmailingModal" runat="server" OnClick="btnCloseBulkEmailingModal_Click" Text="Close" CssClass="CloseBtn" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
