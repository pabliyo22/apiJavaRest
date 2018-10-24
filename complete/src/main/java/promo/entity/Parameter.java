package promo.entity;


import java.sql.Timestamp;
import java.util.List;


import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;


/**
 * 
 */
@Entity
@Table(name="pr_parameters")
public class Parameter {

    @Id
    private Integer id;

    private String name;

    private String strategy;

    private String filter_json;

    private Boolean visible;

    private String type;

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return this.name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStrategy() {
        return this.strategy;
    }

    public void setStrategy(String strategy) {
        this.strategy = strategy;
    }

    public String getFilter_json() {
        return this.filter_json;
    }

    public void setFilter_json(String filter_json) {
        this.filter_json = filter_json;
    }

    public Boolean getVisible() {
        return this.visible;
    }

    public void isVisible(Boolean visible) {
        this.visible = visible;
    }

    public String getType() {
        return this.type;
    }

    public void setType(String type) {
        this.type = type;
    }
}
