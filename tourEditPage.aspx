﻿


<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="tourEditPage.aspx.cs" Inherits="toourshared.tourEditPage" %>
<asp:Content ID="Content2" ContentPlaceHolderID="Header" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous"/>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.11/dist/summernote-bs4.min.css" rel="stylesheet"/>
    <script src="https://code.jquery.com/jquery-1.12.0.min.js"></script>
    <script src='https://www.google.com/recaptcha/api.js'></script>
    <title></title>

</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="col-sm-12"> 
            <div id="emailMsg"></div>
            <form method="post" action="writeget.aspx" >
                <input type="hidden" name="sendEmail" value="ok" />
                <div class="form-group">
                    <asp:TextBox ID="TextBox21" runat="server" CssClass="form-control form-control-lg"  placeholder="제목을 입력해주세요"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine"/>
                </div>
                 <div class="form-group">
                    <asp:TextBox ID="TextBox3" runat="server" CssClass="form-control form-control-lg"  placeholder="#해시태그를 입력해주세요"></asp:TextBox>
                </div>
                <div class="form-group">
                    <input type ="submit" value="넘기기" />
                </div>
            </form>
        </div>
    </div>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bs4-summernote@0.8.10/dist/summernote-bs4.min.js"></script>
    <script>
        $(document).ready(function() {
            $('textarea').summernote({
                height: 300,   //set editable area's height
            });
        });
    </script>

</asp:Content>
