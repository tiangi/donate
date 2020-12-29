package com.donate;

import org.apache.http.*;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.client.methods.RequestBuilder;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StopWatch;

import java.io.UnsupportedEncodingException;
import java.util.List;

public class HttpUtils {

    private static final Logger LOGGER = LoggerFactory.getLogger(HttpUtils.class);

    public static Result post(CloseableHttpClient httpClient, String url, List<Header> headers, List<BasicNameValuePair> params, String body) {
        LOGGER.debug("post,url:{},params:{}", url, params);
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        Result r = new Result();
        RequestBuilder builder = RequestBuilder.post(url);
        if (body != null) {
            try {
                builder.setEntity(new StringEntity(body));
            } catch (UnsupportedEncodingException e) {
                LOGGER.error("", e);
            }
        }
        if (params != null && params.size() > 0) {
            UrlEncodedFormEntity entity = new UrlEncodedFormEntity(params, Consts.UTF_8);
            builder.setEntity(entity);
//            if (headers != null) {
//                headers.add(new BasicHeader("Content-Length", entity.getContentLength() + ""));
//            }

        }

        HttpUriRequest request = builder.build();
        if (headers != null && headers.size() > 0) {
            for (Header header : headers) {
                request.setHeader(header);
            }
        }

        try {
            HttpResponse response = httpClient.execute(request);
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                r.setContent(EntityUtils.toString(response.getEntity(), "utf-8"));
                r.setHeaders(response.getAllHeaders());
            }
            r.setStatus(response.getStatusLine().getStatusCode());
        } catch (Exception e) {
            LOGGER.error("", e);
        }
        stopWatch.stop();
        r.setCost(stopWatch.getTotalTimeMillis());
        LOGGER.debug("http post,url:{}, cost:{}", url, stopWatch.getTotalTimeMillis());
        return r;
    }

    public static Result get(CloseableHttpClient httpClient, String url, List<Header> headers) {
        LOGGER.debug("get,url:{}", url);
        StopWatch stopWatch = new StopWatch();
        stopWatch.start();
        Result r = new Result();
        HttpUriRequest request = RequestBuilder.get(url).build();
        if (headers != null && headers.size() > 0) {
            for (Header header : headers) {
                request.setHeader(header);
            }
        }
        try {
            HttpResponse response = httpClient.execute(request);
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                r.setContent(EntityUtils.toString(response.getEntity(), "utf-8"));
                if (response.getHeaders("Set-Cookie")!= null) {
                    Header header = response.getFirstHeader("Set-Cookie");
                    if (header != null) {
                        String value = header.getValue();
                        String[] cookies = value.split(";");
                        for (int i = 0; i < cookies.length; i++) {
                            if (cookies[i].indexOf("PHPSESSID") >=0) {
                                r.setCookie(cookies[i]);
                                break;
                            }
                        }
                    }
                }
            }
            r.setStatus(response.getStatusLine().getStatusCode());
        } catch (Exception e) {
            LOGGER.error("", e);
        }
        stopWatch.stop();
        r.setCost(stopWatch.getTotalTimeMillis());
        LOGGER.debug("http get,url:{}, cost:{}", url, stopWatch.getTotalTimeMillis());
        return r;
    }

    public static HttpEntity getEntity(HttpClient httpClient, String url, List<Header> headers) {
        LOGGER.debug("get,url:{}", url);
        HttpUriRequest request = RequestBuilder.get(url).build();
        if (headers != null && headers.size() > 0) {
            for (Header header : headers) {
                request.setHeader(header);
            }
        }
        try {
            HttpResponse response = httpClient.execute(request);
            if (response.getStatusLine().getStatusCode() == HttpStatus.SC_OK) {
                return response.getEntity();
            }
        } catch (Exception e) {
            LOGGER.error("", e);
        }
        return null;
    }

}