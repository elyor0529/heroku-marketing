package models;

import com.google.gson.annotations.SerializedName;

import java.util.List;

/**
 * Created by elyor on 8/31/2015.
 */
public class LimitationResponseModel<T> {

    @SerializedName("total")
    private int total;

    @SerializedName("limit")
    private int limit;

    @SerializedName("offset")
    private int offset;

    @SerializedName("items")
    private List<T> items;

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getLimit() {
        return limit;
    }

    public void setLimit(int limit) {
        this.limit = limit;
    }

    public int getOffset() {
        return offset;
    }

    public void setOffset(int offset) {
        this.offset = offset;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }

}