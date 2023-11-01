class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all
  end

  def create
    @book = Book.new(book_params)
    if @book.save
    flash[:notice] = "Book was successfully updated."
    redirect_to books_path(@book.id)
   else
    flash[:alert] = "Book was unsuccessfully updated"
    @books = Book.all
    render :index
   end
  end

  def show
    @books = Book.find(params[:id])

  end

  def edit
    @books = Book.find(params[:id])
  end

  def update
     @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to book_path(@books.id)
    render :index
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to '/books'
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
