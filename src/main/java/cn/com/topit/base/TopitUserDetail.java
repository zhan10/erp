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
public class TopitUserDetail extends User {
    private static final long serialVersionUID = 1L;

    private String userId;

    @SuppressWarnings("deprecation")
    public TopitUserDetail(String username, String password, boolean enabled,
	    boolean accountNonExpired, boolean credentialsNonExpired,
	    boolean accountNonLocked,  Set<GrantedAuthority> authorities)
	    throws IllegalArgumentException {
	/* user.getCode(),  
         user.getPassword(),   
         user.getEnable(),   
         accountNonExpired,   
         credentialsNonExpired,   
         accountNonLocked,   
         authorities)*/
	super(username, password, enabled, accountNonExpired,credentialsNonExpired, accountNonLocked, authorities);
	
    }

    public String getUserId() {
	return userId;
    }

    public void setUserId(String userId) {
	this.userId = userId;
    }

    public static long getSerialVersionUID() {
	return serialVersionUID;
    }

}
