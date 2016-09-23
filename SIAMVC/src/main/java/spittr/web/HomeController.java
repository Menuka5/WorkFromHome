package spittr.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.method.support.ModelAndViewContainer;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
public class HomeController {
    @RequestMapping({"/", "/home"})
    public String home(){
        return "self-care-home";
    }

    @RequestMapping("test")
    public ModelAndView test(){
//        model.addAttribute("menuka", "Menuka");
        return new ModelAndView("test", "menuka", "Menuka is the best of Best");
    }

/*    @RequestMapping("student")
    public String tetst(){
        return "student";
    }*/

    @RequestMapping(value = "/student", method = RequestMethod.GET)
    public ModelAndView student(){
        return new ModelAndView("student", "command", new Student());
    }

    @RequestMapping(value = "/addStudent", method = RequestMethod.POST)
    public String addStudent(@ModelAttribute("SpringWeb")Student student, ModelMap model){
        model.addAttribute("name", student.getName());
        model.addAttribute("age", student.getAge());
        model.addAttribute("id", student.getId());
        return "result";
    }

    @RequestMapping("login")
    public String login(HttpServletRequest request){

            String name = request.getParameter("name");
            String pass = request.getParameter("password");
            if(name.equals(pass))
            {
                return "test";
            }else{
                return "result";
            }

        }



    }


