package com.annb.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomePage {
    @RequestMapping("/home-page")
    public String voidShowHomePage(HttpServletRequest request) {
        HttpSession session = request.getSession();
        if (session.getAttribute("loggedInUser") == null) {
            // Chưa đăng nhập, chuyển hướng về trang login
            return "redirect:/login";
        }
        // Đã đăng nhập, hiển thị trang homePage
        return "homePage";
    }
}
