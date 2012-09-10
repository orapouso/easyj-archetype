package ${package}.controller.security;

import ${package}.domain.security.Authority;
import ${package}.domain.security.User;
import ${package}.service.security.UserService;
import java.util.List;
import javax.annotation.Resource;
import org.easyj.orm.SingleService;
import org.easyj.rest.controller.jpa.JPAGenericEntityController;
import org.springframework.beans.propertyeditors.CustomCollectionEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin/user")
public class UserController extends JPAGenericEntityController<User, Short>{

    @ModelAttribute("auths")
    protected List<Authority> auths() {
        return getService().findAll(Authority.class);
    }

    @Override
    protected User findOne(Short primaryKey) {
        return getService().findUserWithAuthorities(primaryKey);
    }
    
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(List.class, "authorities", new CustomCollectionEditor(List.class) {
            @Override
            protected Object convertElement(Object element) {
              if(element == null || "".equals((String)element)) {
                  return null;
              }
              return new Authority((String)element);
            }
        });
    }
    
    @Override
    @Resource(name="userService")
    public void setService(SingleService service) {
        this.service = (UserService) service;
    }
    
    @Override
    public UserService getService() {
        return (UserService) service;
    }
}