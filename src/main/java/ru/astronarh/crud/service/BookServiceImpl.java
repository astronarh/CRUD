package ru.astronarh.crud.service;

import ru.astronarh.crud.dao.BookDao;
import ru.astronarh.crud.model.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    private BookDao bookDao;

    @Autowired
    public void setBookDao(BookDao bookDao) {
        this.bookDao = bookDao;
    }

    @Override
    @Transactional
    public void addBook(Book book) {
        bookDao.addBook(book);
    }

    @Override
    @Transactional
    public void updateBook(Book book) {
        bookDao.updateBook(book);
    }

    @Override
    @Transactional
    public void removeBook(int id) {
        bookDao.removeBook(id);
    }

    @Override
    @Transactional
    public Book getBook(int id) {
        return bookDao.getBook(id);
    }

    @Override
    @Transactional
    public List<Book> getBooks(Long page) {
        return bookDao.getBooks(page);
    }

    @Override
    @Transactional
    public List<Book> getBooks(String name) {
        return bookDao.getBooks(name);
    }

}
