package admin.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.AdminDAO;
import admin.model.InterAdminDAO;
import common.controller.AbstractController;


public class Admin_idFindResultAction extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String method = request.getMethod();  // "GET" 또는 "POST" 
		
		if("POST".equalsIgnoreCase(method)) {
			// 아이디 찾기 모달창에서 찾기 버튼을 클릭했을 경우 
			
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			InterAdminDAO adao = new AdminDAO();
			
			Map<String, String> paraMap = new HashMap<>();
			paraMap.put("name", name);
			paraMap.put("email", email);
						
			String adminID = adao.findUserid(paraMap);
			
			if(adminID != null) {
				request.setAttribute("userid", adminID);
			}
			else {
				request.setAttribute("userid", "존재하지 않습니다.");
			}
			
			request.setAttribute("name", name);
			request.setAttribute("email", email);
			
		}// end of if("POST".equalsIgnoreCase(method))---------------------------------
		
		
		request.setAttribute("method", method);
		
	//	super.setRedirect(false);
		super.setViewPage("/WEB-INF/admin/admin_idFindResult.jsp");
		
	}

}
