package org.programarteduele.app.repository;

import org.programarteduele.app.entity.Post;
import org.programarteduele.app.entity.PostLike;
import org.springframework.data.repository.CrudRepository;


public interface PostRepository extends CrudRepository<Post, Long>{
      

}