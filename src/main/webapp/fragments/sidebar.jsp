<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-danger sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../dashboardAdmin/dashboard.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <!--<i class="fas fa-laugh-wink"></i>-->
                </div>
              	<div class="sidebar-brand-text mx-3" style="font-size:20px;">Viva Admin</div>
                <div class="sidebar-brand-icon rotate-n-15">
                    <!--<i class="fas fa-laugh-wink"></i>-->
                </div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">

            <!-- Nav Item - Dashboard -->
            <li class="nav-item">
                <a class="nav-link" href="../dashboardAdmin/dashboard.jsp">
                    <i class="fas fa-fw fa-tachometer-alt"></i>
                    <span style="font-size:18px">대시보드</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="../userinfoAdmin/userinfo.jsp">
                    <i class="fas fa-fw fa-user-alt"></i>
                    <span style="font-size:18px">회원정보조회</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading" style="font-size:13px">
                관리
            </div>

            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link" href="../reserveAdmin/ticket_reserve.jsp">
                    <i class="fas fa-ticket-alt"></i>
                    <span style="font-size:18px">티켓 예매</span></a>
            </li>
            
            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="../reserveAdmin/perf_reserve.jsp">
                    <i class="fas fa-theater-masks"></i>
                    <span style="font-size:18px">공연 예약</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="../perfAdmin/perf_schedule.jsp">
                    <i class="fas fa-crown"></i>
                    <span style="font-size:18px">행사</span></a>
            </li>
            
            <li class="nav-item">
                <a class="nav-link" href="../attractionAdmin/attrac_schedule.jsp">
                    <i class="fas fa-democrat"></i>
                    <span style="font-size:18px">놀이기구</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
            <div class="sidebar-heading" style="font-size:13px">
                CS
            </div>


            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="../noticeAdmin/notice.jsp">
                    <i class="fas fa-exclamation-circle"></i>
                    <span style="font-size:18px">공지</span></a>
            </li>
            
            <!-- Nav Item - Charts -->
            <li class="nav-item">
                <a class="nav-link" href="../faqAdmin/faq.jsp">
                    <i class="fas fa-question"></i>
                    <span style="font-size:18px">FAQ</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item">
                <a class="nav-link" href="../qnaAdmin/qna.jsp">
                    <i class="far fa-envelope"></i>
                    <span style="font-size:18px">문의</span></a>
            </li>

            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>


        </ul>
        <!-- End of Sidebar -->
 