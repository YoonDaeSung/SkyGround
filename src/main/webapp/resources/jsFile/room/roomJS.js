$(function() {
	$("#editBtn").click(function() {
		alert("EditBtn Clicked")
		var Num = $("#rm_num").val();
		var Name = $("#rm_name").val();
		var Nprice = $("#rm_nprice").val();
		var Price = $("#rm_price").val();
		var Min = $("#rm_min_prs").val();
		var Max = $("#rm_max_prs").val();
		var Size = $("#rm_size").val();
		var Pyeong = $("#rm_pyeong").val();
		var Strt = $("#rm_strt").val();
		var Inst = $("#rm_inst").val();
		var Intro = $("#rm_intro").val();

		if (Num == "") {
			alert("객실번호가 비어있습니다.")
		} else if (Name == "") {
			alert("객실명이 비어있습니다.")
		} else if (Nprice == "") {
			alert("'비 성수가'가 비어있습니다.")
		} else if (Price == "") {
			alert("'성수가'가 비어있습니다.")
		} else if (Min == "") {
			alert("최소 인원이 비어있습니다.")
		} else if (Max == "") {
			alert("최대 인원이 비어있습니다.")
		} else if (Size == "") {
			alert("방 사이즈(제곱미터)가 비어있습니다.")
		} else if (Pyeong == "") {
			alert("방 사이즈(평 수)가 비어있습니다.")
		} else if (Strt == "") {
			alert("객실구조가 비어있습니다.")
		} else if (Inst == "") {
			alert("객실 내부 시설이 비어있습니다.")
		} else if (Intro == "") {
			alert("객실 소개가 비어있습니다.")
		}

		$.ajax({

			url : "editU",
			type : "post",
			data : {
				rm_num : Num,
				rm_name : Name,
				rm_nprice : Nprice,
				rm_price : Price,
				rm_min_prs : Min,
				rm_max_prs : Max,
				rm_size : Size,
				rm_pyeong : Pyeong,
				rm_strt : Strt,
				rm_inst : Inst,
				rm_intro : Intro
			},

			success : function(data) {
				alert("몬가... 몬가 일어나고 있음..." + data);
			},
			error : function() {
				alert("무언가가 잘못되었다. 장비를 정지합니다.");
			}
		});// ajax
	});// editBtn.click

// TOP Btn
	window.onscroll = function() {scrollFunction()};
	
//When the user clicks on the button, scroll to the top of the document
	$('#topBtn').click(function() {
		document.body.scrollTop = 0;
		document.documentElement.scrollTop = 0;
	});
	
	function scrollFunction() {
		if (document.body.scrollTop > 20 || document.documentElement.scrollTop > 20) {
			document.getElementById("topBtn").style.display = "block";
		} else {
			document.getElementById("topBtn").style.display = "none";
		}
	}

});// function