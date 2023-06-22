package cc.spring.provider;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.stream.JsonReader;

import java.io.StringReader;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

@Component
public class ChatGPTProvider {
	
	@Value("${CHATGPT-KEY}")
	private String chatGptApiKey;

	@Autowired
	private HttpClient httpClient;
	
	@Autowired
	private Gson gson;
	
	public JsonObject makeMeal(String sendMsg) throws Exception{
		
		String apiUrl = "https://api.openai.com/v1/chat/completions";
		String apiKey = chatGptApiKey; // API 키로 변경해야 합니다.
		String model = "gpt-3.5-turbo-0613"; // 사용할 model
		
		String systemMessage1 = "{\"role\": \"system\", \"content\": \"지금부터 넌 한식 전문 영양사야.\"}";
		String userMessage1 = "{\"role\": \"user\", \"content\": \"1일치 식단 아침,점심,저녁만 JSON데이터로 짜줘\"}";
		String assistantMessage1 = "{\"role\": \"assistant\", \"content\": \"{\\\"day1\\\":{\\\"breakfast\\\": [\\\"오트밀\\\", \\\"바나나\\\", \\\"우유\\\"],\\\"lunch\\\": [\\\"쌀밥\\\", \\\"된장찌개\\\", \\\"불고기\\\"],\\\"dinner\\\": [\\\"쌀국수\\\", \\\"새우튀김\\\", \\\"미역국\\\"]}}\"}";
		String systemMessage2 = "{\"role\": \"system\", \"content\": \"" + sendMsg + "\"}";
		
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
		// 응답 출력
		System.out.println("Status Code: " + statusCode);
		System.out.println("Response Body: " + responseBody);

		// Json 문자열 -> Map
		JsonReader reader = new JsonReader(new StringReader(responseBody));
		reader.setLenient(true);
		Map<String, Object> map = gson.fromJson(reader, Map.class);
		JsonParser parser = new JsonParser();
		JsonElement choices = parser.parse(map.get("choices").toString());
		JsonObject choicesZero = choices.getAsJsonArray().get(0).getAsJsonObject();
		JsonObject message = choicesZero.get("message").getAsJsonObject();
		JsonObject content = message.get("content").getAsJsonObject();
		
		System.out.println("PROVIDER: ");
		System.out.println(content);
		///sdfasdfasd
		return content;
	}
	
}
