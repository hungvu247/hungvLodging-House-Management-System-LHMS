<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Phản Hồi</title>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Main CSS-->
        <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/Resource/doc/css/main.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
        <!-- or -->
        <link rel="stylesheet" href="https://unpkg.com/boxicons@latest/css/boxicons.min.css">
        <!-- Font-icon css-->
        <link rel="stylesheet" type="text/css"
              href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.8.2/css/all.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-confirm/3.3.2/jquery-confirm.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <style>
            .avatar{
                width: 200px !important;
                height: 200px !important;
                border-radius: 50% !important;
                object-fit: cover !important;
            }
            .avatarHeader{
                width: 100px !important;
                height: 100px !important;
                border-radius: 50% !important;
                object-fit: cover !important;
            }
            .badge {
                display: inline-block;
                padding: 7px;
                font-size: 12px;
                font-weight: 500;
                line-height: 1;
                text-align: center;
                white-space: nowrap;
                vertical-align: baseline;
                border-radius: 0.25rem;
                color: white;
            }
            .ratingBlock {
                display: flex;
                flex-direction: column;
                align-items: flex-start;
                gap: 10px; /* Adjust this value to change the spacing between elements */
            }
            .star{
                display: inline-block;
                width: 30px;
                height: 30px;
                margin-right: 10px;
                background-image: url('https://icon-library.com/images/star-png-icon/star-png-icon-0.jpg');
                background-size: contain;
                cursor: pointer;
            }
            .star:hover,
            .star.active{
                background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQK_x0xsTpZtA8UkG6hGE7Y8E-EXVXwT8NWbY0KymT2o_0pxmI&s');
            }
            .labelStar {
                font-size: 16px;
                font-weight: bold;
                margin-bottom: 10px;
            }
            .btn {
                margin-top: 10px; /* Adjust this value to change the spacing above the button */

            }
        </style>
    </head>

    <body onload="time()" class="app sidebar-mini rtl">
        <!-- Navbar-->
        <!-- Sidebar menu-->
        <%@ include file="header.jsp" %>
        <%@ include file="left-menu-tenant.jsp" %>
        <main class="app-content">
            <div class="app-title">
                <ul class="app-breadcrumb breadcrumb side">
                    <li class="breadcrumb-item active"><a href="feedback?service=showFeedback"><b>Phản Hồi</b></a></li>
                </ul>
                <div id="clock"></div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="tile">
                        <div class="tile-body">
                            <div class="row element-button">
                                <div class="col-sm-6 ratingBlock">
                                    <form action="feedback" method="post">
                                        <div><p class='labelStar'>Đánh Giá Chung Về Khu Trọ</p></div>
                                        <div id="rating" class="rating">
                                            <span class="star" data-rating="1"></span>
                                            <span class="star" data-rating="2"></span>
                                            <span class="star" data-rating="3"></span>
                                            <span class="star" data-rating="4"></span>
                                            <span class="star" data-rating="5"></span>
                                        </div>
                                        <input type="hidden" name="rating" id="ratingInput" value="${star}">
                                        <input type="hidden" name="service" value="updateStar">
                                        <button type="submit" class="btn btn-add btn-sm"><i class="fas fa-check"></i> Gửi Đánh Giá</button>
                                    </form>
                                </div>
                            </div>
                            <c:if test="${checkFeedback==true}">
                                <form action="feedback" method="post">
                                    <table style="background-color: #efefef;">
                                        <tr style="border-bottom: 0 none">
                                            <td>
                                                <div>
                                                    <center>
                                                        <h2>
                                                            Chỉnh Sửa Nhận Xét Của Tháng Này</h2>
                                                    </center>
                                                    <span id="ctl00_mainContent_lblMege" style="color:Red;"></span>
                                                    <table border="1">
                                                        <tr>
                                                            <td width="50%">
                                                                Khu Trọ: 
                                                                <span id="ctl00_mainContent_lblGroup">${lodging.nameLodgingHouse}</span>
                                                            </td>
                                                            <td width="50%">
                                                                Nhận Xét Cho Tháng: <span id="ctl00_mainContent_lblMonth">${formattedDate}</span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="50%">
                                                                Phòng Trọ :<span id="ctl00_mainContent_lblSubject">${firstRoom.getRoomName()}</span>
                                                            </td>
                                                            <td width="50%">
                                                                Quản Lý :
                                                                <span id="ctl00_mainContent_lblTeacher">${manageInfor.fullName}</span>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                    <p><font style="font-style: italic; font-weight: bold">Đánh dấu vào ô thích hợp</font></p>
                                                    <table id="ctl00_mainContent_reload" cellspacing="1" cellpadding="2" border="0" style="border-width:1px;border-style:solid;width:100%;">
                                                        <tr>
                                                            <td width="50%">
                                                                <table width="100%" style="background-color: #D7D7D7;" border="0">
                                                                    <tr>
                                                                        <td>
                                                                            <font style="font-weight: bold">
                                                                            <span id="ctl00_mainContent_reload_ctl00__GroupQuestion">Dịch Vụ Vệ Sinh</span>
                                                                            </font>
                                                                            <table id="ctl00_mainContent_reload_ctl00_chkList" border="0">
                                                                                <tr>
                                                                                    <td><input id="clean" type="radio" name="clean" value="4" ${feedback.cleaningService==4?"checked":""}/><label for="ctl00_mainContent_reload_ctl00_chkList_0">Sạch Sẽ</label></td>
                                                                                </tr><tr>
                                                                                    <td><input id="clean" type="radio" name="clean" value="3" ${feedback.cleaningService==3?"checked":""}/><label for="ctl00_mainContent_reload_ctl00_chkList_1">Khá Sạch</label></td>
                                                                                </tr><tr>
                                                                                    <td><input id="clean" type="radio" name="clean" value="2" ${feedback.cleaningService==2?"checked":""}/><label for="ctl00_mainContent_reload_ctl00_chkList_2">Chưa Được Sạch Lắm</label></td>
                                                                                </tr><tr>
                                                                                    <td><input id="clean" type="radio" name="clean" value="1" ${feedback.cleaningService==1?"checked":""}/><label for="ctl00_mainContent_reload_ctl00_chkList_3">Còn Bẩn Rất Nhiều</label></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="50%">
                                                                <table width="100%" style="background-color: #D7D7D7;" border="0">
                                                                    <tr>
                                                                        <td>
                                                                            <font style="font-weight: bold">
                                                                            <span id="ctl00_mainContent_reload_ctl01__GroupQuestion">Điện</span>
                                                                            </font>
                                                                            <table id="ctl00_mainContent_reload_ctl01_chkList" border="0">
                                                                                <tr>
                                                                                    <td><input id="electric" type="radio" name="electric" value="4" ${feedback.electric==4?"checked":""} /><label for="ctl00_mainContent_reload_ctl01_chkList_0">Khỏe, ổn định</label></td>
                                                                                </tr><tr>
                                                                                    <td><input id="electric" type="radio" name="electric" value="3" ${feedback.electric==3?"checked":""}/><label for="ctl00_mainContent_reload_ctl01_chkList_1">Tạm ổn</label></td>
                                                                                </tr><tr>
                                                                                    <td><input id="electric" type="radio" name="electric" value="2" ${feedback.electric==3?"checked":""}/><label for="ctl00_mainContent_reload_ctl01_chkList_2">Yếu</label></td>
                                                                                </tr><tr>
                                                                                    <td><input id="electric" type="radio" name="electric" value="1" ${feedback.electric==1?"checked":""}/><label for="ctl00_mainContent_reload_ctl01_chkList_3">Thường xuyên bị cắt điện</label></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="50%">
                                                                <table width="100%" style="background-color: #D7D7D7;" border="0">
                                                                    <tr>
                                                                        <td>
                                                                            <font style="font-weight: bold">
                                                                            <span id="ctl00_mainContent_reload_ctl02__GroupQuestion">Nước</span>
                                                                            </font>
                                                                            <table id="ctl00_mainContent_reload_ctl02_chkList" border="0">
                                                                                <tr>
                                                                                    <td><input id="water" type="radio" name="water" value="4" ${feedback.water==4?"checked":""} /><label for="ctl00_mainContent_reload_ctl02_chkList_0">Sạch sẽ, ổn định</label></td>
                                                                                </tr><tr>
                                                                                    <td><input id="water" type="radio" name="water" value="3" ${feedback.water==3?"checked":""} /><label for="ctl00_mainContent_reload_ctl02_chkList_1">Tạm ổn</label></td>
                                                                                </tr><tr>
                                                                                    <td><input id="water" type="radio" name="water" value="2" ${feedback.water==2?"checked":""}/><label for="ctl00_mainContent_reload_ctl02_chkList_2">Bẩn</label></td>
                                                                                </tr><tr>
                                                                                    <td><input id="water" type="radio" name="water" value="1" ${feedback.water==1?"checked":""}/><label for="ctl00_mainContent_reload_ctl02_chkList_3">Thường xuyên bị cắt nước</label></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="50%">
                                                                <table width="100%" style="background-color: #D7D7D7;" border="0">
                                                                    <tr>
                                                                        <td>
                                                                            <font style="font-weight: bold">
                                                                            <span id="ctl00_mainContent_reload_ctl03__GroupQuestion">Mạng</span>
                                                                            </font>
                                                                            <table id="ctl00_mainContent_reload_ctl03_chkList" border="0">
                                                                                <tr>
                                                                                    <td><input id="internet" type="radio" name="internet" value="4" ${feedback.internet==4?"checked":""}/><label for="ctl00_mainContent_reload_ctl03_chkList_0">Mạng Khỏe</label></td>
                                                                                </tr><tr>
                                                                                    <td><input id="internet" type="radio" name="internet" value="3" ${feedback.internet==3?"checked":""}/><label for="ctl00_mainContent_reload_ctl03_chkList_1">Tạm ổn</label></td>
                                                                                </tr><tr>
                                                                                    <td><input id="internet" type="radio" name="internet" value="2" ${feedback.internet==2?"checked":""}/><label for="ctl00_mainContent_reload_ctl03_chkList_2">Yếu</label></td>
                                                                                </tr><tr>
                                                                                    <td><input id="internet" type="radio" name="internet" value="1" ${feedback.internet==1?"checked":""}/><label for="ctl00_mainContent_reload_ctl03_chkList_3">Hay bị mất mạng</label></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="50%">
                                                                <table width="100%" style="background-color: #D7D7D7;" border="0">
                                                                    <tr>
                                                                        <td>
                                                                            <font style="font-weight: bold">
                                                                            <span id="ctl00_mainContent_reload_ctl04__GroupQuestion">Giá Dịch Vụ</span>
                                                                            </font>
                                                                            <table id="ctl00_mainContent_reload_ctl04_chkList" border="0">
                                                                                <tr>
                                                                                    <td><input id="price" type="radio" name="price" value="4" ${feedback.servicePrice==4?"checked":""} /><label for="ctl00_mainContent_reload_ctl04_chkList_0">Rẻ, phù hợp với sinh viên và người lao động</label></td>
                                                                                </tr><tr>
                                                                                    <td><input id="price" type="radio" name="price" value="3" ${feedback.servicePrice==3?"checked":""}/><label for="ctl00_mainContent_reload_ctl04_chkList_1">Hợp lý</label></td>
                                                                                </tr><tr>
                                                                                    <td><input id="price" type="radio" name="price" value="2" ${feedback.servicePrice==2?"checked":""}/><label for="ctl00_mainContent_reload_ctl04_chkList_2">Hơi Đắt</label></td>
                                                                                </tr><tr>
                                                                                    <td><input id="price" type="radio" name="price" value="1" ${feedback.servicePrice==1?"checked":""}/><label for="ctl00_mainContent_reload_ctl04_chkList_3">Rất Đắt</label></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br/>
                                                    <p><font style="font-style: italic; font-weight: bold">Nhận Xét Khác</font></p>
                                                    <textarea name="otherResponse" rows="5" cols="70" id="ctl00_mainContent_txtComment">${feedback.otherResponse}</textarea>
                                                    <br/>
                                                    <button type="submit">Gửi Nhận Xét</button>
                                                    <input type="hidden" name="service" value="updateFeedback" id="ctl00_mainContent_btSendFeedback" /><br/>
                                                    <br/>
                                                    <hr/>
                                                    <center>
                                                        Thank you ! /Xin cảm ơn !
                                                    </center>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="border-bottom: 0 none">
                                            <td >
                                                <br/>
                                                <table width="100%" style="border: 1px solid transparent;" id="cssTable">
                                                    <tr>
                                                        <td>
                                                            <div id="ctl00_divSupport">
                                                                <br/>
                                                                <b>Mọi góp ý, thắc mắc xin liên hệ: </b><span style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; font-weight: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">Quản lý khu trọ
                                                                </span>: Email: ${managerAccount.email}.
                                                                Điện thoại: <span class="style1" style="color: rgb(34, 34, 34); font-family: arial, sans-serif; font-size: 13.333333969116211px; font-style: normal; font-variant: normal; letter-spacing: normal; line-height: normal; orphans: auto; text-align: start; text-indent: 0px; text-transform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit-text-stroke-width: 0px; background-color: rgb(255, 255, 255); display: inline !important; float: none;">
                                                                    ${manageInfor.phoneNumber} </span>
                                                                <br/>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </form>
                            </c:if>
                            <c:if test="${checkFeedback==false}">
                                <h2>Chưa Có Form review tháng này</h2>
                            </c:if>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    <!-- Essential javascripts for application to work-->
    <script src="https://esgoo.net/scripts/jquery.js"></script>
    <script src="${pageContext.request.contextPath}/Resource/doc/js/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/Resource/doc/js/popper.min.js"></script>
    <script src="https://unpkg.com/boxicons@latest/dist/boxicons.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/Resource/doc/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/Resource/doc/js/main.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/Resource/js/profile.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/Resource/doc/js/plugins/pace.min.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/Resource/js/star.js"></script>
    <!--===============================================================================================-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/Resource/doc/js/plugins/chart.js"></script>
    <script type="text/javascript">
        //Thời Gian
        function time() {
            var today = new Date();
            var weekday = new Array(7);
            weekday[0] = "Chủ Nhật";
            weekday[1] = "Thứ Hai";
            weekday[2] = "Thứ Ba";
            weekday[3] = "Thứ Tư";
            weekday[4] = "Thứ Năm";
            weekday[5] = "Thứ Sáu";
            weekday[6] = "Thứ Bảy";
            var day = weekday[today.getDay()];
            var dd = today.getDate();
            var mm = today.getMonth() + 1;
            var yyyy = today.getFullYear();
            var h = today.getHours();
            var m = today.getMinutes();
            var s = today.getSeconds();
            m = checkTime(m);
            s = checkTime(s);
            nowTime = h + " giờ " + m + " phút " + s + " giây";
            if (dd < 10) {
                dd = '0' + dd
            }
            if (mm < 10) {
                mm = '0' + mm
            }
            today = day + ', ' + dd + '/' + mm + '/' + yyyy;
            tmp = '<span class="date"> ' + today + ' - ' + nowTime +
                    '</span>';
            document.getElementById("clock").innerHTML = tmp;
            clocktime = setTimeout("time()", "1000", "Javascript");

            function checkTime(i) {
                if (i < 10) {
                    i = "0" + i;
                }
                return i;
            }
        }
    </script>
</body>

</html> 