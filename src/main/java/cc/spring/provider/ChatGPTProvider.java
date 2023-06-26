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

import java.io.IOException;
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
	
	public JsonObject gpt(String messages) throws Exception {

		String apiUrl = "https://api.openai.com/v1/chat/completions";
		String apiKey = chatGptApiKey; // API 키로 변경해야 합니다.
		String model = "gpt-3.5-turbo-0613"; // 사용할 model
		
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
		return content;
	}
	
	public JsonObject makeMeal(String sendMsg) throws Exception{
		
		String systemMessage1 = "{\"role\": \"system\", \"content\": \"지금부터 넌 한식 전문 영양사야.\"}";
		String userMessage1 = "{\"role\": \"user\", \"content\": \"1일치 식단 아침,점심,저녁만 JSON데이터로 짜줘\"}";
		String assistantMessage1 = "{\"role\": \"assistant\", \"content\": \"{\\\"day1\\\":{\\\"breakfast\\\": [\\\"오트밀\\\", \\\"바나나\\\", \\\"우유\\\"],\\\"lunch\\\": [\\\"쌀밥\\\", \\\"된장찌개\\\", \\\"불고기\\\"],\\\"dinner\\\": [\\\"쌀국수\\\", \\\"새우튀김\\\", \\\"미역국\\\"]}}\"}";
		String systemMessage2 = "{\"role\": \"system\", \"content\": \"" + sendMsg + "\"}";
		
		String messages = String.join(", ", systemMessage1, userMessage1, assistantMessage1, systemMessage2);
		return gpt(messages);
	}
	
	public JsonObject extractIngredients(String sendMsg) throws Exception{
		
		String systemMessage1 = "{\"role\": \"system\", \"content\": \"지금부터 넌 전문 요리사야.\"}";
		String userMessage1 = "{\"role\": \"user\", \"content\": \"비빔밥, 김치찌개, 프렌치토스트의 재료를 JSON 데이터로 짜줘\"}";
		String assistantMessage1 = "{\"role\": \"assistant\", \"content\": \"{{\\\"메뉴\\\":\\\"비빔밥\\\",\\\"재료\\\":[\\\"밥\\\",\\\"고추장\\\",\\\"참기름\\\",\\\"간장\\\",\\\"다진 소고기\\\",\\\"단호박\\\",\\\"시금치\\\",\\\"콩나물\\\",\\\"시금치\\\",\\\"당근\\\",\\\"계란\\\",\\\"김\\\"]},{\\\"메뉴\\\":\\\"김치찌개\\\",\\\"재료\\\":[\\\"김치\\\",\\\"두부\\\",\\\"돼지고기\\\",\\\"양파\\\",\\\"대파\\\",\\\"고춧가루\\\",\\\"소금\\\",\\\"설탕\\\"]},{\\\"메뉴\\\":\\\"프렌치토스트\\\",\\\"재료\\\":[\\\"식빵\\\",\\\"달걀\\\",\\\"우유\\\",\\\"설탕\\\",\\\"버터\\\"]}}\"}";
		String systemMessage2 = "{\"role\": \"system\", \"content\": \"" + sendMsg + "\"}";
		
		String messages = String.join(", ", systemMessage1, userMessage1, assistantMessage1, systemMessage2);

		return gpt(messages);
	}
}
