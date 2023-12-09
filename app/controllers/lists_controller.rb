class ListsController < ApplicationController
  def new
      # Viewへ渡すためのインスタンス変数にからのModelオブジェクトを生成する
      @list = List.new
  end

  def create
    # １＆２データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # ３データをデータベースに保存するためのsaveメソッド実行
    list.save
    # ４トップ画面へのリダイレクト
    redirect_to '/top'
  end


  def index
      @lists = List.all
  end

  def show
       @list = List.find(params[:id])
  end

  def edit
  end

  private
  #ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body)
  end

end
