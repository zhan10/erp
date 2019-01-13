/**
 * 
 */
package cn.com.topit.base;

import java.util.Collection;
import java.util.Set;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

/**
 * @author Administrator
 * 
 */
public class TopitUser extends User {
    private static final long serialVersionUID = 1L;

    private Long userId;
private String name;
    @SuppressWarnings("deprecation")
    public TopitUser(String username, String password, boolean enabled,
	    boolean accountNonExpired, boolean credentialsNonExpired,
	    boolean accountNonLocked,  Set<GrantedAuthority> authorities,Long id,String name)
	    throws IllegalArgumentException {
	/* user.getCode(),  
         user.getPassword(),   
         user.getEnable(),   
         accountNonExpired,   
         credentialsNonExpired,   
         accountNonLocked,   
         authorities)*/
	super(username, password, enabled, accountNonExpired,credentialsNonExpired, accountNonLocked, authorities);
	this.setUserId(id);
	this.setName(name);
    }

    public Long getUserId() {
	return userId;
    }

    public void setUserId(Long userId) {
	this.userId = userId;
    }

    public static long getSerialVersionUID() {
	return serialVersionUID;
    }

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
