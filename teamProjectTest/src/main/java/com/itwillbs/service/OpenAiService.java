package com.itwillbs.service;

import java.nio.charset.StandardCharsets;
import java.util.*;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

@Component
public class OpenAiService {

    @Value("${openai.api.key}")
    private String apiKey;

    private final String API_URL = "https://api.openai.com/v1/chat/completions";

    public String analyzeSentiment(String reviewContent) {
        System.out.println("🔍 OpenAiService.analyzeSentiment() 실행");

        try {
            // 1. 헤더 설정
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);
            headers.set("Authorization", "Bearer " + apiKey);

            // 2. 메시지 구성
            Map<String, String> systemMsg = new HashMap<>();
            systemMsg.put("role", "system");
            systemMsg.put("content", "너는 리뷰 감정 분석기야. 사용자 입력이 긍정이면 'positive', 부정이면 'negative'만 출력해.");

            Map<String, String> userMsg = new HashMap<>();
            userMsg.put("role", "user");
            userMsg.put("content", reviewContent);

            List<Map<String, String>> messages = new ArrayList<>();
            messages.add(systemMsg);
            messages.add(userMsg);

            // 3. JSON 요청 본문 구성
            JSONObject requestBody = new JSONObject();
            requestBody.put("model", "gpt-3.5-turbo");
            requestBody.put("temperature", 0.5);
            requestBody.put("messages", messages);

            HttpEntity<String> httpEntity = new HttpEntity<>(requestBody.toString(), headers);

            // 4. RestTemplate 구성
            RestTemplate restTemplate = new RestTemplate();
            List<HttpMessageConverter<?>> converters = new ArrayList<>();
            converters.add(new StringHttpMessageConverter(StandardCharsets.UTF_8));
            converters.addAll(restTemplate.getMessageConverters());
            restTemplate.setMessageConverters(converters);

            // 5. 요청 보내기
            ResponseEntity<String> response = restTemplate.exchange(
                    API_URL,
                    HttpMethod.POST,
                    httpEntity,
                    String.class
            );

            System.out.println("✅ OpenAI 응답: " + response.getBody());

            // 6. 응답 파싱
            JSONObject json = new JSONObject(response.getBody());

            if (!json.has("choices")) {
                System.err.println("❌ 'choices' 필드 없음! 응답: " + response.getBody());
                return "error";
            }

            JSONArray choices = json.getJSONArray("choices");
            JSONObject message = choices.getJSONObject(0).getJSONObject("message");
            String content = message.getString("content").trim().toLowerCase();

            if (content.contains("positive")) return "positive";
            if (content.contains("negative")) return "negative";
            return "unknown";

        } catch (Exception e) {
            System.err.println("❌ 감정 분석 실패");
            e.printStackTrace();
            return "error";
        }
    }
}
