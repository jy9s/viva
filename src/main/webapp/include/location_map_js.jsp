<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script type="text/javascript">

$(function(){
	

/*  const map = document.getElementById('mapImage');
    const mapArea = document.getElementById('mapArea');  */
   	var map = $("#mapImage");
	var mapArea = $("#mapArea"); 
    
    let scale = 1;
    let posX = 0, posY = 0;
    let startX, startY, initialPosX, initialPosY;
    let isDragging = false;

    // 이미지 중앙 정렬을 위한 초기 transform-origin 설정
    map.css("transformOrigin",'center center');

    function updateTransform() {
      	map.css("transform","translate("+posX+"px,"+posY+"px) scale("+scale+")");

    }

    // Zoom In

 	$("#zoomIn").click(function(){
        scale = Math.min(4, scale + 0.2); // 확대 단계를 조금 더 키움
        updateTransform();
 	});
 
    // Zoom Out
 
 		$("#zoomOut").click(function(){
 	        scale = Math.max(0.5, scale - 0.2); // 축소 단계를 조금 더 키움
 	        updateTransform();
 			
 		});
 		
    // Reset

 	$("#resetZoom").click(function(){
        scale = 1;
        posX = 0;
        posY = 0;
        updateTransform();
 	});
    
    
    // Mouse Drag

    
    $('#mapArea').mousedown(function(event){
    	event.preventDefault(); // 기본 드래그 동작 방지 (텍스트 선택 등)
        isDragging = true;
        startX = event.clientX;
        startY = event.clientY;
        initialPosX = posX;
        initialPosY = posY;
        mapArea.css("cursor","grabbing");
        
    })
    
    
    

 
 	$(window).mousemove(function(e){
        if (!isDragging) return;
        const dx = e.clientX - startX;
        const dy = e.clientY - startY;
        posX = initialPosX + dx;
        posY = initialPosY + dy;
        updateTransform();
 	})	;
 
 

    
    $(window).mouseup(function(){
    	 isDragging = false;
    	 mapArea.css("cursor","grab");
    });

    // Mobile Touch + Pinch Zoom (기존 코드 유지)
    let touchStartDist = 0;
    let initialTouchScale = 1; // 핀치 줌 시작 시의 스케일
   
      if (mapArea.length > 0) { // jQuery 객체가 요소를 찾았는지 확인하는 안전 장치
          mapArea[0].addEventListener("touchstart", function(e) {
              e.preventDefault(); // 기본 터치 동작 방지

              if (e.touches.length === 1) {
                  startX = e.touches[0].clientX;
                  startY = e.touches[0].clientY;
                  initialPosX = posX;
                  initialPosY = posY;
              } else if (e.touches.length === 2) {
                  const dx = e.touches[0].clientX - e.touches[1].clientX;
                  const dy = e.touches[0].clientY - e.touches[1].clientY;
                  touchStartDist = Math.sqrt(dx * dx + dy * dy);
                  initialTouchScale = scale; // 핀치 줌 시작 시 현재 스케일 저장
              }
          }, { passive: false }); 
      

          // ⚠️ 수정 2: mapArea[0] 사용
          mapArea[0].addEventListener("touchmove", function(e) {
              e.preventDefault(); // 기본 터치 동작 방지

              if (e.touches.length === 1) {
                  const dx = e.touches[0].clientX - startX;
                  const dy = e.touches[0].clientY - startY;
                  posX = initialPosX + dx;
                  posY = initialPosY + dy;
              } else if (e.touches.length === 2) {
                  const dx = e.touches[0].clientX - e.touches[1].clientX;
                  const dy = e.touches[0].clientY - e.touches[1].clientY;
                  const dist = Math.sqrt(dx * dx + dy * dy);

                  if (touchStartDist) {
                      let zoomFactor = dist / touchStartDist;
                      scale = Math.min(4, Math.max(0.5, initialTouchScale * zoomFactor));
                  }
              }
              updateTransform();
          }, { passive: false });

          // ⚠️ 수정 3: mapArea[0] 사용
          mapArea[0].addEventListener("touchend", function() {
              touchStartDist = 0;
          });
      } // if (mapArea.length > 0) 닫는 괄호
     

});
</script>
    