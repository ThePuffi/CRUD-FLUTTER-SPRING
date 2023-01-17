package com.crudspringflutter.crudspringflutterbackend.Repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.crudspringflutter.crudspringflutterbackend.Entity.TodoEntity;

/**
 * @author Erik Meinardus
 */
@Repository
public interface TodoRepository extends JpaRepository<TodoEntity, String> {
}
