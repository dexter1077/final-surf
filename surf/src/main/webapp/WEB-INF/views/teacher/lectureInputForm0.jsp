<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>강의 등록하기_기본정보</title>
<style>
	.content{width:820px; height:630px;}
    b{font-size:15px;}
    /*공통으로 뺄만한거*/
    .note{
        font-size: 12px;
        color: gray;
    }
    .content>div{
        float: left;
    }

    /*고유 영역*/
    .form-control{
        font-size: 14px;
        height: 40px;
    }
    tr>th{height:50px;}
    .select-form{width:500px; margin-bottom: 10px;}
    .main-content{width:540px; height:100%;}
    .desciption{
        display: inline;
        width:210px;
        height: 95px;
        background: lightgray;
    }
    /*영역 나누기*/
    .main-content{width:760px; height:580px;}
    .main-content>div{
        float: left;
    }
    .right-area{
        width: 210px;
        height: 95px;
        background: rgb(241, 241, 241);
        margin: 135px 0px 0px 40px;
    }

    .right-area{
        padding: 4px 8px;
    }

    #period{width: 300px; display: inline-block; appearance: none;}

    input[type="number"]::-webkit-outer-spin-button,
    input[type="number"]::-webkit-inner-spin-button{
        -webkit-appearance: none;
    }
</style>
</head>
<body>
	<jsp:include page="common/lectureEnrollForm.jsp"/>
<div class="content">

    <div class="main-content">
        <div class="left-area">
            <form id="inputForm" action="updateLecture0.te" method="POST">
            <input type="hidden" name="classNo" value="${ l.classNo }">
            <input type="hidden" name="currentPage" value="${currentPage}">
                <label class="guide">간단하게 어떤 클래스인지 알려주세요</label>
                <label class="note">
                    언젠가 이런 걸 가르쳐봐야지 생각해본 적이 있으신가요?<br>
                    간단히 강사님이 알려 줄 수 있는 카테고리를 설정해봐요.
                </label>
                <br>
                <br>
                <div>
                    
                </div>
                <label for="mainCat" class="subGuide">카테고리</label>
                <select name="maincatNo" id="maincatNo" class="form-control select-form" onchange="loadSubCatInfo($(this).val());">
                </select>
                <select name="subcatNo" id="subcatNo" class="form-control select-form">
                    <option value="11">뜨개 · 자수</option>
                    <option value="12">가죽 공예</option>
                    <option value="13">플라워</option>
                </select>
                <br>
                <br>
                <label class="guide">강의 정보</label>
                <label class="note">
                    수강생들이 강의에 필요한 준비물 및 강의 시간 등<br>
                    강의에 필요한 기타 정보를 입력해주세요!
                </label>
                <br><br>
                <table>
                    <tr>
                        <th width="100px;">강의기간 *</th>
                        <td width="400px;">
                            <input id="period" type="number" class="form-control" placeholder="강의 기간을 숫자로 입력해주세요" name="period" min="0" max="360"> <b>일</b>
                        </td>
                    </tr>
                    <tr>
                        <th>준비물 *</th>
                        <td><input type="text" class="form-control" placeholder="수강생이 강의에 필요한 필수 준비물을 입력해주세요" name="need" value="${ l.need }" maxlength="40"></td>
                    </tr>
                    <tr>
                        <th>유의사항</th>
                        <td><input type="text" class="form-control" placeholder="기타 유의 사항을 입력해주세요" name="note" value="${ l.note }" maxlength="40"></td>
                    </tr>
                </table>
            </form>
        </div>
        <div class="right-area">
            <span class="qus-title">카테고리는 어디에 사용되나요?</span>
            
            <p class="qus-answer">
                카테고리는 학생들이 카테고리 검색을<br>
                통해 노출되는 기준이 될 수 있습니다.
            </p>
        </div>
    </div>
</div>
<script>
    $(function(){
        var $period = $('input[name=period]');
        $period.val('${ l.period }'.substr(0, '${l.period}'.length - 1));

        var $need = $('input[name=need]');

        if($period.val().length > 1 && $need.val().length > 1){
            onLoadCheckSuccess();
        }

        $('input[name=period], input[name=need], input[name=note]').keyup(function () {
            
            if($period.val() < 0){
                $period.val("");
            }

            if($period.val().length > 3){
                $period.val($period.val().substr(0, $period.val().length - 1));
            }

            if($period.val() > 365){
                alertify.alert('365일 이하로 입력해 주세요.');
                $period.val($period.val().substr(0, $period.val().length - 1));
            }

            if($period.val().length > 0 && $need.val().length > 1){
                $('#save-btn').removeAttr('disabled');
            }else{
                $('#save-btn').attr('disabled', true);
            }    

        })
        $('#subcatNo').on('change', function(){
            if($period.val().length > 2 && $need.val().length > 1){
                $('#save-btn').removeAttr('disabled');
            }else{
                $('#save-btn').attr('disabled', true);
            }
        })


        $('.menubar').css('height', '800px');
        $('.outer').css('height', '800px');
        
        // 메인 카테고리 조회
        $.ajax({
            url : "JqAjaxMainCat.te",
            type : "post"
            , success : function(maincat){
                for(var i in maincat){
                    $('select[name=maincatNo]').append('<option value=' + maincat[i].maincatNo +'>' + maincat[i].maincatName + '</option>');
                }
                // 등록하기로 들어온 경우가 아닌경우
                <c:if test="${l.subcatNo ne 0}">
                    loadSelectedSubcat();
                </c:if>
            }, error : function(){
                console.log("서브 카테고리 조회 실패");
            }
        })
        
        
    })
    
    // 메인카테고리 값 변경시 해당 서브카테고리 출력
    function loadSubCatInfo(maincatNo, subcatNo){ 
        $.ajax({
            url : "JqAjaxSubcat.te",
            type : "post",
            data : {
                'maincatNo' : maincatNo
            }, success : function(subcat){
                $('select[name=subcatNo]').html("");
                for(var i in subcat){
                    $('select[name=subcatNo]').append('<option value=' + subcat[i].subcatNo +'>' + subcat[i].subcatName + '</option>');
                }
                
                $('option[value=' + subcatNo + ']').attr('selected', true);
            }, error : function(){
                console.log("서브 카테고리 조회 실패");
            }
        })
    }

    // 저장된 카테고리 select 하기
    function loadSelectedSubcat(){
        var maincatNo = Math.floor(${l.subcatNo} / 10) * 10;
        var subcatNo = ${l.subcatNo};

        $('option[value=' + maincatNo + ']').prop('selected', true);
        loadSubCatInfo(maincatNo, subcatNo);
    }
</script>
<jsp:include page="common/lectureEnrollFormFooter.jsp"/>
</div>
</body>
</html>