class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    id = params[:id]
    @book = Book.all.find { |book| book.id == id.to_i }
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
    id = params[:id]
    @book = Book.all.find { |book| book.id == id.to_i }
    @book.destroy
  end


end
