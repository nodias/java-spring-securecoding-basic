package kr.co.openeg.lab.common.utils;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class OpenCrypt {

	 public static byte[] getSHA256(String source, String salt) {
           return null;
     }
	 	 
	 public static byte[] generateKey(String algorithm) throws NoSuchAlgorithmException {
           return null; 
	}	
	 
	 public static byte[] generateKeyPair(String algorithm) throws NoSuchAlgorithmException {
         return null; 
	}	 
	  

	 public static String encrypt(String msg, byte[] key) throws Exception {
          return null;
	 }
	 
	 public static String decrypt(String msg,byte[] key ) throws Exception {
          return null;
	}
	 
	 public static String encryptRSA(String msg, byte[] key) throws Exception {
         return null;
	 }
	 
	 public static String decryptRSA(String msg,byte[] key ) throws Exception {
         return null;
	}
	 
	 public static byte[] hexToByteArray(String hex) {
		    if (hex == null || hex.length() == 0) {
		        return null;
		    }
		 
		    byte[] ba = new byte[hex.length() / 2];
		    for (int i = 0; i < ba.length; i++) {
		        ba[i] = (byte) Integer.parseInt(hex.substring(2 * i, 2 * i + 2), 16);
		    }
		    return ba;
		}
		 
		// byte[] to hex
		public static String byteArrayToHex(byte[] ba) {
		    if (ba == null || ba.length == 0) {
		        return null;
		    }
		 
		    StringBuffer sb = new StringBuffer(ba.length * 2);
		    String hexNumber;
		    for (int x = 0; x < ba.length; x++) {
		        hexNumber = "0" + Integer.toHexString(0xff & ba[x]);
		 
		        sb.append(hexNumber.substring(hexNumber.length() - 2));
		    }
		    return sb.toString();
		} 
	 
}
