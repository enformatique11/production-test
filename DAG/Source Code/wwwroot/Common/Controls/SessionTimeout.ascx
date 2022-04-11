<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SessionTimeout.ascx.cs" Inherits="PwC.Common.Controls.SessionTimeout" %>
<style type="text/css" >
    .coveralert {
        display:none;
        position:fixed;
        left:0px;
        top:0px;
        z-index:9999;
        width:100%;
        height:100%;
        padding:50px;
        background-color:rgba(170,170,170,0.8);
        color:white;
        font-size:20px;

    }
</style>
<script type="text/javascript">

    var startTime;
    var sessionInterval;

    function setTime() {
        startTime = new Date().getTime();
        sessionInterval = true;
    }

    function getTimeoutValue() {
        return parseInt($('#<%= hidTimeoutValue.ClientID %>').val());
    }

    function checkTime() {
        var current = new Date().getTime();
        var minutes = getTimeoutValue() * 60 * 1000;
        var buffer = (2 * 60 * 1000);

        if (current - startTime > minutes) {
            sessionExpired();
        } else if (current - startTime > minutes - buffer) {
            sessionAlert();
        }
    }

    function C_alert(msg) {
        $('.coveralert').html(msg);
        $('.coveralert').show();
    }

    function sessionAlert() {
        if (sessionInterval) {
            sessionInterval = false;
            C_alert('Your session is about to time out. You will be automatically logged out within five minutes. Please click anywhere to remove this message, keep your session active and continue your work. NOTE, you will need to do this on any tabs that you have open for this site.');
        }
    }

    function sessionExpired() {
        //C_alert('Your session has expired. You will need to log in again to continue using the site.');
        location.href = '<%= ResolveUrl("~/Logout.aspx")  %>';
    }

    function bindEvents() {
        setTime();
        setInterval(checkTime, 32170);
    }

    Sys.Application.add_load(bindEvents);


</script>

<asp:HiddenField ID="hidTimeoutValue" runat="server" Value="60" />
<div class="coveralert" onclick="sessionInterval();$(this).hide();" ></div>