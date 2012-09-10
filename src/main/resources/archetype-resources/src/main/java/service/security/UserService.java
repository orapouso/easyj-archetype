package ${package}.service.security;

import ${package}.domain.security.User;
import java.util.HashMap;
import org.easyj.orm.jpa.SingleJPAEntityService;
import org.springframework.stereotype.Service;

@Service
public class UserService extends SingleJPAEntityService {
    
    public <ID> User findUserWithAuthorities(final ID primaryKey) {
        return findByQuery("User.findByIdWithAuthorities", User.class, new HashMap<String, Object>(){{put("id", primaryKey);}});
    }
    
}
