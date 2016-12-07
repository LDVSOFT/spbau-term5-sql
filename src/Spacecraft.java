// This class is a part of the 4th "sprint" of the database labs
// running in Saint-Petersburg Academic University in Fall'16
//
// Author: Dmitry Barashev
// License: WTFPL

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

/**
 * Entity object corresponding to a single row in Spacecraft table
 */
@Entity
public class Spacecraft {
  @Column
  @Id
  @GeneratedValue
  private Integer id;

  @Column
  private String name;

  @Column
  private Integer capacity;

  @Column(name = "class")
  private Integer clazz;

  // Required by ORM
  public Spacecraft() {}

  public Spacecraft(String name, Integer capacity, Integer clazz) {
    this.name = name;
    this.capacity = capacity;
    this.clazz = clazz;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public Integer getCapacity() {
    return capacity;
  }

  public void setCapacity(Integer capacity) {
    this.capacity = capacity;
  }

  public Integer getClazz() {
    return clazz;
  }

  public void setClazz(Integer clazz) {
    this.clazz = clazz;
  }

  @Override
  public String toString() {
    final StringBuffer sb = new StringBuffer("Spacecraft{");
    sb.append("id=").append(id);
    sb.append(", name='").append(name).append('\'');
    sb.append(", capacity=").append(capacity);
    sb.append(", clazz=").append(clazz);
    sb.append('}');
    return sb.toString();
  }
}
