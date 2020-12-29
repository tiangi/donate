package com.donate;
import lombok.Data;
import org.apache.http.Header;

import java.io.Serializable;

@Data
public class Result implements Serializable {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    private int status;

    private long cost;

    private String content;

    private Header[] headers;

    private String cookie;

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }


    public Header[] getHeaders() {
        return headers;
    }

    public void setHeaders(Header[] headers) {
        this.headers = headers;
    }

    @Override
    public String toString() {
        return "Result [status=" + status + ", content=" + content + "]";
    }

}