class BookArticlesController < ApplicationController
  before_action :set_book_article, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  # GET /book_articles
  # GET /book_articles.json
  def index
    @book_articles = BookArticle.all
  end

  # GET /book_articles/1
  # GET /book_articles/1.json
  def show
  end

  # GET /book_articles/new
  def new
    @book_article = current_user.book_articles.build
  end

  # GET /book_articles/1/edit
  def edit
  end

  # POST /book_articles
  # POST /book_articles.json
  def create
    @book_article = current_user.book_articles.build(book_article_params)

    respond_to do |format|
      if @book_article.save
        format.html { redirect_to @book_article, notice: 'Book article was successfully created.' }
        format.json { render :show, status: :created, location: @book_article }
      else
        format.html { render :new }
        format.json { render json: @book_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /book_articles/1
  # PATCH/PUT /book_articles/1.json
  def update
    respond_to do |format|
      if @book_article.update(book_article_params)
        format.html { redirect_to @book_article, notice: 'Book article was successfully updated.' }
        format.json { render :show, status: :ok, location: @book_article }
      else
        format.html { render :edit }
        format.json { render json: @book_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_articles/1
  # DELETE /book_articles/1.json
  def destroy
    @book_article.destroy
    respond_to do |format|
      format.html { redirect_to book_articles_url, notice: 'Book article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book_article
      @book_article = BookArticle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def book_article_params
      params.require(:book_article).permit(:title, :body)
    end
end
