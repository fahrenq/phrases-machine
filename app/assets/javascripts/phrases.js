function setCookie() {
  if (!($.cookie("phrases_ids"))) {
    $.cookie("phrases_ids", "");
  }
}

function displayPhrase(id, text, count) {
  $('#display_phrase').text(id + ". " text + count + " remaining.");
}

function updateCookie(id) {

  var phrases_ids;
  current_ids = $.cookie("phrases_ids");

  if (current_ids != "") {
    phrases_ids = new Array(current_ids);
    phrases_ids.push(id);
    phrases_ids.join(",");
  } else {
    phrases_ids = id;
  }
  $.cookie("phrases_ids", phrases_ids);
}

$(function() {

  setCookie();

  $('#get_phrase').on('click', function() {
    $.ajax({
      url: "/random_phrase.json",
      type: 'GET',
      success: function(data){
        displayPhrase(data.phrase.id, data.phrase.text, data.available.count);
        updateCookie(data.phrase.id);
      },
      statusCode: {
        422: function() {
          displayPhrase("There is no more phrases. Sorry");
        }
      }
    });
  });

});
