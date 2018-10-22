package promo;

import java.sql.Timestamp;
import java.util.List;
import java.util.ArrayList;


import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.JoinColumn;

@Entity
@Table(name="pr_promo_rules")
public class PromoRules{
    @Id
    private Integer id;

    
    private  String formula;

    private  String json;

    @OneToOne()
    @JoinColumn(name="promo_id", nullable=false)
    private  Promo promoId;

    @OneToMany(
        mappedBy = "promoRule"
    )

    private List<Rule> rules = new ArrayList<>();

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getFormula() {
        return this.formula;
    }

    public void setFormula(String formula) {
        this.formula = formula;
    }

    public String getJson() {
        return this.json;
    }

    public void setJson(String json) {
        this.json = json;
    }

    public Promo getPromoId() {
        return this.promoId;
    }

    public void setPromoId(Promo promoId) {
        this.promoId = promoId;
    }

    public List<Rule> getRules() {
        return this.rules;
    }

    public void setRules(List<Rule> rules) {
        this.rules = rules;
    }

    
}