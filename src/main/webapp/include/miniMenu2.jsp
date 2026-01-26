<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script type="text/javascript">
function miniBtn_Click(name){
	
	
	
	if(name=="performBtn"){
		window.location.href="perform.jsp?currentPage=1&filter=2";
	}else if(name=="paradeBtn"){		
		window.location.href="perform.jsp?currentPage=1&filter=1";
		
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
		
		
	}//end else if
	
}//miniBtn_Click
</script>   
    <style>
    /* breadcrumb 안쪽 폭/패딩 */
.inner2 {
  width: 100%;
  padding-left: 1.6rem;
  padding-right: 1.6rem;
}
@media (min-width: 1329px) {
  .inner2 {
    margin: 0 auto;
    max-width: 136rem;
  }
}

/* 홈 아이콘(svg) 사이즈 맞추는 용 */
.icon {
  display: inline-block;
  vertical-align: top;
  width: 100%;
  height: 100%;
}
.icon > svg {
  width: 100%;
  height: 100%;
}

/* breadcrumb 레이아웃 */
.breadcrumb {
  margin-left : 20px;
  margin-top: 150px;
  width:40px;
  font-size:15px;
}
.breadcrumb__wrap {
  display: flex;
  align-items: center;
}
.breadcrumb__home {
/*    padding-right: 1.3rem;
  margin-right: 1.3rem;  */
  padding-right: 12px;
  margin-right: 12px;
  padding-bottom:2px;

/*   margin-top : 1px;
  padding-right :4px; */
  position: relative;
}
.breadcrumb__home:after {
  content: "";
  display: block;
  position: absolute;
  width: 1px;
  height: 1rem;
  background-color: #dfdfdf;
  top: 57%;
  transform: translateY(-50%);
  right: 0;
}
.breadcrumb__home-link {
  width: 1.2rem;
  height: 1.2rem;
  display: block;
}
.breadcrumb__home-icon {
 /*  width: 100%;
  height: 100%; */

  display: block;
 
}
.breadcrumb__menu {
  display: flex;
  align-items: center;
}

/* breadcrumb 안의 메뉴 간격 */
.breadcrumbMenu {
  position: relative;
  margin-right: 12px;
}
.breadcrumbMenu:last-child {
  margin-right: 0;
}

/* (너 HTML에선 breadcrumbMenu__title은 안 쓰지만 같이 있는 스타일) */
.breadcrumbMenu__menu {
  display: flex;
  align-items: center;
}
.breadcrumbMenu__title {
  font-size: 1.6rem;
  font-weight: 400;
  line-height: 1.4;
  color: var(--text-color-2);
  display: block;
}
.breadcrumbMenu:last-child .breadcrumbMenu__title {
  font-weight: 600;
  color: var(--text-color-1);
}
.breadcrumbMenu__icon {
  width: 1.2rem;
  height: 1.2rem;
  display: block;

  margin-left: .6em;
  transition: all .35s;
}
.breadcrumbMenu.is-open .breadcrumbMenu__icon {
  transform: rotate(180deg);
}


.dropdown-menu>li{

	text-align: center;
	font-size: 14px;
}


@media (max-width: 1329px) {
	.breadcrumb{
	
		display: none;
	}
	

}
    </style>
    
	<div>
				<div class="breadcrumb">
					<div class="inner2">
						<div class="breadcrumb__wrap">
							<div class="breadcrumb__home">
								<a class="breadcrumb__home-link" href="${CommonURL}/main/mainPg_Include.jsp" ><span
									class="breadcrumb__home-icon"><svg width="13"
												height="13" viewBox="0 0 20 20" fill="none"
												xmlns="http://www.w3.org/2000/svg">
												<path fill-rule="evenodd" clip-rule="evenodd"
													d="M2.68299 8.40241C2.24896 8.78218 2 9.33084 2 9.90756V16C2 17.1046 2.89543 18 4 18H16C17.1046 18 18 17.1046 18 16V9.90756C18 9.33084 17.751 8.78218 17.317 8.40241L11.9755 3.7286C10.8444 2.73891 9.15557 2.7389 8.02449 3.7286L2.68299 8.40241ZM10 12C8.89543 12 8 12.8955 8 14V18H12V14C12 12.8955 11.1046 12 10 12Z"
													fill="#495057"></path></svg></span></a>
							</div>
							<div class="breadcrumb__menu">
								<div class="breadcrumbMenu">
									<div class="btn-group">
										<button type="button" class="btn-secondary dropdown-toggle"
											data-bs-toggle="dropdown" data-bs-display="static"
											aria-expanded="false" style="color: #B3B3B3">행사</button>
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
											<li><button class="dropdown-item" type="button" id="performBtn" onclick="miniBtn_Click('performBtn')">공연</button></li>
											<li><button class="dropdown-item" type="button" id="paradeBtn" onclick="miniBtn_Click('paradeBtn')">퍼레이드</button></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>	