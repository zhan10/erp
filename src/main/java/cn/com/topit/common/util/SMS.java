/**
 * 
 */
package cn.com.topit.common.util;

import java.security.MessageDigest;

import com.aliyuncs.CommonRequest;
import com.aliyuncs.CommonResponse;
import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.exceptions.ClientException;
import com.aliyuncs.exceptions.ServerException;
import com.aliyuncs.http.MethodType;
import com.aliyuncs.profile.DefaultProfile;

/**
 * 阿里云短信平台
 * 
 * @author doom
 * @datetime 2011-5-31
 */
public class SMS {
    /***
     * 发送短信
     * 
     * @param 短信内容
     * @return 返回短信是否发送成功
     */
    public static String sendSms(String inStr) throws Exception {
    	DefaultProfile profile = DefaultProfile.getProfile("default", "<accessKeyId>", "<accessSecret>");
        IAcsClient client = new DefaultAcsClient(profile);

        CommonRequest request = new CommonRequest();
        //request.setProtocol(ProtocolType.HTTPS);
        request.setMethod(MethodType.POST);
        request.setDomain("dysmsapi.aliyuncs.com");
        request.setVersion("2017-05-25");
        request.setAction("SendSms");
        //手机号
        request.putQueryParameter("PhoneNumbers", "");
        //短信签名名称
        request.putQueryParameter("SignName", "");
        //短信模板id
        request.putQueryParameter("TemplateCode", "");
        //短信模板id
        request.putQueryParameter("TemplateParam", "");
        try {
            CommonResponse response = client.getCommonResponse(request);
            System.out.println(response.getData());
        } catch (ServerException e) {
            e.printStackTrace();
        }
		return inStr;
    }

    /**
     * 测试主函数
     * 
     * @param args
     * @throws Exception
     */
    public static void main(String args[]) throws Exception {
	
    }
}