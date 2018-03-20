class BooksController < ApplicationController

  BOOK_LIST = [
      {id: 1, title: "1984", author: "George Orwell", review: "4/5. Had to read and nearly finished"},
      {id: 2, title: "Pride & Prejudice", author: "Jane Austin", review: "4.2/5. Never read but people seem to love it."},
      {id: 3, title: "Harry Potter", author: "JK Rowling", review: "5/5. Greatest book ever."},
      {id: 4, title: "Harry Poodr", author: "Sandy Metz", review: "TBD. Chapter 3 was excessive."}
    ]

  def index
    @books = BOOK_LIST
  end

  def show
    id = params[:id]
    @book = BOOK_LIST.find { |book| book[:id] == id.to_i }
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
