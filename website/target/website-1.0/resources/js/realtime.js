/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/ClientSide/Gruntfile.js to edit this template
 */
var flag = false;
var _incoming;
var _outcoming;
$(document).ready(function (){
    $.ajaxSetup({cache:false});
    setInterval(function (){
        if(flag == true){return;}
        checkmess();
    },1000);
    setInterval(function (){
        if(flag == false){return;}
        loadrealtime();
    },1000);
    $('#view-chat').hide();
    $('#btn-close-chat').click(function (){
        _incoming=null;
        _outcoming=null;
        $('#view-chat').hide(800);
    });
    $('#content').keyup(function (e) { 
        var keycode = (event.keyCode ? event.keyCode : event.which);
        if (keycode=='13') {
            sendmess($(this).val());
            $('#list-content-chat').prepend('<div class="chat1"><p class="incoming">'+$(this).val()+'</p></div>');
            $(this).val("");
        }
        
    });
    $('#chat-start').click(function (){
        var idstore=$('#id-store').val();
        $.ajax({
            type: 'POST',
            url:"http://localhost:8080/website/api/mess/getstatus",
            data:{
                idstore:idstore
            },
            dataType: 'json',
            success: function (response) {
                _incoming=response['incoming'];
                _outcoming=response['outcoming'];
                loadstart();
            }
        });
    });
});
function loadstart(){
    $.ajax({
        type: 'GET',
        url:"http://localhost:8080/website/api/mess/"+_incoming+"/"+_outcoming,
        dataType: 'json',
        success: function (response) {
            $('#list-content-chat').html("");
            for (var i=0;i< response.length;i++) {
                if(response[i]['incoming']==_incoming){
                    $('#list-content-chat').append('<div class="chat1"><p class="incoming">'+response[i]['content']+'</p></div>');
                }else{
                    $('#list-content-chat').append('<div class="chat"><p class="outcoming">'+response[i]['content']+'</p></div>');
                    
                }
            }
            setImageOutcoming(_outcoming);
            
            $('#view-chat').show(1000);
        }
    });
}
function loadrealtime(){
    if(_incoming ==null || _outcoming==null){
        return;
    }
    $.ajax({
        type: 'GET',
        url:"http://localhost:8080/website/api/realtimeloadmess/"+_incoming+"/"+_outcoming,
        dataType: 'json',
        success: function (response) {
            if(response!=null){
                if(response['incoming']==_incoming){
                    $('#list-content-chat').prepend('<div class="chat1"><p class="incoming">'+response['content']+'</p></div>');
                }else{
                    $('#list-content-chat').prepend('<div class="chat"><p class="outcoming">'+response['content']+'</p></div>');
                }
            }
        },
            error: function (jqXHR, textStatus, errorThrown) {
            
            }
    });
}
function sendmess(mess){
    $.ajax({
            type: 'POST',
            url:"http://localhost:8080/website/api/mess/send",
            data:{
                incoming: _incoming,
                outcoming: _outcoming,
                content: mess
            },
            dataType: 'json',
            success: function (response) {
                
            }
        });
}
function checkmess(mess){
    $.ajax({
            type: 'GET',
            url:"http://localhost:8080/website/api/realtimecheckmess/",
            data:{
                incoming: _incoming,
                outcoming: _outcoming,
                content: mess
            },
            dataType: 'json',
            success: function (response) {
                flag=true;
                _incoming=response['outcoming'];
                _outcoming=response['incoming'];
                loadstart();
            },
            error: function (jqXHR, textStatus, errorThrown) {
            
            }
        });
}
function setImageOutcoming(id){
    $.ajax({
            type: 'GET',
            url:"http://localhost:8080/website/api/user/"+id,
            dataType: 'json',
            success: function (response) {
                $('#img-outcoming').attr('src','/website/resource/image/user/'+response['image']);
            }
        });
}