<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style type="text/css">
	@media (min-width: 1329px) {
    .floatingBtn {
        left:calc(100% - 10rem);
        bottom: 1rem
    }
}

.floatingBtn__topBtn {
    width: 4rem;
    height: 4rem;
    border-radius: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    background-color: var(--color-white);
    box-shadow: 1px 1px 10px rgba(0,0,0,.15);

}

.floatingBtn__topBtn-icon {
    width: 1.2rem;
    height: 1.3rem;


}

.floatingBtn {
    position: fixed;
    bottom: 40px;
    right: 20px;
    z-index: 9999;
    opacity: 0;
    visibility: hidden;
    transition: opacity .3s ease-in-out, visibility .3s;

}

.floatingBtn.show {
    opacity: 1;
    visibility: visible;
}
</style>

<script type="text/javascript">
$(function(){
	$(window).on("scroll",function(){
		if($(window).scrollTop()>300){
			$(".floatingBtn").addClass("show");
		}else{
			$(".floatingBtn").removeClass("show");
			
		}
	});

});
	
</script>
	
	