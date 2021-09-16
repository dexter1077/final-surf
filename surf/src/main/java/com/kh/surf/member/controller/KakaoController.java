package com.kh.surf.member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.surf.member.model.vo.Member;

@Controller
public class KakaoController {
	
	/** @author 최서경
	 * 인가코드 받기 url
	 */
	@ResponseBody
	@RequestMapping(value = "kauth.do", method =RequestMethod.GET )
	public String getKakaoAuth(String type, HttpSession session, Model model) {
		
		String kakaoUrl = KakaoController.getAuthorizationUrl(type, session);
		return kakaoUrl;
	}

	//REST API : 6773ac9a8842b8e65f935579a8ae7124
	
	private final static String K_CLIENT_ID = "6773ac9a8842b8e65f935579a8ae7124";
	// uri 하나만 설정할거면 이 위치에 private final static으로 선언하기
	
	/** @author 최서경
	 * @param session HttpSession객체
	 * @return 인가 코드
	 */
	public static String getAuthorizationUrl(String type, HttpSession session) {
		
		String redirectUri = "";
		
		// 로그인 버튼 눌렀을 때
		if(type.equals("login")) {
			redirectUri = "http://localhost:8888/surf/klogin.do";
		// 카카오로 시작하기 버튼 눌렀을 때	
		} else if(type.equals("enroll")) {
			redirectUri = "http://localhost:8888/surf/kenroll.do";			
		}
		
		String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?client_id="+ K_CLIENT_ID 
						+ "&redirect_uri=" + redirectUri + "&response_type=code";
		
		return kakaoUrl;
	}
	
	/** @author 최서경
	 * @param authorize_code 권한 코드
	 * @return 접근 토큰
	 */
	public static JsonNode getAccessToken(String type, String authorize_code) {
		final String RequestUrl = "https://kauth.kakao.com/oauth/token";
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", K_CLIENT_ID));
		// 로그인버튼 눌렀을 때
		if(type.equals("login")) {
			postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8888/surf/klogin.do"));
		// 카카오로 시작하기버튼 눌렀을 때	
		} else if(type.equals("enroll")) {
			postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8888/surf/kenroll.do"));
		}
		postParams.add(new BasicNameValuePair("code", authorize_code));
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		
		JsonNode returnNode = null;
		
		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			
			final HttpResponse response = client.execute(post);
			
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}
		
		return returnNode;
	}

	
	/** @author 최서경
	 * @param accessToken 토큰
	 * @return 사용자 정보
	 */
	public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
		
		final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(RequestUrl);
		// add header
		post.addHeader("Authorization", "Bearer " + accessToken);	// Bearer뒤에 띄워쓰기 해야됨
		JsonNode returnNode = null;
		
		try {
			final HttpResponse response = client.execute(post);
			//Json형태 반환값 처리
			ObjectMapper mapper = new ObjectMapper();
			returnNode = mapper.readTree(response.getEntity().getContent());
		} catch (ClientProtocolException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// clear resources
		}
		return returnNode;
		
	}
	
	/************************ 밑에는 나중에 삭제 *******************************************************/
    /** 
     * @param autorize_code
     * @return 로그아웃된 아이디
     */
    public JsonNode Logout(String access_token) {
    	
        final String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
 
        post.addHeader("Authorization", "Bearer " + access_token);
 
        JsonNode returnNode = null;
 
        try {
 
            final HttpResponse response = client.execute(post);
 
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
        return returnNode;
    }
    
    /** 연결끊기
     * @param autorize_code
     * @return 연결 끊긴 아이디 
     * properties 삭제됨
    public JsonNode unlink(String access_token) {
    	
        final String RequestUrl = "https://kapi.kakao.com/v1/user/unlink";
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
 
        post.addHeader("Authorization", "Bearer " + access_token);
 
        JsonNode returnNode = null;
 
        try {
 
            final HttpResponse response = client.execute(post);

            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());
 
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        } catch (ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
        }
        return returnNode;
    }
     */
    


}
