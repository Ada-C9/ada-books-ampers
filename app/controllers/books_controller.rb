class BooksController < ApplicationController

  def index
    @books = Book.all
  end

  def show
    id = params[:id]
    @book = Book.all.find { |book| book.id == id.to_i }
  end

  def new
    @book = Book.new

  end

  def create
    @book = Book.new
    @book.title = params[:book][:title]
    @book.author = params[:book][:author]
    @book.description = params[:book][:description]
    @book.save
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
