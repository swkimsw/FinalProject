package cc.spring.commons;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

public class ChatGPTUtils {

	@Value("${CHATGPT-KEY}")
	private String chatGptApiKey;

	@Autowired
	private HttpClient httpClient;

	public String makeMeal(String sendMsg) throws Exception{
		String apiUrl = "https://api.openai.com/v1/chat/completions";
		String apiKey = chatGptApiKey; // API 키로 변경해야 합니다.
		String model = "gpt-3.5-turbo-0301"; // 사용할 model
		String prompt = "3일치 비건 식단 아침, 저녁만 JSON데이터로 짜줘"; // ChatGPT에 전달할 프롬프트 메시지
		
		String systemMessage1 = "{\"role\": \"system\", \"content\": \"지금부터 넌 한식 전문 영양사야.\"}";
		String userMessage1 = "{\"role\": \"user\", \"content\": \"오늘 하루 식단을 JSON으로 작성해줄래?\"}";
		String assistantMessage1 = "{\"role\": \"assistant\", \"content\": \"{\\\"breakfast\\\": \\\"오트밀, 바나나, 우유\\\",\\\"lunch\\\": \\\"쌀밥, 된장찌개, 불고기\\\",\\\"dinner\\\": \\\"쌀국수, 새우튀김, 미역국\\\"}\"}";
		String systemMessage2 = "{\"role\": \"system\", \"content\": \"" + prompt + "\"}";

		String messages = String.join(", ", systemMessage1, userMessage1, assistantMessage1, systemMessage2);

		// API 요청 생성
		String requestBody = "{\"model\": \"" + model + "\", \"messages\": [" + messages + "]}";
		HttpRequest request = HttpRequest.newBuilder().uri(URI.create(apiUrl))
				.header("Content-Type", "application/json").header("Authorization", "Bearer " + apiKey)
				.POST(HttpRequest.BodyPublishers.ofString(requestBody)).build();

		// API 요청 전송 및 응답 처리
		HttpResponse<String> response = httpClient.send(request, HttpResponse.BodyHandlers.ofString());
		int statusCode = response.statusCode();
		String responseBody = response.body();
		System.out.println("Response Body: " + responseBody);
		
		return responseBody;
	}

}
