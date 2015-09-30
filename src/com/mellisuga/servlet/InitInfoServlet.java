package com.mellisuga.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;

import com.mellisuga.dao.MemberDAO;
import com.mellisuga.dao.RoleDAO;
import com.mellisuga.dao.RoleMemberDAO;
import com.mellisuga.db.DBConnection;
import com.mellisuga.model.Member;
import com.mellisuga.model.Role;
import com.mellisuga.model.RoleMember;
import com.mellisuga.remote.model.User;

@WebServlet("/InitInfo")
public class InitInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public InitInfoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		User u = (User) request.getSession().getAttribute("user");
		
		String fullname = request.getParameter("fullname");
		String gender = request.getParameter("gender");
		String location = request.getParameter("location");
		String business = request.getParameter("business");
		String employment = request.getParameter("employment");
		String position = request.getParameter("position");
		String education = request.getParameter("education");
		String major = request.getParameter("major");
		String description = request.getParameter("description");
		
		SqlSession session = null;
		
		try{
			session = DBConnection.openDefaultSession();
			
			// 插入成员信息
			MemberDAO memberDAO = session.getMapper(MemberDAO.class);
			Member member = new Member();
			
			// 处理全名
			if("".equals(fullname) || fullname == null) {
				member.setFullname(u.getUsername());
			}else {
				member.setFullname(fullname);
			}

			// 处理性别
			switch(gender) {
				case "male" :
					member.setGender(1);
					break;
				case "female" :
					member.setGender(2);
					break;
				case "other" :
					member.setGender(3);
					break;
			}
			
			member.setAvatar_path("./images/avatar/default.jpg");
			member.setLocation(location);
			member.setBusiness(business);
			member.setEmployment(employment);
			member.setPosition(position);
			member.setEducation(education);
			member.setMajor(major);
			member.setDescription(description);
			member.setUser_id(u.getId());
			
			memberDAO.insertMember(member);
			session.commit();
			
			// 查询成员角色
			RoleDAO roleDAO = session.getMapper(RoleDAO.class);
			Role r = new Role();
			r.setRolename("NormalUser");
			Role role = roleDAO.queryRoleByName(r);
			
			// 查询成员
			Member m = memberDAO.queryMemberByUserID(u.getId());
			
			// 插入成员角色对应关系
			RoleMemberDAO roleMemberDAO = session.getMapper(RoleMemberDAO.class);
			RoleMember roleMember = new RoleMember();
			roleMember.setMember_id(m.getId());
			roleMember.setRole_id(role.getId());
			
			roleMemberDAO.insertRoleMember(roleMember);
			session.commit();
			
			// 跳转首页
			// TODO 各种首页查询啊。。。
			request.getSession().setAttribute("member", m);
			response.sendRedirect(request.getContextPath()
					+ "/pages/index.jsp");
			
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			DBConnection.closeSession(session);
		}
		
	}
}
