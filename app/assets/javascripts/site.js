$(document).on('turbolinks:load', function(){
  $('.rating').raty({
    starHalf: '<%= asset_path 'star-half.png' %>',
    starOff: '<%= asset_path 'star-off.png' %>',
    starOn: '<%= asset_path 'star-on.png' %>',
    scoreName: 'comment[rating]'
  });

  $('.rated').raty({
    starHalf: '<%= asset_path 'star-half.png' %>',
    starOff: '<%= asset_path 'star-off.png' %>',
    starOn: '<%= asset_path 'star-on.png' %>',
    readOnly: true,
    score: function() {
      return $(this).attr('data-score');
    }
  });
});