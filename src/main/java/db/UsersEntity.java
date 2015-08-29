package db;

import javax.persistence.*;
import java.sql.Timestamp;

/**
 * Created by elyor on 8/29/2015.
 */
@Entity
@Table(name = "users", schema = "public", catalog = "d3pc16rn0l88v9")
public class UsersEntity {
    private int id;
    private String fullName;
    private String email;
    private String gender;
    private Timestamp birthday;
    private int promotionalCode;
    private int deviceId;
    private DevicesEntity devicesByDeviceId;

    @Id
    @Column(name = "id", nullable = false, insertable = true, updatable = true)
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    @Basic
    @Column(name = "full_name", nullable = false, insertable = true, updatable = true, length = 250)
    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    @Basic
    @Column(name = "email", nullable = false, insertable = true, updatable = true, length = 50)
    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Basic
    @Column(name = "gender", nullable = false, insertable = true, updatable = true, length = 25)
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    @Basic
    @Column(name = "birthday", nullable = false, insertable = true, updatable = true)
    public Timestamp getBirthday() {
        return birthday;
    }

    public void setBirthday(Timestamp birthday) {
        this.birthday = birthday;
    }

    @Basic
    @Column(name = "promotional_code", nullable = false, insertable = true, updatable = true)
    public int getPromotionalCode() {
        return promotionalCode;
    }

    public void setPromotionalCode(int promotionalCode) {
        this.promotionalCode = promotionalCode;
    }

    @Basic
    @Column(name = "device_id", nullable = false, insertable = true, updatable = true)
    public int getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(int deviceId) {
        this.deviceId = deviceId;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;

        UsersEntity that = (UsersEntity) o;

        if (id != that.id) return false;
        if (promotionalCode != that.promotionalCode) return false;
        if (deviceId != that.deviceId) return false;
        if (fullName != null ? !fullName.equals(that.fullName) : that.fullName != null) return false;
        if (email != null ? !email.equals(that.email) : that.email != null) return false;
        if (gender != null ? !gender.equals(that.gender) : that.gender != null) return false;
        return !(birthday != null ? !birthday.equals(that.birthday) : that.birthday != null);

    }

    @Override
    public int hashCode() {
        int result = id;
        result = 31 * result + (fullName != null ? fullName.hashCode() : 0);
        result = 31 * result + (email != null ? email.hashCode() : 0);
        result = 31 * result + (gender != null ? gender.hashCode() : 0);
        result = 31 * result + (birthday != null ? birthday.hashCode() : 0);
        result = 31 * result + promotionalCode;
        result = 31 * result + deviceId;
        return result;
    }

}
