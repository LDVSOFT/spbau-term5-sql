import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * Created by ldvsoft on 07.12.16.
 */
@Entity
public class DosageForm {
    @Column
    @Id
    @GeneratedValue
    private Integer id;

    @Column
    private String name;

    public Integer getId() {
        return id;
    }

    public String getName() {
        return name;
    }
}
