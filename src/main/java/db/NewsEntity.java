package db;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by elyor on 8/29/2015.
 */
@Entity
@Table(name = "news", schema = "public", catalog = "d3pc16rn0l88v9")
public class NewsEntity {
    private int id;
    private String photoUrl;
    private Timestamp modifiedDate;
    private Timestamp createdDate;
    private String content;
    private String title;
    private int companyId;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "photo_url", nullable = false, insertable = true, updatable = true, length = 250)
    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    @Basic
    @Column(name = "modified_date", nullable = false, insertable = true, updatable = true)
    public Timestamp getModifiedDate() {
        return modifiedDate;
    }

    public void setModifiedDate(Timestamp modifiedDate) {
        this.modifiedDate = modifiedDate;
    }

    @Basic
    @Column(name = "created_date", nullable = false, insertable = true, updatable = true)
    public Timestamp getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Timestamp createdDate) {
        this.createdDate = createdDate;
    }

    @Basic
    @Column(name = "content", nullable = false, insertable = true, updatable = true, length = 2147483647)
    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    @Basic
    @Column(name = "title", nullable = false, insertable = true, updatable = true, length = 250)
    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    @Basic
    @Column(name = "company_id", nullable = false, insertable = true, updatable = true)
    public int getCompanyId() {
        return companyId;
    }

    public void setCompanyId(int companyId) {
        this.companyId = companyId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        NewsEntity that = (NewsEntity) o;

        if (id != that.id) return false;
        if (companyId != that.companyId) return false;
        if (photoUrl != null ? !photoUrl.equals(that.photoUrl) : that.photoUrl != null) return false;
        if (modifiedDate != null ? !modifiedDate.equals(that.modifiedDate) : that.modifiedDate != null) return false;
        if (createdDate != null ? !createdDate.equals(that.createdDate) : that.createdDate != null) return false;
        if (content != null ? !content.equals(that.content) : that.content != null) return false;
        return !(title != null ? !title.equals(that.title) : that.title != null);

    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (photoUrl != null ? photoUrl.hashCode() : 0);
        result = 31 * result + (modifiedDate != null ? modifiedDate.hashCode() : 0);
        result = 31 * result + (createdDate != null ? createdDate.hashCode() : 0);
        result = 31 * result + (content != null ? content.hashCode() : 0);
        result = 31 * result + (title != null ? title.hashCode() : 0);
        result = 31 * result + companyId;
        return result;
    }

}
