package Controller;

import java.util.List;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import Dto.TodoDto;
import lombok.RequiredArgsConstructor;

/**
 * @author Erik Meinardus
 */
@Controller("todo")
@RequiredArgsConstructor
public class TodoController {

    @PostMapping("/create")
    public ResponseEntity<TodoDto> create(@RequestBody TodoDto dto) {
        return null;
    }

    @GetMapping("getAll")
    public ResponseEntity<List<TodoDto>> getAll() {
        return null;
    }

    @PutMapping("update")
    public ResponseEntity<TodoDto> update(@RequestBody TodoDto dto) {
        return null;
    }

    @DeleteMapping("delete/{id}")
    public ResponseEntity<TodoDto> delete(@PathVariable String id) {
        return null;
    }
}
