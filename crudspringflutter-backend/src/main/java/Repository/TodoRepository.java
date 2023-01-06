package Repository;

import org.springframework.data.jpa.repository.JpaRepository;

import Entity.TodoEntity;

/**
 * @author Erik Meinardus
 */
public interface TodoRepository extends JpaRepository<TodoEntity, String> {
}
