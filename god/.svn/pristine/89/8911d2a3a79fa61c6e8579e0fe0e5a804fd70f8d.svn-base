$(document).ready(function() {


	// 인트로 슬라이드
	// 4초 간격으로 이미지 교체
	var slideCount = 0;
	setInterval(function(){

		// console.log("slideCount:"+slideCount);

		//배너 이미지 변화
		$("#imgs_"+slideCount).css({"z-index": "2", "position": "relative", "opacity": "1", "transition-duration": "2000ms"});

		$("#imgs_"+slideCount).siblings().css({"z-index": "1", "position": "absolute", "opacity": "0.5", "transition-duration": "0ms"});

		//bullet 변화
		$("#bullet_banner span#bullet_banner_"+slideCount)
			.css({"background":"black", "width": "34px","transition-duration": "1000ms"});

		$("#bullet_banner span#bullet_banner_"+slideCount)
			.siblings().css({"background":"rgba(255, 255, 255, 0.5)", "width": "8px", "transition-duration": "0ms"});



		slideCount++;

		// 카운터 최대 수 증가시 다시 감소
		if(slideCount > 2){
			slideCount = 0;
		}

	}, 4000);

	// 배너 이전 이동 버튼
	$("#banner_left").click(function(e){

		// 클릭시 슬라이드 카운터 감소
		slideCount--;

		//console.log(slideCount);

		//배너 이미지 변화
		$("#imgs_"+slideCount).css({"z-index": "2", "position": "relative", "opacity": "1", "transition-duration": "2000ms"});

		$("#imgs_"+slideCount).siblings().css({"z-index": "1", "position": "absolute", "opacity": "0.5", "transition-duration": "0ms"});

		//bullet 변화
		$("#bullet_banner span#bullet_banner_"+slideCount)
			.css({"background":"black", "width": "34px","transition-duration": "1000ms"});

		$("#bullet_banner span#bullet_banner_"+slideCount)
			.siblings().css({"background":"rgba(255, 255, 255, 0.5)", "width": "8px", "transition-duration": "0ms"});

		// 카운터 최소 수 감소시 다시 증가
		if(slideCount < 1) {
			slideCount = 3;
		}
	});

	// 배너 다음 이동 버튼
	$("#banner_right").click(function(e){

		// 클릭시 슬라이드 카운터 증가
		slideCount++;

		//console.log(slideCount);

		//배너 이미지 변화
		$("#imgs_"+slideCount).css({"z-index": "2", "position": "relative", "opacity": "1", "transition-duration": "2000ms"});

		$("#imgs_"+slideCount).siblings().css({"z-index": "1", "position": "absolute", "opacity": "0.5", "transition-duration": "0ms"});

		//bullet 변화
		$("#bullet_banner span#bullet_banner_"+slideCount)
			.css({"background":"black", "width": "34px","transition-duration": "1000ms"});

		$("#bullet_banner span#bullet_banner_"+slideCount)
			.siblings().css({"background":"rgba(255, 255, 255, 0.5)", "width": "8px", "transition-duration": "0ms"});

		// 카운터 최대 수 증가시 다시 감소
		if(slideCount >= 2) {
			slideCount = -1;
		}
	});

	$("[id^=bullet_banner_]").click(function(e){

		console.log("블릿 : "+e.currentTarget.id);
		var id = e.currentTarget.id;
		var number = id.substring('bullet_banner_'.length, id.length);

		console.log("number:"+number);

		switch(number){
			case number: slideCount= 1;
			case 2: slideCount= 2;
			case 3: slideCount= 3;
		}

		console.log("slideCount"+slideCount);
		//$('#banner_img div#imgs_'+number).

		//배너 이미지 변화
		$("#imgs_"+number).css({"z-index": "2", "position": "relative", "opacity": "1", "transition-duration": "2000ms"});

		$("#imgs_"+number).siblings().css({"z-index": "1", "position": "absolute", "opacity": "0.5", "transition-duration": "0ms"});
		//
		//bullet 변화
		$("#bullet_banner span#bullet_banner_"+number)
		.css({"background":"black", "width": "34px","transition-duration": "1000ms"});

		$("#bullet_banner span#bullet_banner_"+number)
		.siblings().css({"background":"rgba(255, 255, 255, 0.5)", "width": "8px", "transition-duration": "0ms"});
	});

	//갤러리 이미지 롤오버 할 경우 돋보기 아이콘 투명도 조정 rollover
	$("div[id^=product_]").mousemove(function(e) {

		//console.log("mousemove");
		//console.log("id: "+ e.currentTarget.id);

		//console.log($("div[id^=product_] .list_img").siblings());

		//$("div[id^=product_]").parent().find("div.icon").css("opacity", "1.0");
		$("#"+e.currentTarget.id).find("div.icon").css("opacity", "1.0");


	});

	<!-- $("div.icon").hover(function() { -->

		<!-- //onsole.log($("div.product_list .list_img").parent().find("div.icon")); -->

		<!-- $("div.icon").parent().find("div.icon ").css("opacity", "1.0"); -->

	<!-- }); -->

	//갤러리 이미지 mouseout 경우 돋보기 아이콘 투명도 조정 mouseout
	$("div[id^=product_]").mouseout(function(e) {

		//console.log("mouseout");
		//console.log($("div.product_list .list_img").parent().find("div.icon"));

		//$("div[id^=product_]").parent().find("div.icon").css("opacity", "0");


		$("#"+e.currentTarget.id).find("div.icon").css("opacity", "0");

	});


});