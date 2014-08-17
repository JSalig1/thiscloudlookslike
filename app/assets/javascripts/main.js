
$(document).ready(function(){

  $('.cloud-page').each(function(){
    var pageObj = $(this);
    var wrapperObj = $('.main-cloud-wrapper',pageObj);
    var formObj = $('form#new_comment',pageObj);

    $('.navlink',pageObj).bind('ajax:success',function( e, response ){
      
      if( !response.image ) 
        return; //show an error

      $('input#comment_cloud_id',formObj).val( response.id );

      var imageObj = $('<img src="'+response.image+'" />');
      imageObj.load(function(){
        var imgObj = $(this);
        var marginTop = Math.floor((wrapperObj.height() - imageObj.height()) / 2);
        if( marginTop > 0 )
          imgObj.css('margin-top' , marginTop );

        imgObj.fadeIn('fast',function(){
          imgObj.magnificPopup({
            type:'image',
            zoom: {
              enabled: false
            },
            callbacks: {
              elementParse: function(item) {            
                item.src = imgObj.attr('src');
              }
            }
          });
        });
      });

      wrapperObj.empty().append( imageObj );

      window.location.hash = 'cloud=' + response.id;
      $('#perma-link').html("<a href='"+window.location.href+"'>"+window.location.href+"</a>");

      // load up comment form

    }).bind('ajax:before',function(){
      wrapperObj.html('<span class="ajax-loader"></span>');

      // load specific image based on window hash
    });

    $('.navlink.next',pageObj).trigger('click');


    formObj.bind('ajax:success',function( e, response ){
      var containerObj = $('#comments-container',pageObj),commentObj,str,body
      containerObj.empty();
      $.each( response , function( index, comment ){
        body = comment.body.replace(/^a /i,'');
        str = format_plural( comment.count , '<span class="count">1</span> person sees a' , '<span class="count">@count</span> people see a' );
        commentObj = ''
          + '<div class="comment-pill">'
          + str
          + '  <span class="body">'+body+'</span>'
          + '</div>';

        containerObj.append( commentObj );
      });
    });

    formObj.submit(function(){
      var comment = $('input#comment_body').val();
      if(!comment)
        return false;
    });

    $('input#comment_body',formObj).focus().bind('keyup',function(e){
      var code = e.keyCode || e.which;
      if( code == 13 )
        formObj.submit();
    });    
  });
});