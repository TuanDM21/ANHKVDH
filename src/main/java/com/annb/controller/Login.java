package com.annb.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class Login {

	@PostMapping("/login")
	public String login(@RequestParam("userName") String userName, @RequestParam("password") String password,
			HttpServletRequest request, RedirectAttributes redirectAttributes) {
		final String defaultUsername = "ANNB";
		final String defaultPassword = "ANNB@vdh123";

		if (defaultUsername.equals(userName) && defaultPassword.equals(password)) {
			request.getSession().setAttribute("loggedInUser", userName);
			return "redirect:/home-page";
		} else {
			redirectAttributes.addFlashAttribute("errorMessage", "Sai tên đăng nhập hoặc mật khẩu!");
			return "redirect:/login";
		}
	}

	@GetMapping("/login")
	public String showLoginPage() {
		return "login"; // Trả về trang login.jsp
	}

	@GetMapping("/home")
	public String showHomePage(HttpServletRequest request) {
		if (request.getSession().getAttribute("loggedInUser") == null) {
			return "redirect:/login"; // Chuyển hướng về trang đăng nhập nếu chưa đăng nhập
		}
		return "home"; // Trả về trang home.jsp
	}

	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate(); // Hủy session khi logout
		return "redirect:/login"; // Chuyển hướng về trang đăng nhập
	}
}
