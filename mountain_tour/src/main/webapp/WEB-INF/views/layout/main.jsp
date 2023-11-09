<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:include page="header.jsp">
  <jsp:param value="마운틴투어" name="title"/>
</jsp:include>
  
  <div class="ad_wrapper">
	  <div class="ad">
    
	      <div class="container">
            <ul class="slider-container simple-list" id="slider">
                <li class="slide">
                    <img src="https://github.com/skal48/portfolio/blob/main/bakdo.jpg?raw=true">
                </li>
                <li class="slide">
                   <img src="https://github.com/skal48/portfolio/blob/main/hanla.jpg?raw=true">       
                </li>
                <li class="slide">
                   <img src="https://github.com/skal48/portfolio/blob/main/seolark.jpg?raw=true">
                </li>
            </ul>
            <p class="pager">
                <!-- <span data-idx="0">1</span>
                <span data-idx="1">2</span>
                <span data-idx="2">3</span>
                <span data-idx="3">4</span>
                <span data-idx="4">5</span>
                <span data-idx="5">6</span> -->
            </p>

            <a href="#" id="prev"></a>
            <a href="#" id="next"></a>
        </div> <!-- end container -->
       
	  </div>
  </div>

  <div class="container text-center">
  <div class="row">
    <div class="col-1">      
    </div>
    <div class="col-10">
      <!--  여기다가 작성 -->
      
      
      
      
      
      
      
      
      

    </div>
    <div class="col-1">
    </div>
  </div>
</div>
<script>
  document.addEventListener('DOMContentLoaded', function(){ 
    
    // 변수 지정
    var $slideWrap = document.querySelector('.container'),
        $slideContainer = document.querySelector('.slider-container'),
        $slide = document.querySelectorAll('.slide'),
        $navPrev = document.getElementById('prev'),
        $slideHeight = 0,
        $slideCount = $slide.length,
        $currentIndex = 0,
        $pager = document.querySelector('.pager'),
        $pagerBtn = document.querySelectorAll('.pager span'),
        $navNext = document.getElementById('next');
                   
        //슬라이드의 높이 확인하여 부모의 높이로 지정하기 - 대상.offsetHeight
        for(var i = 0; i < $slideCount ; i++){
           if($slideHeight < $slide[i].offsetHeight){
                $slideHeight = $slide[i].offsetHeight;
           }
        }
        console.log($slideHeight);

        $slideWrap.style.height = $slideHeight +'px';
        $slideContainer.style.height = $slideHeight +'px';

        // 슬라이드가 있으면 가로로 배열하기
        for(var a = 0; a < $slideCount; a++){
            $slide[a].style.left = a * 100 + '%'; 
        }

       

        // 슬라이드 이동 함수 
        function goToSlide(idx){
            $slideContainer.classList.add('animated');
            $slideContainer.style.left = -100 * idx + '%';
            $currentIndex = idx;         
        }//goToSlide

        goToSlide(0);

        // 버튼을 클릭하면 슬라이드 이동시키기
        $navPrev.addEventListener('click',function(){            
            //goToSlide($currentIndex - 1);

            if($currentIndex == 0){
                //$navPrev.classList.add('disabled');
                goToSlide($slideCount - 1);
            }else{
                //$navPrev.classList.remove('disabled');
                goToSlide($currentIndex - 1);
            } 
        });

        $navNext.addEventListener('click',function(){
            //goToSlide($currentIndex + 1);

           if($currentIndex == $slideCount - 1){
               // $navNext.classList.add('disabled');
               goToSlide(0);
           }else{
               // $navNext.classList.remove('disabled');
               goToSlide($currentIndex + 1);
           }
        });

    //자동 슬라이드
   

});//DOMcontentloaded
  
</script>  
  
  

<%@ include file="footer.jsp" %>