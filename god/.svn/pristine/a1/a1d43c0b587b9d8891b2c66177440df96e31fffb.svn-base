/*window.onresize = function() {

	console.log("################## 화면 크기 변화");
	location.reload(); // 메뉴 중앙 정렬 초기화위한 조치
}*/


// 각 메인 메뉴의 서브 메뉴 출력
// 각 메인 메뉴의 서브 메뉴 출력
window.onload = function() {

/* 추가 :
   절대 좌표 : 좌측 여백 너비 + 서브메뉴.offsetLeft
   좌측 여백 너비 : 화면 전체 너비 - div#menu_wrap 너비/2
*/

	// document.querySelector("#outer_btn");
	// console.log(document.querySelector("#new_btn"));
    // 추가 : 서브메뉴 중앙 설정 설정
    // 서브 메뉴 좌표 설정(중앙)
    // var center_left = document.querySelectorAll("[id$=_btn]")

    // document.querySelectorAll("[id$=_sub]").left = center_left;

    var sub_menus = document.querySelectorAll("[id$=_sub]");

	// 좌측 여백 너비
	var menu_wrap_div = document.querySelector("div#menu_wrap");
	var left_blank_width = menu_wrap_div.offsetLeft;

	//console.log("### 좌측 여백 너비 : " + left_blank_width);

    for (var sub_menu of sub_menus) {

        //console.log("### 서브 메뉴 : ");
		//console.log(sub_menu);
        //console.log(sub_menu.clientLeft);
        //console.log("### 서브 메뉴 너비 : "+sub_menu.clientWidth);

        var main_menu_id = sub_menu.id.replace("_sub","") + "_btn";
        //console.log("main_menu_id : "+main_menu_id);

        var main_menu = document.getElementById(main_menu_id);

        //console.log(main_menu);
        //console.log("main_menu left(x):"+ Number(main_menu.offsetLeft + left_blank_width));
        //console.log("main_menu width :"+main_menu.offsetWidth);

		// 가운데 좌표(x)
        // var sub_menu_left = Number(main_menu.offsetLeft + main_menu.offsetWidth/2);
		// var sub_menu_center_x = Number(main_menu.offsetLeft + main_menu.offsetWidth/2);


		var sub_menu_center_x = Number(left_blank_width + main_menu.offsetLeft + main_menu.offsetWidth/2);


		// console.log("#### 좌표(x) : "+sub_menu_left);
        //console.log("#### 서브 메뉴 중심 좌표(x) : "+sub_menu_center_x);
		// console.log("#### 서브 메뉴 너비 : "+sub_menu.clientWidth);
		//console.log("#### 서브 메뉴 너비 : "+sub_menu.style.width);

		// 추가
        // 서브 메뉴 좌표 : 메인 메뉴 가운데 좌표 - 서브메뉴 길이/2
        // sub_menu.style.left = sub_menu_left + "px"; // 서브 메뉴 좌표 설정 ("px" 필히 부착)
		// console.log("### 서브메뉴 x좌표 : " + Number(sub_menu_center_x - sub_menu.clientWidth/2));
		//console.log("### 서브메뉴 x좌표 : " + Number(sub_menu_center_x - parseInt(sub_menu.style.width)/2));

		// sub_menu.style.left = Number(sub_menu_center_x - sub_menu.clientWidth/2)  + "px";
		sub_menu.style.left = Number(sub_menu_center_x - left_blank_width - parseInt(sub_menu.style.width)/2)  + "px";

		//console.log("#### sub_menu.id : " + sub_menu.id);
		//console.log("#### sub_menu.style.left : " + sub_menu.style.left);
    } //


    ////////////////////////////////////////////////////////////////////////////////////////

    // 모든 서브 메뉴 초기 상태 : 은닉(hidden)
    // 모든 서브 메뉴를 sub_menus 변수로 할당(대입)
    // 선택자(selector) 적용 : id가 _sub로 끝나는 div 태그들
    var sub_menus = document.querySelectorAll("div[id$=_sub]");

    // 반복문(for)를 활용하여 모든 서브 메뉴들의 보이기 속성(visibility)를 은닉(감추기) 상태로 초기화 설정합니다.
    for (var i=0; i<sub_menus.length; i++) {
        sub_menus[i].style.display = "none";
    } // for

    // 메인 메뉴들을 main_menus 변수로 할당합니다.
    // 선택자(selector) 적용 : id가 _btn으로 끝나는 li 태그들
    var main_menus = document.querySelectorAll("li[id$=_btn]")

    // 메인 메뉴들의 각각의 이벤트 처리 코드를 축소하기 위해 for문 활용.
    for (const main_menu_one of main_menus) {

        // 각 개별 메인 메뉴에 마우스를 올렸을 때(rollover) 이벤트 처리
        main_menu_one.onmouseover = function(e) {

            // this.id = e.currentTarget.id 여기서는 같은 의미로써
            // 마우스 롤오버한 대상(target) 태그(li)의 아이디

            const rollover_menu = this.id.split("_")[0]; // 참고 코드-1

			//console.log("################# rollover_menu:"+rollover_menu);
            // 홈(home) 메뉴는 롤오버 적용 제외
            // if (rollover_menu != "best", "new", "set", "beauty", "review") {
			if(rollover_menu != "best" ||
			   rollover_menu != "new" ||
		   	   rollover_menu != "set" ||
	           rollover_menu != "beauty" ||
		       rollover_menu != "review") {

                // 메인 메뉴 버튼의 아이디 추출을 통해서 서브 메뉴 아이디를 선택
                var sub_menu_id = this.id.split("_")[0] + "_sub";
				//console.log("################## sub_menu_id:"+sub_menu_id);


	                // 메인 메뉴 계열(자신)의 서브 메뉴
                var this_sub_menu = document.getElementById(sub_menu_id);
				//console.log("################## this_sub_menu:"+this_sub_menu);

				if(this_sub_menu != null) {

	                // 참고 코드-2
	                // 다른 서브 메뉴들을 은닉(감추기)
	                // for ~ of 문을 활용합니다.
	                // 전체 서브 메뉴 변수 : sub_menus
	                // 단, 반복문 내에서 조건식을 사용하여 서브 메뉴 아이디(id)가 자신의 서브 메뉴 아이디(this_sub_menu)
	                // 가 아닌 것만 선택적으로 은닉(hidden)하도록 조치합니다.
	                for (const sub_menu_one of sub_menus) {
						//console.log("################ sub_menu_one:"+sub_menu_one);
	                    if (sub_menu_one.id != this_sub_menu.id) {
	                        sub_menu_one.style.display = "none";
	                    }

	                } // for

	                // 자신의 서브 메뉴(this_sub_menu)를 보이도록 조치
	                this_sub_menu.style.display = "block";

	            } // 홈(home) 버튼 롤오버 할 경우 모든 서브 메뉴(sub_menus) 은닉
	            else if(rollover_menu != "best" ||
				   rollover_menu != "new" ||
			   	   rollover_menu != "set" ||
		           rollover_menu != "beauty" ||
			       rollover_menu != "review") {

	                // 위의 구문(참고 코드-2)과 유사하게 for ~ of 문을 활용합니다.
	                // 단, 모든 서브 메뉴를 은닉 조치하기 때문에 조건식은 없습니다.
	                for (const sub_menu_one of sub_menus) {
	                    sub_menu_one.style.display = "none";
	                } // for

	            } //
			}// if sub_menu_id end
        } // onmouseover

    } // for

    // 서브 메뉴 롤아웃 할 경우 이벤트 핸들러
    // for ~ of 문을 활용하여 서브 메뉴(sub_menus) 변수의 개별 서브메뉴(sub_menu_one)의 이벤트 처리
    for (const main_menu_one of main_menus) {

        // 개별 서브메뉴(sub_menu_one)에 마우스 롤아웃(mouseout) 하였을 때 이벤트 핸들(처리)
        main_menu_one.onmouseout = function(e) {

            // 서브 메뉴 자신의 아이디에서 "_"를 제거한 첫번째 토큰을 rollover_nemu라는 변수로 할당
            // 참고 코드-1의 방식을 참조합니다.
            const rollover_menu = this.id.split("_")[0];
			//console.log("############ rollover_menu :"+rollover_menu);
            // 홈 메뉴(home)는 롤오버 적용 제외 : 조건식(if)
			if(rollover_menu != "best" ||
			   rollover_menu != "new" ||
			   rollover_menu != "set" ||
			   rollover_menu != "beauty" ||
			   rollover_menu != "review") {

                // 메인 메뉴 버튼의 아이디(this.id) 추출을 통해서 서브 메뉴 아이디를 선택
                // 참고 코드-1의 방식을 참조하며 추가적으로 "_sub" 첨가하여
                // 아이디(sub_menu_id) 변수에 할당(대입)합니다.
                var sub_menu_id = this.id.split("_")[0] + "_sub";

				//console.log("########### sub_menu_id :"+sub_menu_id);

                // 위에서 추출한 아이디(sub_menu_id)를 가진 객체(태그)를 this_sub_menu 변수로 할당합니다.
                var this_sub_menu = document.getElementById(sub_menu_id);

				if(this_sub_menu != null) {
                // this_sub_menu 보이기(visibility) 속성을 은닉(hidden)으로 설정합니다.
                	this_sub_menu.style.display = "none";
				}// this_sub_menu

            } // if

        }  // 개별 서브메뉴(sub_menu_one)에 마우스 롤아웃(mouseout) 하였을 때 이벤트 핸들(처리) "끝"

    } // for ~ of 문을 활용하여 서브 메뉴(sub_menus) 변수의 개별 서브메뉴(sub_menu_one)의 이벤트 처리 "끝"

} //

$(document).ready(function() {

	var menu = $('#menu').offset();

	$(window).scroll(function() {
		if ($(document).scrollTop() > menu.top) {
			$('#menu').addClass('fixed');
		} else {
			$('#menu').removeClass('fixed');
		}
	});

/*추가*/
/*////////////////////////////// 모달 jquery /////////////////////////////*/

	//모달 초기 상태 : 은닉
	$("#search_modal_wrap").hide();

	// 모달 출력
	$("#search_paging_result").click(function() {
		$("#search_modal_wrap").show();
	});

	// 모달 닫기
	$("#search_modal_wrap").click(function(e){
		if($("#search_modal_wrap").css("display")=="block") {
			if(!$("#search_modal_wrap").has(e.target).length){
				//console.log("##### modal 영역 :"+$("#modal_wrap"));
				$("#search_modal_wrap").hide();
			}
		}
	});

});
/*////////////////////////////// //모달 jquery /////////////////////////////*/