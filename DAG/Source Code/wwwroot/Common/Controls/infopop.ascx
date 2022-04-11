<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="infopop.ascx.cs" Inherits="PwC.Common.Controls.infopop" %>
<div class="infopopup">
    <div class="infoiconO" onclick="$(this).next().show();">
    </div>
    <div runat="server" id="popupcontent" class="infocontent" onclick="$(this).hide();">
        </div>
</div>
