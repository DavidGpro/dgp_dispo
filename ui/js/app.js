$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.action == "open"){
            setRobStatus(event.data);
            setJobStatus(event.data)
        }else if(event.data.action == "close"){
            $("#background").css('display', 'none').fadeOut(150);
        }
    })
});

setRobStatus = function(data) {
    $('#background').css('display', 'block').fadeIn(150)
    $("#number").html(data.players+"/"+data.maxPlayers);

    $.each(data.requiredPolice, function(i, category){
        var div = $("#data").find('[id="'+i+'-est"]');

        if (category.active) {
            $(div).html('<i class="fas fa-clock"></i>');
        } else if (data.police >= category.minimum) {
            $(div).html('<i class="fas fa-check"></i>');
        } else {
            $(div).html('<i class="fas fa-times"></i>');
        }
    });
}

setJobStatus = function(data) {
    if (data.police >= '1') {
        console.log('1')
        $("#police-est").html('<i class="fas fa-check"></i>');
    } else {
        $("#police-est").html('<i class="fas fa-times"></i>');
        console.log('2')
    }

    if (data.ems >= '1') {
        $("#ems-est").html('<i class="fas fa-check"></i>');
    } else {
        $("#ems-est").html('<i class="fas fa-times"></i>');
    }

    if (data.mechanic >= '1') {
        $("#mechanic-est").html('<i class="fas fa-check"></i>');
    } else {
        $("#mechanic-est").html('<i class="fas fa-times"></i>');
    }

    if (data.taxi >= '1') {
        $("#taxi-est").html('<i class="fas fa-check"></i>');
    } else {
        $("#taxi-est").html('<i class="fas fa-times"></i>');
    }
}