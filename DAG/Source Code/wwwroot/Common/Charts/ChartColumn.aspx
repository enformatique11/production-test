<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ChartColumn.aspx.cs" Inherits="PwC.Common.Charts.ChartColumn" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=3.5.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting"
    TagPrefix="asp" %>
    
    <asp:Chart ID="chartColumn" runat="server" ImageType="Png" RenderType="BinaryStreaming" Palette="None"
        AntiAliasing="All" TextAntiAliasingQuality="High">
        <Titles>
            <asp:Title Name="Title" Docking="Top" Alignment="TopCenter" IsDockedInsideChartArea="true" Font="Arial,12pt" />
        </Titles>
        <ChartAreas>
            <asp:ChartArea Name="ca1">
                <Position Height="92" Width="100" X="0" Y="8" />                
                <AxisX IntervalAutoMode="VariableCount" Interval="Auto">
                    <MajorGrid Enabled="false" />
                    <MinorGrid Enabled="false" />
                    <MajorTickMark Enabled="false" />
                    <MinorTickMark Enabled="false" />
                </AxisX>
                <AxisY IntervalAutoMode="VariableCount" Interval="Auto">
                    <MajorGrid Enabled="true" />
                    <MinorGrid Enabled="false" />
                </AxisY>
            </asp:ChartArea>
        </ChartAreas>
    </asp:Chart>