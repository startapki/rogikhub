module DeviseConfiguration
  extend ActiveSupport::Concern

  included do
    before_action :configure_permitted_parameters, if: :devise_controller?
  end

  private

  def additional_devise_permitted_params
    {}
  end

  def configure_permitted_parameters
    additional_devise_permitted_params.each do |(method, fields)|
      fields.each do |field|
        devise_parameter_sanitizer.for(method) << field
      end
    end
  end
end
