function ToggleGridViewRow(gridCtrlID)
{
     $('table[id$='+ gridCtrlID +']').find('img').attr("src", "../../../img/PwCIcons/20x20/plus_icon20.png");
     $('table[id$='+ gridCtrlID +']').find('img').click(function() { 
        var $imgCtrl = $(this);
        $imgCtrl.parent().parent().siblings("#ClusterMembers").slideToggle(300);
                                        
        if($imgCtrl.attr("src") == "../../../img/PwCIcons/20x20/plus_icon20.png")
        {
            $imgCtrl.attr("src", "../../../img/PwCIcons/20x20/minus_icon20.png");
            $imgCtrl.attr("alt", "Collapse");
        }
        else
        {
            $imgCtrl.attr("src", "../../../img/PwCIcons/20x20/plus_icon20.png");
            $imgCtrl.attr("alt", "Expand");
        }
        
    });
}

function showModal(ctrlID)
{
    $('#' + ctrlID).show();
}
        
function hideModal(ctrlID)
{           
    $('#' + ctrlID).hide();
}
