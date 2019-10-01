package kr.co.openeg.lab.test.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

@Service
public class TestService {
	
	@Value("${encryptor.masterKey}")
	String masterKey;
	
	public String getKey() {
		return masterKey;
	}
	
	
}
