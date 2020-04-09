<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page isELIgnored="false" %>
<html>
<head>
    <title>${office.officename}--在线预约挂号系统</title>
    <jsp:include page="include/headtag.jsp"/>
</head>
<body>
<jsp:include page="include/head.jsp"/>
<jsp:include page="include/menu.jsp"/>

<div style="margin-top: 100px;margin-left: 300px">
    <div id="page-inner">

        <div class="search">
            <h1>科室详情</h1>
            <form wid="doctor" action="searchDoctor" method="post">
                <input  value="${doctor}" name="doctor"  autocomplete="off" class="" placeholder="在此科室下查找医生">
                <input id="start" hidden value="1" name="start">
                <input id="office" hidden value="${office.officename}" name="office">
                <button type="submit">查找医生</button>
            </form>
            <style>
                .search{
                    height:150px;
                    border-bottom: 2px #2e2e2e solid;
                }
                .search input{
                    height: 40px;
                    width: 200px;
                    color: #2e2e2e;
                    padding: 0 20px;
                    border-radius: 4px;
                }
                .search button{
                    height: 40px;
                    color: #2e2e2e;
                    padding: 0 20px;
                    border-radius: 2px;
                    cursor: pointer;
                }
                .search button:hover{
                    color: #0065AF;
                }
            </style>
        </div>

        <div class="office-info">
            <h3 class="office-name">
                ${office.officename}
            </h3>
            <h2>科室简介</h2>
            <div>
                ${office.description}
            </div>
            <div>
                该科室有${office.doctornum}位医生
            </div>
        <style>
            .office-info{
                border-top: 2px solid #1E9EB9;
            }
            .office-info .office-name{
                border: 1px solid #E8E8E8;
                background: #F7FDFE;
            }
            .office-info h2{
                border: 1px solid #E8E8E8;
                background: #F7FDFE;
            }
        </style>
        </div>

        <div class="doctors">
            <c:forEach items="${doctors}" var="item">
                <div class="ysjs">
                    <div class="title">
                        <div class="t">
                            <span><a href="showWeek?did=${item.did}">${item.dname}</a></span>
                            <span class="gender">${item.gender}</span>
                            <span class="career">${item.career}</span>
                            <span class="career">${item.age}岁</span>
                        </div>
                        <img src="${item.picpath}">
                    </div>
                    <div class="content">
                        <div >
                            <div>介绍：</div>
                            <div>${item.description}</div>
                        </div>
                    </div>
                </div>
            </c:forEach>

            <style>
                .doctors:after{
                    content: "";
                    clear: both;
                    display: block;
                }
                .ysjs{
                    float: left;
                    margin: 20px;
                    height: 300px;
                    border-radius: 8px;
                    width: 680px;
                    border: 1px #000 solid;
                }
                .ysjs .title{
                    margin: 20px;
                    position: relative;
                }
                .ysjs .title:after{
                    visibility: hidden;
                    display: block;
                    font-size: 0;
                    content: "";
                    clear: both;
                    height: 0;
                }
                .ysjs .title .t span{
                    margin: 20px;
                    color: rgb(43,43,43);
                    font-size: 30px;
                    line-height: 30px;
                }
                .ysjs .title img{
                    position: absolute;
                    top: -20px;
                    left: 480px;
                    width: 100px;
                    height: 125px;
                }
                .ysjs .title .t .gender{
                    color:rgb(95, 156, 236);
                }
                .ysjs .title .t .career{
                    font-size: 17px;
                    margin-left: 30px;
                    color:rgb(61,175,167);
                }
                .ysjs .content {
                    border-top: 1px solid rgb(219, 219, 219);
                    margin: 30px;
                    text-align: left;
                    width: 640px;
                }
                .ysjs .content div{
                    padding-top: 10px;
                }
            </style>
        </div>

    <c:if test="${pages.totalPage > 0}">
<form id="pagination">

    <ul class="pagination">
        <li <c:if test="${pages.currentPage < 1}">class="disabled"</c:if>><a
                onclick="jump('${pages.prePage }')">&laquo;</a></li>
        <c:forEach begin="${pages.pageNumStart }" end="${pages.pageNumEnd }"
                   varStatus="status">
            <li>
                <a <c:if test="${status.index == pages.currentPage }">class="disabled"</c:if>
                    onclick="jump('${status.index }')">
                        ${status.index } </a>
            </li>
        </c:forEach>
        <li
                <c:if test="${pages.currentPage> pages.totalPage}">class="disabled"</c:if>>
            <a onclick="jump('${pages.nextPage }')">&raquo;</a>
        </li>
        <li><input class="text-input" id="index"></li>
        <li><a onclick="jumpInput()">Go</a></li>
        <li><a class="disabled">共${pages.totalPage}页${pages.totalRecord}条记录</a>

        <script>
            function jump(index) {
                $("#start").val(index);
                $("#doctor").submit();
            }
            function jumpInput() {
                var index=$("#index").val();
                var match = /^[1-9][0-9]*[0-9]*$/;
                if(match.test(index)){
                    jump(index);
                }else {
                    alert("请输入数字！")
                }
            }
        </script>
        <style>
            #pagination{
                width: 90%;
                text-align: center;
            }
            .pagination {
                display: inline-block;
                padding-left: 0;
                margin: 21px 0;
                border-radius: 4px;
            }.pagination li{
                 display: inline;
             }

            .pagination a{
                border-radius: 6px;
                color: #eb6864;
                cursor: pointer;
                padding: 14px 16px;
                font-size: 19px;
                line-height: 1.3333333;
                border: 1px solid #dddddd;
                margin-left: -1px;
            }
            .pagination a:hover{
                background-color: #eeeeee;
            }
            .pagination input{
                border: 1px solid #dddddd;
                width: 60px;
                padding: 8px 12px;
                font-size: 15px;
                line-height: 1.5;
                color: #777777;
            }
            .pagination .disabled{
                cursor: not-allowed;
            }
        </style>
    </ul>
</form>
</c:if>
    </div>
</div>

</body>
</html>
