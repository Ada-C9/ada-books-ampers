class BooksController < ApplicationController

  def index
    @user = User.find_by(id: session[:user_id] )
    # If we are in a nested route (/authors/7/books), we don't want @books to be Book.all, we want @books to just be the author's books
    if params[:author_id]
      author = Author.find_by(id: params[:author_id])
      @books = author.books
    else
      # we don't need to find a specific author's books, we just need to list all books
      @books = Book.all

    end
  end

  def show
    id = params[:id]
    @book = Book.find(id)
  end

  def new
    @book = Book.new
    @book.author = Author.find(params[:author_id])
    @action = author_books_path(params[:author_id])
  end

  def create
    @book = Book.new(book_params)
    @book.author = Author.find(params[:author_id])
    if @book.save
      flash[:success] = "#{@book.title} saved"
      redirect_to root_path
    else
      flash.now[:alert] = @book.errors

      render :new
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])
    if !@book.nil?
      if @book.update(book_params)
        redirect_to book_path(@book.id)
      else
        render :edit
      end
    else
      redirect_to books_path
    end


  end

  def destroy
    id = params[:id]
    begin
      @book = Book.find(id)
      if @book
        @book.destroy
      end
      flash[:success] = "#{@book.title} deleted"
    rescue
      flash[:alert] = "Book does not exist"
    end
    redirect_to books_path
  end

  private

  def book_params
    return params.require(:book).permit(:author_id, :description, :title, genre_ids: [])
  end










end
