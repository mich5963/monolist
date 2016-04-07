class RankingController < ApplicationController
    before_action :set_user
    
    def have
        items = Have.group(:item_id).order('count_id desc').limit(10).count(:id)
        @item_counts = items.transform_keys!{ |key| Item.find(key) }
        # binding.pry

    end
    
    def want
        items = Want.group(:item_id).order('count_id desc').limit(10).count(:id)
        @item_counts = items.transform_keys!{ |key| Item.find(key) }
    end

    private
    
    def set_user
    @user = current_user
    end
    
    def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation)
    end
    
end
