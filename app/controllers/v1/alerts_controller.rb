class V1::AlertsController < ApplicationController
  before_action :find_alert, only: [:destroy]

  ## Fetch all alerts - GET API v1/alerts
  def index
    Rails.cache.fetch("#{@current_user.id}_total_alerts", expires_in: 5.hours) do
      @total_alerts = Alert.with_deleted.where(user: @current_user).order(created_at: :desc)

      @total_alerts = @total_alerts.where(status: params[:status]) if params.has_key?(:status)

      @alerts = @total_alerts.paginate(page: params[:page] || 1, per_page: params[:per_page] || 5)
      @user_name = "#{@current_user.first_name} #{@current_user.last_name}"
    end
  end

  ## Create an alert - POST API v1/alerts
  def create
    @alert = Alert.new(alert_params)
    @alert.user = current_user
    if @alert.save
      render json: { message: 'Alert has been created'}, status: :ok
    else
      render json: { errors: @alert.errors.full_messages }, status: :unprocessable_entity
    end
  end

  ## Delete an alert - DELETE API v1/:alert_id/alerts
  def destroy
    if @alert.update(status: "deleted") && @alert.destroy
      render json: { message: 'Alert has been deleted successfully' }, status: :ok
    else
      render json: { errors: @alert.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def alert_params
    params.permit(:crypto_currency, :target_price)
  end

  def find_alert
    @alert = Alert.find_by(id: params[:id], user_id: @current_user.id)
    if @alert.nil?
      return render json: { message: 'not_found' }, status: :not_found
    end
  end
end
