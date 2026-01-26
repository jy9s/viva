<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function miniBtn_Click(name){
	
	
	
	if(name=="acttracBtn"){
		window.location.href="${CommonURL}/attraction/viva_Attraction_main.jsp";
	}else if(name=="foodBtn"){
		
		
		window.location.href="${CommonURL}/restaurant/viva_Restaurant_main.jsp";
	}else if(name=="giftBtn"){
		
		
		window.location.href="${CommonURL}/giftShop/viva_Gift_main.jsp";
		
	}else if(name=="enjoy"){
		window.location.href="${CommonURL}/attraction/viva_Attraction_main.jsp";
		
	}else if(name=="event"){
		window.location.href="${CommonURL}/perf/perform.jsp?filter=all";
		
	}else if(name=="charge"){
		
		window.location.href="${CommonURL}/pay/ticketPrice.jsp";
	}else if(name =="information"){
		
		window.location.href="${CommonURL}/info/user_guide2.jsp";
		
	}else if(name =="communication"){
		
		window.location.href="${CommonURL}/info/user_guide2.jsp";
		
		
	}
	

	
	
	
	
	
	
	
	
	//acttracBtn foodBtn giftBtn
	
}//miniBtn_Click
</script>   
    
    
	<div>
				<div class="breadcrumb">
					<div class="inner2">
						<div class="breadcrumb__wrap">
							<div class="breadcrumb__home">
								<a class="breadcrumb__home-link" href="${CommonURL}/main/mainPg_Include.jsp"><span
									class="breadcrumb__home-icon"><i class="icon"
										style="--iconColor: var(--text-color-2);"><svg width="20"
												height="20" viewBox="0 0 20 20" fill="none"
												xmlns="http://www.w3.org/2000/svg">
												<path fill-rule="evenodd" clip-rule="evenodd"
													d="M2.68299 8.40241C2.24896 8.78218 2 9.33084 2 9.90756V16C2 17.1046 2.89543 18 4 18H16C17.1046 18 18 17.1046 18 16V9.90756C18 9.33084 17.751 8.78218 17.317 8.40241L11.9755 3.7286C10.8444 2.73891 9.15557 2.7389 8.02449 3.7286L2.68299 8.40241ZM10 12C8.89543 12 8 12.8955 8 14V18H12V14C12 12.8955 11.1046 12 10 12Z"
													fill="var(--iconColor, #111111)"></path></svg></i></span></a>
							</div>
							<div class="breadcrumb__menu">
								<div class="breadcrumbMenu">
									<div class="btn-group">
										<button type="button" class="btn-secondary dropdown-toggle"
											data-bs-toggle="dropdown" data-bs-display="static"
											aria-expanded="false" style="color: #B3B3B3">즐길거리</button>
										<ul class="dropdown-menu dropdown-menu-lg-end">
											<li><button class="dropdown-item" type="button" onclick="miniBtn_Click('enjoy')">즐길거리</button></li>
											<li><button class="dropdown-item" type="button" onclick="miniBtn_Click('event')">행사</button></li>
											<li><button class="dropdown-item" type="button" onclick="miniBtn_Click('charge')">요금/예매</button></li>
											<li><button class="dropdown-item" type="button" onclick="miniBtn_Click('information')">이용정보</button></li>
											<li><button class="dropdown-item" type="button" onclick="miniBtn_Click('communication')">소통서비스</button></li>
										</ul>
									</div>											
								</div>
								<!-- 부트스트랩 -->
								<div class="breadcrumbMenu">
									<div class="btn-group">
										<button type="button"
											class="btn-secondary dropdown-toggle fw-bold"
											data-bs-toggle="dropdown" data-bs-display="static"
											aria-expanded="false">${minimenu_sub}</button>
										<ul class="dropdown-menu dropdown-menu-lg-end">
											<li><button class="dropdown-item" type="button" id="acttracBtn" onclick="miniBtn_Click('acttracBtn')">어트랙션</button></li>
											<li><button class="dropdown-item" type="button" id="foodBtn" onclick="miniBtn_Click('foodBtn')">레스토랑</button></li>
											<li><button class="dropdown-item" type="button" id="giftBtn" onclick="miniBtn_Click('giftBtn')">기프트샵</button></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>	