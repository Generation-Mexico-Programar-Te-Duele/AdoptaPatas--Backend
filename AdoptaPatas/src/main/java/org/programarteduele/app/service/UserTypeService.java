package org.programarteduele.app.service;

import java.util.List;

import org.programarteduele.app.entity.UserType;

public interface UserTypeService {
	
	UserType getRoleById(Long id);
	//UserType createRole(UserType role);
	List<UserType> getAllRoles();
	//UserType updateRole(UserType user, Long id);
	//void deleteRole(Long id);

}
