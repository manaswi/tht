class PasswordResetsController < ApplicationController

  def new
  end

  def create
    redirect_to [:new, :password_reset], flash: { error: t(:provide_email) } and return if params[:email].blank?
    user = User.where("email = ?", params[:email]).first
    user.send_password_reset if user
    redirect_to sign_in_path, flash: { success: t(:reset_email) }
  end

  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end

  def update
    @user = User.find_by_password_reset_token!(params[:id])
    if @user.password_reset_sent_at < 2.hours.ago
      redirect_to new_password_reset_path, flash: { error: t(:password_reset_expired) }
    elsif @user.update_attributes(params[:user])
      redirect_to sign_in_path, flash: { success: t(:change_password_success) }
    else
      render :edit
    end
  end

end

#https://github.com/leesmith/decent_authentication/blob/master/app/controllers/password_resets_controller.rb
#views/password_resets/new
# %h1= t(:reset_password)
#
# = form_tag [:password_resets], method: :post do
#   = render partial: 'flash', locals: { flash: flash }
#   %div
#     = label_tag :email
#     = email_field_tag :email, params[:email]
#   %div
#     = submit_tag t(:reset_password), class: 'button'
#
#views/password_resets/edit
# %h1= t(:change_password)
#
# = form_for @user, url: password_reset_path(params[:id]) do |f|
#   - if @user.errors.any?
#     .error-messages
#       %ul
#         - @user.errors.full_messages.each do |message|
#           %li= message
#   %div
#     = f.label :password
#     = f.password_field :password
#   %div
#     = f.label :password_confirmation
#     = f.password_field :password_confirmation
#   %div
#     = f.submit t(:change_password), class: 'button'
# # app/views/user_mailer/password_reset.text.erb
# To reset your password, click the URL below:
#
# <%= edit_password_reset_url(@user.password_reset_token) %>
#
# If you did not request your password to be reset, please ignore this email.