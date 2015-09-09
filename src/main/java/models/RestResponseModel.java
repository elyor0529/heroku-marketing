package models;

import com.google.gson.annotations.SerializedName;

/**
 * Created by elyor on 9/9/2015.
 */
public class RestResponseModel {

    @SerializedName("object")

    private Object object;

    @SerializedName("status")
    private String status;

    @SerializedName("code")
    private int code;

    public RestResponseModel(Object object, String status, int code) {
        this(status, code);

        this.object = object;
    }

    public RestResponseModel(String status, int code) {
        this.status = status;

        this.code = code;
    }

    public Object getObject() {
        return object;
    }

    public void setObject(Object object) {
        this.object = object;
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

}
