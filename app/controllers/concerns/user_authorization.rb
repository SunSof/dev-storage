module UserAuthorization
  extend ActiveSupport::Concern

  included do
    before_action :authorize_user_access
  end

  private

  def authorize_user_access
    return unless params[:id].present?

    unless current_user.id.to_s == params[:id].to_s
      flash[:alert] = "Access denied"
      redirect_to root_path
    end
  end
end
