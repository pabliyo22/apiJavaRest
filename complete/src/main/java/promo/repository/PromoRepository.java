package promo.repository;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import promo.entity.*;

@RepositoryRestResource(collectionResourceRel = "promos", path = "promo")
/**  esta notacion  publica el repositorio **/
public interface PromoRepository extends PagingAndSortingRepository<Promo, Integer> {

	List<Promo> findByName(@Param("name") String name);
	
}