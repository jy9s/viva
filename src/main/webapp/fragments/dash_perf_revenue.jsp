<%@page import="dashboard.DashBoardPerfRevenueDTO"%>
<%@page import="dashboard.DashBoardService"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>


<div class="chart-container border-bottom-danger">
    <div class="chart-header">
        <h2 class="m-0 font-weight-bold text-danger">행사 매출</h2>
    </div>
    <div class="chart-body">
	  <canvas id="PerfRevChart"></canvas>
    </div>
</div>

<%

	DashBoardService dbService = new DashBoardService();
	List<DashBoardPerfRevenueDTO> list = dbService.searchTotalPerf();

    List<Integer> perfRevenue = new ArrayList<Integer>();
    
    for(int i=0; i<6; i++){ //최근 6개월
    	perfRevenue.add(list.get(i).getPerfRev()); //행사 매출을 넣어준다.
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

	var chartLabels = [
    <%
	    for(int i=0; i < chartLabelsList.size(); i++) {
	        out.print("'" + chartLabelsList.get(i) + "'"); // "월" 접미사 제거
	        if (i < chartLabelsList.size() - 1) out.print(", ");
	    }
    %>
    ];
  
	// 티켓 가격 시리즈
    var perfRevSeries = [
    <%
        for(int i=0; i < perfRevenue.size(); i++) {
            out.print(perfRevenue.get(i));
            if (i < perfRevenue.size() - 1) out.print(", ");
        }
    %>
    ];
	
  const ctx3 = document.getElementById('PerfRevChart');
  
  
  

  new Chart(ctx3, {
    type: 'line',
    data: {
      labels: chartLabels,
      datasets: [{
        label: '행사 매출',
        data: perfRevSeries,
        borderWidth: 1,
        borderColor : 'rgba(255, 99, 132, 0.8)',
        backgroundColor: 'rgba(255, 99, 132, 0.8)', // 빨간색 계열
      }]
    },
    options: {
    	responsive: true, // 반응형 설정을 유지하는 것이 좋습니다.
        // 👇 이 부분을 추가하세요.
        plugins: {
          legend: {
            display: false // 범례(Legend) 전체를 숨깁니다.
          }
        },
      scales: {
        y: {
          beginAtZero: true,
          ticks: {
              // 소수점 이하 자릿수를 0으로 설정하여 정수만 표시
              precision: 0 
          }
        }
      }
    }
  });
</script>