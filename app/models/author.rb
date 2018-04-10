class Author < ApplicationRecord
  has_many :books

  validates :name, presence: true

  def first_published
    books_with_publication_year = self.books.where.not(publication_year: nil)

    sorted_books = books_with_publication_year.order(:publication_year)

    if sorted_books.empty?
      return "NO BOOKS"
    end

    first_book = sorted_books.first

    return first_book.publication_year.to_i
  end
end
