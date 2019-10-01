package kr.co.openeg.lab.test.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathConstants;
import javax.xml.xpath.XPathExpressionException;
import javax.xml.xpath.XPathFactory;

import kr.co.openeg.lab.common.utils.EConnection;
import kr.co.openeg.lab.common.utils.EConnectionMs;

import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;


public class TestUtil {

	public static  int getInt(String data){
		int i=-1;
		try {
		    i= Integer.parseInt(data);
		}catch(NumberFormatException e){
			return i;
		}
		return i;
	}
	
	public static int factorial(int n) {
		int i;
		if ( n == 1) {
			i=1;
		} else {
		   return n*factorial(n-1);
		}
		return i;
	}
	
	public String readXML(String name)  {

	 StringBuffer buffer=new StringBuffer();
     
	 try {
	   InputStream is =
			   this.getClass().getClassLoader().getResourceAsStream("config/address.xml");
       DocumentBuilderFactory builderFactory = 
    		    DocumentBuilderFactory.newInstance();
	   DocumentBuilder builder =  builderFactory.newDocumentBuilder();
	   Document xmlDocument = builder.parse(is);
	   XPath xPath =  XPathFactory.newInstance().newXPath();
	 
	   System.out.println("ccard 출력");
	   String expression = "/addresses/address[@name='"+name+"']/ccard";

	   NodeList nodeList = (NodeList) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODESET);
	   for (int i = 0; i < nodeList.getLength(); i++) {
		   buffer.append("CCARD[ "+i+ " ]  "+nodeList.item(i).getTextContent()+"<br/>");
	   }
//	 
//	   System.out.println("*************************");
//	   expression = "/addresses/address[@type='admin']/name";
//	   System.out.println(expression);
//	   nodeList = (NodeList) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODESET);
//	   for (int i = 0; i < nodeList.getLength(); i++) {
//	        System.out.println(nodeList.item(i).getFirstChild().getNodeValue()); 
//	   }
//	 
//	   System.out.println("*************************");
//	   expression = "/addresses/address[@name='"+name+"']";
//	   System.out.println(expression);
//	   Node node = (Node) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODE);
//	   if(null != node) {
//		   NodeList nodeList = node.getChildNodes();
//	       for (int i = 0;null!=nodeList && i < nodeList.getLength(); i++) {
//	           Node nod = nodeList.item(i);
//	           if(nod.getNodeType() == Node.ELEMENT_NODE)
//	                Sys tem.out.println(nodeList.item(i).getNodeName() + " : " + nod.getFirstChild().getNodeValue()); 
//	           }
//	       }
//	             
//	       System.out.println("*************************");
//	 
//	  	         
//	       System.out.println("*************************");
//	            expression = "/addresses/address[1]/name";
//	            System.out.println(expression);
//	            nodeList = (NodeList) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODESET);
//	            for (int i = 0; i < nodeList.getLength(); i++) {
//	                System.out.println(nodeList.item(i).getFirstChild().getNodeValue()); 
//	            }
//	            System.out.println("*************************");
//	            expression = "/addresses/address[position() <= 1]/name";
//	            System.out.println(expression);
//	            nodeList = (NodeList) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODESET);
//	            for (int i = 0; i < nodeList.getLength(); i++) {
//	                System.out.println(nodeList.item(i).getFirstChild().getNodeValue()); 
//	            }
//	 
//	            System.out.println("*************************");
//	            expression = "/addresses/address[last()]/name";
//	            System.out.println(expression);
//	            nodeList = (NodeList) xPath.compile(expression).evaluate(xmlDocument, XPathConstants.NODESET);
//	            for (int i = 0; i < nodeList.getLength(); i++) {
//	                System.out.println(nodeList.item(i).getFirstChild().getNodeValue()); 
//	            }
//	 
//	            System.out.println("*************************");
	 
	        } catch (FileNotFoundException e) {
	            e.printStackTrace();
	        } catch (SAXException e) {
	            e.printStackTrace();
	        } catch (IOException e) {
	            e.printStackTrace();
	        } catch (ParserConfigurationException e) {
	            e.printStackTrace();
	        } catch (XPathExpressionException e) {
	            e.printStackTrace();
	        } catch (Exception e) {
	        	e.printStackTrace();
	        }
	        if ( buffer.length() == 0) {
	        	buffer.append("검색된 결과가 없습니다.");
	        }
        	return buffer.toString();
	}
	
	public String readDB(String id, String passwd) {
		StringBuffer  result=new StringBuffer();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		try {
			con = EConnection.getConnection(this);	
			st = con.createStatement();
			rs = st.executeQuery("select * from board_member where userid='"+id+"' and userpw='"+passwd+"'");
   		    if ( rs.next() ) {
			       result.append("ID: "+rs.getString(2));
			       result.append("    PASSWORD: "+rs.getString(3));
			}
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			result.append("요청처리에러발생");
		}
	
			if ( rs != null ) try { rs.close(); }catch(SQLException e){}
			if ( st != null ) try { st.close(); }catch(SQLException e){}
			if ( con != null ) try { con.close(); }catch(SQLException e){}
            
			return result.toString();
	}
	
//	public String readDB2(String id) {
//		StringBuffer  result=new StringBuffer();
//		Connection con=null;
//		Statement st=null;
//		ResultSet rs=null;
//		try {
//			con = EConnection.getConnection(this);	
//			st = con.createStatement();
//			rs = st.executeQuery("select * from board_member where userid='"+id+"'");
//   		    while ( rs.next() ) {
//   		    	   result.append("IDX: "+rs.getString(1));
//			       result.append("      ID: "+rs.getString(2));
//			       result.append("      PASSWORD: "+rs.getString(3));
//			       result.append("      이름: "+rs.getString(4)+"\n");
//			}
//		} catch (SQLException e1) {
//			result.append("요청 처리 에러 발생");
//		}
//	
//			if ( rs != null ) try { rs.close(); }catch(SQLException e){}
//			if ( st != null ) try { st.close(); }catch(SQLException e){}
//			if ( con != null ) try { con.close(); }catch(SQLException e){}
//            
//			return result.toString();
//	}

	//@@@@
	public String readDB2(String id) {
		StringBuffer result = new StringBuffer();
		Connection con = null;
//		Statement st = null;
//		ResultSet rs = null;
//		try {
//			con = EConnection.getConnection(this);
//			st = con.createStatement();
//			rs = st.executeQuery("select * from board_member where userid='" + id + "'");
		
		// Statement를 PreparedStatement로 변환 
		// #1 PrepredStatement를 선언
		java.sql.PreparedStatement st = null;
		ResultSet rs = null;
		try {
			// #2 SQL문의 구조를 정의 : 변수 영역은 ?로 표시
			String sql = "select * from board_member where userid = ? ";
			con = EConnection.getConnection(this);
			// #3 PrepredStatement 인스턴스를 생성 : con.prepareStatement(쿼리문의구조)
			st = con.prepareStatement(sql);
			// #4 쿼리문 구조에서 정의한 변수에 값을 바인딩
			st.setString(1, id);
			// #5 쿼리를 실행 : 별도의 인자(sql)를 사용하지 않는다.
			rs = st.executeQuery();
		while ( rs.next() ) {
	    	   result.append("IDX: "+rs.getString(1));
		       result.append("      ID: "+rs.getString(2));
		       result.append("      PASSWORD: "+rs.getString(3));
		       result.append("      이름: "+rs.getString(4)+"\n");
		}
	} catch (SQLException e1) {
		result.append("요청 처리 에러 발생");
	}

		if ( rs != null ) try { rs.close(); }catch(SQLException e){}
		if ( st != null ) try { st.close(); }catch(SQLException e){}
		if ( con != null ) try { con.close(); }catch(SQLException e){}
	 
		return result.toString();
	}
	
	public String readDB3(String id) throws Exception {
		StringBuffer  result=new StringBuffer();
		Connection con=null;
		Statement st=null;
		ResultSet rs=null;
		con = EConnectionMs.getConnection(this);	
		st = con.createStatement();
		rs = st.executeQuery("select * from board_member where userid='"+id+"'");
   		while ( rs.next() ) {
   		    	   result.append("IDX: "+rs.getString(1));
			       result.append("      ID: "+rs.getString(2));
			       result.append("      PASSWORD: "+rs.getString(3));
			       result.append("      이름: "+rs.getString(4)+"\n");
   		}

	
			if ( rs != null ) try { rs.close(); }catch(SQLException e){}
			if ( st != null ) try { st.close(); }catch(SQLException e){}
			if ( con != null ) try { con.close(); }catch(SQLException e){}
            
			return result.toString();
	}
	
	
}
