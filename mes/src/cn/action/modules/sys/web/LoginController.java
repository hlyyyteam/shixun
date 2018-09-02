package cn.action.modules.sys.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cn.action.common.utils.UserUtils;
import cn.action.common.web.BaseController;
import cn.action.modules.sys.entity.Menu;
import cn.action.modules.sys.entity.User;
import cn.action.modules.sys.service.SystemService;

@Controller
public class LoginController extends BaseController{
	
	@Autowired
	private SystemService systemService;
	
	/**
	 * 管理登录
	 */
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(HttpSession session, HttpServletResponse response, Model model) {
		User user =  (User)session.getAttribute(UserUtils.CURRENT_USER);
		// 如果已经登录，则跳转到管理首页
		if(user != null){
			return "redirect:/";
		}
		return "modules/sys/sysLogin";
	}

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(HttpSession session,String account,String pwd, Model model){
		User user = systemService.login(account, pwd);
		if (user!=null) {
			user.setRoleList(UserUtils.getRoleList());
			session.setAttribute(UserUtils.CURRENT_USER, user);
			//获取用户的菜单
			List<Menu> menus = systemService.getMenuByUserId(user.getId());
			session.setAttribute(UserUtils.MENU_LIST, menus);
			return "modules/sys/sysIndex";
		}else {
			addMessage(model, "用户名或者密码错误，请重新输入！");
			return "redirect:/login";
		}
	}

	/**
	 * 登录成功，进入管理首页
	 */
	@RequestMapping(value = "/")
	public String index(HttpServletRequest request, HttpServletResponse response) {
		User user = UserUtils.getUser();
		// 登录成功后，验证码计算器清零
		if(user!=null && user.getId()==null) {
			return "redirect:/login";
		}
		return "modules/sys/sysIndex";
	}

	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session){
		session.removeAttribute(UserUtils.CURRENT_USER);
		return "redirect:/login";
	}
}
