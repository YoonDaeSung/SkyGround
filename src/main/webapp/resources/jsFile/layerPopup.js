/* 검은 막을 눌렀을 때 */
$(function() {
	$('#layerPopup').click(function () {  
	    $(this).close = false;  
	    $('#join_layerPopup').close = false;
	
	});
}); // $(function()

/* 회원가입 LayerPopup */
function openJoinPopup() {
	
	var joinPopupHeight = 650;
	var joinPopupWidth  = 500;
	
	//화면의 높이와 너비를 구한다.
	var popupHeight = $(document).height();
	var popupWidth = $(window).width();
	
	$('#layerPopup').css({'width':popupWidth,'height':popupHeight});
	
	var joinPopupTop = ( popupHeight / 2 ) - (joinPopupHeight / 2);
	var joinPopupleft = ( popupWidth / 2 ) - (joinPopupWidth / 2);
	
	$('#join_layerPopup').css({'width':joinPopupWidth,'height':joinPopupHeight, 'background-color':'#FFFFFF',
		'top':joinPopupTop, 'left':joinPopupleft});
	
	
	$('#layerPopup').fadeTo("slow",0.8);
	$('#join_layerPopup').fadeTo("slow",0.9);
	
	// joinForm과 연결해 주는 부분
	$('#joinIFrame').attr('src','joinF');
}

/* 로그인 LayerPopup */
function openLoginPopup() {
	
	var joinPopupHeight = 300;
	var joinPopupWidth  = 500;
	
	//화면의 높이와 너비를 구한다.
	var popupHeight = $(document).height();
	var popupWidth = $(window).width();
	
	$('#layerPopup').css({'width':popupWidth,'height':popupHeight});
	
	var joinPopupTop = ( popupHeight / 2 ) - (joinPopupHeight / 2);
	var joinPopupleft = ( popupWidth / 2 ) - (joinPopupWidth / 2);
	
	$('#login_layerPopup').css({'width':joinPopupWidth,'height':joinPopupHeight, 'background-color':'#FFFFFF',
		'top':joinPopupTop, 'left':joinPopupleft});
	
	
	$('#layerPopup').fadeTo("slow",0.8);
	$('#login_layerPopup').fadeTo("slow",0.9);
	
	// joinForm과 연결해 주는 부분
	$('#loginIFrame').attr('src','loginF');
	
}