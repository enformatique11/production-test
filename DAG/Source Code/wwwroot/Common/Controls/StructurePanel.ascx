<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="StructurePanel.ascx.cs" Inherits="PwC.Common.Controls.StructurePanel" %>
<script language="javascript" type="text/javascript">
    function changeTab(sTab, sPanel) 
    {
        var hidCurrentTab = document.getElementById(sPanel + '_currentTab');
        
        var divCurrentTabContent = document.getElementById(sPanel + '_tab_' + hidCurrentTab.value);
        var divTargetTabContent = document.getElementById(sPanel + '_tab_' + sTab);            
        var divCurrentTab = document.getElementById(sPanel + '_' + hidCurrentTab.value);
        var divTargetTab = document.getElementById(sPanel + '_' + sTab);
        
        divCurrentTabContent.style.display = 'none';
        divCurrentTab.className = null;
        
        $('#' + sPanel + '_tab_' + sTab + ' .SectionColumn').fadeIn(400);        
        divTargetTabContent.style.display = 'block';
        divTargetTab.className = 'Selected';
        
        hidCurrentTab.value = sTab;
    }

    function expand(sPanel, sButton) 
    {
        var hidExpanded = document.getElementById(sPanel + '_expanded');
        var divPanel = document.getElementById(sPanel);
        
        if(hidExpanded.value == '0') {
            sButton.style.backgroundImage = 'url(../img/expand_minus.png)';
            hidExpanded.value = '1';
            //divPanel.style.height = null;
            $('#' + sPanel).animate({"height": "100%"}, 400);
            $('#' + sPanel + ' ul').fadeIn(400);
        } else {
            sButton.style.backgroundImage = 'url(../img/expand_plus.png)'
            hidExpanded.value = '0';
            //divPanel.style.height = '64px';
            $('#' + sPanel).animate({"height": "64px"}, 400);
            $('#' + sPanel + ' ul').fadeOut(400);
        }
    }
</script>