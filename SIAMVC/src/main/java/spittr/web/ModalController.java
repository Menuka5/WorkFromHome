package spittr.web;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ModalController {
    @RequestMapping(value = "modals", method= RequestMethod.GET)
    public String tata(Model model){
        model.addAttribute("formBean", new Login());
        return "Modals";
    }
}
