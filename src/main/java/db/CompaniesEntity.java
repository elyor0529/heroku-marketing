package db;

import javax.persistence.*;

/**
 * Created by elyor on 8/29/2015.
 */
@Entity
@Table(name = "companies", schema = "public")
public class CompaniesEntity {
    private int id;
    private String name;
    private String key;
    private double currency;
    private String logoUrl;
    private String about;
    private String siteUrl;
    private String privacyPolicy;
    private String phone;

    public CompaniesEntity() {
        id = 0;
        name = "";
        key = "";
        about = "";
        currency = 0;
        logoUrl = "";
        siteUrl = "";
        privacyPolicy = "";
        phone = "";
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
    @Column(name = "name", nullable = false, insertable = true, updatable = true, length = 250)
    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Basic
    @Column(name = "key", nullable = true, insertable = true, updatable = true, length = 50)
    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    @Basic
    @Column(name = "currency", nullable = false, insertable = true, updatable = true, precision = 0)
    public double getCurrency() {
        return currency;
    }

    public void setCurrency(double currency) {
        this.currency = currency;
    }

    @Basic
    @Column(name = "logo_url", nullable = false, insertable = true, updatable = true, length = 250)
    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    @Basic
    @Column(name = "about", nullable = false, insertable = true, updatable = true, length = 2147483647)
    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    @Basic
    @Column(name = "site_url", nullable = false, insertable = true, updatable = true, length = 250)
    public String getSiteUrl() {
        return siteUrl;
    }

    public void setSiteUrl(String siteUrl) {
        this.siteUrl = siteUrl;
    }

    @Basic
    @Column(name = "privacy_policy", nullable = false, insertable = true, updatable = true, length = 2147483647)
    public String getPrivacyPolicy() {
        return privacyPolicy;
    }

    public void setPrivacyPolicy(String privacyPolicy) {
        this.privacyPolicy = privacyPolicy;
    }

    @Basic
    @Column(name = "phone", nullable = false, insertable = true, updatable = true, length = 50)
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public boolean equals(Object o) {

        if (this == o)
            return true;

        if (o == null || getClass() != o.getClass())
            return false;

        CompaniesEntity that = (CompaniesEntity) o;

        if (id != that.id)
            return false;

        if (Double.compare(that.currency, currency) != 0)
            return false;

        if (name != null ? !name.equals(that.name) : that.name != null)
            return false;

        if (key != null ? !key.equals(that.key) : that.key != null)
            return false;

        if (logoUrl != null ? !logoUrl.equals(that.logoUrl) : that.logoUrl != null)
            return false;

        if (about != null ? !about.equals(that.about) : that.about != null)
            return false;

        if (siteUrl != null ? !siteUrl.equals(that.siteUrl) : that.siteUrl != null)
            return false;

        if (privacyPolicy != null ? !privacyPolicy.equals(that.privacyPolicy) : that.privacyPolicy != null)
            return false;

        return !(phone != null ? !phone.equals(that.phone) : that.phone != null);
    }

    @Override
    public int hashCode() {
        int result;
        long temp;

        result = id;
        result = 31 * result + (name != null ? name.hashCode() : 0);
        result = 31 * result + (key != null ? key.hashCode() : 0);
        temp = Double.doubleToLongBits(currency);
        result = 31 * result + (int) (temp ^ (temp >>> 32));
        result = 31 * result + (logoUrl != null ? logoUrl.hashCode() : 0);
        result = 31 * result + (about != null ? about.hashCode() : 0);
        result = 31 * result + (siteUrl != null ? siteUrl.hashCode() : 0);
        result = 31 * result + (privacyPolicy != null ? privacyPolicy.hashCode() : 0);
        result = 31 * result + (phone != null ? phone.hashCode() : 0);

        return result;
    }
}
