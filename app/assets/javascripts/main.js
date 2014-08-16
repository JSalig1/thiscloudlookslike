
$(document).ready(function(){

  $('.cloud-page').each(function(){
    var pageObj = $(this);
    var wrapperObj = $('.main-cloud-wrapper',pageObj);

    $('.navlink',pageObj).bind('ajax:success',function( e, response ){
      
      if( !response.image ) 
        return; //show an error

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
  });

  $('.navlink.next').trigger('click');
});