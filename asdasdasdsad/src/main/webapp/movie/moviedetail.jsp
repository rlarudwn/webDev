<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../movie/mstyle.css">
<link rel="stylesheet" href="../assets/css/fontawesome.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

$(function() {
	let ratingCheck = false
	let likeCheck=false
	let id=$('#id').val()
	let mno = $('#mno').val()
	
	reviewlist()
	
	if(id.length>0){
		$.ajax({
			type:'post',
			url:'../like/likeCheck.do',
			data:{
				'tno':mno,
				'type':4
			},
			success:function(result){
				if(result==='OK'){
					likeCheck=true
					$('#likeBtnIcon').attr('src', 'likeon.png')
				}
				else{
					likeCheck=false
					$('#likeBtnIcon').attr('src', 'likeoff.png')
				}
			}
		})
	}
	else{
		$('#likeBtn').css('display', 'none')
	}
	$('#likeBtn').click(function() {
		if(likeCheck===true){
			$.ajax({
				type:'post',
				url:'../like/likeOff.do',
				data:{
					'tno':mno,
					'type':4
				},
				success:function(result){
					if(result>=0){
						likeCheck=false
						$('#likeBtnIcon').attr('src', 'likeoff.png')
						$('#likeCount').text(result)
					}
				}
			})
		}
		else{
			$.ajax({
				type:'post',
				url:'../like/likeOn.do',
				data:{
					'tno':mno,
					'type':4
				},
				success:function(result){
					if(result>=0){
						likeCheck=true
						$('#likeBtnIcon').attr('src', 'likeon.png')
						$('#likeCount').text(result)
					}
				}
			})
		}
	})
})
	 $('.rating').change(function() {
		    ratingCheck=true	
				let rating=$('input[name="rating"]:checked').val()
				rating=6-rating
		    console.log(rating)
			})
	$(function() {
		    let avgRating=parseFloat('${avg}')

		    let star= ''
		    for (let i=1;i<=5;i++) {
		        if (i<=avgRating) {
		            star+='<img src="star.png" style="width:20px;height:20px;">'
		        } else {
		            star+='<img src="nostar.png" style="width:20px;height:20px;">'
		        }
		    }
		    $('#avgstar').html(star)
		    $('#avgS').html(star)
		    
		})
		$('.rating').change(function() {
		    ratingCheck=true	
				let rating=$('input[name="rating"]:checked').val()
				rating=6-rating
		    console.log(rating)
			})
		$(function() {
		    let avgRating = parseFloat('${avg}')
		    let roundRating = Math.round(avgRating)

		    let star= ''
		    for (let i=1;i<=5;i++) {
		        if (i<=roundRating) {
		            star+='<img src="star.png" style="width:35px;height:35px;">'
		        } else {
		            star+='<img src="nostar.png" style="width:35px;height:35px;">'
		        }
		    }
		    $('#avgS').html(star)
		    
		})
			$('#reviewBtn').click(function(){
				let rating=0
				if(ratingCheck){
				rating=$('input[name="rating"]:checked').val()
				rating=6-rating
		   		console.log(rating)
					
				}
				else{
					alert('평점을 선택해주세요')
					return
				}
				let content=$('#content').val()
				if(content.trim()===''){
					alert('리뷰를 입력해주세요')
					$('#content').focus()
					return
				}
				// 리뷰 작성 가능 여부 확인
		        $.ajax({
		            type: 'post',
		            url: '../review/checkedReview.do',
		            data: {
		                'tno': mno,
		                'userId': id
		            },
		            success: function(result) {
		                if (result==='NO_REVIEW') {
		                    // 리뷰 작성
		                    $.ajax({
		                        type: 'post',
		                        url: '../review/insert.do',
		                        data: {
		                            'tno': mno,
		                            'trating': rating,
		                            'tcontent': content,
		                            'type': 1
		                        },
		                        success: function() {
		                            let count = $('#rcount').text()
		                            count = parseInt(count)
		                            $('#content').val('')
		                            $('input[name="rating"]').prop('checked', false)
		                            reviewlist()
		                            $('#rcount').text('')
		                            $('#rcount').text(count+1)
		                        }
		                    })
		                } else {
		                    alert('이미 작성하신 리뷰가 있습니다.')
		                }
		            }
		        })
		    })
		
  function reviewlist(){
			$.ajax({
				type:'post',
				url:'../review/list.do',
				data:{
					'tno':mno,
					'type':1
				},
				success:function(result){
					let json=JSON.parse(result)
					html=''
						json.map(function(reply) {
							let stars=''
							for(let i=1;i<=reply.trating;i++){
								stars+='<img src="star.png" style="width:15px;height:15px;">'
							}
							for(let i=1;i<=5-reply.trating;i++){
								stars+='<img src="nostar.png" style="width:15px;height:15px;">'
							}
					html+='<tr>'
					html+='<td>'
					html+='<div class="review-list">'
					html+='<div>'
					html+='<span class="nick-rate">'+reply.nickname+'</span>'
					if(reply.id===reply.sessionId){
						html+='<input type="button" class="xBtn" value="X" onclick="reviewdelete('+reply.trno+')">'
						}
					html+='<br>'
				  html+=stars+'<br>'
					html+='<span class="date">'+reply.dbday+'&nbsp;</span>'
					if(reply.sessionId.length>2){
					html+='<input type="button" class="rBtn" value="|&nbsp&nbsp;신고">'
					}
					html+='<div>'
					html+='<div class="r-content">'+reply.tcontent+'</div>'
					html+='</div>'
					html+='</div>'
					html+='</td>'
					html+='</tr>'
						})
						$('#review').html(html)
				}
			})
		}
	function reviewdelete(trno){
			$.ajax({
				type:'post',
				url:'../review/delete.do',
				data:{
					'trno':trno,
				},
				success:function(result){
					reviewlist()
					let count=$('#rcount').text()
					count=parseInt(count)
					$('#rcount').text(count-1)
					}
				})
		}
		document.addEventListener('DOMContentLoaded', function() {
		    const stars = document.querySelectorAll('.star-rating input[type="radio"]');
		    stars.forEach(star => {
		        star.addEventListener('change', function() {
		            updateStars(this);
		        });
		    });

		    function updateStars(selectedStar) {
		        const allStars = document.querySelectorAll('.star-rating label');
		        allStars.forEach(star => {
		            star.style.color = '#ddd'; 
		        });

		        const selectedValue = selectedStar.value;
		        allStars.forEach(star => {
		            const starValue = star.getAttribute('for').replace('star', '');
		            if (parseInt(starValue) >= parseInt(selectedValue)) {
		                star.style.color = '#779BC9'; 
		            }
		        });
		    }
		    
		});
		$(document).ready(function() {
		    var acountInput = $('#account');
		    var incrementButton = $('#increment');
		    var decrementButton = $('#decrement');

		    incrementButton.click(function() {
		        var value = parseInt(acountInput.val());
		        acountInput.val(value + 1);
		    });

		    decrementButton.click(function() {
		        var value = parseInt(acountInput.val());
		        if (value > 1) {
		        	acountInput.val(value - 1)
		        }
		    })
		    
		})
</script>
</head>
<body>
	<div class="page-content2">
	<div class="mlbefore">
	   	<i class="fa fa-chevron-circle-left"></i>
		  <input type="button" id='backbtn' name="이전 페이지로 이동" value="뒤로 가기" onclick="javascript:history.back()"> 
	</div>
	<div class="container">
	 <input type="hidden" value="${sessionScope.id}" id="id">
     <input type="hidden" value="${vo.mno}" id="mno">
	<table class="mdtable">
       <tr>
        <td width="40%" class="text-center" rowspan="16">
          <img src="https://www.kobis.or.kr${vo.mposter }" style="width: 100%">
        </td>
        </tr>
        <tr>
        <td>
          <h2 id="motitle" class="text-left">&nbsp;${vo.mtitle}&nbsp;&emsp;</h2>        
        </td>
        </tr>
        <tr>
          <td>
          <h4 id="moinfo1">&nbsp;${vo.mrday}&nbsp;개봉&nbsp;|&nbsp;${vo.mtime}&nbsp;|&nbsp;${vo.mgrade}&nbsp;<br>
          &nbsp;누적관객수&nbsp;:&nbsp; ${vo.mcount }명&nbsp;|&nbsp;${vo.mnation }&nbsp;</h4>
       </td>
       <tr>
        <td class="text-left" id="moinfo2">소개</td>
        </tr>
        <tr>
        <td id="moinfo3"> ${vo.msynop } </td>
       </tr>
       <tr>
        <td id="moinfo4">장르 &nbsp;:&nbsp; ${vo.mgenre} </td>
       </tr>
       <tr>
        <td id="moinfo5">감독 &nbsp;:&nbsp; ${vo.mdirector} </td>
       </tr>
       <c:if test="${vo.mactor!=null }">
       <tr>
        <td id="moinfo6">출연 &nbsp;:&nbsp; ${vo.mactor} </td>
       </tr>
       </c:if>
       <tr>
       <td><button id="likeBtn">
				<img src="" id="likeBtnIcon"><h4>${vo.likecount }</h4></button> 
       </td>
       </tr>
       </table>
		<div class="moviebook">
            <h3>  <br></h3>
                <div class="owl-features owl-carousel">
                 <c:forEach var="mbvo" items="${mbList }">
                  <input type="hidden" value="${vo.mno}" id="mno">
				 <div class="item">
				 <div class="thumb">
                <img src="${mbvo.cover }"  alt="">
                 <div class="hover-effect">
                      <h6><i class="fa fa-eye"></i><a href="../book/detail.do?bno=${mbvo.bno }"  title="상세정보 확인">상세정보</a></h6>
                      </div>
                <h4 id="text2"><span>${mbvo.btitle }</span></h4>
                <ul>
                    <li>&nbsp; ${mbvo.sale_price }원</li>
                </ul>
            </div>
        </div>
          </c:forEach>
        </div>
        </div>
 
	<div class="heading-section" style="padding: 0 0 15px 0;">
			<span style="font-size: 25px; font-weight: bold;"><span id="rcount" style="font-size:30px;color:  #7400e8">${rcount}</span> 명의&nbsp;회원이&nbsp;평가한&nbsp;이&nbsp;영화의&nbsp;평균별점</span>
				</div>
				<div class="avgRating">
				<span id="avgS" style="font-weight: bold;"></span>
				<p id="avgN" style="font-size: 30px; font-weight: bold;">${avg}</p><p style="font-size: 25px; font-weight: bold;">&nbsp;/ 5.0</p>
				</div>
				<div id="review-form" class="review-form" style="margin-top: 40px;">
						<div class="heading-section" style="padding: 0 0 15px 0;">
							<span style="font-size: 20px; font-weight: bold;">영화 리뷰(<span id="rcount">${rcount}</span>)</span>
										</div>
											<input type="hidden" id="mno" name="mno" value="${vo.mno}" /> 
											<div>
											<div class="star-rating">
												<input class="rating" type="radio" id="star5" name="rating"
													value="5" required />
												<label for="star5"></label>
												<input class="rating" type="radio" id="star4" name="rating"
													value="4" />
												<label for="star4"></label>
												<input class="rating" type="radio" id="star3" name="rating" value="3" />
												<label for="star3"></label>
												<input class="rating" type="radio" id="star2" name="rating" value="2" />
												<label for="star2"></label>
												<input class="rating" type="radio" id="star1" name="rating" value="1" />
												<label for="star1"></label>
											</div>
										</div>
											<table>
												<tr>
													<td>
														<div class="review-container">
															<textarea id="content" style="resize: none;"
																name="content" required placeholder="리뷰를 작성해주세요!!"></textarea>
															<button type="button" id="reviewBtn">리뷰 작성</button>
														</div>
													</td>
												</tr>
											</table>
											<table>
										 <tbody id="review">
										 </tbody>
						</table>
				</div>
		</div>
	</div>
</body>
</html>