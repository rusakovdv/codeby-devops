/*
 * @author Rimsha (230000)
 * @Lab No 04
 */
package com.example.myfirstjavawebapp.controller;

import com.example.myfirstjavawebapp.dao.UserDAO;
import com.example.myfirstjavawebapp.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class UserController {
    @Autowired
    private UserDAO userDAO;

    @GetMapping("/")
    public String home() {
        return "redirect:/users";
    }

    @GetMapping("/users")
    public String listUsers(Model model) {
        model.addAttribute("users", userDAO.getAllUsers());
        return "users-list";
    }

    @GetMapping("/users/add")
    public String showAddForm(Model model) {
        model.addAttribute("user", new User());
        return "add-user";
    }

    @PostMapping("/users/save")
    public String saveUser(@ModelAttribute("user") User user) {
        userDAO.saveUser(user);
        return "redirect:/users";
    }
}
