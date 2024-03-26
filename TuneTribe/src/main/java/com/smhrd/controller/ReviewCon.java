package com.smhrd.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.smhrd.model.ReviewDAO;
import com.smhrd.model.ReviewVO;

@WebServlet("/ReviewCon")
public class ReviewCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[ReviewCon]");
		request.setCharacterEncoding("UTF-8");
		
        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(request);
                String b_content = null;
                String b_file = null;
                String user_id = null;
                int fes_idx = 0;
                UUID uuid = UUID.randomUUID();
                
                //System.out.println("트라이캐치");
                System.out.println(multiparts);
                for (FileItem item : multiparts) {
                    if (!item.isFormField()) {
                        // 파일 처리
                    	System.out.println("파일처리");
                        b_file = uuid.toString()+"_"+ new File(item.getName()).getName();
                        System.out.println(b_file);
                        item.write(new File("C:\\Users\\smart\\git\\TuneTribe\\TuneTribe\\src\\main\\webapp\\img" + File.separator + b_file));
                    } else {
                        // 텍스트 데이터 처리
                    	System.out.println("텍스트처리");
                    	String fieldName = item.getFieldName();
	                    String fieldValue = item.getString("UTF-8");

	                    switch (fieldName) {
	                    	case "b_content":
	                    		// b_content가 jdbc에서 other 타입으로 지정됨
	                    		b_content = fieldValue;
	                    		break;
	                    	case "user_id":
	                    		user_id = fieldValue;
	                    		break;
	                    	case "fes_idx":
	                    		fes_idx = Integer.parseInt(fieldValue);
	                    		break;
	                    } // switch문 끝
	                    System.out.println(fieldValue);
                        // 예: 데이터베이스에 저장하는 로직 구현
                    }
                }
                System.out.println(b_content);
                ReviewVO reviewvo = new ReviewVO(b_content,b_file,user_id,fes_idx);
                ReviewDAO dao = new ReviewDAO();
                int cnt = 0;
                cnt = dao.reviewWrite(reviewvo);
                System.out.println(cnt);
                
                System.out.println(b_content);
                // 응답 메시지
                response.getWriter().print("Upload has been done successfully!");
            } catch (Exception ex) {
                response.getWriter().print("File Upload Failed due to " + ex);
            }
        }
    }
}
