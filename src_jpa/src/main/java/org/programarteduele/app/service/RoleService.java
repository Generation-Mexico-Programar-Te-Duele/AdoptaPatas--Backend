package org.programarteduele.app.service;

import java.util.List;

import org.programarteduele.app.entity.Role;

public interface RoleService {
	
    Role createRole(Role role);
    Role updateRole(Long roleId, Role updatedRole);
    void deleteRole(Long roleId);
    Role getRoleById(Long roleId);
    List<Role> getAllRoles();
	

}
