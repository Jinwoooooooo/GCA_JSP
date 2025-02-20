<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="/jboard/js/daumPostcode.js"></script>
<script>
	
	//유효성 검사에 사용할 정규표현식
	const reUid   = /^[a-z]+[a-z0-9]{4,19}$/g;
	const rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
	const reName  = /^[가-힣]{2,10}$/ 
	const reNick  = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
	const reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	const reHp    = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;
	
	document.addEventListener('DOMContentLoaded', function() {
		
		//유효성 검사에 사용할 상태 변수
		let isUidOk = false;
		let isPassOk = false;
		let isNameOk = false;
		let isNickOk = false;
		let isEmailOk = false;
		let isHpOk = false;
		
		//1. 아이디 유효성 검사
		const btnCheckUid = document.getElementById("btnCheckUid");		
		const uidResult = document.getElementsByClassName("uidResult")[0];
		
		
		btnCheckUid.onclick = function() {
			
			//데이터 전송
			const value = formRegister.uid.value;

			//아이디 유효성 검사
			if(!value.match(reUid)) {
				uidResult.innerText = "아이디 형식에 맞지 않습니다.";
				uidResult.style.color = "crimson";
				isUidOk = false;
				return; //처리 종료
			}
			
			//아이디 중복 체크
			fetch('/jboard/user/check.do?type=uid&value='+value)
			.then(response => response.json())
			.then(data=>{
				console.log(data);
				if(data.count > 0) {
					//이미 사용중인 아이디
					uidResult.innerText = "이미 사용중인 아이디입니다.";
					uidResult.style.color = "crimson";
					isUidOk = false;
					
				} else {
					//사용 가능한 아이디
					uidResult.innerText = "사용 가능한 아이디입니다.";
					uidResult.style.color = "green";
					isUidOk = true;
				}
			})
			.catch((err)=>{
				console.log(err);
			});
		}
		
		//2. 비밀번호 유효성 검사
		const passResult = document.getElementsByClassName("passResult")[0];
		
		formRegister.pass2.addEventListener('focusout', function() {
			
			const value1 = formRegister.pass1.value;
			const value2 = formRegister.pass2.value;
			
			if(!value1.match(rePass)) {
				passResult.innerText = "숫자, 대, 소, 특수문자 조합 8자리 이상이어야 합니다.";
				passResult.style.color = "crimson";
				isPassOk = false;
				return;
			}
			
			if(value1 === value2) {
				passResult.innerText = "비밀번호가 일치합니다.";
				passResult.style.color = "green";
				isPassOk = true;
			} else {
				passResult.innerText = "비밀번호가 일치하지 않습니다.";
				passResult.style.color = "crimson";
				isPassOk = false;
			}
		});
		
		//별명 중복 체크
		const btnCheckNick = document.getElementById("btnCheckNick");
		const nickResult = document.getElementsByClassName("nickResult")[0];
		
		btnCheckNick.onclick = async function() {
			
			const value = formRegister.nick.value;
			
			try {
				const response = await fetch('/jboard/user/check.do?type=nick&value='+value);
				const data = await response.json();
				console.log(data);
				
				if(data.count > 0) {
					nickResult.innerText = "이미 사용중인 별명입니다.";
					nickResult.style.color = "crimson";
					isNickOk = false;
				} else {
					nickResult.innerText = "사용 가능한 별명입니다.";					
					nickResult.style.color = "green";
					isNickOk = true;
				}
				
			} catch (err) {
				console.log(err);
			}
		}
		
		//이메일 인증처리
		const btnSendEmail = document.getElementById("btnSendEmail");
		const emailResult = document.querySelector('.emailResult');
		const auth = document.querySelector('.auth');
		
		btnSendEmail.onclick = async function() {
			
			const value = formRegister.email.value;
	
			const response = await fetch('/jboard/user/check.do?type=email&value='+value);
			const data = await response.json();
			
			if(data.count > 0) {
				emailResult.innerText = "이미 사용중인 이메일입니다.";
				emailResult.style.color = "crimson";
			} else {
				auth.style.display = "block";
			}
		}
		
		const btnAuthEmail = document.getElementById("btnAuthEmail");
		
		btnAuthEmail.onclick = async function() {
			
			const value = formRegister.auth.value;
			//const jsonData = {"authCode" : value};
			
			//폼 데이터 생성
			const formData = new URLSearchParams();
			formData.append("authCode", value);
			
			//서버 전송
			const response = await fetch('/jboard/user/check.do', {
											method: 'POST',
											headers: {'Content-Type': 'application/x-www-form-urlencoded'},
											body: formData
										});
			const data = await response.json();
			console.log(data);
			
			if(data.result > 0) {
				emailResult.innerText = "이메일이 인증 되었습니다.";
				emailResult.style.color = "green";
			} else {
				emailResult.innerText = "유효한 인증코드가 아닙니다.";
				emailResult.style.color = "crimson";
			}
		}
		
		//최종 폼 전송 이벤트
		formRegister.onsubmit = function(e) {

			//1. 아이디 유효성 검사 결과
			if(!isUidOk) {
				return false;
			}
			
			//2. 비밀번호 유효성 검사 결과
			if(!isPassOk) {
				return false;
			}
			
			//3. 이름 유효성 검사 결과
			if(!isNameOk) {
				return false;
			}
			
			//4. 별명 유효성 검사 결과
			if(!isNickOk) {
				return false;
			}
			
			//5. 이메일 유효성 검사 결과
			if(!isEmailOk) {
				return false;
			}
			
			//6. 휴대폰 유효성 검사 결과
			if(!isHpOk) {
				return false;
			}
			
			return true; //폼 전송 시작
		}
	
	});
	
</script>
<main id="user">
    <section class="register">

        <form action="/jboard/user/register.do" name="formRegister" method="post">
            <h2 class="tit">사이트 이용정보 입력</h2>
            <table border="1">                        
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="uid" placeholder="아이디 입력"/>
                        <button type="button" id="btnCheckUid"><img src="../images/chk_id.gif" alt="중복확인"/></button>
                        <span class="uidResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td>
	                    <input type="password" name="pass1" placeholder="비밀번호 입력"/>
    	            	<span class="passResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="pass2" placeholder="비밀번호 입력 확인"/></td>
                </tr>
            </table>

            <h2 class="tit">개인정보 입력</h2>
            <table border="1">                        
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" name="name" placeholder="이름 입력"/>                        
                    </td>
                </tr>
                <tr>
                    <td>별명</td>
                    <td>
                        <p class="nickInfo">공백없는 한글, 영문, 숫자 입력</p>
                        <input type="text" name="nick" placeholder="별명 입력"/>
                        <button type="button" id="btnCheckNick"><img src="../images/chk_id.gif" alt="중복확인"/></button>
                        <span class="nickResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <input type="email" name="email" placeholder="이메일 입력"/>
                        <button type="button" id="btnSendEmail"><img src="../images/chk_auth.gif" alt="인증번호 받기"/></button>
                        <span class="emailResult"></span>
                        <div class="auth">
                            <input type="text" name="auth" placeholder="인증번호 입력"/>
                            <button type="button" id="btnAuthEmail"><img src="../images/chk_confirm.gif" alt="확인"/></button>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td><input type="text" name="hp" placeholder="휴대폰 입력"/></td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <input type="text" name="zip" id="postcode" placeholder="우편번호" readonly/>
                        <button type="button" onclick="DaumPostcode()"><img src="../images/chk_post.gif" alt="우편번호찾기"/></button>
                        <input type="text" name="addr1" id="address" placeholder="주소 검색" readonly/>
                        <input type="text" name="addr2" id="detailAddress" placeholder="상세주소 입력"/>
                    </td>
                </tr>
            </table>

            <div>
                <a href="/jboard/user/login.do" class="btn btnCancel">취소</a>
                <input type="submit" value="회원가입" class="btn btnRegister"/>
            </div>

        </form>

    </section>
</main>
<%@ include file="./_footer.jsp" %>