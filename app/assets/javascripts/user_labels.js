$(document).ready(function(){
  $(document).on("click", '.add_label', function(e){
    e.preventDefault();
    $(this).next('.labels_container').toggle();
  });

  $(document).on("click", '.add_label_item', function(){
      var user = $(this).attr('data-user');
      var label = $(this).attr('data-label');
      $.post('/add_label', {user: user, label: label}, null, 'script');
  });

  $(document).on("click", '.delete_label', function(){
      var user = $(this).attr('data-user');
      var label = $(this).attr('data-label');
      $.post('/delete_label', {user: user, label: label}, null, 'script');
  });
});
