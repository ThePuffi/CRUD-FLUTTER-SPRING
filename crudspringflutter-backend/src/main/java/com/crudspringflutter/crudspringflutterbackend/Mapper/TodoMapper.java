package com.crudspringflutter.crudspringflutterbackend.Mapper;

import com.crudspringflutter.crudspringflutterbackend.Dto.TodoDto;
import com.crudspringflutter.crudspringflutterbackend.Entity.TodoEntity;

import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;

/**
 * @author Erik Meinardus
 */

@Component
@RequiredArgsConstructor
public class TodoMapper {

    public TodoEntity toEntity(TodoDto todoDto){
        TodoEntity todoEntity = new TodoEntity();
        todoEntity.setId(todoDto.getId());
        todoEntity.setTitle(todoDto.getTitle());
        todoEntity.setContent(todoDto.getContent());
        return todoEntity;
    }

    public TodoDto toDto(TodoEntity todoEntity){
        TodoDto todoDto = new TodoDto();
        todoDto.setId(todoEntity.getId());
        todoDto.setTitle(todoEntity.getTitle());
        todoDto.setContent(todoEntity.getContent());
        return todoDto;
    }
}
