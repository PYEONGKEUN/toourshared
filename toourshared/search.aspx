﻿<%@ Page Language="C#" %>

<!DOCTYPE html>

<script runat="server">

    protected void btnHome_Click(object sender, EventArgs e)
    {
        Response.Redirect("index.aspx");
    }
</script>

<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>TO OUR SHARED : SEARCH</title>

    <!-- Font -->
    <link href="https://fonts.googleapis.com/css?family=Mansalva|Nanum+Gothic|Nanum+Myeongjo|Noto+Sans+KR|Lora|East+Sea+Dokdo|Jua&display=swap" rel="stylesheet">

    <!-- ICON -->
    <script src="https://kit.fontawesome.com/a076d05399.js"></script>
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <!-- JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

    <style>
        html,
        body {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
        }

        .main {
            width: 100%;
            height: 100%;

            overflow: hidden;
            position: absolute;
        }

        .searchBar {
            width: 100%;
            height: 100%;
            display: flex;
            flex-direction: row;

            z-index: 1;
            position: absolute;
        }

        #mapArea {
            width: 100%;
            height: 100%;

            background: url(./img/map.jpg);
            background-size: cover;
            background-repeat: no-repeat;
            z-index: 0;
        }

        .sideBar {
            width: 360px;
            height: 850px;
            margin: 15px 0 15px 15px;

            display: flex;
            flex-direction: column;

            border: 1px solid rgba(0, 0, 0, 0.1);
            border-top-left-radius: 4px;
            border-bottom-left-radius: 4px;
            border-bottom-right-radius: 4px;
            background-color: #fff;
            background-clip: padding-box;
            box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1);
            transition-duration: .5s;
        }

        .sideBarBtn {
            width: auto;
            height: 100%;
            margin-top: 15px;
            margin-left: -1px;

            display: flex;
        }

        .sideBarBtn input[type="button"] {
            width: 50px;
            height: 50px;

            color: white;
            font-size: 15px;
            font-weight: bold;

            outline: none;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-top-right-radius: 4px;
            border-bottom-right-radius: 4px;
            background-color: rgba(0, 185, 241, 0.8);
            transition-duration: .5s;
        }

        .sideBarBtn input[type="button"]:hover {
            transition-duration: .5s;
            background-color: rgba(0, 185, 241, 1);
        }

        .sideBarHome {
            width: auto;
            height: 100%;
            margin-top: 15px;
            margin-left: 15px;

            display: flex;
        }

        .sideBarHome button {
            width: auto;
            height: 50px;

            font-size: 18px;
            padding: 0 10px;
            font-family: 'Mansalva', cursive;

            outline: none;
            border-radius: 4px;
            border: 1px solid rgba(0, 0, 0, 0.1);
            color: white;
            background-color: rgba(0, 185, 241, 0.8);
            transition-duration: .5s;
        }

        .sideBarHome button:hover {
            transition-duration: .5s;
            background-color: rgba(0, 185, 241, 1);
        }

        .sideBarHome .homeBtn {
            width: auto;
            height: 50px;

            font-size: 18px;
            padding: 0 10px;
            font-family: 'Mansalva', cursive;

            outline: none;
            border-radius: 4px;
            border: 1px solid rgba(0, 0, 0, 0.1);
            color: white;
            background-color: rgba(0, 185, 241, 0.8);
            transition-duration: .5s;
        }

        .sideBarHome .homeBtn:hover {
            transition-duration: .5s;
            background-color: rgba(0, 185, 241, 1);
        }

        .header {
            width: 100%;
            height: 50px;

            border-top-left-radius: 4px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);

            display: flex;
            flex-direction: row;
            flex-wrap: nowrap;
            transition-duration: .5s;
        }

        .iconBtnArea {
            width: 15%;
        }

        .iconBtnArea button {
            width: 100%;
            height: 100%;
            font-size: 13px;
            color: rgba(0, 0, 0, 0.7);
            border: none;
            outline: none;
            cursor: pointer;
            background-color: transparent;
        }

        .inputArea {
            width: 85%;
        }

        .inputArea input {
            width: 100%;
            height: 100%;
            padding: 10px;
            color: rgba(0, 0, 0, 0.7);
            border: none;
            outline: none;
        }

        .contents {
            transition-duration: .5s;
            width: 100%;
            height: 85%;
            display: flex;
            flex-direction: column;
        }

        .contentsArea {
            width: 100%;
            height: 100%;

            display: flex;
            flex-direction: column;
        }

        .orderArea {
            transition-duration: .5s;
            width: 100%;
            height: auto;
            padding: 15px 10px 0px;
        }

        .orderRadio {
            width: 100%;
            padding-bottom: 25px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

        .orderRadioItem {
            width: auto;
            height: auto;
            padding: 0 10px;

            font-size: 15px;
            font-weight: 300;
        }

        .orderRadioItem input[type="radio"] {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            border: 0;
        }

        .orderRadioItem input[type="radio"]+label {
            display: inline-block;
            position: relative;
            padding-left: 23px;
            cursor: pointer;
            -webkit-user-select: none;
            -moz-user-select: none;
            -ms-user-select: none;
        }

        .orderRadioItem input[type="radio"]+label:before {
            content: '';
            position: absolute;
            left: 0;
            top: 2px;
            width: 17px;
            height: 17px;
            text-align: center;
            background: #fff;
            border: 1px solid #cacece;
            border-radius: 100%;
        }

        .orderRadioItem input[type="radio"]:checked+label:before {
            background: #fff;
            border-color: #adb8c0;
        }

        .orderRadioItem input[type="radio"]:checked+label:after {
            content: '';
            position: absolute;
            top: 2px;
            left: 0px;
            width: 17px;
            height: 17px;
            border: 5px solid deepskyblue;
            background-color: transparent;
            border-radius: 100%;
        }

        .orTxt {
            font-size: 15px;
            font-weight: bold;
            padding: 8px 10px;
            color: rgba(0, 0, 0, 0.7);
        }

        .boardArea {
            width: 100%;
            height: 100%;
            padding: 0 10px;
            word-spacing: -2px;
        }

        .boardAlign {
            width: 100%;
            height: 100%;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            overflow: auto;
        }

        .boardItem {
            display: flex;
            flex-direction: column;
            padding: 10px 0px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
        }

        .article1 {
            width: 100%;
            height: auto;
            display: flex;
            flex-direction: column;
        }

        .boardImage {
            width: 100%;
            height: 200px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .boardImageItem {
            width: 300px;
            height: 190px;
            border-radius: 5px;
        }

        .boardContent {
            width: 100%;
            height: 100%;
            padding: 5px 10px 0;
        }

        .boardContent>a {
            transition-duration: .5s;
            text-decoration: none;
        }

        .boardTitle {
            transition-duration: .2s;
            color: black;
            width: 100%;
            font-size: 15px;
            font-weight: 700;
        }

        .boardBody {
            width: 100%;
            height: 30px;

            overflow: auto;
            color: rgba(0, 0, 0, 0.5);
            font-size: 13px;
        }

        .article2 {
            width: 100%;
            height: 20%;

            display: flex;
            flex-direction: row;
        }

        .boardUser {
            width: 100%;
            height: 100%;
            padding: 10px;
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .userImageItem {
            width: 40px;
            height: 40px;
            border-radius: 100%;
        }

        .boardUserId {
            font-size: 15px;
            font-weight: 300;
            padding: 0px 10px;
        }

        .boardUserId>a {
            color: black;
            text-decoration: none;
        }

        .boardUserTime {
            font-size: 13px;
        }

        .boardScore {
            width: 50%;
            height: 100%;

            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;

            font-size: 14.5px;
        }

        .boardScore>.Score1 {
            font-size: 18px;
            color: darkorange;
        }

        .boardScore>.Score2 {
            font-size: 16px;
            color: orange;
        }

        .boardScore>.Score3 {
            display: inline-block;
            padding-top: 3px;
            font-size: 15px;
        }

        .footer {
            width: 100%;
            padding: 15px 0;
            transition-duration: .5s;

            display: flex;
            justify-content: center;
            align-items: center;
        }

        .pagination>a {
            width: auto;
            height: auto;

            color: black;
            font-size: 18px;
            font-weight: 300;
            text-decoration: none;
        }

        .pagination>a>li {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 40px;
            height: 40px;
            padding: 0 10px;
        }

        .pagination>a>li:hover {
            background-color: rgba(0, 0, 0, 0.08);
        }

        .modal {
            border: 2px solid red;
        }

        .modal-dialog {
            width: 100%;
            display: flex;
            flex-direction: row;
            z-index: 9999;
        }

        .modal-header {
            width: 100%;
            display: flex;
            flex-direction: column;
            background-color: #eee;
        }

        .modal-data {
            display: flex;
            flex-direction: column;
        }

        .modal-title-align {
            width: 100%;
            display: flex;
            flex-direction: row;
        }

        .modal-title-align2 {
            width: 100%;
            display: flex;
            flex-direction: row;
        }

        .modal-title {
            width: 740px;
            cursor: default;
            font-size: 28px;
            font-weight: 700;
        }

        .modal-close {
            display: inline-block;
            margin-top: -10px;
            outline: none;
        }

        .modal-time {
            height: auto;
            font-size: 17px;
            cursor: default;
            color: rgba(0, 0, 0, 0.3);
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .modal-report {
            padding-left: 7px;
        }

        .modal-report a {
            font-size: 13px;
            color: firebrick;
            text-decoration: none;
            transition-duration: .5s;
        }

        .modal-report a:hover {
            color: red;
            transition-duration: .5s;
        }

        .modal-user {
            width: 100%;
            display: flex;
            flex-direction: row;
            justify-content: flex-end;
            align-items: center;
        }

        .modal-user-image a>img {
            width: 35px;
            height: 35px;
            border-radius: 100%;
        }

        .modal-user-id {
            height: 100%;
            display: flex;
            padding-right: 10px;
        }

        .modal-user-id>a>span {
            display: inline-block;
            color: rgba(0, 0, 0, 0.8);
            padding-left: 5px;
            font-size: 20px;
            font-weight: 400;
        }

        .modal-score {
            width: 100%;
            display: flex;
            flex-direction: row;
            justify-content: flex-end;
            align-items: center;
        }

        .modal-score .star {
            cursor: default;
            font-size: 19px;
            color: darkorange;
        }

        .modal-score .score {
            cursor: default;
            font-size: 15px;
            font-weight: 400;
            display: inline-block;
            padding-left: 5px;
            padding-top: 5px;
        }

        .modal-body {
            height: 500px;
            overflow: auto;
        }

        .modal-footer {
            padding: 0;
            height: 600px;
        }

        .footerContents {
            width: 100%;
            height: 100%;
        }

        .footerReadReply {
            width: 100%;
            height: 300px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            overflow: auto;
        }

        .replyHeader {
            width: 100%;
            height: 15%;
            background-color: #eee;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            padding-left: 15px;
            display: flex;
            flex-direction: row;
            align-items: center;
        }

        .replyTxt {
            display: inline-block;
            padding-right: 5px;
            font-weight: 500;
        }

        .replyAmt {
            display: inline-block;
            font-size: 20px;
            color: darkorange;
        }

        .replyContent {
            width: 100%;
            padding-right: 15px;
        }

        .replyItem {
            height: 140px;
            padding: 15px;
            display: flex;
            flex-direction: column;
            overflow: auto;
            border-bottom: 1px solid rgba(0, 0, 0, .1);
        }

        .replyAlign {
            width: 100%;
            height: 100%;
        }

        .replyUser {
            display: flex;
            flex-direction: row;
            align-items: center;
            
        }

        .replyImage {
            width: auto;
            height: auto;
            padding-right: 5px;
        }

        .replyImageItem {
            width: 30px;
            height: 30px;
            border-radius: 100%;
        }

        .replyId {
            width: auto;
            height: auto;
            padding-right: 5px;
        }

        .replyId a {
            font-size: 18px;
            font-weight: 400;
            color: rgba(0, 0, 0, 0.85);
            text-decoration: none;
        }

        .replyTime {
            cursor: default;
            display: inline-block;
            padding-top: 1px;
            padding-right: 15px;
        }

        .replyTime span {
            font-size: 13px;
        }

        .replyScore {
            width: auto;
            height: auto;
            cursor: default;
            display: inline-block;
            padding-bottom: 1px;
            padding-right: 15px;
        }

        .replyBody {
            padding: 10px 5px;
            font-size: 14px;
            font-weight: 350;
        }

        .replyScore .replyStar {
            font-size: 15px;
            color: darkorange;
        }

        .replyScore .replyText {
            font-size: 15px;
        }

        .replyCancle {
            width: 40px;
            height: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .replyCancle button {
            width: auto;
            height: auto;
            font-size: 11px;
            display: inline-block;
            margin-top: 3px;
        }

        .footerWriteReply {
            height: 300px;
            padding: 10px;
            border-bottom-left-radius: 4px;
            border-bottom-right-radius: 4px;
        }

        .footerWriteArea {
            width: 100%;
            height: 100%;
        }

        .footerInputArea {
            padding: 5px 5px 0;
        }

        .footerInputArea>textarea {
            width: 100%;
            height: 130px;
            outline: none;
            resize: none;
            color: rgba(0, 0, 0, 0.7);
            font-size: 18px;
            padding: 10px;
        }

        .inputScore {
            width: 100%;
            padding: 5px;
            display: flex;
            flex-direction: row;
            justify-content: flex-end;
            align-items: center;
        }

        .scoreText {
            font-weight: 300;
            padding: 0 10px;
        }

        .scoreSelect select {
            width: 100px;
            height: 30px;
            outline: none;
            cursor: pointer;
            font-size: 13px;
        }

        .inputBtn {
            width: 100%;
            height: 80px;

            display: flex;
            justify-content: flex-end;
            align-items: center;
            padding: 0 5px;
        }

        .inputBtnItem {
            width: 100px;
            height: 50px;
            outline: none;
            border: 1px solid rgba(0, 0, 0, 0.1);
            color: rgba(0, 0, 0, 0.5);
            background-color: rgba(255, 140, 0, 0.8);
            font-size: 13px;
            transition-duration: .5s;
        }

        .inputBtnItem:hover {
            transition-duration: .5s;
            color: rgba(0, 0, 0, 1);
            background-color: rgba(255, 140, 0, 1);
        }

        .modal-cost {
            top: 0;
            margin-top: 28px;
            padding-right: 127px;
            display: flex;
            justify-content: flex-end;
            width: 100%;
            position: fixed;
        }

        .modal-cost-area {
            width: 300px;
            height: 700px;
            border: 1px solid rgba(0, 0, 0, 0.6);
            background-color: #eee;
            border-radius: 4px;
            display: flex;
            flex-direction: column;
        }

        .cost-header {
            cursor: default;
            width: 100%;
            height: 80px;
            padding: 10px;
            background-color: #e2e2e2;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
            border-bottom: 1px solid rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;

        }

        .cost-header .chTitle {
            font-size: 23px;
            font-weight: 700;
        }

        .cost-header .chBody {
            font-size: 15px;
        }

        .cost-body {
            width: 100%;
            height: 100%px;
            padding: 0px 10px 10px;
            overflow: auto;
        }

        .costItem {
            cursor: default;
            padding: 10px 0 5px;
            border-bottom: 1px dashed rgba(0, 0, 0, 0.2);
        }

        .costItem-header span {
            font-size: 40px;
            font-family: 'East Sea Dokdo', cursive;
        }

        .costItem-body ul {
            padding: 0 5px 0 20px;
            list-style-type: circle;
        }

        .costItem-body li {
            font-size: 12px;
        }

        #reportContent {
            width: 300px;
            margin-top: 200px;
            background-color: #eee;
            border: 1px solid rgba(0, 0, 0, 0.2);
        }

        .reportHeader {
            width: 100%;
            height: 50px;
            display: flex;
            cursor: default;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            color: white;
            background-color: #282c37;
            border-top-left-radius: 4px;
            border-top-right-radius: 4px;
        }

        .reportHeader span {
            font-size: 15px;
            font-weight: 300;
        }

        .reportBody {
            width: 100%;
            height: 200px;
            background-color: #9baec8;
        }

        .reportBodyItem1 {
            width: 100%;
            height: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 10px 0;
        }

        .reportBodyItem1 span {
            font-size: 13px;
        }

        .reportBodyItem2 {
            width: 100%;
            height: 150px;
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

        .reportBodyItem2 textarea {
            width: 250px;
            height: 130px;
            font-size: 13px;
            padding: 10px;
            outline: none;
            resize: none;
            color: rgba(0, 0, 0, 0.7);
            border: 1px solid rgba(0, 0, 0, 0.1);
            background-color: #d9e1e8;
        }

        .reportFooter {
            width: 100%;
            height: 50px;
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
        }

        .reportFooterItem1 {
            padding: 10px 5px 10px 10px;
        }

        .reportFooterItem2 {
            padding: 10px 10px 10px 5px;
        }

        .reportFooterItem1 button {
            width: 70px;
            height: 30px;
            color: #fff;
            outline: none;
            font-size: 12px;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 3px;
            background-color: #2b90d9;
        }

        .reportFooterItem2 button {
            width: 70px;
            height: 30px;
            color: #fff;
            outline: none;
            font-size: 12px;
            border: 1px solid rgba(0, 0, 0, 0.1);
            border-radius: 3px;
            background-color: #ff5f2e;
        }

    </style>

    <script>
        function sidebarSwitch() {
            var chk = document.getElementById("contents");

            if (chk.style.display != 'none') {
                document.getElementById("contents").style.display = "none";
                document.getElementById("footer").style.display = "none";
                $('.orderArea').height("0px");
                $('.boardArea').height("0px");
                $('.footer').height("0px");
                $('#sideBar').height("48px");
                $('#sideBarBtnItem').val("▼");
            } else {
                document.getElementById("contents").style.display = "flex";
                document.getElementById("footer").style.display = "flex";
                $('.orderArea').height("auto");
                $('.boardArea').height("100%");
                $('.footer').height("50px");
                $('#sideBar').height("850px");
                $('#sideBarBtnItem').val("▲");
            }
        }

        $(function() {
            $('#inputAreaItem').keyup(function(e) {
                var content = $(this).val();
                $('#textCnt').html("(" + content.length + " / 200)");

                if (content.length > 200) {
                    $(this).val(content.substring(0, 200));
                    $('#textCnt').html("(200 / 200)");
                }
            });
            $('#inputAreaItem').keyup();
        });

    </script>
</head>

<body>
    <form name ="form1" runat="server">
    <div class="main">
        <div class="searchBar">

            <div class="sideBar" id="sideBar">
                <div class="header" id="header">
                    <div class="iconBtnArea">
                        <button><i class="fas fa-search"></i></button>
                    </div>
                    <div class="inputArea">
                        <input type="text" placeholder="리뷰를 볼 지역을 입력하세요" />
                    </div>
                </div>
                <div class="contents" id="contents">
                    <div class="contentsArea">
                        <div class="orderArea">
                            <div class="orderRadio">
                                <p class="orTxt"><i class="far fa-window-restore"></i> 검색 기준</p>
                                <table>
                                    <tr>
                                        <td>
                                            <div class="orderRadioItem"><input type="radio" id="1st" name="orderStd" checked /><label for="1st">최신</label></div>
                                        </td>
                                        <td>
                                            <div class="orderRadioItem"><input type="radio" id="2st" name="orderStd" /><label for="2st">인기</label></div>
                                        </td>
                                        <td>
                                            <div class="orderRadioItem"><input type="radio" id="3st" name="orderStd" /><label for="3st">팔로워</label></div>
                                        </td>
                                        <td>
                                            <div class="orderRadioItem"><input type="radio" id="4st" name="orderStd" /><label for="4st">HOT</label></div>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div class="boardArea">
                            <div class="boardAlign">
                                <div class="boardItem">
                                    <div class="article1">
                                        <div class="boardImage">
                                            <a href="#" data-toggle="modal" data-target="#myModal">
                                                <img src="./img/areaImage.jpg" alt="ㅁㄴㅇㅇㅁㅁㄴ " class="boardImageItem">
                                            </a>
                                        </div>
                                        <div class="boardContent">
                                            <a href="#" data-toggle="modal" data-target="#myModal">
                                                <div class="boardTitle">
                                                    <span>벚꽃이 너무 예쁘네요~</span>
                                                </div>
                                                <div class="boardBody">
                                                    <span>
                                                        ㅁㄴㅇㅁㅇㅁㅇㅇㅁㅁㄴ
                                                    </span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="article2">
                                        <div class="boardUser">
                                            <div class="boardUserImage">
                                                <a href="#">
                                                    <img src="./img/UserNoneImage.png" alt="userImage" class="userImageItem">
                                                </a>
                                            </div>
                                            <div class="boardUserId">
                                                <a href="#">
                                                    <span>milk9503</span>
                                                </a>
                                                <div class="boardUserTime">
                                                    <span style="cursor: default;">2019-10-15 00:06</span>
                                                </div>
                                            </div>
                                            <div class="boardScore" style="cursor: default;">
                                                <span class="Score1">★★★</span>
                                                <span class="Score2">☆☆</span>
                                                <span class="Score3">(3.8)</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="boardItem">
                                    <div class="article1">
                                        <div class="boardImage">
                                            <a href="#" data-toggle="modal" data-target="#myModal">
                                                <img src="./img/areaImage.jpg" alt="ㅁㄴㅇㅇㅁㅁㄴ " class="boardImageItem">
                                            </a>
                                        </div>
                                        <div class="boardContent">
                                            <a href="#" data-toggle="modal" data-target="#myModal">
                                                <div class="boardTitle">
                                                    <span>벚꽃이 너무 예쁘네요~</span>
                                                </div>
                                                <div class="boardBody">
                                                    <span>
                                                        ㅁㄴㅇㅁㅇㅁㅇㅇㅁㅁㄴ
                                                    </span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="article2">
                                        <div class="boardUser">
                                            <div class="boardUserImage">
                                                <a href="#">
                                                    <img src="./img/UserNoneImage.png" alt="userImage" class="userImageItem">
                                                </a>
                                            </div>
                                            <div class="boardUserId">
                                                <a href="#">
                                                    <span>milk9503</span>
                                                </a>
                                                <div class="boardUserTime">
                                                    <span style="cursor: default;">2019-10-15 00:06</span>
                                                </div>
                                            </div>
                                            <div class="boardScore" style="cursor: default;">
                                                <span class="Score1">★★★</span>
                                                <span class="Score2">☆☆</span>
                                                <span class="Score3">(3.8)</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="boardItem">
                                    <div class="article1">
                                        <div class="boardImage">
                                            <a href="#" data-toggle="modal" data-target="#myModal">
                                                <img src="./img/areaImage.jpg" alt="ㅁㄴㅇㅇㅁㅁㄴ " class="boardImageItem">
                                            </a>
                                        </div>
                                        <div class="boardContent">
                                            <a href="#" data-toggle="modal" data-target="#myModal">
                                                <div class="boardTitle">
                                                    <span>벚꽃이 너무 예쁘네요~</span>
                                                </div>
                                                <div class="boardBody">
                                                    <span>
                                                        ㅁㄴㅇㅁㅇㅁㅇㅇㅁㅁㄴ
                                                    </span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="article2">
                                        <div class="boardUser">
                                            <div class="boardUserImage">
                                                <a href="#">
                                                    <img src="./img/UserNoneImage.png" alt="userImage" class="userImageItem">
                                                </a>
                                            </div>
                                            <div class="boardUserId">
                                                <a href="#">
                                                    <span>milk9503</span>
                                                </a>
                                                <div class="boardUserTime">
                                                    <span style="cursor: default;">2019-10-15 00:06</span>
                                                </div>
                                            </div>
                                            <div class="boardScore" style="cursor: default;">
                                                <span class="Score1">★★★</span>
                                                <span class="Score2">☆☆</span>
                                                <span class="Score3">(3.8)</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="boardItem">
                                    <div class="article1">
                                        <div class="boardImage">
                                            <a href="#" data-toggle="modal" data-target="#myModal">
                                                <img src="./img/areaImage.jpg" alt="ㅁㄴㅇㅇㅁㅁㄴ " class="boardImageItem">
                                            </a>
                                        </div>
                                        <div class="boardContent">
                                            <a href="#" data-toggle="modal" data-target="#myModal">
                                                <div class="boardTitle">
                                                    <span>벚꽃이 너무 예쁘네요~</span>
                                                </div>
                                                <div class="boardBody">
                                                    <span>
                                                        ㅁㄴㅇㅁㅇㅁㅇㅇㅁㅁㄴ
                                                    </span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="article2">
                                        <div class="boardUser">
                                            <div class="boardUserImage">
                                                <a href="#">
                                                    <img src="./img/UserNoneImage.png" alt="userImage" class="userImageItem">
                                                </a>
                                            </div>
                                            <div class="boardUserId">
                                                <a href="#">
                                                    <span>milk9503</span>
                                                </a>
                                                <div class="boardUserTime">
                                                    <span style="cursor: default;">2019-10-15 00:06</span>
                                                </div>
                                            </div>
                                            <div class="boardScore" style="cursor: default;">
                                                <span class="Score1">★★★</span>
                                                <span class="Score2">☆☆</span>
                                                <span class="Score3">(3.8)</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="boardItem">
                                    <div class="article1">
                                        <div class="boardImage">
                                            <a href="#" data-toggle="modal" data-target="#myModal">
                                                <img src="./img/areaImage.jpg" alt="ㅁㄴㅇㅇㅁㅁㄴ " class="boardImageItem">
                                            </a>
                                        </div>
                                        <div class="boardContent">
                                            <a href="#" data-toggle="modal" data-target="#myModal">
                                                <div class="boardTitle">
                                                    <span>벚꽃이 너무 예쁘네요~</span>
                                                </div>
                                                <div class="boardBody">
                                                    <span>
                                                        ㅁㄴㅇㅁㅇㅁㅇㅇㅁㅁㄴ
                                                    </span>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                    <div class="article2">
                                        <div class="boardUser">
                                            <div class="boardUserImage">
                                                <a href="#">
                                                    <img src="./img/UserNoneImage.png" alt="userImage" class="userImageItem">
                                                </a>
                                            </div>
                                            <div class="boardUserId">
                                                <a href="#">
                                                    <span>milk9503</span>
                                                </a>
                                                <div class="boardUserTime">
                                                    <span style="cursor: default;">2019-10-15 00:06</span>
                                                </div>
                                            </div>
                                            <div class="boardScore" style="cursor: default;">
                                                <span class="Score1">★★★</span>
                                                <span class="Score2">☆☆</span>
                                                <span class="Score3">(3.8)</span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="footer" id="footer">
                    <div class="footerArea">
                        <div class="footerItem">
                            <ul class="pagination">
                                <a href="#">
                                    <li>
                                        <</li> </a> <a href="#">
                                    <li class="pageActive">1</li>
                                </a>
                                <a href="#">
                                    <li>2</li>
                                </a>
                                <a href="#">
                                    <li>3</li>
                                </a>
                                <a href="#">
                                    <li>4</li>
                                </a>
                                <a href="#">
                                    <li>5</li>
                                </a>
                                <a href="#">
                                    <li>></li>
                                </a>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <!-- sideBar open & close switch -->
            <div class="sideBarBtn" id="sideBarBtn">
                <input type="button" id="sideBarBtnItem" onClick="sidebarSwitch()" value="▲" />
            </div>

            <!-- To Our Shared Home Button -->
            <div class="sideBarHome" id="sideBarhome">
                <div class="btnArea">
                    <asp:Button ID="btnHome" runat="server" Text="To Our Shared" class="homeBtn" OnClick="btnHome_Click" />
                </div>
            </div>
        </div>

        <!-- Kakao Map Area -->
        <div class="map" id="mapArea"></div>
    </div>

    <!-- board Modal -->
    <div class="modal fade" id="myModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <!-- Modal Header -->
                <div class="modal-header">
                    <div class="modal-data">
                        <div class="modal-title-align">
                            <div class="modal-title">벚꽃이 너무 예쁘네요~</div>
                            <div class="modal-close"><a href="#" class="close" data-dismiss="modal">&times;</a></div>
                        </div>
                        <div class="modal-title-align2">
                            <div class="modal-time">2019-10-18 16:05</div>
                            <div class="modal-report"><a href="#" data-toggle="modal" data-target="#reportModal">🚨 게시글 신고하기</a></div>
                        </div>
                    </div>
                    <div class="modal-user">
                        <div class="modal-user-image">
                            <a href="#"><img src="./img/서울.jpg" alt="img"></a>
                        </div>
                        <div class="modal-user-id">
                            <a href="#"><span>milk9503</span></a>
                        </div>
                    </div>
                    <div class="modal-score">
                        <span class="star">★★★☆☆</span>
                        <span class="score">(3.5)</span>
                    </div>
                </div>

                <!-- Modal body -->
                <div class="modal-body">
                    Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />
                    Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />
                    Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />
                    Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />
                    Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />Modal body..<br />
                    Modal body..<br />Modal body..<br />Modal body..<br />Modal body..
                </div>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <div class="footerContents">
                        <div class="footerReadReply">
                            <div class="replyHeader">
                                <span class="replyTxt">댓글</span>
                                <span class="replyAmt">2</span>
                            </div>
                            <div class="replyContent">
                                <div class="replyItem">
                                    <div class="replyAlign">
                                        <div class="replyUser">
                                            <div class="replyImage">
                                                <a href="#"><img src="./img/areaImage.jpg" alt="replyImage" class="replyImageItem"></a>
                                            </div>
                                            <div class="replyId">
                                                <a href="#"><span class="replyIdItem">milk950317</span></a>
                                            </div>
                                            <div class="replyTime">
                                                <span>2019-10-16 16:10</span>
                                            </div>
                                            <div class="replyScore">
                                                <span class="replyStar">★★★★★</span>
                                                <span class="replyText">(5.0)</span>
                                            </div>
                                        </div>
                                        <div class="replyBody">
                                            <span>To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="replyItem">
                                    <div class="replyAlign">
                                        <div class="replyUser">
                                            <div class="replyImage">
                                                <a href="#"><img src="./img/areaImage.jpg" alt="replyImage" class="replyImageItem"></a>
                                            </div>
                                            <div class="replyId">
                                                <a href="#"><span class="replyIdItem">milk950317</span></a>
                                            </div>
                                            <div class="replyTime">
                                                <span>2019-10-16 16:10</span>
                                            </div>
                                            <div class="replyScore">
                                                <span class="replyStar">★★★★★</span>
                                                <span class="replyText">(5.0)</span>
                                            </div>
                                        </div>
                                        <div class="replyBody">
                                            <span>To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="replyItem">
                                    <div class="replyAlign">
                                        <div class="replyUser">
                                            <div class="replyImage">
                                                <a href="#"><img src="./img/areaImage.jpg" alt="replyImage" class="replyImageItem"></a>
                                            </div>
                                            <div class="replyId">
                                                <a href="#"><span class="replyIdItem">milk950317</span></a>
                                            </div>
                                            <div class="replyTime">
                                                <span>2019-10-16 16:10</span>
                                            </div>
                                            <div class="replyScore">
                                                <span class="replyStar">★★★★★</span>
                                                <span class="replyText">(5.0)</span>
                                            </div>
                                        </div>
                                        <div class="replyBody">
                                            <span>To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... </span>
                                        </div>
                                    </div>
                                </div>
                                <div class="replyItem">
                                    <div class="replyAlign">
                                        <div class="replyUser">
                                            <div class="replyImage">
                                                <a href="#"><img src="./img/areaImage.jpg" alt="replyImage" class="replyImageItem"></a>
                                            </div>
                                            <div class="replyId">
                                                <a href="#"><span class="replyIdItem">milk950317</span></a>
                                            </div>
                                            <div class="replyTime">
                                                <span>2019-10-16 16:10</span>
                                            </div>
                                            <div class="replyScore">
                                                <span class="replyStar">★★★★★</span>
                                                <span class="replyText">(5.0)</span>
                                            </div>
                                        </div>
                                        <div class="replyBody">
                                            <span>To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... To Our Shared ... </span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="footerWriteReply">
                            <div class="footerWriteArea">
                                <div class="footerInputArea">
                                    <textarea placeholder="댓글을 입력하세요. (최대 200자)" id="inputAreaItem"></textarea>
                                </div>
                                <div class="inputScore">
                                    <div class="scoreText">
                                        <span style="cursor: default;">평점</span>
                                    </div>
                                    <div class="scoreSelect">
                                        <select name="score">
                                            <option value="0">평점</option>
                                            <option value="1">1</option>
                                            <option value="2">2</option>
                                            <option value="3">3</option>
                                            <option value="4">4</option>
                                            <option value="5">5</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="inputBtn">
                                    <div style="padding: 10px;"><span id="textCnt" style="font-weight: 300; cursor: default;">(0 / 200)</span></div>
                                    <div><input type="button" value="등록" class="inputBtnItem" /></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- costModal -->
        <div class="modal-cost">
            <div class="modal-cost-area">
                <div class="cost-header">
                    <span class="chTitle">전체 경비</span>
                    <span class="chBody">💰 290,000</span>
                </div>
                <div class="cost-body" id="costBody">
                    <div class="costItem">
                        <div class="costItem-header">
                            <span># 1일 째</span>
                        </div>
                        <div class="costItem-body">
                            <ul>
                                <li>식비 18,000</li>
                                <li>쇼핑 40,000</li>
                            </ul>
                        </div>
                    </div>
                    <div class="costItem">
                        <div class="costItem-header">
                            <span># 2일 째</span>
                        </div>
                        <div class="costItem-body">
                            <ul>
                                <li>식비 18,000</li>
                                <li>쇼핑 40,000</li>
                            </ul>
                        </div>
                    </div>
                    <div class="costItem">
                        <div class="costItem-header">
                            <span># 3일 째</span>
                        </div>
                        <div class="costItem-body">
                            <ul>
                                <li>식비 18,000</li>
                                <li>쇼핑 40,000</li>
                            </ul>
                        </div>
                    </div>
                    <div class="costItem">
                        <div class="costItem-header">
                            <span># 4일 째</span>
                        </div>
                        <div class="costItem-body">
                            <ul>
                                <li>식비 18,000</li>
                                <li>쇼핑 40,000</li>
                            </ul>
                        </div>
                    </div>
                    <div class="costItem">
                        <div class="costItem-header">
                            <span># 5일 째</span>
                        </div>
                        <div class="costItem-body">
                            <ul>
                                <li>식비 18,000</li>
                                <li>쇼핑 40,000</li>
                            </ul>
                        </div>
                    </div>
                    <div class="costItem">
                        <div class="costItem-header">
                            <span># 6일 째</span>
                        </div>
                        <div class="costItem-body">
                            <ul>
                                <li>식비 18,000</li>
                                <li>쇼핑 40,000</li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- board report Modal -->
    <div class="modal report fade" id="reportModal">
        <div class="modal-dialog">
            <div class="modal-content" id="reportContent">
                <div class="reportHeader">
                    <span>🚨 게시글 신고하기</span>
                </div>
                <div class="reportBody">
                    <div class="reportBodyItem1">
                        <span>게시글 신고 사유를 간략히 입력해주세요.</span>
                    </div>
                    <div class="reportBodyItem2">
                        <textarea placeholder="신고사유를 입력하세요"></textarea>
                    </div>
                </div>
                <div class="reportFooter">
                    <div class="reportFooterItem1">
                        <button data-dismiss="modal">작성 완료</button>
                    </div>
                    <div class="reportFooterItem2">
                        <button data-dismiss="modal">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</form>
</body>

</html>