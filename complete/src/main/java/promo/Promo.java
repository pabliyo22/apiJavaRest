package promo;

import java.sql.Timestamp;
import java.util.List;
import java.util.ArrayList;


import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.JoinColumn;
import javax.persistence.CascadeType;
import javax.persistence.FetchType;


/**
 * Clase que se representa las promciones generadas 
 * 
 * @author pluna
 *
 */
@Entity
@Table(name="pr_promo")
// Notaciones como doctrinee
public class Promo {

    @Id
    private Integer id;

    private Integer userPromo;

    private String name;

    private Timestamp dateFrom;

    private Timestamp dateTo;

    private Timestamp creationDate;

    private Boolean enabled;

    @OneToOne(
        mappedBy = "promoId",
        cascade = CascadeType.ALL, 
        fetch = FetchType.LAZY, 
        optional = false
    )
    private PromoRules promoRule;

    public Integer getId() {
        return this.id;
    }

    public Integer getUserPromo() {
        return this.userPromo;
    }

    public String getName() {
        return this.name;
    }

    public Timestamp getDateFrom() {
        return this.dateFrom;
    }

    public Timestamp getDateTo() {
        return this.dateTo;
    }

    public Timestamp getCreationDate() {
        return this.creationDate;
    }

    public Boolean getEnabled() {
        return this.enabled;
    }

    public PromoRules getPromoRule() {
        return this.promoRule;
    }

}
