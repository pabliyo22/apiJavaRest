package promo.entity;

import java.sql.Date;
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
@Table(name="pr_members")
public class Member {

    @Id
    private Integer id;

    private  String name;

    private  String surname;
  
    private Long externalSocioId;

    private String CardId;

    private Timestamp modificationDate;



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

    public String getSurname() {
        return this.surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }

    public Long getExternalSocioId() {
        return this.externalSocioId;
    }

    public void setExternalSocioId(Long externalSocioId) {
        this.externalSocioId = externalSocioId;
    }

    public String getCardId() {
        return this.CardId;
    }

    public void setCardId(String CardId) {
        this.CardId = CardId;
    }

    public Timestamp getModificationDate() {
        return this.modificationDate;
    }

    public Timestamp setModificationDate(Timestamp modificationDate) {
       return  this.modificationDate = modificationDate;
    }
}