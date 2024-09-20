package kr.or.ddit.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class SHA256 {
	public static String getSHA256(String originPw) {
		
		String sha256Pw = null;
	    try {
	        MessageDigest digest = MessageDigest.getInstance("SHA-256");
	    	byte[] hash = digest.digest(originPw.getBytes("UTF-8"));
	    	StringBuffer hexString = new StringBuffer();

	    	for (int i = 0; i < hash.length; i++) {
	    		String hex = Integer.toHexString(0xff & hash[i]);
	    		if(hex.length() == 1) hexString.append('0');
	    		hexString.append(hex);
	    	}
	    	sha256Pw = hexString.toString();

	    } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
	        e.printStackTrace();
	        sha256Pw = null;
	    }
		
		return sha256Pw;
	}
}
