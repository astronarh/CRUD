package ru.astronarh.crud.dao;

import ru.astronarh.crud.model.Book;

import java.util.List;

public interface BookDao {
    void addBook(Book book);
    void updateBook(Book book);
    void removeBook(int id);
    Book getBook(int id);
    List<Book> getBooks(Long page);
    List<Book> getBooks(String name);

}
