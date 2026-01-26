<%@page import="dashboard.DashBoardDailyUserDTO"%>
<%@page import="dashboard.DashBoardService"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>


<script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>

<style>
    /* 🛑 CSS 수정: 제목 구분선 및 컨테이너 스타일 */
    body { text-align: center; }
    .chart-container { 
        width: 100%; 
        box-shadow: 0 4px 8px rgba(0,0,0,0.1); 
        background: #fff;
        border-radius: 6px; 
        overflow: hidden; 
        height:410px;
    }
    
    /* 🛑 CSS 수정: 제목 영역 스타일 */
    .chart-header {
        padding: 15px 30px; 
        margin-bottom: 0;
        text-align: left;
        border-bottom: 1px solid #e0e0e0; 
        background-color: #f8f9fc; 
    }
    
    .chart-header h2 {
        margin: 0;
        font-size: 1.25rem;
        font-weight: bold;
        /* 🛑 텍스트 색상을 회색 계열로 변경 */
        color: #6c757d; /* Bootstrap의 text-secondary에 가까운 회색 */
    }
    
    .chart-body {
        padding: 30px; 
    }
</style>

<%-- 
    **********************************************************
    * 🔑 JSP 스크립틀릿: 서버 측 데이터 준비 (가데이터)
    **********************************************************
--%>


<div class="chart-container border-bottom-danger">
    <div class="chart-header">
        <h2 class="m-0 font-weight-bold text-danger">방문객 수</h2>
    </div>
    <div class="chart-body">
        <canvas id="useCountChart"></canvas>
    </div>
</div>

<%
	
	DashBoardService dbService = new DashBoardService();
	
	List<DashBoardDailyUserDTO> list = dbService.searchTotalDailyUser();

	
	
    List<Integer> series1Data = new ArrayList<Integer>();
    
    for(int i=0; i<6; i++){ //최근 6개월
    	series1Data.add(list.get(i).getAnnUser()); //최근 6개월 연간회원 방문객수를 넣어준다.
    }
    
    List<Integer> series2Data = new ArrayList<Integer>();
    for(int i=0; i<6; i++){ //최근 6개월
    	series2Data.add(list.get(i).getNormalUser()); //최근 6개월 일반회원 방문객수를 넣어준다.
    }
	
    
    List<String> chartLabelsList = new ArrayList<String>();
    
    LocalDate today = LocalDate.now();
    
    for (int i = 5; i >= 0; i--) {
        LocalDate pastDate = today.minusMonths(i);
        
        
        String yearMonth = String.format("%d-%02d", pastDate.getYear(), pastDate.getMonthValue());
        chartLabelsList.add(yearMonth);
    }
    
    
%>

<script>
    // X축 라벨 배열 (예: ['1월', '2월', '3월', ...])
    var chartLabels = [
    <%
	    for(int i=0; i < chartLabelsList.size(); i++) {
	        out.print("'" + chartLabelsList.get(i) + "'"); // "월" 접미사 제거
	        if (i < chartLabelsList.size() - 1) out.print(", ");
	    }
    %>
    ];

    // 연간회원 데이터 배열 (파란색)
    var dataSeries1 = [
    <%
        for(int i=0; i < series1Data.size(); i++) {
            out.print(series1Data.get(i));
            if (i < series1Data.size() - 1) out.print(", ");
        }
    %>
    ];
    
    // 일반회원 데이터 배열 (빨간색)
    var dataSeries2 = [
    <%
        for(int i=0; i < series2Data.size(); i++) {
            out.print(series2Data.get(i));
            if (i < series2Data.size() - 1) out.print(", ");
        }
    %>
    ];

    // ----------------------------------------------------
    // 🔑 Chart.js 차트 초기화 (스타일 옵션 적용)
    // ----------------------------------------------------
    
    const ctx = document.getElementById('useCountChart').getContext('2d');
    
    new Chart(ctx, {
        type: 'bar',
        data: {
            labels: chartLabels, 
            datasets: [
                {
                    label: '일반 회원',
                    backgroundColor: 'rgba(255, 99, 132, 0.8)', // 빨간색 계열
                    data: dataSeries2
                },
                {
                    label: '연간 회원',
                    backgroundColor: 'rgba(54, 162, 235, 0.8)', // 파란색 계열
                    data: dataSeries1
                }
            ]
        },
        options: {
            responsive: true,
            scales: {
                x: {
                    stacked: true,
                    grid: {
                        display: false // X축(세로선) 그리드 숨김
                    }
                },
                y: {
                    stacked: true,
                    beginAtZero: true,
                    max: 50,
                    grid: {
                        borderDash: [5, 5], // Y축(가로선)을 점선으로 설정
                        drawTicks: false, 
                        color: 'rgba(0, 0, 0, 0.1)' 
                    }
                }
            },
            plugins: {
                legend: {
                    position: 'bottom', 
                }
            }
        }
    });
</script>