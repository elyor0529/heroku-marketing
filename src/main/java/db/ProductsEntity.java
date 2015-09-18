package db;

import javax.persistence.*;

/**
 * Created by elyor on 8/29/2015.
 */
@Entity
@Table(name = "products", schema = "public")
public class ProductsEntity {
    private int id;
    private String photoUrl;
    private String description;
    private String name;
    private int mark;
    private int companyId;

    public ProductsEntity() {
        id = 0;
        photoUrl = "";
        description = "";
        name = "";
        mark = 0;
        companyId = 0;
    }

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
    @Column(name = "description", nullable = false, insertable = true, updatable = true, length = 2147483647)
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    @Basic
    @Column(name = "name", nullable = false, insertable = true, updatable = true, length = 50)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "mark", nullable = false, insertable = true, updatable = true)
    public int getMark() {
        return mark;
    }

    public void setMark(int mark) {
        this.mark = mark;
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

        if (this == o)
            return true;

        if (o == null || getClass() != o.getClass())
            return false;

        ProductsEntity that = (ProductsEntity) o;

        if (id != that.id)
            return false;

        if (mark != that.mark)
            return false;

        if (companyId != that.companyId)
            return false;

        if (photoUrl != null ? !photoUrl.equals(that.photoUrl) : that.photoUrl != null)
            return false;

        if (description != null ? !description.equals(that.description) : that.description != null)
            return false;

        return !(name != null ? !name.equals(that.name) : that.name != null);
    }

    @Override
    public int hashCode() {
        int result = id;

        result = 31 * result + (photoUrl != null ? photoUrl.hashCode() : 0);
        result = 31 * result + (description != null ? description.hashCode() : 0);
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + mark;
        result = 31 * result + companyId;

        return result;
    }

}
