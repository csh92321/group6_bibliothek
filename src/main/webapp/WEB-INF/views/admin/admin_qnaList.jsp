<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>관리자-문의 페이지</title>
<link rel="stylesheet" href="css/admin_header1.css">
<link rel="stylesheet" href="css/footer1.css">
<!-- 나눔고딕 폰트 적용 -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
<!-- 관리자 메인 문의등록 페이지 -->
</head>
<body>
<%@ include file="admin_header.jsp" %>

 <!--/span-->
                <div class="span9" id="content">
                    <div class="row-fluid">
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <h4>답변 리스트</h4>
                        </div>
                         
                             
                        </div>
                    
                    
                   <div>
                      
                     <form method="post" action="" name="frm">
                     <div class="table-responsive">
                     <table class="table">
                       <tr class="success">
                         <th>번호(답변여부)</th>
                         <th>제목</th>
                         <th>작성자</th>
                         <th>작성일</th>
                       </tr>
                      <c:if test="${empty qnaList or qnaList.size()==0 }" >
                        <tr>
                          <td colspan="6" class="text-center"> 작성된 글이 없습니다.</td>
                        </tr>
                      </c:if> 
                      <c:forEach items="${qnaList}" var="qna">
                           <tr> 
                           <td>
                           ${qna.qseq }
                            <c:choose>
                                <c:when test="${qna.rep=='1' }">
                                 <span style="color:red;">(미처리)</span>
                                </c:when>
                                <c:otherwise>
                                <span>(답변처리완료)</span>
                                </c:otherwise>
                            </c:choose>
                           </td>
                           <td><a href="MacaronicsServlet?command=admin_qna_detail&qseq=${qna.qseq}" >${qna.subject }</a></td>
                           <td>${qna.id }</td>
                           <td><fmt:formatDate  type="date"  value="${qna.indate }" /></td>
                           </tr>
                       </c:forEach>
 
                     </table>
                     </div>
                     </form>
                      
                   </div>
                     
                    </div>
                </div>
          
            
            </div>
            <hr>
</body>
</html>