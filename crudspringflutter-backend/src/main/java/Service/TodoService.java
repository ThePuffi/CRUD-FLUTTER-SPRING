package Service;

import java.util.List;

import org.springframework.stereotype.Service;

import Dto.TodoDto;
import lombok.RequiredArgsConstructor;

/**
 * @author Erik Meinardus
 */
@Service
@RequiredArgsConstructor
public class TodoService {

    public TodoDto addTodo() {
        return null;
    }

    public List<TodoDto> getAllTodos() {
        return null;
    }

    public TodoDto updateTodo() {
        return null;
    }

    public boolean deleteTodo() {
        return true;
    }
}
