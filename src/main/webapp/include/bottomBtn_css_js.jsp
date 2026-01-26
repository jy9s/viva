<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>

<style type="text/css">   
    .bottombtns {
    margin-top: 4rem
}

@media (min-width: 1329px) {
    .bottombtns {
        margin-top:8rem
    }

    .bottombtns .button {
        width: 20rem
    }

    .bottombtns .buttonGroup__item {
        flex-basis: auto;
        flex-grow: 0
    }
}

@media (min-width: 1329px) {
    .inner2 {
        margin:0 auto;
        max-width: 136rem
    }
}



.button__wrap {
    display: flex;
    height: 100%;
    width: 100%;
    align-items: center;
    justify-content: center;
    gap: .4rem;
    pointer-events: none
}

.button__text {
    padding: 0 .4rem;
    color: var(--btnTextColor);
    text-align: center;
    font-weight: 600;
    line-height: 1.4;
    font-size: 1.5rem
}

@media (min-width: 1329px) {
    .button__text {
        font-size:1.5rem
    }
}

.button--line {
    background-color: #fff;
    border-color: var(--btnMainColor);
    --btnTextColor: var(--btnMainColor)
}

.button--purple {
    --btnMainColor: var(--color-purple-500-primary)
}

.buttonGroup {
    width: 100%
}

.buttonGroup__wrap {
    display: flex;
    margin-left: -.4rem;
    margin-right: -.4rem
}

.buttonGroup__item {
    flex-basis: calc(50% - .8rem);
    flex-grow: 1;
    margin: 0 .4rem
}

.buttonGroup--center .buttonGroup__wrap {
    justify-content: center
}



</style>

<script type="text/javascript">
 $(function(){
    	$("#bottombtn").click(function(){
    		/* $(location).prop("href","${CommonURL}/${folder_name}/${bottom_fileName}"); */
    		console.log("${CommonURL}/${bottom_Path}")
    		 $(location).prop("href","${CommonURL}/${bottom_Path}"); 
    	});
    	
    });
</script>

