<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 작성</title>
<style>
ul.type_list {
  display: flex;
  flex-wrap: wrap;
  gap: 10px;
  padding: 0;
  margin: 0;
  list-style: none;
}
ul.type_list li {
  margin: 0;
}
.box-btn.qna_email {
  text-align: right;
  margin-top: 20px;
}
</style>
</head>
<body>
<div id="container">
  <div id="contents">
    <div class="cols-content">
      <%@ include file="qna_menu.jsp" %>
      <div class="col-detail">
          <!-- Header -->
    <%@ include file="../main/header.jsp" %>
      
        <div class="email_list_area">
          <div class="customer_top">
            <h2 class="tit">1 : 1 문의</h2>
            <p class="stit">자주찾는 질문에서 원하는 답변을 찾지 못하셨군요 <br>
불편사태나 문의사항을 남겨주시면 체단한 신속한 답변 드릴것입니다.
            </p>
          </div>
          <form id="qnaForm" name="qnaForm" action="#" method="post" enctype="multipart/form-data" onsubmit="return validateForm()">
            <input type="hidden" id="isTemp" name="isTemp" value="N">
            <input type="hidden" id="qnaId" name="qnaId" value="">
            <fieldset>
              <legend>문의 내용 작성</legend>
              <div class="tbl_area">
                <p class="tbl_info_txt">체크 (<em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수"></em>) 된 항목은 필수 입력 사항입니다.
                </p>
                <table class="tbl_notice_list tbl_left">
                  <colgroup>
                    <col style="width:96px">
                    <col style="width:303px">
                    <col style="width:96px">
                    <col style="width:303px">
                  </colgroup>
                  <tbody>
                    <tr>
                      <th scope="row">문의 선택 <em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수"></em></th>
                      <td colspan="3">
                        <ul class="type_list">
                          <li><input type="radio" id="typeCenter" name="qnaType" value="center" checked><label for="typeCenter">고객센터 문의</label></li>
                          <li><input type="radio" id="typeTheater" name="qnaType" value="theater"><label for="typeTheater">극장별 문의</label></li>
                          <li>
                            <select name="region" id="region">
                              <option value="" disabled selected>지역선택</option>
                              <option value="seoul">서울</option>
                              <option value="busan">부산</option>
                              <option value="daegu">대구</option>
                            </select>
                          </li>
                          <li>
                            <select name="theater" id="theater">
                              <option value="" disabled selected>극장선택</option>
                              <option value="opt1">옵션1</option>
                              <option value="opt2">옵션2</option>
                              <option value="opt3">옵션3</option>
                            </select>
                          </li>
                        </ul>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">문의 유형 <em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수"></em></th>
                      <td colspan="3">
                        <ul class="type_list">
                          <li>
                            <select name="qnaCategory" id="qnaCategory">
                              <option value="" disabled selected>문의유형 선택</option>
                              <option value="general">1:1 문의</option>
                              <option value="lost">분신문의</option>
                            </select>
                          </li>
                        </ul>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row">이름</th>
                      <td colspan="3"><strong>김순신</strong></td>
                      <input type="hidden" name="userId" id="userId" value="">
                      <input type="hidden" name="userName" id="userName" value="">
                    </tr>
                    <tr>
                      <th scope="row">휴대전화</th>
                      <td><strong>01045123333</strong></td>
                      <input type="hidden" name="userPhone" id="userPhone" value="">
                    </tr>
                    <tr>
                      <th scope="row"><label for="qnaTitle">제목 <em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수"></em></label></th>
                      <td colspan="3">
                        <input type="text" name="qnaTitle" id="qnaTitle" class="inp01" style="width: 672px;">
                      </td>
                    </tr>
                    <tr>
                      <th scope="row"><label for="qnaContent">내용 <em><img src="http://img.cgv.co.kr/R2014/images/common/ico/ico_redstar.png" alt="필수"></em></label></th>
                      <td colspan="3">
                        <textarea name="qnaContent" id="qnaContent" cols="100" rows="20" class="inp_txtbox01" style="resize: none; height: 94px !important;" placeholder="의미: 개인정보 포함 불가 (주민번호, 계좌\uubc88호, 신원카드 등)"></textarea>
                        <p class="byte_info"><span id="byteCount">0</span>/5000BYTE <span>(<span id="charCount">0</span>/2500가자)</span></p>
                      </td>
                    </tr>
                    <tr>
                      <th scope="row"><label for="qnaFile">첨부파일</label></th>
                      <td colspan="3">
                        <input type="file" name="qnaFile" id="qnaFile" style="width:300px" title="파일 업로드">
                        <br>* <b>첨부가능 확장자</b>: jpg, png, gif, bmp, jpeg, hwp, ppt(x), xls(x), doc(x), zip, pdf, txt
                      </td>
                    </tr>
                  </tbody>
                </table>
              </div>
              <div class="box-btn qna_email">
                <button style="width:80px" class="round inred" type="submit" id="btnSubmit"><span>등록하기</span></button>
              </div>
            </fieldset>
          </form>
        </div>
               <!-- Footer -->
   <%@ include file="../main/footer.jsp" %>
      </div>
    </div>
  </div>
</div>
</body>
</html>