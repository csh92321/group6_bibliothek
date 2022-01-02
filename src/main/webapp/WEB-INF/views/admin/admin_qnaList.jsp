<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������-���� ������</title>
<link rel="stylesheet" href="css/admin_header1.css">
<link rel="stylesheet" href="css/footer1.css">
<!-- ������� ��Ʈ ���� -->
<style>
@import url('https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap');
</style>
<!-- ������ ���� ���ǵ�� ������ -->
</head>
<body>
<%@ include file="admin_header.jsp" %>

 <!--/span-->
                <div class="span9" id="content">
                    <div class="row-fluid">
                        <div class="alert alert-success">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <h4>�亯 ����Ʈ</h4>
                        </div>
                         
                             
                        </div>
                    
                    
                   <div>
                      
                     <form method="post" action="" name="frm">
                     <div class="table-responsive">
                     <table class="table">
                       <tr class="success">
                         <th>��ȣ(�亯����)</th>
                         <th>����</th>
                         <th>�ۼ���</th>
                         <th>�ۼ���</th>
                       </tr>
                      <c:if test="${empty qnaList or qnaList.size()==0 }" >
                        <tr>
                          <td colspan="6" class="text-center"> �ۼ��� ���� �����ϴ�.</td>
                        </tr>
                      </c:if> 
                      <c:forEach items="${qnaList}" var="qna">
                           <tr> 
                           <td>
                           ${qna.qseq }
                            <c:choose>
                                <c:when test="${qna.rep=='1' }">
                                 <span style="color:red;">(��ó��)</span>
                                </c:when>
                                <c:otherwise>
                                <span>(�亯ó���Ϸ�)</span>
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