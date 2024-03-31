package cc.spring.controllers;

public class UploadImageResponse {
	private String imageUrl;

	public UploadImageResponse(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

}
