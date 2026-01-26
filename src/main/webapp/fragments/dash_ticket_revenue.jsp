<%@page import="dashboard.DashBoardTicketRevenueDTO"%>
<%@page import="dashboard.DashBoardService"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>


<div class="chart-container border-bottom-danger">
    <div class="chart-header">
        <h2 class="m-0 font-weight-bold text-danger">입장권 매출</h2>
    </div>
    <div class="chart-body">
	  <canvas id="ticketRevChart"></canvas>
    </div>
</div>

<%

	DashBoardService dbService = new DashBoardService();
	List<DashBoardTicketRevenueDTO> list = dbService.searchTotalTicket();

    List<Integer> ticketRevenue = new ArrayList<Integer>();
    for(int i=0; i<6; i++){ //최근 6개월
    	ticketRevenue.add(list.get(i).getTicketRev()); //티켓 매출을 넣어준다.
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
    var ticektRevSeries = [
    <%
        for(int i=0; i < ticketRevenue.size(); i++) {
            out.print(ticketRevenue.get(i));
            if (i < ticketRevenue.size() - 1) out.print(", ");
        }
    %>
    ];
	
  const ctx2 = document.getElementById('ticketRevChart');
  
  
  

  new Chart(ctx2, {
    type: 'line',
    data: {
      labels: chartLabels,
      datasets: [{
        label: '입장권 매출',
        data: ticektRevSeries,
        borderWidth: 1
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