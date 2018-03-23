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
    @book = Book.new(book_params)
    if @book.save # it worked!
      redirect_to books_path
    end
  end

  def edit
    @book = Book.find_by(id: params[:id])
  end

  def update
    @book = Book.find_by(id: params[:id])
    if !@book.nil?
      @book.title = params[:book][:title]
      @book.author = params[:book][:author]
      @book.description = params[:book][:description]
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
    @book = Book.find(id)
    if @book
      @book.destroy
    end
    redirect_to books_path
  end


  private

    def book_params
    return params.require(:book).permit(:author, :description, :title)

    end

end
