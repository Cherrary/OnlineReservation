package utils;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016091400511085";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQC0nbkq/qR9IZTGuUPmULjoKOVDBHa9Tc40I4iDeIRdL4CpTEO3FgNcdlKfzj7x45IC9yJSK8EmGz/FIeQmyh3D6BFBvIMVVjcuqsgkuTI4tsku/c4N9M/EDIr/ghuLKY0FwpXFGdCbb94W3uvAeATxElM7NP4mn5londe9Qyxo+EXZdoqaYwX4g/WWM92Og0vJqi12NJXSGCtqpHpmXWwlorRAmvNwZjjZeUFzEdNXgSb1+tFLKBbdrqXsbyGeOTL3/8YQUxeSiYO5QjwBslPRvb0tcdldmQ/dU4ImmWvKOvLNRj8lWJSloUctw7Zw+peKwMg+tZpPaor7HxlLY60vAgMBAAECggEAMlqSiBEMDLKzBqAZ9PjmRBs6p290Jxys805Avd54kH4w0YIokr95WmrGaDUYyVkXmOoLUHtQUu5f3fav47yPhdGKFhiXNvidU85bFBnpjXQwLICn1K4+yjpw+gDs6uQ/o653EMc8qEkM0rV9ZmBPiGICgEwq2tu96jOvNN2oYO72p5/7VQiSz6JOlW0ijLat/wWnE6aGgPDn6Fm9IaC0rJGn9xh9Hft64QXrD/fyLN0Ue/dtQz9HEdKKpkge7KRp+A+oRfoDMFTcvkiF+3C30YzAtEtV2SRN9c1PIwlhP65WwNk9VLs5a8xof1zNpNjB0xG7JqLRS2rBg4k4KagTwQKBgQDa4vbhnrV3LmYnIMHuuKx8AoCRPsRaptRR02GPJOCJM2zWB1A2Ewkm/XgNFNP4YKkkC0fkI+pnjgp8Ou9enEjbB81jvpXPOXAIwAqXimV1DQdAW90bsms2oStcRcQKi7JX0hXcWPLHwHBx0Yc4bOPY3xTMvEJU5ne00m0bu3bE4QKBgQDTPZU88SSOxckJA//sbXAZWvjvBNlpXySe9s8qQmaeTRGkNOLUQKVl3SukvXnkQaHlHTmOuMvoqGh7c51PAvT5AVZ8hoelJ2acg7N4akKN5D6E/JEqgGaJaUiK+pCi9M/jgD175J2I+3iYVJT5LhM0XiO/bJCq8kW6bTM8FQ6kDwKBgEeB0imPEbVnwROTTgfQ6PhyUNIicT80NTSuG7cJ0xi/ZhTdusSPn3PPZoLPhRgla9xMmyXa3d8Ktj4zerOr1tlHSUAGqSZTm1ggdNVg7xg4M2BBIpDDzua/7ExutkbDsHWkOmQL4vSC17k3PDegyya0ajUgY4Mc74pxHBftPDXBAoGBAJeTTu0F08em4JRZjGBoPtHS12EbR642mR5/1zNpphzdDFWZpVHMeWJYi6KQW1CQT80JZW2l6JsvjJlY4n35jzLF5PtBxT+awCR61GMJTGxoZPwkBz5KGElthKJFHVfw9uM19+hYqTnLyEL2HleW2izviBMpob0oTyRwix0HtxO9AoGAOP6+XJpufY9hRFqpoUCjRmVIY9Kd99ahWMXyvE3wRayyFEvhwfKnHtV3e/1CIwWU3C7/vqR+rf98knBXIXxaiW2GkurFzrjkqsJ6DADWawkfnJGsOUtOp2BuP5PN8nbksukiqZj+wst8IE6zYN6CenrMrLBk8nxJAyp6SeOmz1c=";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAvlTNKl51As4anjikh3lPziceVwv+dJ9GnyZUMh2qBxFG5dfxooGCpyyFHbjTsaIJu24iqCC35bFvL5zZ6ioEGBgkNnaJm3mD+daJrP8qON1Im1VCcuSdmAn+2kjV+U4bg3f35a78Bw/QvePg1l/IUt1esNPdfsh+HOxbrc7d/50ACufrx1bxHmwIUTG/pbikT66QuJepAPmf6UBrBjpLVHP/9jEXpibwxotk6nEZuAGo50pKaUb93yBxDon6eJoA5L+Z9dQ9UrtpGztYxRQNt21T9v8UACUkwKf7gU0PEstbS3F9UbpAptO1NqfJ8HGelP8cL+p1i5uaQjZxcoIWVwIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://140.143.119.154:7777/OnlineReservation/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://140.143.119.154:7777/OnlineReservation/returnURL";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "gb2312";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

