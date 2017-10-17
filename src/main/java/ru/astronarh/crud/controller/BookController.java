package ru.astronarh.crud.controller;

import ru.astronarh.crud.model.Book;
import ru.astronarh.crud.service.BookService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class BookController {
    private BookService bookService;

    @Autowired
    public void setBookService(BookService bookService) {
        this.bookService = bookService;
    }

    @RequestMapping(value = "books", method = RequestMethod.GET)
    public String listBooks(@RequestParam(value="page", required = false) Long page, Model model) {
        if (null == page)
            page = 1L;
        model.addAttribute("book", new Book());
        model.addAttribute("searchedbook", new Book());
        model.addAttribute("listBooks", bookService.getBooks(page));
        model.addAttribute("page", page);

        return "books";
    }

    @RequestMapping("/isread/{id}")
    public String isRead(@PathVariable("id") int id) {
        Book book = bookService.getBook(id);
        if (book.isReadAlready()) {
            book.setReadAlready(false);
        } else {
            book.setReadAlready(true);
        }
        bookService.updateBook(book);
        return "redirect:/books";
    }

    @RequestMapping(value = "/books/add", method = RequestMethod.POST)
    public String addBook(@ModelAttribute("book") Book book) {
        bookService.addBook(book);
        return "redirect:/books";
    }

    @RequestMapping(value = "/books/edit", method = RequestMethod.POST)
    public String editBook(@ModelAttribute("book") Book book) {
        bookService.updateBook(book);
        return "redirect:/books";
    }

    @RequestMapping("/remove/{id}")
    public String removeBook(@PathVariable("id") int id) {
        bookService.removeBook(id);

        return "redirect:/books";
    }

    @RequestMapping("edit/{id}")
    public String editBook(@PathVariable("id") int id, @RequestParam(value="page", required = false) Long page, Model model) {
        if (null == page) page = 1L;
        model.addAttribute("book", bookService.getBook(id));
        model.addAttribute("searchedbook", new Book());
        model.addAttribute("listBooks", bookService.getBooks(page));
        model.addAttribute("page", page);

        return "editbook";
    }

    @RequestMapping("bookdata/{id}")
    public String bookData(@PathVariable("id") int id, Model model) {
        model.addAttribute("book", bookService.getBook(id));

        return "bookdata";
    }

    @RequestMapping("addbook")
    public String createBook(@ModelAttribute Book book) {
        return "addbook";
    }

    @RequestMapping(value="searchresults", method = RequestMethod.POST)
    public String searchResults(@ModelAttribute("searchedbook") Book book, Model model) {
        List<Book> searchResult = bookService.getBooks(book.getTitle());
        model.addAttribute("listBooks", searchResult);

        return "searchresults";
    }
}
