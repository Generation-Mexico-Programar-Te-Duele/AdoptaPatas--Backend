package org.programarteduele.app.service.impl;

import java.util.List;

import org.programarteduele.app.entity.UserType;
import org.programarteduele.app.repository.UserTypeRepository;
import org.programarteduele.app.service.UserTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserTypeServiceImpl implements UserTypeService {
	
	@Autowired
	UserTypeRepository roleRepository;

	@Override
	public UserType getRoleById(Long id) {
		return roleRepository.findById(id)
				.orElseThrow( ()-> new IllegalStateException("Role does not exist with id " + id));
	}
	
	/*
	@Override
	public UserType createRole(UserType role) {
		return roleRepository.save(role);
	}
	*/

	@Override
	public List<UserType> getAllRoles() {
		return (List<UserType>) roleRepository.findAll();
	}

	/*
	@Override
	public UserType updateRole(UserType role, Long id) {
		UserType existingRole = getRoleById(id);
		existingRole.setUserType( role.getUserType() );
		existingRole.setRole( role.getRole() );
		return roleRepository.save(existingRole);
	}
	*/

	/*
	@Override
	public void deleteRole(Long id) {
		UserType existingUser = getRoleById(id);
		roleRepository.delete(existingUser);		
	}
	*/

}
