package kr.co.openeg.lab.test.util;

public class Role {
    private String[] adminRoles = {"admin","root","manager"};
    private static Role role;
    private Role() {}
    
    public static Role getInstance() {
    	if ( role == null ) {
    		role=new Role();
    	}
    	return role;
    }
    
	public String[] getAdminRoles() {
		return adminRoles;
	}

	public void setAdminRoles(String[] adminRoles) {
		this.adminRoles = adminRoles;
	}

	public String adminLists() {
		StringBuffer buffer=new StringBuffer();
		for(String s:adminRoles){
			buffer.append(s+" ");
		}
		return buffer.toString();
	}
     
}
