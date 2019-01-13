package cn.com.topit.base;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import cn.com.topit.gl.dao.Users;
import cn.com.topit.gl.service.UserRoleService;
import cn.com.topit.gl.service.UsersService;

	public class TopitUserDetailsServiceImpl implements UserDetailsService {  
		private static final Logger log = LoggerFactory
				.getLogger(TopitUserDetailsServiceImpl.class);
	    private UsersService usersService;  
	    private UserRoleService userRoleService;
	    @Override  
	    public UserDetails loadUserByUsername(String code)  
	            throws UsernameNotFoundException {  
	          log.info("加载用户名和密码，用户名为："+code);
	       List<Users> list=usersService.findBySql(" and code='"+code+"'");
	        Users user=null;
	        		if(list!=null&&list.size()>0)
	        			user= (Users)list.get(0);  
	        if(user==null){  
	        	 log.info("用户名没有找到!");
	            throw new UsernameNotFoundException("用户名没有找到!");  	           
	        }  
	          
	      // boolean enabled = true;                //是否可用  
	        boolean accountNonExpired = true;        //是否过期  
	        boolean credentialsNonExpired = true;     
	        boolean accountNonLocked = true;    
	          
	        Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();  
	        //如果你使用资源和权限配置在xml文件中，如：<intercept-url pattern="/user/admin" access="hasRole('ROLE_ADMIN')"/>；  
	        //并且也不想用数据库存储，所有用户都具有相同的权限的话，你可以手动保存角色(如：预订网站)。  
	        //authorities.add(new SimpleGrantedAuthority("ROLE_USER"));  
	          
	        List<String> roles = userRoleService.findRolesByUsersId(user.getId());  
	        for(String role : roles){  
	            GrantedAuthority ga = new SimpleGrantedAuthority(role);  
	            authorities.add(ga);      
	        }  
	        return new TopitUser(  
	                user.getCode(),  
	                user.getPassword(),   
	                user.getEnable(),   
	                accountNonExpired,   
	                credentialsNonExpired,   
	                accountNonLocked,   
	                authorities,user.getId(),user.getName());  
	    }  
	    /** 
	     * @param usersService the usersService to set 
	     */  
	    public void setUsersService(UsersService usersService) {  
	        this.usersService = usersService;  
	    }  
	    /** 
	     * @param usersService the usersService to set 
	     */  
	    public void setUserRoleService(UserRoleService userRoleService) {  
	        this.userRoleService = userRoleService;  
	    }  
	  
	}  