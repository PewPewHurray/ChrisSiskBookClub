package com.codingdojo.bookclub.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.models.LoginUser;
import com.codingdojo.bookclub.models.User;
import com.codingdojo.bookclub.services.BookService;
import com.codingdojo.bookclub.services.UserService;

@Controller
public class HomeController {

	@Autowired
	UserService userService;
	@Autowired
	BookService bookService;
	
	@GetMapping("/")
	public String index(Model model) {
		model.addAttribute("newUser", new User());
		model.addAttribute("newLogin", new LoginUser());
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String register(@Valid @ModelAttribute("newUser") User newUser, BindingResult result, Model model, HttpSession session) {
		User user = userService.register(newUser, result);
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "index.jsp";
		}
		session.setAttribute("id", user.getId());
		return "redirect:/books";
	}
	
	@PostMapping("/login")
	public String login(@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model, HttpSession session) {
		User user = userService.login(newLogin, result);
		if(result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		}
		session.setAttribute("id", user.getId());
		return "redirect:/books";
	}
	
	@GetMapping("/books")
	public String books(HttpSession session, Model model) {
		if(session.getAttribute("id") == null) {
			return "redirect:/";
		}
		model.addAttribute("books", bookService.findAll());
		model.addAttribute("user", userService.findById((Long) session.getAttribute("id")));
		return "books.jsp";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("id", null);
		return "redirect:/";
	}
	
	@GetMapping("/books/new")
	public String newBook(@ModelAttribute("book") Book book, Model model, HttpSession session) {
		model.addAttribute("userId", session.getAttribute("id"));
		return "newBook.jsp";
	}
	
	@PostMapping("/books/add")
	public String addBook(@Valid @ModelAttribute("book") Book book, BindingResult result, HttpSession session, Model model) {
		if(result.hasErrors()) {
			model.addAttribute("userId", session.getAttribute("id"));
			return "newBook.jsp";
		}
		bookService.create(book);
		return "redirect:/books";
	}
	
	@GetMapping("/books/{id}")
	public String showBook(@PathVariable Long id, Model model, HttpSession session) {
		model.addAttribute("book", bookService.findById(id));
		model.addAttribute("id", session.getAttribute("id"));
		return "showBook.jsp";
	}
	
	@GetMapping("/books/{id}/edit")
	public String editBook(@ModelAttribute("book") Book book, @PathVariable Long id, Model model) {
		model.addAttribute("book", bookService.findById(id));
		return "editBook.jsp";
	}
	
	@PutMapping("/books/{id}/update")
	public String updateBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if(result.hasErrors()) {
			return "editBook.jsp";
		}
		bookService.update(book);
		return "redirect:/books";
	}
}
