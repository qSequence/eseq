var MAIN_MENU_ID_1;
var MAIN_MENU_ID_1_CLICKED=false;
var MAIN_MENU_ID_2;
var MAIN_MENU_ID_2_CLICKED=false;
var MAIN_MENU_ID_3;
var MAIN_MENU_ID_3_CLICKED=false;

var MENU1_TOP = "0px";
var MENU1_LEFT = "0px";
var MENU2_TOP = "0px";
var MENU2_LEFT = "0px";



function addScrollPositionsToUrl(url){
    var x = 0; var y = 0;
    var divElement = document.getElementById("submodules_div");
    if(divElement){
        x = divElement.scrollLeft;
        y = divElement.scrollTop;
    }
    url = addUrlParameter(url, "xPosition", x);
    url = addUrlParameter(url, "yPosition", y);
    return url;
}



function FireUrlHrefEvent(url){

    try {
        document.location.href = url;
    } catch ( error ) {
    }
}

function addUrlParameter(url, name, value) {
	    if (url.indexOf("?") != -1) {
	        url += "&";
	    } else {
	        url += "?";
	    }
	    return url + name + "=" + encodeURI(value);
	}


function showMenu1(id, event){
    hideCascadeOptionsMenus();
    var menuElement = document.getElementById? document.getElementById(id): null;

    if (!menuElement) return;
    MAIN_MENU_ID_1 = id;
	MAIN_MENU_ID_1_CLICKED = true;
    setMenuPosition(menuElement,event);
    menuElement.style.zIndex = 2;

    menuElement.style.visibility="visible";
}


//function showProperties(id, event){
//	alert('--->id='+id);
//    hideCascadeOptionsMenus();
//    var menuElement = document.getElementById? document.getElementById(id): null;
//
//    if (!menuElement) return;
//    MAIN_MENU_ID_1 = id;
//	MAIN_MENU_ID_1_CLICKED = true;
//    setMenuPosition(menuElement,event);
//    menuElement.style.zIndex = 2;
//
//    menuElement.style.visibility="visible";
//}

function hideCascadeOptionsMenus(){

	    if(MAIN_MENU_ID_3 && MAIN_MENU_ID_3_CLICKED){
	       var menuElement = document.getElementById? document.getElementById(MAIN_MENU_ID_3): null;
	       if (menuElement) hideMenuId(menuElement);
		   var mIFrame3 = document.getElementById('MENU3_IFRAME');
		   if(mIFrame3) mIFrame3.style.display = "none";
	    }
		MAIN_MENU_ID_3_CLICKED = false;
	    if(MAIN_MENU_ID_2 && MAIN_MENU_ID_2_CLICKED){
	       var menuElement = document.getElementById? document.getElementById(MAIN_MENU_ID_2): null;
	       if (menuElement) hideMenuId(menuElement);
		   var mIFrame2 = document.getElementById('MENU2_IFRAME');
		   if(mIFrame2) mIFrame2.style.display = "none";
	    }
		MAIN_MENU_ID_2_CLICKED = false;
	    if(MAIN_MENU_ID_1 && !MAIN_MENU_ID_1_CLICKED){
	       var menuElement = document.getElementById? document.getElementById(MAIN_MENU_ID_1): null;
	       if (menuElement) hideMenuId(menuElement);
		   var mIFrame1 = document.getElementById('MENU1_IFRAME');
	       if(mIFrame1) mIFrame1.style.display = "none";
	    }
		MAIN_MENU_ID_1_CLICKED = false;
	}

function hideMenuId(menuElement){

	    menuElement.style.visibility="hidden";
	}

var X_OFFSET = 0;
var Y_OFFSET = 0;

function setMenuPosition(menuElement, e) {



 var winLocation = getWindowLocation();

 var x = e.pageX? e.pageX: e.clientX + winLocation[2];    // scrollX
 var y = e.pageY? e.pageY: e.clientY + winLocation[3];    // scrollY
 var rowOffset = 5;
 if ( x + menuElement.offsetWidth > winLocation[0] + winLocation[2] ){
     x = x - menuElement.offsetWidth ;
 } else {
     x = x + X_OFFSET;
 }

 if ( y + menuElement.offsetHeight > winLocation[1] + winLocation[3] ) {

     y = ( y - menuElement.offsetHeight > winLocation[3] )? y - menuElement.offsetHeight - rowOffset : winLocation[1] + winLocation[3] - menuElement.offsetHeight - rowOffset;
 } else {

     y = y + Y_OFFSET + rowOffset;
 }

 menuElement.style.left = x + "px";
 menuElement.style.top = y + "px";

}

function getWindowLocation(){

 var width   = 0;
 var height  = 0;
 var scrollX = 0;
 var scrollY = 0;

 if (window.innerWidth) {
     width = window.innerWidth;
 } else if (document.documentElement && document.documentElement.clientWidth){
		width = document.documentElement.clientWidth;
 } else if (document.body && document.body.clientWidth){
		width = document.body.clientWidth;
 }

 if (window.innerHeight) {
     height = window.innerHeight;
	} else if (document.documentElement && document.documentElement.clientHeight){
		height = document.documentElement.clientHeight;
	} else if (document.body && document.body.clientHeight){
		height = document.body.clientHeight;
 }

	if (typeof window.pageXOffset == "number") {
	    scrollX = window.pageXOffset;
	} else if (document.documentElement && document.documentElement.scrollLeft){
		scrollX = document.documentElement.scrollLeft;
	} else if (document.body && document.body.scrollLeft){
		scrollX = document.body.scrollLeft;
	} else if (window.scrollX) {
	    scrollX = window.scrollX;
	}

 if (typeof window.pageYOffset == "number") {
     scrollY = window.pageYOffset;
 } else if (document.documentElement && document.documentElement.scrollTop){
		scrollY = document.documentElement.scrollTop;
	} else if (document.body && document.body.scrollTop){
		scrollY = document.body.scrollTop;
	} else if (window.scrollY) {
	    scrollY = window.scrollY;
 }

 return [width, height, scrollX, scrollY];
}

function bodyOnClick(){
hideOptionsMenu();
setWindowPositionsCookie();
}

var ACTIVE_OPTIONS_MENU_ID = null;
var OPTIONS_MENU_CLICKED = false;

function hideOptionsMenu(){

  if(ACTIVE_OPTIONS_MENU_ID != null && !OPTIONS_MENU_CLICKED){
      var menuElement = document.getElementById? document.getElementById(ACTIVE_OPTIONS_MENU_ID): null;
      if(menuElement != null){
          menuElement.style.visibility="hidden";
          ACTIVE_OPTIONS_MENU_ID = null;
      }
  }
	OPTIONS_MENU_CLICKED = false;
	hideCascadeOptionsMenus();
 // hideInfotip();
}


var CanSetWindowPositionsCookie = true;
var WINDOW_X_POS = "WINDOW_X_POS";
var WINDOW_Y_POS = "WINDOW_Y_POS";
var WINDOW_JSP_ID = "WINDOW_JSP_ID";
function setWindowPositionsCookie(){

    var scrollX = 0;  var scrollY = 0;
    if( CanSetWindowPositionsCookie ){
        var winLocation = getWindowLocation();
        if(winLocation){
            scrollX = winLocation[2];
            scrollY = winLocation[3];
        }
        var expires_mins = 25;
        if((typeof(jspId) != "undefined")){
            createCookie(WINDOW_JSP_ID, jspId, expires_mins);
            createCookie(WINDOW_X_POS, scrollX, expires_mins);
            createCookie(WINDOW_Y_POS, scrollY, expires_mins);
        }

    }
}

function keyDownHandler(e) {

 if (isPopupOpened && e.keyCode == 9)  return false;
}
