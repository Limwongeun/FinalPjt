<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<!DOCTYPE html>

<html>

<head>
    <!-- 부트스트랩 -->
    <link href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.css' rel='stylesheet' />
    <link href='https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.13.1/css/all.css' rel='stylesheet'>

    <!-- Date Range Picker  -->
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

    <meta charset="UTF-8">
    <title></title>
</head>

<body>
<section>
	<div class="row justify-content-center">
		<div class="col-md-9" style="max-width:960px;">

	<div class="card card-outline card-info" style="border-top: 3px solid #282c2f;">
<!--     <div class="card card-primary"> -->
        <div class="card-header">
            <h3 class="card-title">일정 등록</h3>
            							<select onchange="javascript:test(this);">
								<option value="0" selected="selected"></option>
								<option value="1">생성</option>
							 </select>
            
        </div>
        <!-- /.card-header -->
        <!-- form start -->
        <form method="post" action="<%=request.getContextPath()%>/mypage/scheduler/regist.do" name="registForm">
            <div class="card-body">
                <div class="form-group">
                    <label for="mber_schdul_nm">일정명</label>
                    <input type="text" class="form-control" name="mber_schdul_nm" id="mber_schdul_nm" placeholder="일정명">
                </div>


                <div class="form-group">
                    <label for="mber_schdul_bgnde">시작 일자</label>
                    <input type="text" class="form-control" name="mber_schdul_bgnde" id="mber_schdul_bgnde">
                </div>
                <div class="form-group">
                    <label for="mber_schdul_endde">종료 일자</label>
                    <input type="text" class="form-control" name="mber_schdul_endde" id="mber_schdul_endde">
                </div>
                <div class="form-group">
                    <label for="mber_allday">하루 종일</label>
                    <input type="checkbox" name="mber_allday" id="mber_allday" value="1">
                    <input type="hidden" name="mber_allday" value='0' id="mber_allday_hidden" />
                </div>
                <div class="form-group">
                    <label>일정 색상</label>
                    <select class="form-control" name="mber_schdul_color" id="mber_schdul_color">
                        <option value="#ffa94d" style="color:#ffa94d;">주황색</option>
                        <option value="#D25565" style="color:#D25565;">빨간색</option>
                        <option value="#9775fa" style="color:#9775fa;">보라색</option>
                        <option value="#74c0fc" style="color:#74c0fc;">파란색</option>
                        <option value="#f06595" style="color:#f06595;">핑크색</option>
                        <option value="#63e6be" style="color:#63e6be;">연두색</option>
                        <option value="#a9e34b" style="color:#a9e34b;">초록색</option>
                        <option value="#4d638c" style="color:#4d638c;">남색</option>
                        <option value="#495057" style="color:#495057;">검정색</option>
                    </select>
                </div>
                <!--   <input type="hidden" id="mber_sn" name="mber_sn" value="1">  -->
                <input type="hidden" id="mber_sn" name="mber_sn" value="${loginUser.mber_sn }">
                <div class="form-group">
                    <label for="mber_schdul_cn">설명</label>
                    <textarea class="form-control" id="mber_schdul_cn" name="mber_schdul_cn"></textarea>
                </div>
            </div>
            <!-- /.card-body -->

            <div class="card-footer">
                <button type="button" class="btn btn-default" id="cancelBtn" style="float: right; border-color: #ddd;" onclick="CloseWindow();">취 소</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <button type="button" class="btn btn-primary" id="registBtn" onclick="regist_go();" style="float: right; margin-right: 10px; background-color: #215287; border: 1px solid #215287; ">등 록</button>
                &nbsp;&nbsp;&nbsp;&nbsp;
            </div>
        </form>
    </div>
</div>
</div>
</section>

    <script>
        //날짜 선택
        $(function() {
            $('input[name="mber_schdul_bgnde"]').daterangepicker({
                timePicker: true,
                timePicker24Hour: true,
                singleDatePicker: true,
                timePickerIncrement: 10,
                //autoUpdateInput: false,
                startDate: moment().startOf('hour'),
                endDate: moment().startOf('hour').add(32, 'hour'),
                locale: {
                    format: 'YYYY-MM-DD HH:mm', // 일시 노출 포맷
                    //format: 'YYYY-MM-DD HH:mm',     // 일시 노출 포맷
                    applyLabel: "확인", // 확인 버튼 텍스트
                    cancelLabel: "취소", // 취소 버튼 텍스트
                    daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"],
                    monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
                }
            });

            $('input[name="mber_schdul_endde"]').daterangepicker({
                timePicker: true,
                timePicker24Hour: true,
                singleDatePicker: true,
                timePickerIncrement: 10,
                //autoUpdateInput: false,
                startDate: moment().startOf('hour'),
                endDate: moment().startOf('hour').add(32, 'hour'),
                locale: {
                    format: 'YYYY-MM-DD HH:mm', // 일시 노출 포맷
                    //format: 'YYYY-MM-DD HH:mm',     // 일시 노출 포맷
                    applyLabel: "확인", // 확인 버튼 텍스트
                    cancelLabel: "취소", // 취소 버튼 텍스트
                    daysOfWeek: ["일", "월", "화", "수", "목", "금", "토"],
                    monthNames: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"]
                }
            });


        });

        function regist_go() {
            var m = moment($("input[name='mber_schdul_endde']").val());
            var s = moment($("input[name='mber_schdul_bgnde']").val());
            var startDate = s.format();
            var endDate = m.add('days', 1).format();
            var realStartDate = startDate.substr(0, 10);
            var realEndDate = endDate.substr(0, 10);
            //endDate.format('YYYY-MM-DD');
            console.log(m);
            console.log("s:" + s);
            console.log("start:" + startDate);
            console.log("realstart:" + realStartDate);
            console.log(realEndDate);
            if ($("input[name='mber_schdul_nm']").val() == "") {
                alert("일정명은 필수입니다.");
                $("input[name='mber_schdul_nm']").focus();

                return;
            }
            if ($("input[name='mber_schdul_bgnde']").val() > $("input[name='mber_schdul_endde']").val()) {
                alert('끝나는 날짜가 앞설 수 없습니다.');
                return;
            }

            if ($("input:checkbox[id='mber_allday']").is(":checked") == true) {
                document.registForm.mber_schdul_bgnde.value = realStartDate;
                document.registForm.mber_schdul_endde.value = realEndDate;
                document.getElementById("mber_allday_hidden").disabled = true;

                alert(mber_allday)
            }
            console.log(document.registForm.mber_schdul_endde.value);
            console.log(document.registForm.mber_schdul_bgnde.value);
            console.log(document.registForm.mber_allday.value);
            document.registForm.submit();
        }
    </script>
    <script>
    function test(obj) {
    	let date_4 = new Date(2021, 10, 26);
    	var tex = "사내 포털 시스템 개발을 위한 프로젝트입니다."
    	if(obj.value==1){
    		document.registForm.mber_schdul_nm.value = "산출물 회의";
    		document.registForm.mber_schdul_cn.value = "사내 포털 시스템 개발 산출물작성";
//     		$('#content').summernote('editor.insertText',tex);
    		
    		  document.getElementById('startDate').value = new Date().toISOString().substring(0, 10);
    		  document.getElementById('endDate').value = date_4.toISOString().substring(0, 10);

    	}
    }

    </script>
</body>

</html>
