package cc.spring.services;

import java.util.HashMap;

import org.json.simple.JSONObject;

import cc.spring.commons.SmsKey;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class SmsService {
	
	public static void certifiedPhoneNumber(String phone, String numStr) {
		String api_key = SmsKey.ACCESS_KEY;
	    String api_secret = SmsKey.SECRET_KEY;
	    Message coolsms = new Message(api_key, api_secret);

	    // 4 params(to, from, type, text) are mandatory. must be filled
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phone);    // 수신전화번호
	    params.put("from", "01037469150");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
	    params.put("type", "SMS");
	    params.put("text", "Going Message" + "["+numStr+"]"); // 문자 내용 입력
	    params.put("app_version", "test app 1.2"); // application name and version

	    try {
	        JSONObject obj = (JSONObject) coolsms.send(params);
	        System.out.println(obj.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	    
	}
}