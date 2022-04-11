function showHideHistory(src) {

    if ($(src).next().next().css('display') == 'none') {
        $(src).next().next().show();
        positionVisibleModals();
        //$(src).html('Hide workflow history');
    }
    else {
        $(src).next().next().hide(); 
        //$(src).html('Show workflow history');
    }
    positionVisibleModals();
}

function showComments(clientid) {
    $('#' + clientid + '_divPopup').show();

    positionVisibleModals();
    //
}

function showHideStatusVisualisation(src) {

    if ($(src).next().css('display') == 'none') {
        $(src).next().show();
        positionVisibleModals();
        //$(src).html('Hide workflow history');
    }
    else {
        $(src).next().hide();
        //$(src).html('Show workflow history');
    }
    positionVisibleModals();
}

$(document).ready(function () {

    $('#slink')[0].onclick = function () {
        showHideHistory($('#slink'));
    };

    $('#svLink')[0].onclick = function () { showHideStatusVisualisation($('#svLink')); };

});



