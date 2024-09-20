// var naver_id_login = new naver_id_login("zFXzPH5MbhIUJpBcUHID", "http://localhost/WebContent/naverCallback.html");
//   var state = naver_id_login.getUniqState();
//   // naver_id_login.setButton("green", 3, 60); // color, type, height
//   //naver_id_login.setDomain("YOUR_SERVICE_URL");
//   naver_id_login.setState(state);
//   naver_id_login.setPopup(true); // 기본값 false
//   naver_id_login.init_naver_id_login();

var naver_id_login = new naver_id_login(
  "zFXzPH5MbhIUJpBcUHID",
  "http://localhost/naverCallback.html"
);
var state = naver_id_login.getUniqState();
naver_id_login.setButton("green", 4, 68); // color, type, height
naver_id_login.setState(state);
naver_id_login.setPopup();
naver_id_login.init_naver_id_login();
