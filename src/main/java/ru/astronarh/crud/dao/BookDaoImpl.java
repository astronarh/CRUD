package ru.astronarh.crud.dao;

import ru.astronarh.crud.model.Book;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public class BookDaoImpl implements BookDao {

    private SessionFactory sessionFactory;
    private static final int limitResultsPerPage = 10;

    @Autowired
    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    @Override
    public void addBook(Book book) {
        Session session = sessionFactory.getCurrentSession();
        session.persist(book);
    }

    @Override
    public void updateBook(Book book) {
        Session session = sessionFactory.getCurrentSession();
        session.update(book);
    }

    @Override
    public void removeBook(int id) {
        Session session = sessionFactory.getCurrentSession();
        Book book = (Book) session.get(Book.class, id);
        if (book != null)
            session.delete(book);
    }

    @Override
    public Book getBook(int id) {
        Session session = sessionFactory.getCurrentSession();
        Book book = (Book) session.get(Book.class, id);
        return book;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> getBooks(Long page) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Book");
        query.setFirstResult((int)(page - 1) * limitResultsPerPage);
        query.setMaxResults(limitResultsPerPage);
        List<Book> books = query.list();
        return books;
    }

    @Override
    @SuppressWarnings("unchecked")
    public List<Book> getBooks(String title) {
        Session session = sessionFactory.getCurrentSession();
        Query query = session.createQuery("FROM Book WHERE title = :title");
        query.setParameter("title", title);
        List<Book> books = query.list();
        return books;
    }


}
