#set( $symbol_pound = '#' )
#set( $symbol_dollar = '$' )
#set( $symbol_escape = '\' )
package ${package}.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ForwarderController {

    @RequestMapping(value="/{whatever}", method=RequestMethod.GET)
    public String whatever(@PathVariable("whatever") String whatever) {
        return whateverPage(whatever, null);
    }

    @RequestMapping(value="/{whatever}/{page}", method=RequestMethod.GET)
    public String whateverPage(@PathVariable("whatever") String whatever, @PathVariable("page") String page) {
        return "/" + whatever + ((page != null) ? "/" + page : "");
    }
}