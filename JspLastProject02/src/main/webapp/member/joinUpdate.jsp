<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../shadow/css/shadowbox.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.js"></script>
<script type="text/javascript" src="../shadow/js/shadowbox.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
Shadowbox.init({
	players:['iframe']
})
$(function(){
	$('#postBtn').on('click', function() {
		new daum.Postcode({
			oncomplete:function(data){
				$('#post1').val(data.zonecode)
				$('#addr1').val(data.address)
			}
		}).open()
	})
})
</script>
</head>
<body>
<div class="wrapper row3">
  <main class="container clear">
   <div class="row row1">
   <form method="post" action="../member/joinUpdateOk.do" name="frm">
    <table class="table">
     <tr>
      <th class="text-right" width="15%">ID</th>
      <td width="85%" class="inline">
       <input type="text" size=20 class="input-sm" 
          readonly name="id" id="id" value="${detail.id}">
      </td>
     </tr>
     <tr>
      <th class="text-right" width="15%">비밀번호</th>
      <td width="85%" class="inline">
       <input type="password" size=20 class="input-sm" name="pwd" id="pwd">
      </td>
     </tr>
     <tr>
      <th class="text-right" width="15%">이름</th>
      <td width="85%">
       <input type="text" size=20 class="input-sm" name="name" id="name" value="${detail.name}">
      </td>
     </tr>
     <tr>
      <th class="text-right" width="15%">성별</th>
      <td width="85%" class="inline">
       <input type="radio" name="sex" value="남자" ${detail.sex=='남자'?'checked':''}>남자
       <input type="radio" name="sex" value="여자" ${detail.sex=='여자'?'checked':''}>여자
      </td>
     </tr>
     <tr>
      <th class="text-right" width="15%">생년월일</th>
      <td width="85%">
       <input type="date" size=30 class="input-sm" name="birthday" id="day" value="${detail.birthday }">
      </td>
     </tr>
     <tr>
      <th class="text-right" width="15%">이메일</th>
      <td width="85%">
       <input type="text" size=70 class="input-sm" name="email" id="email" value="${detail.email}">
      </td>
     </tr>
     <tr>
      <th class="text-right" width="15%">우편번호</th>
      <td width="85%" class="inline">
       <input type="text" size=15 class="input-sm" name="post" readonly id="post1" value="${detail.post }">
       <input type=button value="우편번호검색"
         class="btn btn-sm btn-primary" id="postBtn">
      </td>
     </tr>
     <tr>
      <th class="text-right" width="15%">주소</th>
      <td width="85%">
       <input type="text" size=70 class="input-sm" name="addr1" readonly id="addr1" value="${detail.add1 }">
      </td>
     </tr>
     <tr>
      <th class="text-right" width="15%">상세주소</th>
      <td width="85%">
       <input type="text" size=70 class="input-sm" name="addr2" value="${detail.add2 }">
      </td>
     </tr>
     <tr>
      <th class="text-right" width="15%">전화번호</th>
      <td width="85%" class="inline">
       <select class="input-sm" name="phone1">
        <option>010</option>
       </select>
       <input type="text" size=20 class="input-sm" name="phone2" id="phone2" value="${detail.phone }">
      </td>
     </tr>
     <tr>
      <th class="text-right" width="15%">소개</th>
      <td width="85%">
       <textarea rows="5" cols="70" name="content">${detail.content }</textarea>
      </td>
     </tr>
     <tr>
       <td colspan="2" class="text-center inline">
        <input type="submit" value="회원가입"
         class="btn-sm btn-info" id="joinBtn"
        >
        <input type=button value="취소"
         class="btn-sm btn-warning"
         onclick="javascript:history.back()"
        >
       </td>
     </tr>
    </table>
    </form>
   </div>
  </main>
</div>
</body>
</html>