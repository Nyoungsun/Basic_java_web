package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class checkIdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("id");

		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.isExist(id);
		
		if (memberDTO != null && id.equals(memberDTO.getId())) {
			return "/member/checkIdFail.jsp";
		} else {
			return "/member/checkIdOk.jsp";
		}
	}
}