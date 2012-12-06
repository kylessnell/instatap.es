function onYouTubePlayerReady(player_id){
    ytplayer = document.getElementById('ytplayer');
    ytplayer.addEventListener("onStateChange", "nextSong");
    ytplayer.addEventListener("onError", "errorFunction");
}

function errorFunction(data){
    alert(data);
};

function nextSong(newState){
    if (newState == 0){
        $('.yt_button').each(function(index){
            if ($(this).attr('now_playing') == 'true'){
                $(this).parent().parent().next().find('.yt_button').trigger('click');
            }
         });
    }
};

$(document).on('ajax:complete ready', function(){

    var params = { allowScriptAccess: "always" };
    var atts = {id: "ytplayer"};
    swfobject.embedSWF("http://www.youtube.com/v/jPr4JIG_kak?enablejsapi=1&version=3&playerapiid=ytplayer",
                        "ytplayer_div", "500", "500", "9", null, null, params, atts);

    $('.track_list_item').hover(
        function(){
            $(this).find('.remove').css('visibility', 'visible');
            $(this).find('td').css('visibility', 'visible');
            $(this).find('.now_playing_icon').find('img').attr('src', '/assets/pause_icon.png');
            $(this).find('.not_playing_icon, .now_playing_paused_icon').find('img').attr('src', '/assets/play_icon.png');
        },
        function(){
            $(this).find('.remove').css('visibility', 'hidden');
            $(this).find('.not_playing_icon').css('visibility', 'hidden');
            $(this).find('.now_playing_icon, .now_playing_paused_icon').find('img').attr('src', '/assets/speaker_icon.png')
        }
    );

    function showOrHidePlayImage(){
        $('.now_playing_icon').each(function(){
            $(this).attr('class', 'not_playing_icon').css('visibility', 'hidden');
            $(this).parent().parent().find('.not_playing_icon img').attr('src', '/assets/play_icon.png');
        });
        $('.yt_button').each(function(){
            if ($(this).attr('now_playing') == 'true'){
                var row = $(this).parent().parent()
                row.find('.not_playing_icon, .now_playing_paused_icon').attr('class', 'now_playing_icon').css('visibility', 'visible');
                row.find('.now_playing_icon img').attr('src', '/assets/pause_icon.png');
            }else if ($(this).attr('now_playing') == 'paused'){
                var row = $(this).parent().parent()
                row.find('.not_playing_icon').attr('class', 'now_playing_paused_icon').css('visibility', 'visible');
                row.find('.now_playing_icon img').attr('src', '/assets/play_icon.png');
            }else{
                var row = $(this).parent().parent()
                row.find('.not_playing_icon, .now_playing_paused_icon').css('visibility', 'hidden').attr({
                    'class': 'not_playing_icon',
                    'src': '/assets/play_icon.png'
                });
            }
        });
    };

    // $('.track_list_item img').click(function(){
    //    $(this).closest('button').trigger('click');
    // })

    $('.yt_button').off("click");



    $('.yt_button').click(function(){
        if ($(this).attr('now_playing') == 'false'){
            var song_id = $(this).attr('yt_id');
            ytplayer.loadVideoById(song_id, 1, 'large');
            $('.yt_button').each(function(){
                if (song_id == $(this).attr('yt_id')){
                    $(this).attr('now_playing', 'true');
                }else{
                    $(this).attr('now_playing', 'false');
                }
            });
        }else if ($(this).attr('now_playing') == 'true'){
            ytplayer.pauseVideo();
            $(this).attr('now_playing', 'paused');
        }else if ($(this).attr('now_playing') == 'paused'){
            ytplayer.playVideo();
            $(this).attr('now_playing', 'true');
        };
        showOrHidePlayImage();
    });

    $('.start_over').click(function(){
        ytplayer.pauseVideo();
    });


});


