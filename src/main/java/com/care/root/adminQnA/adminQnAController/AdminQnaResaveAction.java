package adminQnAController;

import java.awt.event.ActionEvent;
import java.beans.PropertyChangeListener;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.Action;

import adminQnA.dto.QnaVO;

public class AdminQnaResaveAction implements Action {
	 
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         
        String url="MacaronicsServlet?command=admin_qna_list";
         
        String qseq=request.getParameter("qseq").trim();
        String reply=request.getParameter("reply");
         
         
        QnaVO qnaVO=new QnaVO();
        qnaVO.setQseq(Integer.parseInt(qseq));
        qnaVO.setReply(reply);
         
        AdminQnaDAO dao =AdminQnaDAO.getInstance();
        dao.updateQna(qnaVO);
         
        response.sendRedirect(url);
         
    }


     
     
 
}