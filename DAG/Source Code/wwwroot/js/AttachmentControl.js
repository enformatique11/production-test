var PopupInnerClientID = new Array();
var customfieldspopup = new Array();
var svbtnid = new Array();
var upbtnid = new Array();
var upbtnid2 = new Array();
var UploaderPanelID = new Array();
var pnNewAttachment = new Array();
var hidClientID = new Array();
var CustomFieldsDivClientID = new Array();
var CustomFieldsDivClientID2 = new Array();
var modalbackclientid = new Array();

//DMS: on document load overrides the default behaviour of the filename click. The href value of attachments of type "link" is replaced so it points to the specified url as oposed to the file download logic
$(document).ready(function () {
    $('a:contains("#LINK#")').filter(function () {
        var urlLink = $(this).text().replace("#LINK#", "");

        $(this).attr("href", urlLink);
        $(this).attr("target", "_blank");
        $(this).html(urlLink);
    })

    $('a:contains("#N/A#")').filter(function () {
        var text = $(this).text().replace("#N/A#", "");

        $(this).removeAttr("href");
        $(this).html(text);
    })

});

function expand(sPanel, sButton) {
    if (sButton.style.backgroundImage != 'url(../../img/PwCIcons/20x20/minus_icon20.png)') {
        sButton.style.backgroundImage = 'url(../../img/PwCIcons/20x20/plus_icon20.png)';
        $('#' + sPanel + ' .HistoryItem').fadeIn(400);
    } else {
        sButton.style.backgroundImage = 'url(../../img/PwCIcons/20x20/plus_icon20.png)';
        $('#' + sPanel + ' .HistoryItem').fadeOut(400);
    }

    $('#' + sPanel).slideToggle(300);
}



function ExternalAction(obj1, obj2) {

   
    $(obj1).hide();
    $(obj2).show();

}

//DMS: changed behaviour of the "upload new" button click. Instead of opening the file upload popup it open a new pop that allows the user to select the upload type
function showDetailPopup(src, option, xxx) {
    
/*
    var uploadOptionsPopUp = "<div class=\"pnlExtra\">";
    uploadOptionsPopUp += "Please provide a link to any underlying data source supporting this submission. If you do not have a link then please provide a reason.";
    uploadOptionsPopUp += "<div style=\"padding-top:10px\" >I have a link to source data, the link is provided below.</div>";

    uploadOptionsPopUp += "<div style=\"float:left; margin-top:10px;margin-bottom:10px;\"><input id=\"url2Text_" + refType + "\" type=\"text\" style=\"width:685px;\"></div>";
    uploadOptionsPopUp += "<div style=\"clear:both\" >I do not have a link to source data, the reasoning is provided below.</div>";
    uploadOptionsPopUp += "<div style=\"float:left; margin-top:10px;margin-bottom:10px;\"><input id=\"reasonText_" + refType + "\" type=\"text\" style=\"width:685px;\"></div>";

    uploadOptionsPopUp += "</div>";
    */
    var attachmentPanel = $(src).parent().parent().parent().parent()[0];
    var refID = $(attachmentPanel).data('refid');
    var refType = $(attachmentPanel).data('reftype');
    //alert(1);
    
    if (normalAttachmentsMode == 'Full')
    {

    
    $(PopupInnerClientID[xxx]).find('.UploaderPanel').append($(CustomFieldsDivClientID[xxx]+'2'));
    }

    $(PopupInnerClientID[xxx]).prepend($(CustomFieldsDivClientID[xxx]));

   
    //alert(2);



  
      if (option == 'insert') {
        $(hidClientID[xxx]).val(0);
        $(customfieldspopup[xxx] + ' .customfield').each(function () { $(this).val(''); clearDropdownSelection(this); });
        $(svbtnid[xxx]).hide();
        //alert(3);


        $(upbtnid[xxx]).val('Upload');
        $(upbtnid[xxx]).show();
        $(upbtnid2[xxx]).val('Upload');
        $(upbtnid2[xxx]).show();

        $(UploaderPanelID[xxx]).show();

        //alert(4);
    }
    else if (option == 'edit1') {
        var id = $(src).attr('MyID');
        
        $(hidClientID[xxx]).val(id);

        $(svbtnid[xxx]).show();

        $(upbtnid[xxx]).hide();
        $(upbtnid2[xxx]).hide();

        $(UploaderPanelID[xxx]).hide();
       
    }
    else if (option == 'edit2') {
        var id = $(src).attr('MyID');

        $(hidClientID[xxx]).val(id);

        $(svbtnid[xxx]).show();
        $(upbtnid[xxx]).show();
        $(upbtnid[xxx]).val('Save & Upload new version');
    }

    var container = $($(src).parent().parent().parent().children()[2]).children()[0];
    var counter = $(container).children().length - 1;


    for (var i = 0; i <= counter; i++) {
        var cell = $(container).children()[i];
        if (option == 'edit1' || option == 'edit2') {

            var colkey = $(cell).attr('colkey');

            if ($(cell).attr('colvalue') != undefined) {
                var colvalue = '#' + $(cell).attr('colvalue');
                var val = $(cell).html().trim();

                if ($(cell).children().length > 0) {

                    val = $($(cell).children()[0]).html().trim();

                }

                $(colvalue).val(val);

                $(colvalue).find("option:contains('" + val + "')").each(function () {
                    if ($(this).text() == val) {
                        $(this).attr("selected", "selected");
                    }
                });

            }
        }
    }

    var Outer = $(pnNewAttachment[xxx]);
    var OuterStartX = $(src).offset().left
    var OuterStartY = $(src).offset().top;
    var awidth = $(Outer).width();
    var aheight = $(Outer).height();

    $(Outer).width(0);
    $(Outer).height(0);
    $(Outer).css('position', 'absolute');
    $(Outer).css('z-index', '10050');

    var x = (($(window).width() - awidth) / 2) - OuterStartX + $(window).scrollLeft();
    var y = (($(window).height() - aheight) / 2) - OuterStartY + $(window).scrollTop();

    var modalback = $(modalbackclientid[xxx]);
  

        $(Outer).css('left', OuterStartX);
        $(Outer).css('top', OuterStartY);

        $(Outer).attr('orig_left', OuterStartX);
        $(Outer).attr('orig_top', OuterStartY);

        $(modalback).css('opacity', '0');

        $(Outer).animate({ width: '+=' + awidth, height: '+=' + aheight, top: '+=' + y.toString() + 'px', left: '+=' + x.toString() + 'px' }, 250, function () { });
        $(modalback).show();
        $(modalback).animate({ opacity: "0.7" }, 250);
        
        if (normalAttachmentsMode == 'Full' || normalAttachmentsMode=='Half') {
            showUploadOption(xxx, refID, refType);
            positionVisibleModals();
        }
        else {
            //alert(5);
            $(pnNewAttachment[xxx]).css('display', 'block');
            //alert(6);
            positionVisibleModals(); //alert(7);
        }
        
        //

       
        
    return false;
}

//DMS: new function that creates and shows an additional popup that allows the user to select 1 of 3 upload options
function showUploadOption(xxx, refID, refType) {
        
    var uploadOptionsPopUp = "<div class=\"pnlUploadOptions\">";
    uploadOptionsPopUp += "<div class=\"InnerHeader\">Upload Options</div>";
    uploadOptionsPopUp += "<div class=\"InnerPopup\">";
    uploadOptionsPopUp += "<div>Please choose from one of the options below what type of upload you would like to do.</div>";
    uploadOptionsPopUp += "<div style=\"padding:5px;\"><input type=\"radio\" name=\"uploadOption\" value=\"File\">&nbsp;Proceed to file upload</div>";
    //uploadOptionsPopUp += "<div style=\"padding:5px;\"><input type=\"radio\" name=\"uploadOption\" value=\"Link\">&nbsp;Link</div>";
    uploadOptionsPopUp += "<div style=\"padding:5px;\"><input type=\"radio\" name=\"uploadOption\" value=\"Not Required\">&nbsp;File upload not Required</div>";
    uploadOptionsPopUp += "<div style=\"padding:5px; float:left;\"><input type=\"button\" value=\"Cancel\" onclick=\"return hideUploadOption(" + xxx + ");\"></div>";
    uploadOptionsPopUp += "<div style=\"padding:5px; float:right;\"><input type=\"button\" value=\"Next\" onclick=\"return selectUploadOption(" + xxx + ", " + refID + ", '" + refType + "');\"></div>";
    uploadOptionsPopUp += "</div>";
    uploadOptionsPopUp += "</div>";

    var modalback = $(modalbackclientid[xxx]);

    modalback.parent().append(uploadOptionsPopUp);

}

//DMS: hides the new additional popups
function hideUploadOption(xxx) {
    $('.pnlUploadOptions').remove();
    CloseModalGrey(xxx);
}

//DMS: determines what action to take based on selected upload type
//        -if "File" just continue as normal and show the original upload popup
//        -if "Link" show a new popup which allows the user to specify the link url
//        -if "Not Required" ... TODO
function selectUploadOption(xxx, refID, refType) {
    
    var selectedOption = $('input[name=uploadOption]:checked').val();
    
    $('.pnlUploadOptions').remove();

    switch(selectedOption)
    {
        case 'File':
            $(pnNewAttachment[xxx]).css('display', 'block');
            break;
        case 'Link':
            showLinkPopUp(xxx, refID, refType);
            break;
        case 'Not Required':
            showNotRequiredPopUp(xxx, refID, refType);
            break;
    }

    positionVisibleModals();

    return false;
}

//DMS: shows the new link popup (for when Link option is selected)
function showLinkPopUp(xxx, refID, refType) {

    var uploadOptionsPopUp = "<div class=\"pnlUploadOptions\">";
    uploadOptionsPopUp += "<div class=\"InnerHeader\">Upload Link</div>";
    uploadOptionsPopUp += "<div class=\"InnerPopup\">";
    uploadOptionsPopUp += "<div style=\"width:35px; margin-top:5px; float:left;\">URL</div>";
    uploadOptionsPopUp += "<div style=\"float:left;\"><input class=\"urlText_" + refType + "\" type=\"text\" style=\"width:685px;\"></div>";
    uploadOptionsPopUp += "<div style=\"clear:both; height:5px;\"></div>";
    uploadOptionsPopUp += "<div style=\"padding:5px; float:left;\"><input type=\"button\" value=\"Cancel\" onclick=\"return hideUploadOption(" + xxx + ");\"></div>";
    uploadOptionsPopUp += "<div style=\"padding:5px; float:right;\"><input type=\"button\" value=\"Upload\" onclick=\"return uploadLink(" + xxx + ", " + refID + ", '" + refType + "');\"></div>";
    uploadOptionsPopUp += "</div>";
    uploadOptionsPopUp += "</div>";

    var modalback = $(modalbackclientid[xxx]);

    modalback.parent().append(uploadOptionsPopUp);

}

//DMS: upload the link as if it was an attachment. This will create a record on the attachments table of type "link". 
function uploadLink(xxx, refID, refType) {

    var fileName = $('.urlText_' + refType).val();

    $.ajax({
        type: "POST",
        contentType: "application/json; charset=utf-8",
        url: "DataSourceSubmissions.aspx" + "/UploadLink",
        data: "{'refID': " + refID + ", 'refType': '" + refType + "', 'fileName': '" + fileName + "'}",
        dataType: "json",
        success: function (response) {
            window.location = window.location;
        },
        error: function (xhr, ajaxOptions, error) {

        }
    });
    
    hideUploadOption(xxx);

    return false;
}

//DMS: shows not required popup (for when "Not Required" option is selected)
function showNotRequiredPopUp(xxx, refID, refType) {

    var uploadOptionsPopUp = "<div class=\"pnlUploadOptions\">";
    uploadOptionsPopUp += "<div class=\"InnerHeader\">Confirm attachment is not required</div>";
    uploadOptionsPopUp += "<div class=\"InnerPopup\">";
    uploadOptionsPopUp += "<div class=\"valMessage1\">Please enter a reason before proceeding.</div>";
    uploadOptionsPopUp += "<div style=\"margin-top:5px; \">Please explain why it is not applicable to upload a submission (cannot proceed without giving a reason).</div>";
    uploadOptionsPopUp += "<div style=\"clear:both; height:5px;\"></div>";
    uploadOptionsPopUp += "<div style=\"float:left;\"><input class=\"naText_" + refType + "\" type=\"text\" style=\"width:685px;\"></div>";
    uploadOptionsPopUp += "<div style=\"padding:5px; float:left;\"><input type=\"button\" value=\"Cancel\" onclick=\"return hideUploadOption(" + xxx + ");\"></div>";
    uploadOptionsPopUp += "<div style=\"padding:5px; float:right;\"><input type=\"button\" value=\"Upload\" onclick=\"return uploadNotRequired(" + xxx + ", " + refID + ", '" + refType + "');\"></div>";
    uploadOptionsPopUp += "</div>";
    uploadOptionsPopUp += "</div>";

    var modalback = $(modalbackclientid[xxx]);

    modalback.parent().append(uploadOptionsPopUp);

}

//DMS: upload the link as if it was an attachment. This will create a record on the attachments table of type "not required". 
function uploadNotRequired(xxx, refID, refType) {

    //var fileName = $('.urlText_' + refType).val();
    var naReason = $('.naText_' + refType).val();

    if (naReason == "") {
        $('.valMessage1').show();
    }
    else{
        $.ajax({
            type: "POST",
            contentType: "application/json; charset=utf-8",
            url: "DataSourceSubmissions.aspx" + "/UploadNotRequired",
            data: "{'refID': " + refID + ", 'refType': '" + refType + "', 'fileName': '" + naReason + "'}",
            dataType: "json",
            success: function (response) {
                window.location = window.location;
            },
            error: function (xhr, ajaxOptions, error) {

            }
        });

        hideUploadOption(xxx);
    }
    return false;
}

function clearDropdownSelection(src) {
    var isSelect = false;
    $(src).find("option").each(function () {

        $(this).attr("selected", "");
        isSelect = true;
    });

    if (isSelect == true) {
        $(src).val(0);
    }
}

function OpenModalGrey() {
    var modalback = $(modalbackclientid);
    $(modalback).css('opacity', '0');
    $(modalback).show();
    $(modalback).animate({ opacity: "0.7" }, 90);

}
function CloseModalGrey(indexid) {

    var modalback = $(modalbackclientid[indexid]);
    var Outer = $(pnNewAttachment[indexid]);

        $(modalback).animate({ opacity: "0" }, 90, function () { $(modalback).hide(); });
        $(Outer).hide(90);

}


