package com.itwillbs.service;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Component;


@Component
public class OpenAiService {

    private static final String API_KEY = "sk-발급받은-OpenAI-키";
    private static final String API_URL = "https://api.openai.com/v1/chat/completions";

    public String analyzeSentiment(String reviewContent) throws Exception {
        String prompt = reviewContent;

        String requestBody = String.format(
            "{\n" +
            "  \"model\": \"gpt-3.5-turbo\",\n" +
            "  \"messages\": [\n" +
            "    { \"role\": \"system\", \"content\": \"너는 리뷰 감정 분석기야. 사용자 입력이 긍정이면 'positive', 부정이면 'negative'만 출력해." +
            " },\n" +
            "    { \"role\": \"user\", \"content\": \"%s\" }\n" +
            "  ]\n" +
            "}", prompt);

        HttpRequest request = HttpRequest.newBuilder()
            .uri(URI.create(API_URL))
            .header("Content-Type", "application/json")
            .header("Authorization", "Bearer " + API_KEY)
            .POST(HttpRequest.BodyPublishers.ofString(requestBody))
            .build();

        HttpClient client = HttpClient.newHttpClient();
        HttpResponse<String> response = client.send(request, HttpResponse.BodyHandlers.ofString());

        JSONObject json = new JSONObject(response.body());
        JSONArray choices = json.getJSONArray("choices");
        JSONObject message = choices.getJSONObject(0).getJSONObject("message");
        String content = message.getString("content").trim().toLowerCase();

        if (content.contains("positive")) {
            return "positive";
        } else if (content.contains("negative")) {
            return "negative";
        } else {
            return "unknown";
        }
    }
}
