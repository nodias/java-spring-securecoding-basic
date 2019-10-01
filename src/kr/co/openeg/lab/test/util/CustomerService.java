package kr.co.openeg.lab.test.util;

public class CustomerService {
	   
	private static CustomerService service;
	private  Customer cust;
	
	public CustomerService() {
		cust=new Customer();
	}
	
    public static CustomerService getInstance() {
    	   if ( service == null ) {
    		   service  = new CustomerService();
    	   }
    	   return service;
   }
   
    public String displayCustomer() {
    	return "이름: "+cust.getName() +"<br/>전화번호: "+cust.getPhone();
    }
    
    public Customer getCustomer() {
    	return cust;
    }
    
//    public void setCustomer(String name, String phone) {
//    	cust.setName(name);
//    	cust.setPhone(phone);
//    }
    
    public void setCustomer(Customer cust){
    	this.cust=cust;
    }
    
}
