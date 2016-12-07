import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * Created by ldvsoft on 07.12.16.
 */
public class Component {
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
