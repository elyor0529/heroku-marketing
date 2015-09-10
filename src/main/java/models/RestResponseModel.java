package models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by elyor on 9/9/2015.
 */
public class RestResponseModel {

    @SerializedName("data")
    private Object data;

    @SerializedName("status")
    private String status;

    @SerializedName("code")
    private int code;

    @SerializedName("action")
    private String action;

    public RestResponseModel(String status, int code, String action) {
        this.status = status;
        this.code = code;
        this.action = action;
    }

    public Object getData() {
        return data;
    }

    public void setData(Object data) {
        this.data = data;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getAction() {
        return action;
    }

    public void setAction(String action) {
        this.action = action;
    }
}
