class ListsController < ApplicationController
  def new
    # Viewへ渡すためのインスタンス変数に空のModelオブジェクトを生成する。
    @list = List.new
  end


  def create
     @list = List.new(list_params)
     if @list.save
        redirect_to list_path(@list.id)
     else
        render :new
     end
  end



  def index
    @lists=List.all
  end

  def show
    @list= List.find(params[:id])
  end

  def edit
    @list= List.find(params[:id])
  end

  def update
    list= List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end


  def destroy
    list=List.find(params[:id])
    list.destroy# データ（レコード）を削除
    redirect_to '/lists'
  end


  private #privateは一種の境界線で、「ここから下はこのcontrollerの中でしか呼び出せません」という意味があります。
  # ストロングパラメータ
  def list_params
    params.require(:list).permit(:title, :body, :image)
  end

end
