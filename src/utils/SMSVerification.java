package utils;
import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

public class SMSVerification {
	public static final String DEF_CHATSET = "UTF-8";
	public static final int DEF_CONN_TIMEOUT = 30000;
	public static final int DEF_READ_TIMEOUT = 30000;
	public static String userAgent = "Mozilla/5.0 (Windows NT 6.1) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/29.0.1547.66 Safari/537.36";

	// ≈‰÷√ƒ˙…Í«ÎµƒKEY
	public static final String APPKEY = "ee9791160075d84d748cfe0a8480ef0e";

	// 2.∑¢ÀÕ∂Ã–≈
	public static boolean send(String number,String code) throws Exception {
		String code_str=URLEncoder.encode("#code#="+code,"utf-8");
			URL url=new URL("http://v.juhe.cn/sms/send?mobile="+number+"&tpl_id=83082&tpl_value="+code_str+"&key="+APPKEY);
			URLConnection connection = url.openConnection();
			connection.connect();
			BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
			StringBuffer buffer = new StringBuffer();
			String lineData=null;
			while((lineData=bufferedReader.readLine())!= null){
				buffer.append(lineData);
			}
			bufferedReader.close();
			String result = buffer.toString();
			JSONObject object = JSONObject.fromObject(result);
			if(object.getInt("error_code")==0){
				System.out.println(object.get("result"));
				return true;
			}else{
				System.out.println(object.get("error_code")+":"+object.get("reason"));
				return false;
			}
	}
}
