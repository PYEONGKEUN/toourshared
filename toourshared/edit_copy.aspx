﻿<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">
    protected void btnLogout_Click(object sender, EventArgs e)
    {
        Session.Abandon();
        Response.Redirect("/index.aspx");
    }

    protected void btnMypage_Click(object sender, EventArgs e)
    {
        Response.Redirect("/MyPage.aspx");
    }

    protected void btnJoin_Click(object sender, EventArgs e)
    {
        Response.Redirect("/join.aspx");
    }

    protected void btnFindIDPW_Click(object sender, EventArgs e)
    {
        Response.Redirect("/find_idpw.aspx");
    }
</script>


<html>
<head>
    <meta charset = "utf-8">
    <meta name = "viewport" content= "width=device-width, initial-scale=1">

    <title>TO OUR SHARED : EDIT</title>

    <!-- Font -->
    <link href = "https://fonts.googleapis.com/css?family=Mansalva|Nanum+Gothic|Nanum+Myeongjo|Noto+Sans+KR|Lora|Jua&display=swap" rel = "stylesheet" >

    <!-- Bootstrap -->
    <link rel = "stylesheet" href = "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity= "sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin= "anonymous" >
	
	<!-- JS -->
    <script src= "https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity= "sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin= "anonymous" ></script>
    <script src= "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity= "sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin= "anonymous" ></script>
    <script src= "https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity= "sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin= "anonymous" ></script>

    <style>
        html, body, form{
            margin: 0;
            padding: 0;
            list-style: none;
			line-height: 1;
			height: 100%;
			position: relative;

            /* 전체 배경색 */
			background-color: #00b9f1;
			background-repeat: no-repeat;
        }
		
		.topnavUl {
			margin: 0;
            padding: 0;

            list-style: none;
            text-decoration: none;

            font-size: 20px;
            font-family: '맑은고딕';
		}
		
		.topnavLi{
			margin: 0;
            padding: 0;

            list-style: none;
            text-decoration: none;

            font-size: 20px;
            font-family: '맑은고딕';
		}
		
		.topnavLi ul, li{
			list-style: none;
			text-decoration: none;
			padding: 0;
			margin: 0;
		}
		
		a {
			color: white;
			text-decoration: none;
		}

        #nav {
            z-index: 99999;
			position: fixed;
            width: 100%;
			height: auto;
            /* absolute는 부피를 못잡으니까 width 100% */
            overflow: hidden;
            font-size: 25px;

            transition-duration: 0.5s;

        }

        #nav:hover {
            height: 250px;
            transition: background .5s;
            background-color: rgba(249, 192, 12, 0.95);
        }

        #nav>ul {
            text-align: center;
            font-family: 'Mansalva', cursive;
            font-size: 25px;
        }

        #nav>ul>li {
            display: inline-block;
            position: relative;

            padding: 0px 50px;
        }

        #nav>ul>li>a {
            display: block;
            padding: 30px 15px 20px;
            line-height: 30px;
            transition: color 0.9s;
            transition: background 0.4s;

            /* 부트스트랩 적용 후 nav 효과 적용이 되는걸 방지하기 위해 */
            text-decoration: none;


            /* 상단 메뉴 글씨 색 */
            color: white;
        }

        #nav>ul>li:hover>a {
            /* 메뉴에 마우스 올렸을 때 발생할 스타일(1Depth) */
            transition: border .5s;
            border-bottom: 3px solid #ff7473;

        }

        #nav ul ul {
            /*display: none;*/
            position: absolute;
            width: 100%;
            /* absolute는 부피를 가질 수 없다 */
            margin: 0px -50px;
        }

        #nav ul ul a {
            /* 2Depth li Style */
            display: block;
            line-height: 40px;
            font-size: 14px;
            color: white;
        }

        #nav ul ul a:hover {
            /* SubMenu 마우스 올렸을 때 발생할 스타일 */
            font-weight: bold;

            /* 부트스트랩 적용 후 nav 효과 적용이 되는걸 방지하기 위해 */
            text-decoration: none;
        }

        #nav li:hover ul {
            display: block;
        }

        #nav li:nth-child(1) ul {
            left: 0;
            width: 100%;
        }
		
        .nav-logo {
            /* 웹 사이트 좌측 상단에 위치한 로고 div style */
        }

        .nav-logo-item {
            font-family: 'Mansalva', cursive;
            font-size: 25px;
            transition: .5s;
        }

        .nav-logo-item:hover {
            transition: font .5s;
            font-size: 27.5px;
            color: white;

            /* 부트스트랩 적용 후 텍스트에 적용되는 효과 방지를 위해 */
            text-decoration: none;
        }
		
        .nav-log-area {
            /* 로그인, 로그아웃 영역 */
            width: 150px;
            height: 40px;

            padding-bottom: 5px;
            border: 2px solid white;
            border-radius: 15px;

            transition: .5s;

        }

        .nav-log-item {
            font-size: 20px;
            border: none;
            outline: none;
            cursor: pointer;

            margin-top: 8px;
            color: white;
            background-color: transparent;
        }
		
        /* 창 크기 조절 시 nav display none 설정 */
        @media only screen and (max-width: 1600px) {
            .topnav {
                display: none;
            }

            .topnav>ul>li>.nav-logo>.nav-logo-item {
                float: left;
                display: block;
            }
        }
		
		.section{
			top: 100px;
			width: 100%;
			height: 100%;
			position: relative;
		}
		
		.profile{
			width: 935px;
			height: 100%;
			margin: 0 auto;
			overflow: hidden;
			padding-bottom: 50px;
		}
		
		.profileArea{
			width: 100%;
			max-width: 935px;
			height: 80%;
			overflow: hidden;
			margin: 60px auto 0;
			
			background-color: white;
			border: 0.5px solid rgba(0, 0, 0, 0.3);
			border-radius: 3px;
		}
		
		.profileHeader{
			width: 100%;
			height: 30%;
			
			position: relative;
		}
		
		.profileItem1{
			display: flex;
			width: inherit;
			height: 100%;
		}
		
		.profileImage{
			display: flex;
			justify-content: center;
			align-items: center;
			
			width: 30%;
			height: 100%;
			
			position: relative;
		}
		
		.profileImage img{
			width: 130px;
			height: 130px;
		}
		
		.profileID{
			display: flex;
			flex-direction: column;
			justify-content: center;
			
			width: 70%;
			height: 100%;
			
			position: relative;
		}
		
		.profileID .ID{
			padding: 10px 10px 0;
		}
		
		.profileID .ID > .idSpan1 {
			font-size: 30px;
			font-weight: 300;
		}
		
		.profileID .ID > .idSpan2{
			font-size: 12px;
			font-weight: 700;
		}
		
		.profileID .editTxt{
			padding: 10px 10px 0;
		}
		
		.profileID .imageEdit a{
			color: darkorange;
			font-weight: 700;
			text-decoration: none;
		}
		
		.profileContents{
			display: flex;
			flex-direction: column;
			flex-wrap: nowrap;
			
			width: 100%;
			height: 70%;
			padding: 70px 0px 0px;
			position: relative;
			background-color: #eee;
		}
		
		.profileItem2{
			width: 100%;
			height: 20%;
			
			display: flex;
			flex-direction: row;
			justify-content: center;
			align-item: center;
		}
		
		.profilePw{
			padding: 10px;
			
			display: flex;
			flex-direction: row;
			justify-content: center;
			align-items: center;
			
			left: 25%;
			position: absolute;
		}
		
		.profilePwTxt{
			padding: 0 15px 0 0;
		}
		
		.profilePwTxt .pwTxtSpan{
			font-size: 18px;
			font-weight: 300;
		}
		
		.profilePwEdit > input{
			width: 400px;
			height: 50px;
			
			color: dimgray;
			font-size: 15px;
			padding: 0 10px;
			
			outline: none;
			border: 1px solid rgba(0, 0, 0, 0.25);
			border-radius: 2px;
			transition-duration: .5s;
		}
		
		.profileItem3{
			width: 100%;
			height: 20%;
			
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-item: center;
		}
		
		.profileTel{
			padding-left: 27px;
			
			display: flex;
			flex-direction: row;
			justify-content: center;
			align-items: center;
			
			left: 25%;
			position: absolute;
		}
		
		.profileTelTxt{
			padding: 0 15px 0 0;
		}
		
		.profileTelTxt > span{
			font-size: 18px;
			font-weight: 300;
		}
		
		.profileTelTxt > span:focus .modal{
			
		}
		
		.profileTelEdit > input{
			width: 400px;
			height: 50px;
			
			color: dimgray;
			font-size: 15px;
			padding: 0 10px;
			
			outline: none;
			border: 1px solid rgba(0, 0, 0, 0.25);
			border-radius: 2px;
			transition-duration: .5s;
		}
		
		
		.profileItem4{
			width: 100%;
			height: 25%;
		}
		
		.profileQna{
			width: 100%;
			height: 100%;
			
			display: flex;
			flex-direction: row;
			justify-content: center;
			align-items: center;
		}
		
		.profileQnaTxt{
			width: auto;
			height: inherit;
			
			display: flex;
			flex-direction: row;
			align-items: center;
			
			left: 15.75%;
			position: relative;
		}
		
		.profileQnaTxt span{
			font-size: 18px;
			font-weight: 300;
			
			padding-right: 10px;
		}
		
		.profileQnaItem{
			width: 75%;
			height: inherit;
			
			display: flex;
			flex-direction: column;
			justify-content: center;
			align-items: center;
		}
		
		.profileQSelect select{
			width: 400px;
			height: 45px;
			
			color: dimgray;
			font-size: 15px;
			padding: 0 10px;
			
			outline: none;
			border: 1px solid rgba(0, 0, 0, 0.25);
			border-top-left-radius: 2px;
			border-top-right-radius: 2px;
		}
		
		.profileA .profileAEdit input{
			width: 400px;
			height: 45px;
			
			color: dimgray;
			font-size: 15px;
			padding: 0 10px;
			
			outline: none;
			border: 1px solid rgba(0, 0, 0, 0.25);
			border-top: none;
			border-bottom-left-radius: 2px;
			border-bottom-right-radius: 2px;
			transition-duration: .5s;
		}
		
		.profileItem5{
			width: 100%;
			height: 15%;
			padding-top: 77px;
		}
		
		.profileUpdate{
			height: 100%;
			
			display: flex;
			flex-direction: row;
			justify-content: center;
			align-items: center;
		}
		
		.updateButton input{
			width: 150px;
			height: 40px;
			
			border: none;
			outline: none;
			color: snow;
			background-color: rgba(53, 56, 102, 0.7);
			border-radius: 2px;
			transition-duration: .5s;
		}
		
		.updateButton input:hover{
			background-color: rgba(53, 56, 102, 1);
			transition-duration: .5s;
		}
		
		.footer
		{
			width: 100%;
			height: 150px;
			position: relative;
			background-color: #272625;
		}
		
		.footerText{
			width: 100%;
			height: inherit;
			
			color: white;
			
			display: flex;
			flex-direction: row;
			justify-content: center;
			align-items: center;
			position: absolute;
		}
		
		/* modal Css */
		
		.modal-dialog{
			width: 100%;
			height: 100%;
			display: flex;
			flex-direction: row;
			justify-content: center;
			align-items: center;
		}
		
		.modal-content{
			display: flex;
			flex-direction: column;
			flex-wrap: nowrap;
		}
		
		.modal-header{
			display: flex;
			flex-direction: row;
			justify-content: center;
			align-items: center;
			
			height: 70px;
			border-bottom: 0.5px solid rgba(0, 0, 0, 0.25);
		}
		
		.modal-header .modal-header-item1{
			width: auto;
			font-size: 20px;
			font-weight: 400;
		}
		
		.modal-body{
			text-align: center;
			height: 180px;
			transition-duration: .5s;
			border-bottom: 0.5px solid rgba(0, 0, 0, 0.45);
		}
		
		.modal-footer{
			border: none;
			height: 70px;
			
			display: flex;
			flex-direction: row;
			justify-content: center;
			align-items: center;
		}
		
		.fileText{
			padding: 30px 0px 15px;
		}
		
		.fileText .fileTextSpan1{
			color: firebrick;
			font-size: 18px;
		}
		
		.fileText .fileTextSpan2{
			font-size: 16px;
			font-weight: 400;
		}
		
		.fileUpload input[type="file"] {
			position: absolute;
			width: 1px;
			height: 1px;
			padding: 0;
			margin -1px;
			overflow: hidden;
			clip: rect(0,0,0,0);
			border: 0;
		}

		.fileUpload label{
			display: inline-block;
			padding: 13px;
			color: black;
			font-size: 12px;
			font-weight: 300;
			line-height: normal;
			vertical-align: middle;
			background-color: rgba(246, 179, 82, 0.85);
			cursor: pointer;
			border: 1px solid #ebebeb;
			border-bottom-color: #e2e2e2;
			border-radius: .25em;
			transition-duration: .5s;
		}
		
		.fileUpload label:hover{
			transition-duration: .5s;
			background-color: rgba(246, 179, 82, 1);
		}

		.fileUpload .upload-name{
			display: inline-block;
			padding: 10px;
			width: 250px;
			height: 40px;
			line-height: normal;
			font-size: 12px;
			font-weight: 300;
			text-align: left;
			background-color: #f5f5f5;
			border: 1px solid #ebebeb;
			border-bottom-color: #e2e2e2;
			border-radius: .25em;
			-webkit-appearance: none;
			-moz-appearance: none;
			appearance: none;
		}
		
		.fileUploadButton{
			transition-duration: .9s;
			padding: 30px;
			display: none;
		}
		
		.fileUploadButton input{
			width: 80px;
			height: 30px;
			font-size: 13px;
			font-weight: 300;
			
			border: none;
			outline: none;
			
			border: 1px solid #ebebeb;
			border-radius: .25em;
			color: black;
			background-color: rgba(246, 179, 82, 0.85);
			transition-duration: .5s;
		}
		
		.fileUploadButton input:hover{
			transition-duration: .5s;
			background-color: rgba(246, 179, 82, 1);
		}
		
		.fileUploadArea{
			padding: 25px 0;
		}
		
		#fileUploadImage{
			width: 130px;
			height: 130px;
			border-radius: 100%;
		}
		
	</style>
	<script>
        /* scroll할 때 발생할 이벤트 */
        window.onscroll = function() {
            scrollFunction();
        }

        function scrollFunction() {
            var nav = $("nav");
            var v_scroll = $(window).scrollTop();

            if (v_scroll >= 20) {
                document.getElementById("nav").style.background = "rgba(249, 192, 12, 0.95)";
            } else if (v_scroll <= 0) {
                document.getElementById("nav").style.background = "";
            }
        }
		
		/* Modal 열 시 창크기 및 button display 초기화 */
		$(document).ready(function(){
			document.getElementById("profileEdit").onclick=function(){
				document.getElementById("modalBody").style.height = "180px";
				document.getElementById("fileUploadBtn").style.display = "none";
				$('#filePath').val("...");
			};
		});
		
		/* FileUpload (경로 없이 무조건 파일명만 뜨게) */
		$(document).ready(function(){
			var fileTarget = $('.fileUpload .upload-hidden');
			var originalFileName;
			fileTarget.on('change', function(){ // 값이 변경되면
				if(window.FileReader){ // modern browser
					originalFileName = $(this)[0].files[0].name;
					
					var filename = $(this)[0].files;
					var filename = $(this)[0].files[0].name;
				}
				else
				{ // old IE
					originalFileName = $(this).val();
					var filename = $(this).val().split('/').pop().split('\\').pop(); // 파일명만 추출
				}
			
				// 추출한 파일명 삽입
				$(this).siblings('.upload-name').val(filename);
				
				// modalBody 부분 높이 조절 및 업로드 버튼 나타내기
				document.getElementById("modalBody").style.height = "400px";
				document.getElementById("fileUploadBtn").style.display = "block";
				
				var image = document.getElementById("fileUploadImage");
				image.alt = filename;
				image.src = originalFileName;
			});
		});
		
	</script>
</head>

<body>
    <form name="form1" runat="server">
    <!-- navbar 영역 -->
    <div id="nav" class="topnav">
        <ul class="topnavUl">
            <li class="topnavLi">
                <div class="nav-logo">
                    <a href="index.aspx" class="nav-logo-item">To Our Shared</a>
                </div>
            </li>
            <li class="topnavLi">
                <a>Intro</a>
                <ul>
                    <li><a href="#">TOUPLE</a></li>
                </ul>
            </li>
            <li class="topnavLi">
                <a>Shared</a>
                <ul>
                    <li><a href="search.aspx">검색</a></li>
                </ul>
            </li>
            <li class="topnavLi">
                <a>Event</a>
                <ul>
                    <li><a>진행중인 이벤트</a></li>
                    <li><a>종료된 이벤트</a></li>
                </ul>
            </li>
            <li class="topnavLi">
                <a>Help</a>
                <ul>
                    <li><a href="FAQ.aspx">자주 찾는 질문</a></li>
                </ul>
            </li>
        <% 
            if (IsLogin.isLogin() == false)
            {
        %>
            <li class="topnavLi">
                <div class="nav-log">
                    <a>
                        <div class="nav-log-area">
                            <asp:Button ID="btnLogin" runat="server" Text="로그인" class="nav-log-item" PostBackUrl="~/login.aspx"/>
                        </div>
                    </a>
                </div>
                <ul>
                    <br />
                    <li><asp:Button ID="btnJoin" runat="server" Text="회원가입" OnClick="btnJoin_Click" /></li>
                    <li><asp:Button ID="btnFindIDPW" runat="server" Text="계정찾기" OnClick="btnFindIDPW_Click" /></li>
                </ul>
            </li>
        <%  
            }
            else
            {
        %>
            <li class = "topnavLi" >
				<a href = "#" ><% string id = Session["mem_id"].ToString(); Response.Write(id); %></a>
                <ul>
                    <li><asp:Button ID="btnMypage" runat="server" Text="마이페이지" OnClick="btnMypage_Click" /></li>
                    <li><asp:Button ID="btnLogout" runat="server" Text="로그아웃" OnClick="btnLogout_Click" /></li>

                </ul>
            </li>
        <% 
            }
        %>
        </ul>
    </div>
	<div class = "section">
		
		<!-- profile edit -->
		<div class = "profile">
			<div class = "profileArea">
				<div class = "profileHeader">
					<div class = "profileItem1">
						<div class = "profileImage">
							<img src = "./img/UserNoneImage.png" alt = "프로필 사진">
						</div>
						<div class = "profileID">
							<div class = "ID">
								<span class = "idSpan1">milk9503</span>
								<span class = "idSpan2">(이민혁)</span>
							</div>
							<div class = "imageEdit">
								<div class = "editTxt">
									<a href = "#" data-toggle="modal" data-target="#myModal" id="profileEdit">
										<span>프로필 사진 편집</span>
									</a>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class = "profileContents">
					<div class = "profileItem2">
						<div class = "profilePw">
							<div class = "profilePwTxt">
								<span class = "pwTxtSpan">비밀번호</span>
							</div>
							<div class = "profilePwEdit">
								<input type = "password" placeholder = "변경하실 비밀번호를 입력하세요.">
							</div>
						</div>
					</div>
					<div class = "profileItem3">
						<div class = "profileTel">
							<div class = "profileTelTxt">
								<span>연락처</span>
							</div>
							<div class = "profileTelEdit">
								<input type = "text" placeholder = "변경하실 연락처를 입력하세요. (- 제외)">
							</div>
						</div>
					</div>
					<div class = "profileItem4">
						<div class = "profileQna">
							<div class = "profileQnaTxt">
								<span>본인확인 질문</span>
							</div>
							<div class = "profileQnaItem">
								<div class = "profileQSelect">
									<select>
										<option value = "1">본인이 태어난 곳은?</option>
										<option value = "2">처음 키운 반려견은?</option>
										<option value = "3">본인의 출신 초등학교는?</option>
										<option value = "4">내 부모님의 고향은?</option>
										<option value = "5">학창시절 나의 별명은?</option>
									</select>
								</div>
								<div class = "profileA">
									<div class = "profileAEdit">
										<input type = "text" placeholder = "변경하실 답변을 입력하세요.">
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class = "profileItem5">
						<div class = "profileUpdate">
							<div class = "updateButton">
								<input type = "button" value = "프로필 편집 완료"/>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 바닥글 영역 -->
	<div class="footer">
		<div class = "footerText">
			ㅂㄷㄱ
		</div>
	</div>
	
	<!-- 프로필 사진 편집 Modal -->
	<div class="modal fade" id="myModal">
  		<div class="modal-dialog">
    		<div class="modal-content">

      			<!-- Modal Header -->
      			<div class="modal-header">
        			<div class = "modal-header-item1">
						프로필 사진 편집
					</div>
      			</div>

      			<!-- Modal body -->
      			<div class="modal-body" id="modalBody">
        			<div class = "fileText">
						<span class = "fileTextSpan1">*</span>
						<span class = "fileTextSpan2">프로필 사진 첨부는 2MB까지 가능합니다.</span>
					</div>
					<div class = "fileUpload">
						<input class="upload-name" disabled="disabled" id="filePath">
						<label for ="fileStyle">사진 첨부</label>
						<input type = "file" id="fileStyle" class = "upload-hidden">
					</div>
					<div class = "fileUploadButton" id="fileUploadBtn">
						<div class = "fileUploadArea">
							<img id = "fileUploadImage" alt="">
						</div>
						<input type = "button" value = "적용" data-dismiss="modal">
					</div>
      			</div>

      			<!-- Modal footer -->
      			<div class="modal-footer">
					<div class = "updateButton">
        				<input type="button" style="width: 85px;" data-dismiss="modal" value="닫기">
					</div>
      			</div>
    		</div>
  		</div>
	</div>
  </form>
</body>
</html>