package org.handsome.controller;

import org.handsome.base.BaseService;
import org.handsome.entity.Task;
import org.handsome.service.TaskService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class TaskController extends BaseService {

    @Autowired
    private TaskService taskService;

    @RequestMapping(name = "/tasks", method = RequestMethod.GET)
    public ModelAndView tasks() {
        List<Task> taskList = taskService.findAll();
        String str = "";
        for (Task task : taskList){
            str = str.concat(task.getDescription());
        }
        ModelAndView mav = new ModelAndView("tasks");
        mav.addObject("str", str);
        return mav;
    }
}
