function showMetricsGrid(sender, metricIndex, metricName, btnAsync) {
    var containerID;

    if (sender.id == '') {
        containerID = $(sender).parent().parent().parent().parent().parent().attr('id');
    } else {
        containerID = $(sender).parent().parent().parent().parent().attr('id');
    }
    
    var offset = $(sender).parent().offset();
    
    offset.left += 30;
    offset.top += 5;
    
    var subGrid = $('#' + containerID + ' .SubGrid');
    subGrid.css({ "top": offset.top, "left": offset.left });
    subGrid.width($(sender).parent().width() - 4);

    metricIndex.value = $(sender).parent().attr('dbindex');
    metricName.value = $(sender).parent().attr('dbname');

    subGrid.find('.HGridHRow .ColTypeA').text(metricName.value);
    subGrid.find('.HGridContent #divRpt').hide();
    subGrid.find('.HGridContent #divWaitMsg').show();    
    
    subGrid.show();
    $('#' + containerID + ' .SubGrid .HGridRow').fadeIn(speed);
    $('#' + containerID + ' .SubGrid .HGridContent').slideDown(speed);
    
    btnAsync.click();        
}

function hideMetricsGrid(sender) {          
    var subGrid = $(sender).parent().parent();
    
    $('#' + subGrid.attr('id') + ' .HGridRow').fadeOut(speed);
    $('#' + subGrid.attr('id') + ' .HGridContent').slideUp(speed, function() {
        subGrid.hide();
    });
}

//        function show(sender) {
//        var containerID = $(sender).parent().parent().parent().parent().attr('id');       
//        var offset = $(sender).parent().offset();
//        
//        offset.left += 30;
//        offset.top += 5;
//        
//        var subGrid = $('#' + containerID + ' #divSubGrid');
//        subGrid.css({ "top": offset.top, "left": offset.left });
//        subGrid.width($(sender).parent().width() - 4);
//        //$('.HGridContent').first().addClass('Fade');
//        subGrid.show();
//        
//        //$('#divSubGrid .HGridRow').fadeIn(speed);
//        //$('#divSubGrid .HGridContent').slideDown(speed);
//        $('#' + containerID + ' #divSubGrid .HGridRow').fadeIn(speed);
//        $('#' + containerID + ' #divSubGrid .HGridContent').slideDown(speed);
//         
//        $get('<%= _hidMetricIndex.ClientID %>').value = $(sender).parent().attr('dbindex');
//        $get('<%= _hideMetricName.ClientID %>').value = $(sender).parent().attr('dbname');
//        
//        $get('<%= btnASync2.ClientID %>').click();        
//    }

//    function hide(sender) {
//        //var subGrid = $('#divSubGrid');        
//        var containerID = $(sender).parent().parent().parent().parent().attr('id');
//        var subGrid = $('#' + containerID + ' #divSubGrid');
//        
//        $('#' + containerID + ' #divSubGrid .HGridRow').fadeOut(speed);
//        //$('#' + containerID + ' #divSubGrid .HGridContent').slideUp(speed);
//        
//        //$('#divSubGrid .HGridRow').fadeOut(speed);
//        $('#' + containerID + ' #divSubGrid .HGridContent').slideUp(speed, function() {
//            subGrid.hide();
//            //$('.HGridContent').first().removeClass('Fade');
//        });
//    }