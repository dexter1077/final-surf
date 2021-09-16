<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
<style>
    .outer{
        width: 1200px;
        margin: auto;
    }
    .container{display: flex;}
    .sub-nav{width: 20%; height: 800px;}
    .content{width: 80%; font-weight: bold;}
    .menu-title{
        font-size: 25px; 
        font-weight: bold; 
        height: 100px;
        line-height: 70px;
        margin-left: 15px;
    }
    #teacher-form{margin-left: 15px; font-size: 17px;}
    #teacher-form input{
        font-size: 15px;
        padding:10px 10px 10px 5px;
        display:block;
        width:300px;
        border:none;
        border-bottom:1px solid #757575;
    }
    #teacher-form textarea{
        border:1px solid #757575;
    }
    /*.teacher-img{margin-top: 50px;}*/
    #teacher-form button{
        background: rgb(32, 155, 212); 
        width: 400px;
        color: white;
        font-size: 15px;
        font-weight: bold;
    }
    #teacher-form button:hover{cursor: pointer;}

    /*프로필 사진*/
    .file-upload {
        background-color: #ffffff;
        width: 100%;
        margin: 0 auto;
        padding: 20px;
        margin-top: 50px;
        margin-bottom: 50px;
    }
    .file-upload-btn {
        width: 100%;
        margin: 0;
        color: #fff;
        background: rgb(220, 53, 69);
        border: none;
        padding: 10px;
        border-radius: 4px;
        transition: all .2s ease;
        outline: none;
        text-transform: uppercase;
        font-weight: 700;
    }
    .file-upload-btn:hover {
        background:white;
        color: rgb(220, 53, 69);
        transition: all .2s ease;
        cursor: pointer;
    }
    .file-upload-btn:active {
        border: 0;
        transition: all .2s ease;
    }
    .file-upload-content {
        display: none;
        text-align: center;
        width: 110px;
        height: 110px; 

    }
    .file-upload-input {
        position: absolute;
        margin: 0;
        padding: 0;
        width: 110px;
        height: 110px; 
        outline: none;
        opacity: 0;
        cursor: pointer;
    }
    .image-upload-wrap {
        border: 4px solid darkgray;
        width: 110px;
        height: 110px;            
        border-radius: 1000px !important;
        position: relative;
    }
    .image-dropping,
    .image-upload-wrap:hover {
        border: 4px dashed #ffffff;
    }
    .image-title-wrap {
        padding: 0 15px 15px 15px;
        color: #222;
    }
    .drag-text {
        text-align: center;
    }
    .drag-text p {
        font-weight: 100;
        text-transform: uppercase;
        color: black;
        padding: 30px 0px 0px 0px;
        font-size: 13px;
    }
    .file-upload-image {
        max-height: 200px;
        max-width: 200px;
        margin: auto;
        padding: 20px;
    }
    .remove-image {
        width: 100%;
        margin: 0;
        border: none;
        padding: 10px;
        border-radius: 4px;
        transition: all .2s ease;
        outline: none;
        text-transform: uppercase;
        font-weight: 700;
    }
    .remove-image:hover {
        background: #c13b2a;
        color: white;
        transition: all .2s ease;
        cursor: pointer;
    }
    .remove-image:active {
        border: 0;
        transition: all .2s ease;
    }
</style>
</head>
<body>

    <div class="outer">
        
        <!-- header -->
		<jsp:include page="../common/header.jsp" />
		
		<br><br>

        <div class="container">

            <!-- 마이페이지 사이드바 -->
            <div class="sub-nav">
            <br>
                <jsp:include page="memberMenubar.jsp" />
            </div>

            <div class="content">

                <!-- 타이틀 -->
                <div class="menu-title">
                    <p>강사 신청하기</p>
                </div>

                <!-- 강사 신청 -->
                <form id="teacher-form" action="apply.tea" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="teacherNo" value="${ loginUser.userNo }">

                    <!-- 사진 등록 -->
                    <div class="teacher-img">
                        <span>사진 등록</span> <br><br>
                        
                            <!--<button class="file-upload-btn" type="button" onclick="$('.file-upload-input').trigger( 'click' )">첨부파일 등록하기</button>-->
                            
                            <div class="image-upload-wrap">
                            <input class="file-upload-input" type='file' name="upfile" onchange="readURL(this)" accept="image/*" />
                            <div class="drag-text">
                                <p>이미지를 <br> 등록하세요!</p>
                            </div>
                            </div>
            
                            <div class="file-upload-content">
                            <img class="file-upload-image" src="#" name="upfile" alt="your image" onclick="removeUpload()" />
                            <div class="image-title-wrap">
                                <!--<button type="button" onclick="removeUpload()" class="remove-image"><span class="image-title"></span>를 수정하시겠어요?</button>-->
                            </div>
                            </div>
                            
                       
                    </div>
                    
                    <br>

                    강사명 <br>
                    <input type="text" name="nickname" placeholder="사용하실 강사명을 입력해주세요"  style="width:400px; margin-top: 10px;" required>
                    
                    <br><br>
                    
                    휴대폰 번호 <br>
                    <input type="text" name="phone" placeholder="휴대폰 번호를 입력해주세요. (-제외)" style="width:400px; margin-top: 10px;" required>

                    <br><br>

                    강사님을 소개해주세요 <br>
                    <textarea name="introContent" cols="42" rows="5" style="resize:none; margin-top: 10px;" maxlength="100"></textarea>

                    <br><br>

                    어떤 강의를 열고 싶으신가요? <br>
                    <div class="cate-select" style="margin-top: 10px;">
						
                        <select name="subNo" id="subCat">
                            
                        </select>
						
                    </div>
                    <br>
                    <button type="submit" class="btn apply-teacher" >강사 신청</button>

                </form>
                <br><br>


            </div>

        </div>


        <!-- footer -->
        <jsp:include page="../common/footer.jsp" />

    </div>


    <script>
    	/*
	    $(".apply-teacher").click(){
	        console.log('success');
	        alert('강사 신청이 완료되었습니다!\n승인까지 2~3일 소요됩니다.');
	    };*/
	    
	    $(document).ready(function(){
    		
        	$.ajax({
				url: 'subcat.do',
				success:function(list){
					
					var value = "";
	        		for(var s in list){
	        		
            			value += '<option value="' + list[s].subcatNo + '" >'
						+ list[s].subcatName + '</option>'; 
            				
	        		}
					$("#subCat").html(value);
					
				}, error:function(){
					console.log("카테고리 조회 실패");
				}
				
			}); // End of ajax
        
        });
	    
        function readURL(input) {
	        if (input.files && input.files[0]) {
	
	            var reader = new FileReader();
	
	            reader.onload = function(e) {
		            $('.image-upload-wrap').hide();
		
		            $('.file-upload-image').attr('src', e.target.result);
		            $('.file-upload-content').show();
		
		            $('.image-title').html(input.files[0].name);
	            };
	
	            reader.readAsDataURL(input.files[0]);
	
	        } else {
	            removeUpload();
        	}
        };
        
        // 업로드한 파일 수정 = 제거
        function removeUpload() {
	        $('.file-upload-input').replaceWith($('.file-upload-input').clone());
	        $('.file-upload-content').hide();
	        $('.image-upload-wrap').show();
        }
        $('.image-upload-wrap').bind('dragover', function () {
            $('.image-upload-wrap').addClass('image-dropping');
        });
        $('.image-upload-wrap').bind('dragleave', function () {
            $('.image-upload-wrap').removeClass('image-dropping');
        });

    </script>
    
</body>
</html>