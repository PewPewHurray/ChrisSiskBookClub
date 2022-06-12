package com.codingdojo.bookclub.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codingdojo.bookclub.models.Book;
import com.codingdojo.bookclub.repositories.BookRepository;

@Service
public class BookService {
	@Autowired
	private BookRepository bookRepo;
	
	public List<Book> findAll(){
		return bookRepo.findAll();
	}
	
	public Book create(Book b) {
		return bookRepo.save(b);
	}
	
	public Book findById(Long id) {
		return bookRepo.findById(id).orElse(null);
	}
	
	public Book update(Book b) {
		return bookRepo.save(b);
	}
}
