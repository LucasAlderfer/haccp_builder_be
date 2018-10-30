class RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)

    resource.save
    render_resource(resource)
  end

  private

  def sign_up_params
    params.require(:company).permit(:name, :address, :phone, :team_member_1_name, :team_member_1_title, :email, :password)
  end
end
