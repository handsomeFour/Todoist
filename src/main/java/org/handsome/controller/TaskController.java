package org.handsome.controller;

import org.handsome.base.BaseService;
import org.handsome.entity.Task;
import org.handsome.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
public class TaskController extends BaseService {

    @Autowired
    private TaskService taskService;

    @RequestMapping(name = "/tasks",value = "tasks", method = RequestMethod.GET)
    public ModelAndView tasks() {
        List<Task> taskList = new ArrayList<>(taskService.findAll());
        ModelAndView mav1 = new ModelAndView("tasks");
        mav1.addObject("taskList", taskList);
        return mav1;
    }

    @RequestMapping(name = "/add",value = "add",method = RequestMethod.POST)
    public String add(Task task){
        taskService.addTask(task);
        return "tasks";
    }

    @RequestMapping(name = "/toUpdate",value = "toUpdate")
    public String toUpdate(int id,HttpServletRequest request,Model model){
        request.setAttribute("task",taskService.findById(id));
        model.addAttribute("task",taskService.findById(id));
        return "update";
    }

    @RequestMapping(name = "/updateTask",value = "updateTask")
    public String updateTask(Task task){
        taskService.update(task);
        return "/tasks";
    }

    @RequestMapping(name = "/delete",value = "delete")
    public void delete(int id, HttpServletRequest request, HttpServletResponse response){
        String result = "{\"result\":\"error\"}";
        taskService.delTask(id);
        if (taskService.delTask(id) == 0){
            result = "{\"result\":\"success\"}";
        }
        response.setContentType("application/json");
        try {
            PrintWriter out = response.getWriter();
            out.write(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
