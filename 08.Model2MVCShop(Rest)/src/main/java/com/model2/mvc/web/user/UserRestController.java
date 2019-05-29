package com.model2.mvc.web.user;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


//==> 회원관리 RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method 구현 않음
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public Map<String,Object> login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		Map<String, Object> map = new HashMap<String, Object>();
		
		
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if(dbUser == null) {
			map.put("pass", "false");
		}else {
			if( user.getPassword().equals(dbUser.getPassword())){
				session.setAttribute("user", dbUser);
				map.put("user", dbUser);
				map.put("pass", "true");
			}else {
				map.put("pass", "false");
			}
			
		}
		
		
		
		
		return map;
	}
	
	@RequestMapping( value="json/addUser", method=RequestMethod.POST )
	public User addUser( @RequestBody User user ) throws Exception {

		System.out.println("/user/json/addUser : POST");
		//Business Logic
		userService.addUser(user);
		
		//test
		User dbUser = userService.getUser(user.getUserId());
		
		return dbUser;
	}
	
	@RequestMapping( value="json/updateUser/{userId}", method=RequestMethod.GET )
	public User updateUser( @PathVariable String userId) throws Exception{

		System.out.println("/user/json/updateUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model 과 View 연결
		
		return user;
	}

	@RequestMapping( value="json/updateUser", method=RequestMethod.POST )
	public User updateUser( @RequestBody User user) throws Exception{

		System.out.println("/user/json/updateUser : POST");
		
		//Business Logic
		userService.updateUser(user);
		
//		String sessionId=((User)session.getAttribute("user")).getUserId();
//		if(sessionId.equals(user.getUserId())){
//			session.setAttribute("user", user);
//		}
		
		user = userService.getUser(user.getUserId());
		
		return user;
	}
	

	
	
	@RequestMapping( value="json/checkDuplication/{userId}", method=RequestMethod.GET )
	public boolean checkDuplication( @PathVariable String userId) throws Exception{
		
		System.out.println("/user/json/checkDuplication : GET");
		//Business Logic
		boolean result=userService.checkDuplication(userId);
		// Model 과 View 연결
		

		return result;
	}

	
	@RequestMapping( value="json/listUser" )
	public Map<String , Object> listUser( @RequestBody Search search) throws Exception{
		
		System.out.println("/user/json/listUser : GET / POST");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}
		search.setPageSize(pageSize);
		
		// Business logic 수행
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		map.put("page", resultPage);
		map.put("search", search);
		
		
		return map;
	}
	
	
	
}