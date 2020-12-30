package com.donate.common;

public class RestfulApiResponse<T> {
	public static final String SERVICE_STATUS_SUCCESS = "success";
	public static final String SERVICE_STATUS_FAIL = "fail";
	private String status;
	private String code;
	private String message;
	private T responseBody;

	@SuppressWarnings("rawtypes")
	public static RestfulApiResponse buildFailResponse(String code, String message) {
		return new RestfulApiResponse(SERVICE_STATUS_FAIL, code, message);
	}

	public static <T> RestfulApiResponse<T> buildSuccessResponse(T responseBody) {
		RestfulApiResponse<T> restfulApiResponse = new RestfulApiResponse<T>();

		restfulApiResponse.setResponseBody(responseBody);

		return restfulApiResponse;
	}

	protected RestfulApiResponse() {
		this.status = SERVICE_STATUS_SUCCESS;
	}

	protected RestfulApiResponse(String status, String code, String message) {
		this.status = status;
		this.code = code;
		this.message = message;
	}

	public String getStatus() {
		return status;
	}

	public String getCode() {
		return code;
	}

	public RestfulApiResponse<T> setCode(String code) {
		this.code = code;
		return this;
	}

	public RestfulApiResponse<T> setStatus(String status) {
		this.status = status;
		return this;
	}

	public RestfulApiResponse<T> setResponseBody(T responseBody) {
		this.responseBody = responseBody;
		return this;
	}

	public T getResponseBody() {
		return responseBody;
	}

	public String getMessage() {
		return message;
	}

	public RestfulApiResponse<T> setMessage(String message) {
		this.message = message;
		return this;
	}

}