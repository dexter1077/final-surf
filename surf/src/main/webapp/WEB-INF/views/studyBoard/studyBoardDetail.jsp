<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디 게시판</title>

<style>

/*본문글*/
#studyDetailTop>div {
	/*border: 1px solid red;*/
	box-sizing: border-box;
	height: 30px;
	margin-right: 0;
}

#writerArea {
	font-size: 12px;
	color: rgb(94, 94, 94);
	width: 40%;
	line-height: 30px;
}

#writerArea>label::after {
	content: "";
	padding-right: 10px;
}

#writerArea>label:last-child:after {
	content: "";
	padding-right: 0;
}

/*댓글부*/
.replyMark {
	float: left;
	width: 5%;
	color: rgb(32, 155, 212);
	font-size: 20px;
}

.replyWriter {
	float: left;
	width: 65%;
	font-size: 13px;
	font-weight: 700;
}

.replyTime {
	float: left;
	width: 30%;
	font-size: 11px;
	text-align: right;
}

.replyContent {
	clear: both;
	font-size: 13px;
}

#replyEnroll, #replyUpdate {
	float: left;
	width: 85%;
	font-size: 12px;
	resize: none;
}

/*신고버튼*/
.report {
	cursor: pointer;
}

input[name=whyReport] {
	font-size: 10px;
}

/*뒤로가기버튼*/
#goBackBtn {
	position: fixed;
	z-index: 998;
	margin-left: 120px;
	font-size: 12px;
	border-radius: 10px;
	padding: 8px 12px 8px 12px;
	border: 1px solid lightgrey;
	color: rgb(94, 94, 94);
	background-color: rgba(0, 0, 0, 0);
}

#goBackBtn:hover {
	opacity: 0.7;
}

.rbtn{
    font-weight: 600;
    font-size: 11px;
    color: rgb(94, 94, 94);
}

.rbtn:hover{
    opacity:0.7;
    cursor:pointer;
}

</style>

</head>

<body>
	
	<jsp:include page="../common/header.jsp"/>
	
	<div class="body-outer">
		<br> <br>

		<div class="long-title">
			함께 공부해요!
			<div style="font-size: 15px; font-weight: normal;">
				<br> 같은 클래스를 듣거나, 관심사를 지닌 사람들과 스터디를 만들어보세요.<br> 함께 공부하면
				실력도 두배 재미도 두배랍니다!
			</div>
			<hr style="background-color: rgb(32, 155, 212); height: 2px;">
		</div>

		<!--뒤로가기 버튼-->
		<button id="goBackBtn" onclick="location.href='list.sb';">
			<i class="fa fa-mail-reply"></i>
		</button>

		<div style="width: 750px; margin: auto; margin-top: 30px;">

			<div id="studyDetailTop">

				<div
					style="font-size: 17px; font-weight: 600; float: left; margin-right: 20px;">${ s.studyTitle }</div>
				<div style="width: 100px; float: left;">
					
					<c:choose>
						<c:when test="${ s.recruit eq 'Y' }">
							<img style="width: 45px; margin-right: 10px;" src="https://img.shields.io/badge/모집중-00B388?style=flat-square&&logoColor=white" />
						</c:when>
						<c:otherwise>
		                    <img style="width: 50px;" src="https://img.shields.io/badge/모집완료-6E6E6E?style=flat-square&&logoColor=white" />
						</c:otherwise>
					</c:choose>
					
					<!-- 신고하기 버튼 -->
					<input class="reported" type="hidden" value="${ s.userNo }">
					<input class="sno" type="hidden" value="${ s.studyNo }">
					<img class="report" data-toggle="modal" data-target="#bReportModal"	data-toggle="tooltip" title="신고하기" src="resources/images/report.jpg" style="width: 13px;">
				</div>

			</div>
			<div id="writerArea" style="width: 100%; clear: both;">
				<label>작성자 : ${ s.writer }</label> <label>작성일 : ${ s.createDate }</label> <label>조회수 : ${ s.count }</label>
			</div>

			<div style="height: 700px; overflow: auto; clear: both; font-size: 12px;">
				${ s.studyContent }
			</div>
			
			<!-- 글 수정하기 / 삭제하기 버튼 -->
			<c:if test="${ loginUser.userNo eq s.userNo }">
				<div align="right">
					<form id="udForm" action="" method="POST">
						<input type="hidden" name="studyNo" value="${ s.studyNo }">
						<a id="updateBtn" onclick="updateDelete(1);" class="btn btn-success btn-sm"> 수정하기 <i class="fas fa-pencil-alt"></i></a>
						<a id="deleteBtn" onclick="updateDelete(2);" class="btn btn-secondary btn-sm" style="margin-left:10px; background-color:rgb(0, 96, 155);"> 삭제하기 <i class="far fa-trash-alt"></i></a>
					</form>
				</div>
				
				<script>
					function updateDelete(num){
						if(num == 1){
							$("#udForm").attr("action", "updateForm.sb").submit();
						} else {
							if(confirm("스터디 글을 삭제하시겠습니까?")){
								$("#udForm").attr("action", "delete.sb").submit();
							}
						}
					}
				</script>
			</c:if>


			<!--댓글시작-->
			<hr style="height: 1px; background-color: lightgray;">
			<h5><b id="rCount"></b></h5>
			
			<!-- 새로운 댓글 작성 -->
			<div id="renewReply">
			<textarea class="form-control" name="replyContent" id="replyEnroll"	maxlength="80" rows="3"></textarea>
			<button id="replyBtn" class="btn btn-sm btn-warning" style="height: 45px; margin-left: 20px; margin-top: 10px; 
				font-size: 12px;" type="button" onclick="insertReply();">등록하기</button>
			</div>

			<!--댓글 목록 -->
			<div id="replyArea" style="clear: both; margin-top: 30px;" align="center">
			</div>
			
			<c:if test="${empty loginUser }">
				<script>
					$(function(){
						$("#replyEnroll").attr("readonly", true).val("로그인 후 이용바랍니다.");
						$("#replyBtn").attr("disabled", true);
					})
				</script>
			</c:if>
			<br><br><br><br><br>
		</div>
	</div>
	
	<script>
		$(function(){
			selectReplyList();

		})
			
		// 댓글 작성
		function insertReply(){
			$.ajax({
				url:"rinsert.sb",
				data:{
					studyNo:${s.studyNo},
					replyWriter:'${loginUser.userNo}',
					replyContent:$("#replyEnroll").val()
				}, success:function(result){
					if(result == "success"){
						$("#replyEnroll").val("");
						selectReplyList();
					}
				}, error:function(){
					console.log("댓글작성 ajax통신 실패");
				}
			})
		}
		
		// 댓글 조회
		function selectReplyList(){
			$.ajax({
				url:"rlist.sb",
				data:{sno:${ s.studyNo }},
				success:function(rlist){
					
					$("#rCount").html("댓글(" + rlist.length + ")");
					
					var result = "";
					if(rlist == ""){
						result = '<div style="width: 100%; margin-bottom: 30px;" align="center"> 등록된 댓글이 없습니다. </div>'						
					} else {
						for( var i in rlist){
							result += '<div class="router" style="width: 100%; margin-bottom: 30px;" align="left">'
										+ '<i class="fas fa-fish replyMark"></i>' 
										+ '<span class="replyWriter">'
											+ rlist[i].replyWriter

										    if(rlist[i].userNo == '${loginUser.userNo}') {
												result += '<input class="rno" type="hidden" value="' + rlist[i].replyNo + '">'
								                        + '<span class="rbtn mx-2 rDel">삭제 <i class="fas fa-trash-alt"></i></span>'
								                        + '<span class="rbtn rUpd">수정 <i class="fas fa-edit"></i></span>'
											}
										
								result += '</span>'
								        + '<span class="replyTime">'
									        + rlist[i].createDate 
										  	+ '<input class="sno" type="hidden" value="' + rlist[i].replyNo + '">'
										  	+ '<input class="reported" type="hidden" value="' + rlist[i].userNo + '">'
										  	+ '<img class="report" data-toggle="modal" data-target="#bReportModal" data-toggle="tooltip" title="신고하기" src="resources/images/report.jpg" style="width: 11px; margin-left: 10px;">'
									  	+ '</span>'
									  	+ '<br>'
										+ '<div class="replyContent">' + rlist[i].replyContent + '</div>'
									+ '</div>'
						}
					}
					$("#replyArea").html(result);
					
				}, error:function(){
					console.log("댓글조회 ajax통신 실패");
					
				}
			})
		
		}
    
		/***************** 댓글 삭제 및 수정 *******************/
		$(function(){
			// 댓글 삭제
            $("#replyArea").on("click", ".rDel", function(){
            	if(confirm("선택한 댓글을 삭제하시겠습니까?")){
            		
            		$.ajax({
            			url:"delete.re",
            			data:{rno:$(this).siblings(".rno").val()},
            			type:"POST",
            			success:function(result){
            				if(result == "success"){
            					selectReplyList();
            				} else {
            					alert("댓글 삭제 실패");
            				}
            			}, error:function(){
            				console.log("ajax통신 실패");
            			}
            		})
            	}

            })
            
            var $replyInsertForm = $("#renewReply").html();

            // 댓글 수정
            $("#replyArea").on("click", ".rUpd", function(){
            	$(this).parents(".router").remove();
            	var update = "";
            	update += '<input id="rno" type="hidden" value="' + $(this).siblings(".rno").val() + '">'
            		    + '<textarea class="form-control" id="replyUpdate" maxlength="80" rows="3">' + $(this).parent().siblings(".replyContent").text() + '</textarea>'
    					+ '<button id="rUpdateBtn" class="btn btn-sm btn-info" style="height: 45px; margin-left: 20px; margin-top: 10px;' 
    					+ 'font-size: 12px;" type="button" onclick="">수정하기</button>'
				$("#renewReply").html(update);                
            })
            
            $("#renewReply").on("click", "#rUpdateBtn", function(){
            	$.ajax({
            		url:"update.re",
            		type:"post",
            		data:{replyNo:$(this).siblings("#rno").val(),
						  replyContent:$(this).siblings("#replyUpdate").val()
            		}, success:function(result){
            			if(result == "success"){
            				alert("댓글이 정상적으로 수정되었습니다.");
            				$("#renewReply").html($replyInsertForm);
            				selectReplyList();
            			}
            		}, error:function(){
            			console.log("ajax통신 실패");
            		}
            	})
            })

        })
	</script>
	
    <!-- 게시글 신고하기 Modal -->
    <div class="modal" id="bReportModal">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-dialog">
                <div class="modal-content">
                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h6 class="modal-title"><b>신고 사유를 선택해주세요.</b></h6>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body">
                        <br>
                        <form action="report.sb" method="POST">
                        	<input type="hidden" id="rtype" name="refType">
                        	<input type="hidden" id="num" name="refNo">
                        	<input type="hidden" name="reporter" value="${ loginUser.userNo }">
                        	<input type="hidden" id="reported" name="reported">
                        	<input type="hidden" id="rsno" name="" value="">
                            <div class="form-check">
                                <label class="form-check-label" for="illegalAd">
                                    <input type="radio" class="form-check-input" name="reportContent" value="부적절한 홍보 게시물">부적절한 홍보 게시물
                                </label>
                            </div>
                            <br>
                            <div class="form-check">
                                <label class="form-check-label" for="infringement">
                                    <input type="radio" class="form-check-input" name="reportContent" value="명예훼손/사생활 침해 등" required>명예훼손/사생활 침해 등
                                </label>
                            </div>
                            <br>
                            <div class="form-check">
                                <label class="form-check-label" for="abuse">
                                    <input type="radio" class="form-check-input" name="reportContent" value="욕설 및 비방 글">욕설 및 비방 글
                                </label>
                            </div>
                            <br>
                            <div class="modal-footer"> <button type="submit" class="btn btn-sm btn-danger">신고하기</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

	<script>
		$(function(){
			$(".report").on("click", function(){
				$("#rtype").val("게시글");
				$("#num").val($(this).siblings(".sno").val());
				$("#reported").val($(this).siblings(".reported").val());
			})
			
			$("#replyArea").on("click", ".report", function(){
				$("#rtype").val("댓글");
				$("#num").val($(this).siblings(".sno").val());
				$("#reported").val($(this).siblings(".reported").val());
				$("#rsno").attr("name", "rsno").val(${ s.studyNo });
			})
			
	        $(".report").tooltip();
			
		})
	</script>
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>