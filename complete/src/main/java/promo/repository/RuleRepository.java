package promo.repository;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import promo.entity.*;


@RepositoryRestResource(collectionResourceRel = "rules", path = "rule")

public interface RuleRepository extends PagingAndSortingRepository<Rule, Integer> {

	List<Rule> findByPromoRule(@Param("promoRule") Integer name);
	
}