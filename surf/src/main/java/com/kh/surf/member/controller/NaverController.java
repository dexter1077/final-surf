package com.kh.surf.member.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

@Controller
public class NaverController {
	
	private final static String CLIENT_ID = "W9M2avEyxcdRLUOGu_r_";
	private final static String CLIENT_SECRET = "Zx9G1D1NuR";

	private String redirect_uri;
	
	//= ;
	//private final static String REDIRECT_URI = "http://localhost:8888/surf/nenroll.do";
	private final static String SESSION_STATE = "oauth_state";

	// 세션 유효성 검증을 위한 난수 생성
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
	
	// http session에 데이터 저장
	private void setSession(HttpSession session, String state) {
		session.setAttribute(SESSION_STATE, state);
	}
	
	// http session에서 데이터 가져오기
	private String getSession(HttpSession session) {
		return (String)session.getAttribute(SESSION_STATE);
	}
	
	// 1. 인가코드 가져오기
	/** @author 최서경
	 * @param type 로그인 기능인지 회원가입 기능인지 구분
	 * @return 인가코드 발급 url
	 */
	public String getAuthorizationUrl(String type, HttpSession session) {
		
		if(type.equals("login")) {
			redirect_uri = "http://localhost:8888/surf/nlogin.do";
		} else {
			redirect_uri = "http://localhost:8888/surf/nenroll.do";
		}
		// 사이트간 요청 위조(CSRF)공격 방지를 위해 애플리케이션(서프)에서 생성한 상태 토큰값으로 URL인코딩을 적용한 값을 사용
		// 난수 생성 후 세션에 담기
		String state = generateRandomString();
		setSession(session, state);
		
		// Scribe(다운받은 라이브러리)에서 제공하는 인증 URL생성 기능을 이용하여 네아로 인증URL생성
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(redirect_uri)
				.state(state)
				.build(NaverLoginApi.instance());
		
		return oauthService.getAuthorizationUrl();
		
	}

	// 2. 네아로 Callback처리 및 AccessToken획득 Method
	/** @author 최서경
	 * @param code 인가코드
	 * @param state CSRF방지를 위해 생성한 난수
	 */
	public OAuth2AccessToken getAccessToken(String type, HttpSession session, String code, String state) throws IOException {
		if(type.equals("login")) {
			redirect_uri = "http://localhost:8888/surf/nlogin.do";
		} else {
			redirect_uri = "http://localhost:8888/surf/nenroll.do";
		}
		// Callback으로 전달받은 세션검증용 난수값과 세션에 저장되어있는 값이 일치하는지 확인
		String sessionState = getSession(session);
		
		if(StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(CLIENT_ID)
					.apiSecret(CLIENT_SECRET)
					.callback(redirect_uri)
					.state(state)
					.build(NaverLoginApi.instance());	
			
			// Scribe에서 제공하는 AccessToken얻는 메소드로 네아로 Access Token얻기
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			
			return accessToken;
		}
		return null;
	}
	
	
	// 사용자 프로필조회 api
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	// 3. AccessToken 이용해서 사용자정보 가져오기
	/** @author 최서경
	 * @return 사용자 정보 담긴 json객체
	 */
	public String getUserInfo(String type, OAuth2AccessToken oauthToken) throws IOException {
		if(type.equals("login")) {
			redirect_uri = "http://localhost:8888/surf/nlogin.do";
		} else {
			redirect_uri = "http://localhost:8888/surf/nenroll.do";
		}
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(redirect_uri)
				.build(NaverLoginApi.instance());
		
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();
	}
	
	
	
	/****************** 연결끊기(임시. 나중에 삭제하기) ********************************/
    /** 네이버 연결끊기
	public JsonNode nunlink(OAuth2AccessToken ntoken) {
    	System.out.println(ntoken.getAccessToken());
    	
		final String RequestUrl = "https://nid.naver.com/oauth2.0/token?"
        		+ "grant_type=delete"
        		+ "&client_id="+ CLIENT_ID
        		+"&client_secret="+CLIENT_SECRET
        		+"&access_token=" + ntoken.getAccessToken()
        		+"&service_provider=NAVER";
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(RequestUrl);
        
 
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
