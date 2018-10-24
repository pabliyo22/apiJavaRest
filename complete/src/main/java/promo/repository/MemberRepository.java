package promo.repository;

import java.util.List;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;
import promo.entity.*;


@RepositoryRestResource(collectionResourceRel = "members", path = "member")
public interface MemberRepository extends PagingAndSortingRepository<Member, Integer> {

	List<Member> findByExternalSocioId(@Param("externalSocioId") Long externalSocioId);
	
}