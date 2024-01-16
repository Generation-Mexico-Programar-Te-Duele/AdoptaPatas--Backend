package org.programarteduele.app.service.implementation;

import java.util.List;
import java.util.Optional;

import org.programarteduele.app.entity.Role;
import org.programarteduele.app.repository.RoleRepository;
import org.programarteduele.app.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RoleServiceImplementation implements RoleService {

		@Autowired
	    private RoleRepository roleRepository;

	    @Override
	    public Role createRole(Role role) {
	       
	        return roleRepository.save(role);
	    }

	    @Override
	    public Role updateRole(Long roleId, Role updatedRole) {
	        Optional<Role> roleOptional = roleRepository.findById(roleId);
	        if (roleOptional.isPresent()) {
	            Role existingRole = roleOptional.get();
	           
	           
	            existingRole.setName(updatedRole.getName());
	            existingRole.setDescription(updatedRole.getDescription());
	           
	            return roleRepository.save(existingRole);
	        } else {
	           
	            return null;
	        }
	    }

	    @Override
	    public void deleteRole(Long roleId) {
	        roleRepository.deleteById(roleId);
	       
	    }

	    @Override
	    public Role getRoleById(Long roleId) {
	        return roleRepository.findById(roleId)
	        		.orElseThrow( ()-> new IllegalStateException("Role does not exist with id " + roleId));
	    }

	    @Override
	    public List<Role> getAllRoles() {
	        return (List<Role>) roleRepository.findAll();
	    }
	    



}
