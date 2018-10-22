package promo;

import java.sql.Timestamp;
import java.util.List;


import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToOne;
import javax.persistence.JoinColumn;

/**
 * 
 * 
 * @author pluna
 *
 */
@Entity
@Table(name="pr_rules")
public class Rule {

    @Id
    private Integer id;

    @ManyToOne()
    @JoinColumn(name="parameter", nullable=false)
    private  Parameter parameter;

    @ManyToOne()
    @JoinColumn(name="operator", nullable=false)
    private  Operator operator;
  

    private String value;

    @ManyToOne
    @JoinColumn(name="associatedFormulaId", nullable=false)
    private PromoRules promoRule;

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Parameter getParameter() {
        return this.parameter;
    }

    public void setParameter(Parameter parameter) {
        this.parameter = parameter;
    }

    public Operator getOperator() {
        return this.operator;
    }

    public void setOperator(Operator operator) {
        this.operator = operator;
    }

    public String getValue() {
        return this.value;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public PromoRules getPromoRule() {
        return this.promoRule;
    }

    public void setPromoRule(PromoRules promoRule) {
        this.promoRule = promoRule;
    }


}