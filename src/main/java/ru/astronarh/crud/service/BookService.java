package ru.astronarh.crud.service;

import ru.astronarh.crud.model.Book;

import java.util.List;

public interface BookService {
    void addBook(Book book);
    void updateBook(Book book);
    void removeBook(int id);
    Book getBook(int id);
    List<Book> getBooks(Long page);
    List<Book> getBooks(String name);
}
