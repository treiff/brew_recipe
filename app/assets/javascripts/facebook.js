$('body').prepend('<div id="fb-root"></div>')

$.ajax
  url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js&status=0"
  dataType: 'script'
  cache: true


window.fbAsyncInit = function() {
  FB.init({
    appId: "1004772406203161",
    cookie: true });

  $('#sign_in').click(function(e) {
    e.preventDefault();
    FB.login(function(response) {
      if(response.authResponse) {
        window.location = '/auth/facebook/callback';
      };
    });
  });

  $('#sign_out').click(function(e) {
    FB.getLoginStatus(function(response) {
      if(response.authResponse) {
        FB.logout();
      };
    true
    });
  });
};
