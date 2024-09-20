<script>
	var GoogleAuth;
	var GoogleUser;
	var SCOPE = 'profile email';
	function handleClientLoad() {
	  // Load the API's client and auth2 modules.
	  // Call the initClient function after the modules load.
	  gapi.load('client:auth2', initClient);
	}
  
	function initClient() {
	  // In practice, your app can retrieve one or more discovery documents.
	  var discoveryUrl = 'https://www.googleapis.com/discovery/v1/apis/drive/v3/rest';
  
	  // Initialize the gapi.client object, which app uses to make API requests.
	  // Get API key and client ID from API Console.
	  // 'scope' field specifies space-delimited list of access scopes.
	  gapi.client.init({
		  'apiKey': 'AIzaSyBcrmhOHseLt0qBtqDzfA1xMYWMuFsxgiM',
		  'clientId': '977370788443-iibjs82m2o4nkuktvbl75ct29iu6p1l0.apps.googleusercontent.com',
		  'discoveryDocs': [discoveryUrl],
	       'scope': SCOPE
	  }).then(function () {
		GoogleAuth = gapi.auth2.getAuthInstance();
		// Listen for sign-in state changes.
		GoogleAuth.isSignedIn.listen(updateSigninStatus);
  
		// Handle initial sign-in state. (Determine if user is already signed in.)
		var user = GoogleAuth.currentUser.get();
		setSigninStatus();
		
		// Call handleAuthClick function when user clicks on
		//      "Sign In/Authorize" button.
		$('#sign-in-or-out-button').click(function() {
		  handleAuthClick();
		});
		$('#revoke-access-button').click(function() {
		  revokeAccess();
		});
	  });
	}
  
	function handleAuthClick() {
	  if (GoogleAuth.isSignedIn.get()) {
		// User is authorized and has clicked "Sign out" button.
		GoogleAuth.signOut();
	  } else {
		// User is not signed in. Start Google auth flow.
		GoogleAuth.signIn();
	  }
	}
  
	function revokeAccess() {
	  GoogleAuth.disconnect();
	}
  
	function setSigninStatus() {
	  var user = GoogleAuth.currentUser.get();
	  var isAuthorized = user.hasGrantedScopes(SCOPE);
	  var profile = user.getBasicProfile();
	  var token = user.getAuthResponse(isAuthorized);
	  
	  console.log(token);
	  if (isAuthorized) {
		  
		  console.log("nickname : " + profile.getName());
		  console.log("email : " + profile.getEmail());
		  console.log("GivenName : " + profile.getGivenName());
		  console.log("FamilyName : " + profile.getFamilyName());
		  console.log("id : " + profile.getId());
		  console.log("imageURL : " + profile.getImageUrl());
		  
		$('#sign-in-or-out-button').html('Sign out');
		$('#revoke-access-button').css('display', 'inline-block');
		$('#auth-status').html('You are currently signed in and have granted ' +
			'access to this app.');

	  } else {
		$('#sign-in-or-out-button').html('Sign In/Authorize');
		$('#revoke-access-button').css('display', 'none');
		$('#auth-status').html('You have not authorized this app or you are ' +
			'signed out.');
	  }
	}
  
	function updateSigninStatus() {
	  setSigninStatus();
	}
  </script>
  
  <button id="sign-in-or-out-button"
		  style="margin-left: 25px">Sign In/Authorize</button>
  <button id="revoke-access-button"
		  style="display: none; margin-left: 25px">Revoke access</button>
  
  <div id="auth-status" style="display: inline; padding-left: 25px"></div><hr>
  <div class="g-signin2" onclick='onSignIn()'></div>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  
  <script async defer src="https://apis.google.com/js/api.js"
		  onload="this.onload=function(){};handleClientLoad()"
		  onreadystatechange="if (this.readyState === 'complete') this.onload()">
		  
  </script>
  <body>
  <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
  </body>