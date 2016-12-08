import com.j256.ormlite.field.DatabaseField;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.Date;
import java.util.Random;

@Entity
class Drug {
    @Column
    @GeneratedValue
    @Id
    private Integer id;

    @Column
    private String name;

    @Column(name = "internationalname")
    private String internationalName;

    @DatabaseField(foreign = true, foreignAutoRefresh = true, columnName = "dosageformid")
    private DosageForm dosageForm;

    @DatabaseField(foreign = true, foreignAutoRefresh = true, columnName = "manufacturerid")
    private Manufacturer manufacturer;

    @DatabaseField(foreign = true, foreignAutoRefresh = true, columnName = "componentid")
    private Component component;

    @Column(name = "certificateid")
    private Integer certificateId = new Random().nextInt();

    @Column(name = "certificateexpires")
    private Date certificateExpires = new Date(0);

    @Column(name = "certificatelaboratoryid")
    private Integer certificateLaboratoryId = 0;

    public Drug() {

    }

    public Drug(String name, String internationalName, DosageForm dosageForm, Manufacturer manufacturer, Component component) {
        this.name = name;
        this.internationalName = internationalName;
        this.dosageForm = dosageForm;
        this.manufacturer = manufacturer;
        this.component = component;
    }

    @Override
    public String toString() {
        return "Drug{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", internationalName='" + internationalName + '\'' +
                ", dosageForm='" + dosageForm.getName() + '\'' +
                ", manufacturer=" + ((manufacturer == null) ? "null" : '\'' + manufacturer.getName() + '\'') +
                ", component=" + ((component == null) ? "null" : '\'' + component.getName() + '\'') +
                '}';
    }
}
