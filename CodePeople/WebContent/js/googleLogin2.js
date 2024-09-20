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
	    'apiKey': 'AIzaSyCZRC95pN7I-iw7gxyOKv7q5zLaNzqT7_s',
	    'clientId': '679025986170-hcudc7oi4jm9qegqbim7q7g4l6kq9qgt.apps.googleusercontent.com',
	    'discoveryDocs': [discoveryUrl],
	    'scope': SCOPE
	  }).then(function () {
	    GoogleAuth = gapi.auth2.getAuthInstance();
	    // Listen for sign-in state changes.
	    GoogleAuth.isSignedIn.listen(updateSigninStatus);
	    
	    // Handle initial sign-in state. (Determine if user is already signed in.)
	    GoogleAuth.signIn();
	  });
	}

//사인인 상태 확인
function setSigninStatus() {
  var googleUser = GoogleAuth.currentUser.get();
  var profile = googleUser.getBasicProfile();
  profileLog(googleUser, profile);
  var isAuthorized = googleUser.hasGrantedScopes(SCOPE);
  
  if (isAuthorized) {
    
  console.log(profile.getName() + '로그인 완료');

  } else {

  console.log('로그인 되지 않음');
  }
}

//사인인 상태 업데이트
function updateSigninStatus() {
  setSigninStatus();
}

function profileLog(googleUser, profile) {
  console.log("ID: " + profile.getId()); // Don't send this directly to your server!
  console.log('Full Name: ' + profile.getName());
  console.log('Given Name: ' + profile.getGivenName());
  console.log('Family Name: ' + profile.getFamilyName());
  console.log("Image URL: " + profile.getImageUrl());
  console.log("Email: " + profile.getEmail());
  // The ID token you need to pass to your backend:
  var id_token = googleUser.getAuthResponse().id_token;
  console.log("ID Token: " + id_token);
}
