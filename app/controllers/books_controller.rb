class BooksController < ApplicationController
  def index
    @books=Book.all
    @book= Book.new
  end

  def create
    book = Book.new(list_params)
    book.save
    redirect_to '/books'
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book=Book.find(params[:id])

  end

  def update
    book=Book.find(params[:id])
    book.update(book_params)
    redirect_to book_path(book.id)
  end
  private
  def list_params
    params.require(:book).permit(:title, :body)
  end
end
