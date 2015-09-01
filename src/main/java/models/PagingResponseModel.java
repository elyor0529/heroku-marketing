package models;

import helpers.ConvertHelper;
import manager.ManagerImpl;
import utils.Settings;

import java.util.List;

/**
 * Created by elyor on 9/1/2015.
 */
public class PagingResponseModel<T> {

    private int totalRecord;
    private int pageSize;
    private int currentPage;
    private int nextPage;
    private int prevPage;
    private int pageCount;
    private List<T> items;

    public PagingResponseModel(ManagerImpl<T> manager, String pageParam, String sizeParam) {
        this(manager, ConvertHelper.ToString(pageParam).isEmpty()
                ? Settings.PAGING.PAGE
                : ConvertHelper.ToInteger(pageParam), ConvertHelper.ToString(sizeParam).isEmpty()
                ? Settings.PAGING.COUNT - 1
                : ConvertHelper.ToInteger(sizeParam));
    }

    public PagingResponseModel(ManagerImpl<T> manager, int currentPage, int pageSize) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.totalRecord = manager.getSize();
        this.pageCount = (int) Math.round(Math.ceil(this.totalRecord / this.pageSize));
        this.prevPage = (this.currentPage > 0) ? this.currentPage - 1 : 0;
        this.nextPage = (this.currentPage > 0 && this.currentPage < pageCount - 1) ? this.currentPage + 1 : this.pageCount - 1;
        this.items = manager.getAll(this.pageSize, this.pageSize * (this.currentPage - 1));
    }


    public int getTotalRecord() {
        return totalRecord;
    }

    public void setTotalRecord(int totalRecord) {
        this.totalRecord = totalRecord;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getNextPage() {
        return nextPage;
    }

    public void setNextPage(int nextPage) {
        this.nextPage = nextPage;
    }

    public int getPrevPage() {
        return prevPage;
    }

    public void setPrevPage(int prevPage) {
        this.prevPage = prevPage;
    }

    public int getPageCount() {
        return pageCount;
    }

    public void setPageCount(int pageCount) {
        this.pageCount = pageCount;
    }

    public List<T> getItems() {
        return items;
    }

    public void setItems(List<T> items) {
        this.items = items;
    }
}
