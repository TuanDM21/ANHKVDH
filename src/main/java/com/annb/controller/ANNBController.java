package com.annb.controller;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.annb.dao.ANNBDAO;
import com.annb.model.ANNB;

@Controller
public class ANNBController {
	ANNBDAO dao = new ANNBDAO();

	@RequestMapping("/Add-New-Card")
	public String addANNB(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/login"; // Chuyển hướng về trang login nếu chưa đăng nhập
		}
		return "AddNewAnnb";
	}

	@RequestMapping("/View-All-Card")
	public String showANNB(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/login"; // Chuyển hướng về trang login nếu chưa đăng nhập
		}
		try {
			List<ANNB> listANNB = dao.getAllANNB();
			request.setAttribute("listANNB", listANNB);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return "ViewAllAnnb";
	}

	@PostMapping("/Add-New-Card")
	public String addCategory(HttpServletRequest request, @RequestParam("id") int id,
			@RequestParam("name") String hoTen, @RequestParam("birthday") Date ngaySinh,
			@RequestParam("gender") String gioiTinh, @RequestParam("ngaycap") Date ngayCapThe,
			@RequestParam("ngayhethan") Date ngayHetHanThe, RedirectAttributes redirectAttributes) throws SQLException {
		HttpSession session = request.getSession();
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/login"; // Chuyển hướng về trang login nếu chưa đăng nhập
		}

		ANNB annb = new ANNB();
		annb.setId(id);
		annb.setHoTen(hoTen);
		annb.setNgaySinh(ngaySinh);
		annb.setGioiTinh(gioiTinh);
		annb.setNgayCapThe(ngayCapThe);
		annb.setNgayHetHanThe(ngayHetHanThe);
		if (dao.getANNBById(id) != null) {
			request.setAttribute("errorMessage", "ID thẻ đã được sử dụng");
			return "AddNewAnnb";
		}
		try {
			dao.addANNB(annb);
			redirectAttributes.addFlashAttribute("successMessage", "Thêm mới một thẻ ANKS!");
			return "redirect:/View-All-Card";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@RequestMapping("/Edit-Card")
	public String editANNB(HttpServletRequest request, @RequestParam("id") int id, @RequestParam("name") String hoTen,
			@RequestParam("birthday") Date ngaySinh, @RequestParam("gender") String gioiTinh,
			@RequestParam("ngaycap") Date ngayCapThe, @RequestParam("ngayhethan") Date ngayHetHanThe,
			RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession();
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/login"; // Chuyển hướng về trang login nếu chưa đăng nhập
		}

		ANNB annb = new ANNB();
		annb.setId(id);
		annb.setHoTen(hoTen);
		annb.setNgaySinh(ngaySinh);
		annb.setGioiTinh(gioiTinh);
		annb.setNgayCapThe(ngayCapThe);
		annb.setNgayHetHanThe(ngayHetHanThe);
		request.setAttribute("annb", annb);
		return "EditAnnb";
	}

	@PostMapping("/Edit-Card")
	public String editPostANNB(HttpServletRequest request, @RequestParam("id") int id, @RequestParam("oldId") int oldId,
			@RequestParam("name") String hoTen, @RequestParam("birthday") Date ngaySinh,
			@RequestParam("gender") String gioiTinh, @RequestParam("ngaycap") Date ngayCapThe,
			@RequestParam("ngayhethan") Date ngayHetHanThe, RedirectAttributes redirectAttributes) throws SQLException {
		HttpSession session = request.getSession();
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/login"; // Chuyển hướng về trang login nếu chưa đăng nhập
		}

		ANNB annb = new ANNB();
		annb.setId(id);
		annb.setHoTen(hoTen);
		annb.setNgaySinh(ngaySinh);
		annb.setGioiTinh(gioiTinh);
		annb.setNgayCapThe(ngayCapThe);
		annb.setNgayHetHanThe(ngayHetHanThe);

		if (id != oldId && dao.getANNBById(id) != null) {
			request.setAttribute("errorMessage", "ID thẻ đã được sử dụng");
			request.setAttribute("annb", annb);
			return "EditAnnb";
		}

		try {
			dao.updateANNB(annb);
			redirectAttributes.addFlashAttribute("successMessage", "Cập nhật thẻ ANKS thành công!");
			return "redirect:/View-All-Card";
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
	}

	@GetMapping("/Delete-Card")
	public String deleteCard(HttpServletRequest request, @RequestParam("id") int id,
			RedirectAttributes redirectAttributes) {
		HttpSession session = request.getSession();
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/login"; // Chuyển hướng về trang login nếu chưa đăng nhập
		}

		try {
			ANNB annb = dao.getANNBById(id);
			if (annb != null) {
				dao.deleteANNB(id);
				redirectAttributes.addFlashAttribute("successMessage", "Xóa thẻ thành công!");
			} else {
				redirectAttributes.addFlashAttribute("errorMessage", "ID thẻ không tồn tại!");
			}
		} catch (Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMessage", "Lỗi khi xóa thẻ!");
		}
		return "redirect:/View-All-Card";
	}

	@GetMapping("/Check-Card")
	public String checkCard(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/login";
		}
		return "CheckCard";
	}

	@PostMapping("/Check-Card")
	public String checkCard(HttpServletRequest request, @RequestParam("id") int id) {
		HttpSession session = request.getSession();
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/login";
		}

		try {
			ANNB annb = dao.getANNBById(id);
			if (annb != null) {
				LocalDate currentDate = LocalDate.now();
				Date expiryDate = annb.getNgayHetHanThe();
				if (expiryDate.toLocalDate().isBefore(currentDate)) {
					request.setAttribute("message", "Thẻ đã hết hạn.");
				} else {
					request.setAttribute("message", "Thẻ còn hạn.");
				}
				request.setAttribute("annb", annb);
			} else {
				request.setAttribute("message", "Thẻ không tồn tại trong hệ thống.");
			}
		} catch (Exception e) {
			e.printStackTrace();
			request.setAttribute("message", "Lỗi khi kiểm tra thẻ.");
		}
		return "CheckCard";
	}

	@GetMapping("/Check-Card-With-Camera")
	public String checkCardWithCamera(HttpServletRequest request) {
		HttpSession session = request.getSession();
		if (session.getAttribute("loggedInUser") == null) {
			return "redirect:/login";
		}

		try {
			// Giả sử bạn muốn gửi danh sách tất cả các ANNB từ cơ sở dữ liệu
			List<ANNB> listANNB = dao.getAllANNB();
			request.setAttribute("listANNB", listANNB);
		} catch (SQLException e) {
			e.printStackTrace();
			request.setAttribute("errorMessage", "Lỗi khi tải dữ liệu từ cơ sở dữ liệu.");
		}

		return "CheckCardWithCamera";
	}

}
