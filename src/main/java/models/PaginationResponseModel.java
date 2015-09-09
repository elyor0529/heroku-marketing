package models;

import manager.ManagerImpl;
import org.apache.commons.beanutils.converters.IntegerConverter;
import utils.Settings;

import java.util.List;

/**
 * Created by elyor on 9/1/2015.
 */
public class PaginationResponseModel<T> {

    private int totalRecord;
    private int pageSize;
    private int currentPage;
    private int nextPage;
    private int prevPage;
    private int pageCount;
    private List<T> items;

    public PaginationResponseModel(ManagerImpl<T> manager, String pageParam, String sizeParam) {
        this(manager,
                (Integer) new IntegerConverter(Settings.PAGING.PAGE).convert(String.class, pageParam),
                (Integer) new IntegerConverter(Settings.PAGING.LIMIT).convert(String.class, sizeParam));
    }

    public PaginationResponseModel(ManagerImpl<T> manager, int currentPage, int pageSize) {
        this.currentPage = currentPage;
        this.pageSize = pageSize;
        this.totalRecord = manager.getSize();
        this.pageCount = this.pageSize > 0 ? (int) Math.round(Math.ceil(this.totalRecord / this.pageSize)) : 0;
        this.prevPage = (this.currentPage > 0) ? this.currentPage - 1 : 0;
        this.nextPage = (this.currentPage > 0 && this.currentPage < this.pageCount - 1) ? this.currentPage + 1 : this.pageCount - 1;
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
