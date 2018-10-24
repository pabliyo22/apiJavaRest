package promo.entity;

import java.sql.Timestamp;
import java.util.List;


import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

/**
 * 
 * 
 * @author pluna
 *
 */
@Entity
@Table(name="pr_operators")
public class Operator {

    @Id
    private Integer id;

    private String symboltext;

    private String symbol;

    public Integer getId() {
        return this.id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getSymboltext() {
        return this.symboltext;
    }

    public void setSymboltext(String symboltext) {
        this.symboltext = symboltext;
    }

    public String getSymbol() {
        return this.symbol;
    }

    public void setSymbol(String symbol) {
        this.symbol = symbol;
    }


}