<%@ Page Title="" Language="C#" MasterPageFile="~/PwCMaster.Master" AutoEventWireup="true" CodeBehind="Dashboard2.aspx.cs" Inherits="PwC.Pages.Reporting.NewChartsDasboard.Dashboard2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript" src="https://www.google.com/jsapi"></script>  

    <script type="text/javascript">

        $(document).ready(function () {

            $("#divBottomSection").hide();
            google.load("visualization", "1", { packages: ["corechart"], callback: Charts });

        });

        function Charts() {

            var owner = $("#ctl00_MainContent_ddlOwner").val();
            var retur = $("#ctl00_MainContent_ddlReturn").val();
            var year = $("#ctl00_MainContent_ddlYear").val();
 
            //Progress Summary chart
            $.ajax({
                type: "POST",
                url: "Dashboard2.aspx/Dashboard2Data",
                beforeSend: function (xhr) { xhr.setRequestHeader("Content-type", "application/json; charset=utf-8"); },
                dataType: "json",
                data: "{'owner': " + owner + ",'retur': " + retur + ",'year': '" + year + "'}",
                success: function (response) {

                    var dataTable = jQuery.parseJSON(response.d);

                    var data = new google.visualization.DataTable();

                    data.addColumn('string', 'Fullname');
                    data.addColumn('number', 'InCompleteCount');
                    data.addColumn('number', 'CompleteCount');

                    var foCount = 0;
                    var fblCount = 0;
                    var woCount = 0;
                    var wblCount = 0;
                    var emCount = 0;


                    for (var i = 0; i < dataTable.length; i++) {
                        if (dataTable[i].level == "Finance owner") {
                            foCount += 1;
                        }
                        else if (dataTable[i].level == "Finance business lead") {
                            fblCount += 1;
                        }
                        else if (dataTable[i].level == "Workload owner") {
                            woCount += 1;
                        }
                        else if (dataTable[i].level == "Workload business lead") {
                            wblCount += 1;
                        }
                        else if (dataTable[i].level == "Exec member") {
                            emCount += 1;
                        }
                    }

                    var total = foCount + fblCount + woCount + wblCount + emCount;


                    $("#test1").css("width", (foCount / total * 100) + "%")
                    $("#test2").css("width", (fblCount / total * 100) + "%")
                    $("#test3").css("width", (woCount / total * 100) + "%")
                    $("#test4").css("width", (wblCount / total * 100) + "%")
                    $("#test5").css("width", (emCount / total * 100) + "%")

                    if (foCount == 0) { $("#test1").css("display", 'none'); } else { $("#test1").css("display", ''); }
                    if (fblCount == 0) { $("#test2").css("display", 'none'); } else { $("#test2").css("display", ''); }
                    if (woCount == 0) { $("#test3").css("display", 'none'); } else { $("#test3").css("display", ''); }
                    if (wblCount == 0) { $("#test4").css("display", 'none'); } else { $("#test4").css("display", ''); }
                    if (emCount == 0) { $("#test5").css("display", 'none'); } else { $("#test5").css("display", ''); }


                    for (var i = 0; i < dataTable.length; i++) {

                        data.addRow([dataTable[i].Grouping, dataTable[i].InCompleteCount, dataTable[i].CompleteCount]); 
                        
                        //, summaryInfo[i].Value1.toString(), summaryInfo[i].Value2, summaryInfo[i].Value2.toString(), summaryInfo[i].Value3, summaryInfo[i].Value3.toString(), summaryInfo[i].Value4, summaryInfo[i].Value4.toString()]);
                    }

                    var options = {
                        backgroundColor: 'transparent',
                        width: 900,
                        height: 300,
                        colors: ['rgb(57,89,99)','rgb(216,225,69)'],
                        legend: 'none',
                        isStacked: true,
                        tooltip: { textStyle: { fontSize: 12, bold: false} },
                        chartArea: { 'height': '99%', 'width': '100%' },
                        vAxis: {
                            gridlines: { color: 'transparent' },
                            textPosition: 'none'
                        },
                        hAxis: {
                            gridlines: { color: 'transparent' },
                            textPosition: 'none'
                        }
                    };

                    var chart = new google.visualization.ColumnChart(document.getElementById('middleSection'));

                    chart.draw(data, options);

                    function selectHandler() {
                   
                        var selectedItem = chart.getSelection()[0];
                       
                        if (selectedItem) {
                            var text = data.getValue(selectedItem.row, 0);
                            var value = data.getValue(selectedItem.row, 1);
                            
                            var status = selectedItem.column==1 ? 'Outstanding' : 'Completed';
                            $("#ctl00_MainContent_ddlFilter").val(status);

                            getChartDetail(text, status);
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
                url: "Dashboard2.aspx/DashboardOtherData",
                beforeSend: function (xhr) { xhr.setRequestHeader("Content-type", "application/json; charset=utf-8"); },
                dataType: "json",
                data: "{'owner': " + owner + ",'retur': " + retur + ",'year': '" + year + "'}",
                success: function (response) {

                    var data = jQuery.parseJSON(response.d);

                    $("#ctl00_MainContent_lblOwners").html(data.count);

                   
                },
                error: function () {

                }
            });

        }

        function getChartDetail(arg, status) {
            
            if (arg == '') {
                arg = $("#lblSelectedOwnerInfo").html();
            }

            var owner = $("#ctl00_MainContent_ddlOwner").val();
            var retur = $("#ctl00_MainContent_ddlReturn").val();
            var year = $("#ctl00_MainContent_ddlYear").val();
 
            $.ajax({
                type: "POST",
                url: "Dashboard2.aspx/Dashboard2DataDetail",
                beforeSend: function (xhr) { xhr.setRequestHeader("Content-type", "application/json; charset=utf-8"); },
                dataType: "json",
                data: "{'arg': '" + arg + "','filter': '" + status + "','owner': " + owner + ",'retur': " + retur + ",'year': '" + year + "'}",
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
        <h1 onclick="window.location='Dashboard2.aspx'" style="width: 220px; float: left;
            cursor: pointer; font-size: 14px;">
            Status Report - submissions</h1>
        
        <h1 onclick="window.location='Dashboard4.aspx'" style="width: 220px; float: left; 
            color: #d2d2d2; font-size: 14px;cursor: pointer;">
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
                    <div class="repSection repHeader">
                        <div class="repTitle" style="padding-top:0px;">
                            Owners</div>
                        <table width="100%" style="font-family: Arial; margin-top: 20px; color: #555555;
                            font-weight: bold;">
                            <tr>
                                <td>
                                    Owners
                                </td>
                                <td rowspan="2" style="text-align: right; font-size: 32px; font-family: Arial;color: rgb(57,89,99);">
                                    <asp:Label ID="lblOwners" runat="server">0</asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="color: #555555">
                                    Total Number
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div class="repSection" style="width: 445px !Important; margin-left: 10px;">
                        <div class="repHeader" style="float: left; width: 195px; color: #a32020; ">
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
                        <div class="repHeader" style="float: left; width: 194px; font-family: Arial">
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
                <div id="middleSection" style="height: 300px">
<%--                    <dxchartsui:WebChartControl ID="WebChartControl1" runat="server" CrosshairEnabled="True"
                        DataSourceID="dsOwnersRisk" Height="292px" OnObjectSelected="WebChartControl1_ObjectSelected"
                        PaletteName="Palette 1" Width="897px">
                        <borderoptions visible="False" />
                        <borderoptions visible="False" />
                        <borderoptions visible="False" />
                        <diagramserializable>
                            <cc1:XYDiagram>
                                <axisx visible="False" visibleinpanesserializable="-1">
                                    <constantlines>
                                        <cc1:ConstantLine AxisValueSerializable="a -  " Name="Finance owners" 
                                            Title-Alignment="Far" Title-Font="Tahoma, 10pt, style=Bold" 
                                            Title-TextColor="128, 128, 128">
                                        </cc1:ConstantLine>
                                        <cc1:ConstantLine AxisValueSerializable="b -  " Name="Finance business leads" 
                                            Title-Alignment="Far" Title-Font="Tahoma, 10pt, style=Bold" 
                                            Title-TextColor="128, 128, 128">
                                        </cc1:ConstantLine>
                                        <cc1:ConstantLine AxisValueSerializable="c -  " Name="Workload owners" 
                                            Title-Alignment="Far" Title-Font="Tahoma, 10pt, style=Bold" 
                                            Title-TextColor="128, 128, 128">
                                        </cc1:ConstantLine>
                                        <cc1:ConstantLine AxisValueSerializable="d -  " Name="Workload business leads" 
                                            Title-Alignment="Far" Title-Font="Tahoma, 10pt, style=Bold" 
                                            Title-TextColor="128, 128, 128">
                                        </cc1:ConstantLine>
                                        <cc1:ConstantLine AxisValueSerializable="e -  " Color="128, 128, 128" 
                                            Name="Exec members" Title-Alignment="Far" Title-Font="Tahoma, 10pt, style=Bold" 
                                            Title-TextColor="128, 128, 128">
                                            <linestyle dashstyle="Solid" />
                                            <linestyle dashstyle="Solid" />
                                            <linestyle dashstyle="Solid" />
                                        </cc1:ConstantLine>
                                    </constantlines>
                                    <label visible="False">
                                    </label>
                                </axisx>
                                <axisy visible="False" visibleinpanesserializable="-1">
                                    <gridlines visible="False">
                                    </gridlines>
                                </axisy>
                                <margins bottom="6" left="6" right="6" top="6" />
                                <margins bottom="6" left="6" right="6" top="6" />
                                <margins bottom="6" left="6" right="6" top="6" />
                                <defaultpane bordervisible="False">
                                </defaultpane>
                            </cc1:XYDiagram>
                        </diagramserializable>
                        <legend visible="False"></legend>
                        <seriesserializable>
                            <cc1:Series ArgumentDataMember="Grouping" Name="Series" 
                                ValueDataMembersSerializable="TotalCount">
                                <viewserializable>
                                    <cc1:SideBySideBarSeriesView>
                                        <border visible="False" />
                                        <border visible="False" />
                                        <border visible="False" />
                                    </cc1:SideBySideBarSeriesView>
                                </viewserializable>
                            </cc1:Series>
                        </seriesserializable>
                        <palettewrappers>
                            <dxchartsui:PaletteWrapper Name="Palette 1" ScaleMode="Repeat">
                                <palette>
                                    <cc1:PaletteEntry Color="255, 182, 0" Color2="255, 182, 0" />
                                </palette>
                            </dxchartsui:PaletteWrapper>
                        </palettewrappers>
                        <clientsideevents objectselected="
                        function(s,e) 
                        { 
                        var hitInCategory = e.hitInfo.inSeries; 
                        var hitInBackTitle = e.hitInfo.inChartTitle;
                        if (hitInCategory) 
                            SetArgument(e.additionalHitObject.argument); 
                        else if(hitInBackTitle)
                            SetSummaryKindVisible(e.additionalHitObject.argument); 
                        e.processOnServer = hitInCategory || hitInBackTitle; 
}" />
                        <clientsideevents objectselected="
                        function(s,e) 
                        { 
                        var hitInCategory = e.hitInfo.inSeries; 
                        var hitInBackTitle = e.hitInfo.inChartTitle;
                        if (hitInCategory) 
                            SetArgument(e.additionalHitObject.argument); 
                        else if(hitInBackTitle)
                            SetSummaryKindVisible(e.additionalHitObject.argument); 
                        e.processOnServer = hitInCategory || hitInBackTitle; 
}" />
                    </dxchartsui:WebChartControl>
                    <asp:SqlDataSource ID="dsOwnersRisk" runat="server" ConnectionString="<%$ ConnectionStrings:DagDirectoryWWU %>"
                        SelectCommand="uspDashboard2" SelectCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:SessionParameter DefaultValue="" Name="Username" SessionField="UserName" Type="String" />
                            <asp:SessionParameter DefaultValue="" Name="Role" SessionField="UserRole" Type="String" />
                            <asp:ControlParameter ControlID="ddlReturn" DefaultValue="0" Name="regulationid"
                                PropertyName="SelectedValue" Type="Int32" />
                            <asp:ControlParameter ControlID="ddlOwner" DefaultValue="0" Name="ownerid" PropertyName="SelectedValue"
                                Type="Int32" />
                                <asp:ControlParameter ControlID="ddlYear" DefaultValue="0" Name="year" PropertyName="SelectedValue"
                                Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>--%>
                </div>
                <div style="width:900px; height:40px ">
                    <div id="test1" style="float:left; text-align:center;">Finance owners</div>
                    <div id="test2" style="float:left; text-align:center;">Finance business leads</div>
                    <div id="test3" style="float:left; text-align:center;">Workload owners</div>
                    <div id="test4" style="float:left; text-align:center;">Workload business leads</div>
                    <div id="test5" style="float:left; text-align:center;">Exec owners</div>
                </div>
                <asp:HiddenField ID="hdnClickArg" runat="server" />
                <div id="divBottomSection" style="border-top: 1px dotted #555555; margin-top:25px; padding: 10px; padding-left: 0px; height:24px !important">
                    <label id="lblSelectedOwnerInfo" style="float: left; font-size:18px !important;" ></label>&nbsp
                    <asp:DropDownList runat="server" Style="float: right" ID="ddlFilter" AutoPostBack="false" onchange="getChartDetail('', this.value)">
                        <asp:ListItem>Outstanding</asp:ListItem>
                        <asp:ListItem>Completed</asp:ListItem>
                    </asp:DropDownList>
                </div>
                <div id="divOwnerInfo" style="font-family: arial;">
                    <asp:Repeater ID="rptOwnerInfo" runat="server" OnItemDataBound="rptOwnerInfo_OnItemDataBound">
                        <HeaderTemplate>
                            <div class="ownerRow">
                                <div style="float: left" class="ownerRow1 rowHead">
                                    License Condition</div>
                                <div style="float: left" class="ownerRow2 rowHead">
                                    Condition title / Table number</div>
                                <div style="float: left" class="ownerRow3 rowHead">
                                    NetDAR status</div>
                                <div style="float: left" class="ownerRow4 rowHead">
                                    Submission status</div>
                                
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
                               
                                <div style="float: left" class="ownerRow4">
                                    <asp:Label ID="lblStage1Status" runat="server"></asp:Label></div>
                                <div style="float: left" class="ownerRow5">
                                    <asp:Label ID="lblStage2Status" runat="server"></asp:Label></div>
                                <div style="clear: both">
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
</asp:Content>
