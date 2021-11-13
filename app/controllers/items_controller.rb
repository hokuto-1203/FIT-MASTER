class ItemsController < ApplicationController
    def index
        @items = Item.where(user_id: current_user.id).order(:choice)
    end
       
    def new
      @item = Item.new
      @item.user_id = current_user.id
    end

    def create
        @item = Item.new(item_params)
        if @item.save
            redirect_to items_path, success: '登録が完了しました。'
        else
           flash.now[:danger] = "登録に失敗しました。"
           render :new
        end
    end

    def edit
        @item = find_item_by_id
    end

    def update
        @item = find_item_by_id
        if @item.update(item_params)
            redirect_to items_path, success: "変更に成功しました。"
        else
            flash.now[:danger] = "変更に失敗しました。"
            render :new
        end
    end

    def destroy
        @item = find_item_by_id
        if @item.destroy
            redirect_to items_path, success: "削除しました。"
        else
            flash.now[:danger] = "削除に失敗しました。"
            render :new
        end
    end

    private
    def item_params
        params.require(:item).permit(:user_id, :description, :image, :choice, :r_date)
    end

    def find_item_by_id
        Item.find(params[:id])
    end
end
